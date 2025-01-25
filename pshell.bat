@echo off
cd /D "D:\Test Fritz"
:loop 
powershell $fil = (Get-Date).ToString('yyMMdd_HHmmss.JPG') ; wget http://www.lkexca.com/camakt/webcamimage.jpg  -O ("$fil") ; $fil
timeout 5 > nul
goto loop