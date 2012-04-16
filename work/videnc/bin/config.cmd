:: Operating System architecture (32 or 64)
set OSARCH=32

:: Working directory
set DIRWORK=c:\videnc\

:: DO NOT EDIT BELOW UNLESS REALLY NECESSARY

:: extension of the input files
set EXTIN=avi

:: extension of the ouptut files
set EXTOUT=mp4

:: output video quality from 20 [highest] to 52 [lowest]
set VIDEOQ=36

:: output video width
set VIDEOWIDTH=480

:: input directory (where the source files are located),
:: including trailing backslash
set DIRIN=%DIRWORK%in\

:: output directory (where the encoded files should appear),
:: including trailing backslash
set DIROUT=%DIRWORK%out\

:: binary directory, where the program files are stored
set DIRBIN=%DIRWORK%bin\

set DIRVAR=%DIRWORK%var\

:: $Id$