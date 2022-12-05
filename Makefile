help:
	@echo
	@echo "usage:"
	@echo "       export LAME_LOGFILE=/path/to/var/log/module"
	@echo "       export LAME_INSTALL_DIR=/path/to/__lame.sh"
	@echo "       make install"
	@echo

install: 
	@echo "checking LAME_LOGFILE=${LAME_LOGFILE}"
	@test -n "${LAME_LOGFILE}"
	@echo "checking LAME_INSTALL_DIR=${LAME_INSTALL_DIR}"
	@test -n "${LAME_INSTALL_DIR}"
	mkdir -p $$(dirname ${LAME_LOGFILE})
	touch ${LAME_LOGFILE}
	sed -e "s#__LAME_LOGFILE#${LAME_LOGFILE}#g" < __lame.sh.in \
	| sed -e "s#__LAME_INSTALL_DIR#${LAME_INSTALL_DIR}#g" > __lame.sh 
	[[ -x ${LAME_INSTALL_DIR} ]] || mkdir -p ${LAME_INSTALL_DIR}
	mv __lame.sh ${LAME_INSTALL_DIR}
	@echo "Add the following to your .bashrc: "
	@echo ". ${LAME_INSTALL_DIR}/__lame.sh" 
	@echo

clean:
	rm ${LAME_INSTALL_DIR}/__lame.sh
