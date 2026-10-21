:: VideoEnc - Mobile Video Encoding Procedure

@ECHO OFF

cls

call config.cmd

set BINFF="%DIRBIN%ffmpeg-%OSARCH%.exe"

set BINHB="%DIRBIN%HandBrakeCLI-%OSARCH%.exe"

echo Starting new video encoding job.
echo.
echo %date%, %time%: Starting new video encoding job. > "%DIRVAR%videnc.log"
echo OSARCH: %OSARCH% >> "%DIRVAR%videnc.log"
echo DIRIN: %DIRIN% >> "%DIRVAR%videnc.log"
echo DIROUT: %DIROUT% >> "%DIRVAR%videnc.log"
echo DIRBIN: %DIRBIN% >> "%DIRVAR%videnc.log"
echo EXTIN: %EXTIN% >> "%DIRVAR%videnc.log"
echo EXTOUT: %EXTOUT% >> "%DIRVAR%videnc.log"
echo VIDEOQ: %VIDEOQ% >> "%DIRVAR%videnc.log"
echo VIDEOWIDTH: %VIDEOWIDTH% >> "%DIRVAR%videnc.log"
echo. >> "%DIRVAR%videnc.log"

echo Scanning input directory "%DIRIN%".
echo.
echo %date%, %time%: Scanning input directory "%DIRIN%". >> "%DIRVAR%videnc.log"
echo. >> "%DIRVAR%videnc.log"

for %%f in (%DIRIN%*.%EXTIN%) do (

    echo Starting to process file "%%~nf".
    echo %date%, %time%: Starting to process file "%%~nf". >> "%DIRVAR%videnc.log"
    echo. >> "%DIRVAR%videnc.log"
    
    :: #1
    echo Encoding video file.
    echo %date%, %time%: Encoding file #1. >> "%DIRVAR%videnc.log"
    echo. >> "%DIRVAR%videnc.log"
    %BINHB% < NUL -i "%DIRIN%%%~nf.%EXTIN%" -o "%DIROUT%%%~nf.%EXTOUT%" -O -e x264 -q %VIDEOQ%.0 -a 1 -E faac -B 128 -6 dpl2 -R Auto -D 0.0 -f mp4 -X %VIDEOWIDTH% -m -x cabac=0:ref=2:me=umh:bframes=0:weightp=0:subme=6:8x8dct=0:trellis=0 2>> "%DIRVAR%videnc.log"
    
    :: #2
    ::echo Encoding file #2.
    ::echo %date%, %time%: Encoding file #2. >> "%DIRVAR%videnc.log"
    ::echo. >> "%DIRVAR%videnc.log"
    ::%BINFF% < NUL -i "%DIROUT%%%~nf.%EXTOUT%" -vcodec libvpx -acodec libvorbis -f webm -g 13 "%DIROUT%%%~nf.webm" 2>> "%DIRVAR%videnc.log"
    
    :: #3
    ::echo Encoding file #3.
    ::echo %date%, %time%: Encoding file #3. >> "%DIRVAR%videnc.log"
    ::echo. >> "%DIRVAR%videnc.log"
    ::%BINFF% < NUL -i "%DIROUT%%%~nf.%EXTOUT%" -vcodec libtheora -acodec libvorbis -g 13 "%DIROUT%%%~nf.ogv" 2>> "%DIRVAR%videnc.log"
    
    :: #4
    echo Encoding thumbnail file.
    echo %date%, %time%: Encoding file #4. >> "%DIRVAR%videnc.log"
    echo. >> "%DIRVAR%videnc.log"
    %BINFF% < NUL -i "%DIROUT%%%~nf.%EXTOUT%" -ss 00:00:07 -vframes 1 -r 1 -f image2 "%DIROUT%%%~nf.jpg" 2>> "%DIRVAR%videnc.log"
    
    echo Finished processing file "%%~nf".
    echo %date%, %time%: Finished processing file "%%~nf". >> "%DIRVAR%videnc.log"
    echo. >> "%DIRVAR%videnc.log"
    echo.
)

echo Video encoding job finished!
echo.
echo %date%, %time%: Video encoding job finished!. >> "%DIRVAR%videnc.log"
echo. >> "%DIRVAR%videnc.log"

pause

cls

:: $Id$