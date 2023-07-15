@echo off
rem :: timeout zwischen bildern 
 set _to=%1
 if [%1]==[]  set /a _to=4
rem :: aktuelles datum
 set _dt=%DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%
 set wget="C:\Program Files (x86)\GnuWin32\bin\wget"
rem :: aufräumen
 del /F /Q webcamimage.jp* >nul 2>&1
:loop
rem :: ein verzeichnis pro tag
if NOT exist %_dt% (
 md %_dt% 
 echo -1 >%_dt%.txt
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
set _f
rem :: file id ins tages-verzeichnis schieben
 move webcamimage.jpg %_fil% > nul
 timeout %_to% > nul
goto loop
