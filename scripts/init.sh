#!/bin/sh /etc/rc.common

START=99
STOP=99

directory='/extdisks/sda1/shadowsocks-miwifi/r1cm'

config_load misc

#export command line for /usr/sbin/supervisord
export PROCLINE="$directory/ss-redir -c $directory/config.json"
export PROCFLAG=$PROCLINE
export PROC_DEBUG_FLAG="on"
export OOM_FLAG=0

export EXTRA_HELP="	status	Status the service"
export EXTRA_COMMANDS="status"

stop() {
	/usr/sbin/supervisord stop
	return $?
}
start() {
	/usr/sbin/supervisord start
	return $?
}
restart() {
	stop
	sleep 1
	start
	return $?
}
shutdown() {
	stop
	return $?
}
status() {
	/usr/sbin/supervisord status
	return $?
}
