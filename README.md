- [IrfanView](https://www.irfanview.com)    
- [Screen Recorder](https://www.videosoftdev.com/free-screen-recorder)   

# WebCam
load JPG and assemble to MP4   

Gesammelte skripts für C:\WebCam\   

### load1000
Holt alle 4 sec ein JPG ab  
schreibt es in ein Verzeichnis YYYY-MM-DD mit 5stelliger Nummerierung ab 0000.JPG    
+   
in ein UnterVerzeichnis. YYYY-MM-DD\TS    
TS sind die 1.+2.Tausender Stelle   
nun mit 3stellger Nummer ab 000.JPG 
```
C:\GitHub\webcam>dir /B 2023-07-13\04
000.jpg
001.jpg
002.jpg
003.jpg
004.jpg
005.jpg
006.jpg
007.jpg
008.jpg
009.jpg
010.jpg
011.jpg
012.jpg
```

### video1000
holt sich max. 1000 JPG aus YYYY-MM-DD\TS\*\.JPG   
und macht ein Video mit Framerate %_fr%=8   

### filename
YYYY-DD-MM_TD_f%fr%.MP4 im Top-Verzeichnis.   

````
C:\GitHub\webcam>dir /b *.mp4
2023-07-13_00_f8.mp4
2023-07-13_02_f8.mp4
2023-07-13_03_f12.mp4
2023-07-13_04_f12.mp4
````

