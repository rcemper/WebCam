@echo off
rem :: param %1 = framerate default=8
set _fr=%1
if [%1]==[]  set /A _fr=8
echo *** video generieren ***
set _day=%DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%
dir /b /A:D
echo| set /p _p="welcher tag ? (yyyy-mm-dd) [ %_day% ]: "<nul 
set /p _day=<CON
set _ffmpeg=%cd%\ffmpeg-master-latest-win64-gpl-shared\bin\ffmpeg
cd %_day%
echo video %_day% wird erstellt in %CD% mit %_fr% frame/sec
pause
2>nul %_ffmpeg% -framerate %_fr% -y -i  "%%05d.jpg" %_day%.mp4 
dir /b *.mp4
cd ..
echo fertig
pause