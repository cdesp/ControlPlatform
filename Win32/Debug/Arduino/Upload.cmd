avrdude -Cavrdude.conf -v -patmega328p -carduino -PCOM10 -b115200 -D -Uflash:w:CtrlPlatform.ino.UNO.hex:i 
pause