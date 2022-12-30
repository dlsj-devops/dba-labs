#!/bin/sh

#Fonte: http://www.dba-oracle.com/t_script_linux_shell_commands.htm

#alterar para uso interno
system_pw=`cat /u01/app/oracle/admin/oss/passwords/system.pw`
sqlplus -S system/$system_pw << EOF
set pagesize 0 linesize 80 feedback off

SELECT 'The database ' || instance_name ||
' has been running since ' || to_char(startup_time, 'HH24:MI MM/DD/YYYY')
FROM v\$instance; 

!echo "Hostname is `hostname` and the platform is `uname`" 

SELECT 'There are ' || count(status) ||
' data files with a status of ' || status