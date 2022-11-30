#!/usr/bin/echo "Don't execute this file. *source* this file."

export __LAME_LOGFILE=/lfs/software/var/log/module

# Don't do it twice, or you will break module

if [[ $(type -t __lame) != "function" ]] 

then

    function __lame()
    {
        __lame_date=$(date)
        __lame_user=$(whoami)
        __lame_host=$(hostname)
        __lame_command=$@

        # echo "intercepting module command: $@"
        printf "%s::%s::%s::%s\n" \
               "${__lame_date}" \
               "${__lame_user}" \
               "${__lame_host}" \
               "${__lame_command}" \
               >> ${__LAME_LOGFILE}
        module "$@"
    }

    [[ $(type -t module) == "alias" ]] || alias module="__lame"

fi

