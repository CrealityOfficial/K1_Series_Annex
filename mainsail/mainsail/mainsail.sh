#!/bin/sh

if [ "x$1" = "xinstall" ]; then
    cd /usr/data
    tar -xvf mainsail.tar 

    [ ! -e /etc/init.d/S50nginx ] && mv nginx/S50nginx /etc/init.d/
    [ ! -e /etc/init.d/S56moonraker_service ] && mv moonraker/S56moonraker_service /etc/init.d/

    /etc/init.d/S50nginx start
    /etc/init.d/S56moonraker_service start
elif [ "x$1" = "xunstall" ]; then
    cd /overlay/upper
    /etc/init.d/S50nginx stop
    /etc/init.d/S56moonraker_service stop
    rm -rf /etc/init.d/S50nginx /etc/init.d/S56moonraker_service 
    rm -rf /usr/data/printer_data/config/moonraker.conf /usr/data/printer_data/config/.moonraker.conf.bkp /usr/data/nginx /usr/data/moonraker /usr/data/mainsail
fi

