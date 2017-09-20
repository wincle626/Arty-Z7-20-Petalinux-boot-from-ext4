# manual_mdev.mak

# hardcode devices node
#

DEVICES +=								      \
	tty,c,5,0     ptmx,c,5,2			      \
	mem,c,1,1     kmem,c,1,2    null,c,1,3 				      \
	ttyS0,c,4,64   ttyS1,c,4,65    ttyS2,c,4,66  ttyS3,c,4,67	      \
	ttyUL0,c,204,187	ttyUL1,c,204,188			      \
	ttyUL2,c,204,189	ttyUL3,c,204,190			      \
	rtc,c,10,135   nvram,c,10,144					      \
									      \
	zero,c,1,5     random,c,1,8    urandom,c,1,9			      \
									      \
        fb0,c,29,0                                                            \
                                                                              \
	ptyp0,c,2,0    ptyp1,c,2,1     ptyp2,c,2,2   ptyp3,c,2,3	      \
	ptyp4,c,2,4    ptyp5,c,2,5     ptyp6,c,2,6   ptyp7,c,2,7	      \
	ptyp8,c,2,8    ptyp9,c,2,9     ptypa,c,2,10  ptypb,c,2,11	      \
	ptypc,c,2,12   ptypd,c,2,13    ptype,c,2,14  ptypf,c,2,15	      \
									      \
	ttyp0,c,3,0    ttyp1,c,3,1     ttyp2,c,3,2   ttyp3,c,3,3	      \
	ttyp4,c,3,4    ttyp5,c,3,5     ttyp6,c,3,6   ttyp7,c,3,7	      \
	ttyp8,c,3,8    ttyp9,c,3,9     ttypa,c,3,10  ttypb,c,3,11	      \
	ttypc,c,3,12   ttypd,c,3,13    ttype,c,3,14  ttypf,c,3,15	   

DEVICES +=   \
	mtd0,c,90,0	mtdr0,c,90,1	mtdblock0,b,31,0	\
	mtd1,c,90,2	mtdr1,c,90,3	mtdblock1,b,31,1	\
	mtd2,c,90,4	mtdr2,c,90,5	mtdblock2,b,31,2	\
	mtd3,c,90,6	mtdr3,c,90,7	mtdblock3,b,31,3	\
	mtd4,c,90,8 	mtdr4,c,90,9	mtdblock4,b,31,4	\
	mtd5,c,90,10 	mtdr5,c,90,11	mtdblock5,b,31,5	\
	mtd6,c,90,12 	mtdr6,c,90,13	mtdblock6,b,31,6	\
	mtd7,c,90,14 	mtdr7,c,90,15	mtdblock7,b,31,7	\
	mtd8,c,90,16 	mtdr8,c,90,17	mtdblock8,b,31,8	\
	mtd9,c,90,18 	mtdr9,c,90,19	mtdblock9,b,31,9	\
	mtd10,c,90,20 	mtdr10,c,90,21	mtdblock10,b,31,10  \
	mtd11,c,90,22 	mtdr11,c,90,23	mtdblock11,b,31,11	\
	mtd12,c,90,24 	mtdr12,c,90,25	mtdblock12,b,31,12	\
	mtd13,c,90,26 	mtdr13,c,90,27	mtdblock13,b,31,13	\
	mtd14,c,90,26 	mtdr14,c,90,29	mtdblock14,b,31,14

NET_DEVICES += tun,c,10,200
