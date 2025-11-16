@echo off
ECHO Command to execute: robocopy "%~1" "%~2" user.dat /copy:DATS /R:3 /W:5 /LOG+:"%~1\TP\user_reload.log" /TEE

::Parameter %~1 is the current folder of PcVue project, 
::Parameter %~2 is the Central Folder
::Enable the following row in place of the working one to enable logging
::robocopy "%~1\C" "%~2" user.dat /copy:DATS /R:3 /W:5 /LOG+:"%~1\TP\user_reload.log" /TEE

robocopy "%~1\C" "%~2" user.dat /copy:DATS /R:3 /W:5