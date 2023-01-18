help:
	@echo
	@echo "usage:"
	@echo "       export LAME_LOGFILE=/path/to/var/log/module"
	@echo "       export LAME_INSTALL_DIR=/path/to/__lame.sh"
	@echo "       make install"
	@echo "       or "
	@echo "       make install-rsyslog"
	@echo

install: install-local

install-local: 
	@echo "checking LAME_LOGFILE=${LAME_LOGFILE}"
	@test -n "${LAME_LOGFILE}"
	@echo "checking LAME_INSTALL_DIR=${LAME_INSTALL_DIR}"
	@test -n "${LAME_INSTALL_DIR}"
	mkdir -p $$(dirname ${LAME_LOGFILE})
	touch ${LAME_LOGFILE}
	chmod +w ${LAME_LOGFILE}
	sed -e "s#__LAME_LOGFILE#${LAME_LOGFILE}#g" < __lame.sh.in \
	| sed -e "s#__LAME_INSTALL_DIR#${LAME_INSTALL_DIR}#g" > __lame.sh 
	[[ -x ${LAME_INSTALL_DIR} ]] || mkdir -p ${LAME_INSTALL_DIR}
	mv __lame.sh ${LAME_INSTALL_DIR}
	@echo "Add the following to your .bashrc: "
	@echo ". ${LAME_INSTALL_DIR}/__lame.sh" 
	@echo

install-rsyslog-local: 
	@echo "checking LAME_LOGFILE=${LAME_LOGFILE}"
	@test -n "${LAME_LOGFILE}"
	@echo "checking LAME_INSTALL_DIR=${LAME_INSTALL_DIR}"
	@test -n "${LAME_INSTALL_DIR}"
#	@echo "checking LAME_LOGHOST=${LAME_LOGHOST}"
#	@test -n "${LAME_LOGHOST}"
	sed -e "s#__LAME_LOGFILE#${LAME_LOGFILE}#g" < __lame.sh.in-rsyslog \
	| sed -e "s#__LAME_INSTALL_DIR#${LAME_INSTALL_DIR}#g" > __lame.sh 
	[[ -x ${LAME_INSTALL_DIR} ]] || mkdir -p ${LAME_INSTALL_DIR}
	mv __lame.sh ${LAME_INSTALL_DIR}
	sed -e "s#__LAME_LOGFILE#${LAME_LOGFILE}#g" < etc/rsyslog.d/lame_local.conf.in > etc/rsyslog.d/lame_local.conf
#	sed -e "s#__LAME_LOGFILE#${LAME_LOGFILE}#g" < etc/rsyslog.d/lame_server.conf.in > etc/rsyslog.d/lame_server.conf
#	sed -e "s#__LAME_LOGHOST#${LAME_LOGHOST}#g" < etc/rsyslog.d/lame_client.conf.in > etc/rsyslog.d/lame_client.conf
	@echo "Add the following to your .bashrc: "
	@echo ". ${LAME_INSTALL_DIR}/__lame.sh" 
	@echo
	@echo "Copy the following to /etc/rsyslog.d/: "
	@echo "etc/rsyslog.d/lame_local.conf"
	@echo


install-rsyslog-remote: 
	@echo "checking LAME_LOGFILE=${LAME_LOGFILE}"
	@test -n "${LAME_LOGFILE}"
	@echo "checking LAME_INSTALL_DIR=${LAME_INSTALL_DIR}"
	@test -n "${LAME_INSTALL_DIR}"
	@echo "checking LAME_LOGHOST=${LAME_LOGHOST}"
	@test -n "${LAME_LOGHOST}"
	sed -e "s#__LAME_LOGFILE#${LAME_LOGFILE}#g" < __lame.sh.in-rsyslog \
	| sed -e "s#__LAME_INSTALL_DIR#${LAME_INSTALL_DIR}#g" > __lame.sh 
	[[ -x ${LAME_INSTALL_DIR} ]] || mkdir -p ${LAME_INSTALL_DIR}
	mv __lame.sh ${LAME_INSTALL_DIR}
#	sed -e "s#__LAME_LOGFILE#${LAME_LOGFILE}#g" < etc/rsyslog.d/lame_local.conf.in > etc/rsyslog.d/lame_local.conf
	sed -e "s#__LAME_LOGFILE#${LAME_LOGFILE}#g" < etc/rsyslog.d/lame_server.conf.in > etc/rsyslog.d/lame_server.conf
	sed -e "s#__LAME_LOGHOST#${LAME_LOGHOST}#g" < etc/rsyslog.d/lame_client.conf.in > etc/rsyslog.d/lame_client.conf
	@echo "Add the following to your .bashrc: "
	@echo ". ${LAME_INSTALL_DIR}/__lame.sh" 
	@echo
	@echo "Copy the following to /etc/rsyslog.d/: "
	@echo "On client: etc/rsyslog.d/lame_client.conf"
	@echo "On server: etc/rsyslog.d/lame_server.conf"

clean:
	rm -f ${LAME_INSTALL_DIR}/__lame.sh
	rm -f etc/rsyslog.d/lame_local.conf
	rm -f etc/rsyslog.d/lame_client.conf
	rm -f etc/rsyslog.d/lame_server.conf
