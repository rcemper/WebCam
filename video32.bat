@echo off
rem :: param %1 = rate default=5
set _fr=%1
if [%1]==[]  set /A _fr=150
echo *** video generieren ***
set _day=%DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%
dir /b /A:D
echo| set /p _p="welcher tag ? (yyyy-mm-dd) [ %_day% ]: "<nul 
set /p _day=<CON
cd %_day%
echo video %_day% wird erstellt in %CD% mit rate %_fr% 
pause
2>nul C:\WebCam\ffmpeg32 -r %_fr% -y  %_day%.mp4 -i "%%05d.jpg" 
dir /b *.mp4
cd ..
echo fertig
pause