@echo off
rem :: timeout zwischen bildern 
 set _to=%1
 if [%1]==[]  set /a _to=4
rem :: dir %_dt%
 set wget="C:\Program Files (x86)\GnuWin32\bin\wget"
rem :: aufräumen
 del /F /Q webcamimage.jp* >nul 2>&1
:loop
rem :: aktuelles datum  ! mitternacht !
 set _dt=%DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%
rem :: ein verzeichnis pro tag
if NOT exist %_dt% (
 md %_dt% 
 echo -1 >%_dt%.txt
 timeout 30 
rem :: > nul
)
rem :: bild abholen
 %wget% -q -o -nd http://www.lkexca.com/camakt/webcamimage.jpg >nul 2>&1
rem :: nächste file id 5stellig führende 0
 set /p _lin=<%_dt%.txt
 set /a "_seq=1+_lin"
 set _id1=x00000%_seq%
 set _id=%_id1:~-5,5%
rem :: aktuelle id merken
 >%_dt%.txt echo %_seq%
 set _fil=%_dt%\%_id%.jpg
 set _ts=%_id1:~-5,2%
 set _fi=%_id1:~-3,3%
 set _cpy=%_dt%\%_ts%\%_fi%.jpg
2>nul md %_dt%\%_ts%
 copy webcamimage.jpg %_cpy% > nul
rem :: file id ins tages-verzeichnis schieben
 move webcamimage.jpg %_fil% > nul
 echo %_cpy%
 timeout %_to% > nul
goto loop