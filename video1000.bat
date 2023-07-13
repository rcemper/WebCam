@echo off
rem :: param %1 = framerate default=5
set _fr=%1
if [%1]==[]  set /A _fr=12
echo *** video generieren ***
set _day=%DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%
dir /b /A:D
echo| set /p _p="welcher tag ? (yyyy-mm-dd) [ %_day% ]: "<nul 
set /p _day=<CON
dir /b /A:D %_day%
set _ts=00
echo| set /p _p="welche tausend ? (nn) [ %_ts% ]: "<nul
set /p _ts=<CON

set _mp=%_day%_%_ts%_f%_fr%.mp4
echo video %_mp% wird erstellt in %CD% mit %_fr% frame/sec
cd %_day%\%_ts%
rem:   dir /b
pause
set _ffmpeg=C:\ZZ\_kits\ffmpeg-master-latest-win64-gpl-shared\bin\ffmpeg
2>nul %_ffmpeg% -framerate %_fr% -y -i  "%%03d.jpg" ..\..\%_mp% 
cd ..\..
dir /b *.mp4
echo fertig
pause