proc get_ipinfo {ipinfofile} {
	if { [catch {open "${ipinfofile}" r} ipinfof] } {
		error "Failed to open IP information file ${ipinfofile}."
	}

	set ipinfodata ""
	set previous_indent_level -1
	set key {}
	set ipdict [dict create]
	while {1} {
		if { [eof ${ipinfof}] > 0} {
			close ${ipinfof}
			break
		}
		set line [gets ${ipinfof}]
		incr linenum
		#regsub -all {\s+} $line { } line
		if { [regexp "^#.*" $line matched] == 1 || \
			[regexp "^\s+#.*" $line matched] == 1 || \
			[string compare -nocase [string trim $line] ""] <= 0 } {
			continue
		}
		set trimline [string trim ${line}]
		if { [regexp {^(    )*[A-Za-z0-9_]+:.*} "${line}" matched] == 1} {
			set tmpkey [lindex [split ${trimline} ":"] 0]
			set tmpval [regsub "${tmpkey}:" "${trimline}" ""]
			set tmpkey [string trim "${tmpkey}"]
			set tmpval [string trim "${tmpval}"]
			set indent_level [regexp -all "(    )" ${line}]
			if { [llength ${key}] > ${indent_level}} {
				set key [lreplace ${key} ${indent_level} end]
			}
			lappend key ${tmpkey}
			if { "${tmpval}" != ""} {
				dict set ipdict [join ${key}] "${tmpval}"
			}
		}
	}
	return ${ipdict}
}

proc get_uart_tty {args} {
	set args [split [lindex ${args} 0]]
	set sysconfig [lindex ${args} 0]
	set ipinfofile [lindex ${args} 1]
	set hdf [lindex ${args} 2]
	set outputf [lindex ${args} 3]
	if { "${outputf}" == ""} {
		set outputhd stdout
	} else {
		if { [catch {open "${outputf}" w} outputhd] } {
			error "Failed to open UART tty output info file."
		}
	}
	# get baudrate from sysconfig
	if { [catch {open "${sysconfig}" r} sysconfhd] } {
		error "Failed to open system config file \"${sysconfig}\"."
	}
	set data [read ${sysconfhd}]
	close "${sysconfhd}"
	set lines [split "${data}" "\n"]
	set idx [lsearch -regexp ${lines} "^CONFIG_SUBSYSTEM_SERIAL_(.*)_SELECT=y"]
	if {${idx} < 0} {
		return
	}
	set selectuart [lindex ${lines} ${idx}]
	set selectuart [string map {CONFIG_SUBSYSTEM_SERIAL_ "" _SELECT=y ""} "${selectuart}"]
	if {"${selectuart}" == "MANUAL"} {
		return
	}
	set idx [lsearch -regexp ${lines} "^CONFIG_SUBSYSTEM_SERIAL_${selectuart}_BAUDRATE_(.*)=y"]
	if {${idx} > 0} {
		set baudrate [string map [list "CONFIG_SUBSYSTEM_SERIAL_${selectuart}_BAUDRATE_" "" "=y" ""] [lindex ${lines} ${idx}]]
		puts ${outputhd} "TTY_BAUDRATE=${baudrate}"
	}
	set selectuart [string tolower "${selectuart}"]
	if {[catch {open_hw_design ${hdf}} msg]} {
		error "Failed to open HDF \"${hdf}\"."
	}
	if {[catch {get_cell "${selectuart}"} uartcell]} {
		puts stderr "ERROR: Failed to get uart \"${selectuart}\" from hardware design."
		close ${outputhd}
		return
	}
	set uartip [get_property IP_NAME ${uartcell}]
	set ipdict [get_ipinfo "${ipinfofile}"]
	set ttyfile [dict get ${ipdict} "${uartip} device_type serial linux_console_file_name"]
	puts ${outputhd} "TTYFILE=${ttyfile}"
	close ${outputhd}
	return
}

set cmdline $argv
#set tclproc [shift cmdline]
set tclproc [lindex ${cmdline} 0]
set cmdline [lreplace ${cmdline} 0 0]
set plnx_kconfig 0
set plnx_data 0
set current_arch ""
set plnx_ips_record {}
if { "[info procs ${tclproc}]" eq "${tclproc}"} {
	${tclproc} ${cmdline}
} else {
	error "proc ${tclproc} doesn't exit."
}