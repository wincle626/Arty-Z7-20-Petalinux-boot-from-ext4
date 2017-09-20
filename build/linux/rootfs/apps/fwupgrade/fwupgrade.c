#include <stdio.h>
#include <fcntl.h>
#include <errno.h>
#include <unistd.h>
#include <string.h>
#include <signal.h>
#include <assert.h>
#include <time.h>
#include <stdlib.h>
#include <syslog.h>
#include <stdarg.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/reboot.h>
#include <sys/ioctl.h>

#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <fcntl.h>
#include <unistd.h>

#include <mtd/mtd-user.h>

//#include <md5.h>

/* REVISIT: Could get this with an ioctl, but it's not critical */
// #define FLASH_WRITE_SIZE (128 * 1024)

/*#define FAKE_WRITE*/

static int opt_verbose = 1;
static time_t start_time;
static int percent_complete = 0;

/**
 * Calculates percent complete.
 *
 * Also writes progress to stdout of opt_verbose is set.
 */
static void update_progress(long current, long total)
{
	percent_complete = current * 100 / total;

	if (opt_verbose) {

		int elapsed = time(NULL) - start_time;

		printf("%d:%02d %3d%%\r", elapsed / 60, elapsed % 60, percent_complete);
		fflush(stdout);
	}
}

/**
 * Open a server socket on the given port
 *
 * Returns the socket or -1 on failure
 */
static int open_web_socket(int port)
{
	int fd;
	int on = 1;
	/* union to avoid strict aliasing errors */
	union
	{
		struct sockaddr addr;
		struct sockaddr_in in;
	} addr;

	memset(&addr.in, 0, sizeof(addr));
	addr.in.sin_family = AF_INET;
	addr.in.sin_addr.s_addr = INADDR_ANY;
	addr.in.sin_port = htons(port);

	fd = socket(AF_INET, SOCK_STREAM, 0);
	if (fd < 0) {
		syslog(LOG_ERR, "socket failed: %s", strerror(errno));
		return -1;
	}

	setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, &on, sizeof(on));

	if (bind(fd, &addr.addr, sizeof(addr)) < 0) {
		/*syslog(LOG_ERR, "bind to port %d failed: %s", port, strerror(errno));*/
		close(fd);
		return -1;
	}

	listen(fd, 1);

	return fd;
}

/**
 * Returns true if the fd is readable.
 */
static int fd_readable(int fd)
{
	fd_set rfds;
	struct timeval tv = {0, 0};

	FD_ZERO(&rfds);
	FD_SET(fd, &rfds);

	return select(fd + 1, &rfds, NULL, NULL, &tv) == 1 && FD_ISSET(fd, &rfds);
}

/**
 * Check for a web request on the given port and send
 * status response if there is one.
 */
static void check_web_request(int port)
{
	static int serverfd = -1;

	int clientfd;
	socklen_t len;
	union
	{
		struct sockaddr addr;
		struct sockaddr_in in;
	} addr;

	if (serverfd < 0) {
		/* This may fail if the web server is still running.
		 * Just ignore failure and try again next time
		 */
		serverfd = open_web_socket(port);
		if (serverfd < 0) {
			return;
		}
	}

	/* Don't block if there is no connection */
	if (!fd_readable(serverfd)) {
		return;
	}

	len = sizeof(addr);

	clientfd = accept(serverfd, &addr.addr, &len);
	if (clientfd >= 0) {
		/* Send the response */
		int elapsed = time(NULL) - start_time;
		char buf[64];

		/* Read whatever is available. So the client doesn't get unhappy. */
		while (fd_readable(clientfd) && read(clientfd, buf, sizeof(buf)) > 0) {
		}

		FILE *fh = fdopen(clientfd, "w");

		/* Need to send a valid web response */
		fprintf(fh, "HTTP/1.0 200\r\n");
		fprintf(fh, "Content-Type: text/html\r\n\r\n");

		/* Make it easy to parse in javascript */
		fprintf(fh, "<!-- OK %d %d -->\n", elapsed, percent_complete);

		/* But show something in case of an accidental refresh */
		fprintf(fh, "Upgrade in progress - %d%% complete\n", percent_complete);
		fclose(fh);
	}
}

static void set_status(const char *format, ...)
{
	va_list args;

	va_start(args, format);
	printf("fwupgrade: ");
	vprintf(format, args);
	printf("\n");
	va_end(args);
}

/*
 * Usage: fwupgrade [-noreboot] [-quiet] [-cksum] [-web port] mtdblock1 img1 [mtdblock2 img2 ...]
 *
 * If -cksum is specified, each image is expected to have a 16 byte md5 checksum
 * at the end.
 */
int main(int argc, char *argv[])
{
	int opt_noreboot = 0;
	int opt_cksum = 0;
	int readfd;
	int fd;
	struct stat sb;
	long total = 0;
	long current = 0;
	int rc = 0;
	int i;
	int port = 0;

	openlog("upgrade", LOG_PERROR, LOG_DAEMON);

	while (argc > 1 && argv[1][0] == '-') {
		if (strncmp(argv[1], "-n", 2) == 0) {
			opt_noreboot++;
		}
		else if (strncmp(argv[1], "-q", 2) == 0) {
			opt_verbose = 0;
		}
		else if (strncmp(argv[1], "-c", 2) == 0) {
			opt_cksum++;
		}
		else if (strncmp(argv[1], "-w", 2) == 0 && argc > 2) {
			port = strtol(argv[2], NULL, 0);
			argc--;
			argv++;
		}
		else {
			break;
		}
		argc--;
		argv++;
	}

	if (argc < 3 || argc % 2 != 1) {
		fprintf(stderr, "Usage: fwupgrade [-noreboot] [-quiet] [-cksum] [-web port] mtdblock1 img1 [mtdblock2 img2 ...]\n");
		return 1;
	}


	for (i = 1; i < argc; i += 2) {
		/* Make sure the images exist */
		struct stat sb;
		int ok = 0;

		int readfd = open(argv[i + 1], O_RDONLY);
		if (readfd < 0) {
			syslog(LOG_ERR, "Can't open %s for reading\n", argv[i + 1]);
			return 1;
		}

		fstat(readfd, &sb);
		total += sb.st_size;

		close(readfd);

		if (!ok && opt_cksum) {
			syslog(LOG_ERR, "Not a valid image: %s\n", argv[i + 1]);
			return 1;
		}
	}

	if (total == 0) {
		set_status("Nothing to do");
		return 1;
	}

	start_time = time(NULL);

	if (!opt_noreboot) {
		/* Send SIGTSTP to init to prevent respawning */
		kill(1, SIGTSTP);
		sleep(1);

		/* Don't kill ourselves */
		signal(SIGTERM, SIG_IGN);
		signal(SIGPIPE, SIG_IGN);
		signal(SIGHUP, SIG_IGN);

		/* Need to kill dhcpcd with SIGKILL so it doesn't drop the lease */
		system("killall -KILL dhcpcd");

		set_status("Sending SIGTERM to all processes");
		system("killall5 -TERM");
		/* And kill inetd too. It may not die because it is in our process group */
		system("killall inetd");
		sleep(1);
	}

	for (i = 1; i < argc && rc == 0; i += 2) {
		int len, pagesize;
		int toread;

		erase_info_t erase;
		mtd_info_t meminfo;
		void *buf;
		int start=0;

		set_status("Writing %s from %s", argv[i], argv[i + 1]);
#ifdef FAKE_WRITE
		fd = -1;
#else
		fd = open(argv[i], O_RDWR);
		if (fd < 0) {
			rc = 1;
			syslog(LOG_ERR, "Failed to write to %s", argv[i]);
			break;
		}
#endif

		readfd = open(argv[i + 1], O_RDONLY);
		if (readfd < 0) {
			rc = 1;
			syslog(LOG_ERR, "Can't open %s for reading\n", argv[i + 1]);
			break;
		}

		fstat(readfd, &sb);

		toread = sb.st_size;

		if (ioctl(fd, MEMGETINFO, &meminfo) != 0) {
			syslog(LOG_ERR, "%s: unable to get MTD device info\n", argv[i]);
			exit(1);
		}

		if(meminfo.size < toread) {
			syslog(LOG_ERR, "Insufficient space on target device %s for %s\n", argv[i], argv[i+1]);
			exit(1);
		}

		erase.length = meminfo.erasesize;
		printf("erase size is 0x%08x\n",erase.length);
		buf=malloc(erase.length);
		if(!buf) {
			syslog(LOG_ERR, "Unable to allocate flash buffer\n");
			exit(1);
		}

		pagesize = meminfo.writesize;
		/* Check, if input file is page aligned */
		if ((toread % pagesize) != 0) {
			fprintf(stderr, "Input file is not page aligned\n");
			fprintf(stderr, "force aligned write\n");
		}

		while (toread && (len = read(readfd, buf, toread > erase.length ? erase.length : toread)) > 0) {
			if ((len % pagesize) != 0) {
				len = (len - (len % pagesize)) + pagesize;
				toread = len;
			}
#ifdef FAKE_WRITE
			sleep(1);
#else
			erase.start=start;
			start += meminfo.erasesize;

	                if (ioctl(fd, MEMERASE, &erase) != 0) {
				syslog(LOG_ERR, "MTD Erase failure: %s offset 0x%08x\n",
				argv[i], start);
				exit(1);
			}

			write(fd, buf, len);
#endif
			current += len;
			toread -= len;
			fsync(fd);
			update_progress(current, total);

			/* Check for a web status request */
			if (port > 0) {
				check_web_request(port);
			}
		}
		if (toread) {
			rc = 1;
		}

		free(buf);

		close(readfd);
		close(fd);
	}
	sync();

	if (opt_verbose) {
		/* Leave the last progress time showing */
		printf("\n");
	}

	update_progress(current, total);
	if (port > 0) {
		check_web_request(port);
	}

	if (rc == 0) {
		syslog(LOG_INFO, "Firmware upgrade complete, rebooting");
	}

	if (opt_noreboot) {
		set_status("Completed, not rebooting");
		return rc;
	}

	set_status("Rebooting");
	sleep(1);

#ifndef FAKE_WRITE
	reboot(RB_AUTOBOOT);
	sleep(1);
#endif

	return 1;
}
