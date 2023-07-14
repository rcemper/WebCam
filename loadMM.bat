@echo off
rem :: timeout zwischen bildern 
 set _to=%1
 if [%1]==[]  set /a _to=10
rem :: dir %_dt%
 set wget="C:\Program Files (x86)\GnuWin32\bin\wget"
:loop
rem :: aktuelles datum  ! mitternacht !
 set _dt=%DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%
rem :: ein verzeichnis pro tag
if NOT exist %_dt% (
 md %_dt% 
)
 cd %_dt%
rem :: bild abholen
 %wget% -q -o -nd http://www.lkexca.com/camakt/webcamimage.jpg >nul 2>&1
 dir /b
 cd ..
 timeout %_to% > nul
goto loop