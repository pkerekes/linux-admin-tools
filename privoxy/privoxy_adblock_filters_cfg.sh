#!/bin/bash
LISTEN_IP='1.1.1.1'
LISTEN_PORT='55555'
#
cat <<EOF > /etc/privoxy
confdir /etc/privoxy
logdir /var/log
filterfile default.filter
logfile privoxy
#
actionsfile match-all.action # Actions that are applied to all sites and maybe overruled later on.
actionsfile default.action   # Main actions file
#
filterfile user.filter
#
listen-address  ${LISTEN_IP}.${LISTEN_PORT}
toggle  1
enable-remote-toggle  1
enable-remote-http-toggle  0
enable-edit-actions 1
enforce-blocks 0
buffer-limit 4096
forwarded-connect-retries  0
accept-intercepted-requests 1
allow-cgi-request-crunching 0
split-large-forms 0
keep-alive-timeout 300
socket-timeout 300
permit-access  ${LISTEN_IP}
debug   8192 # Errors - *we highly recommended enabling this*
#
EOF
