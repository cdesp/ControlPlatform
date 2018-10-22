g:
cd _Programming\ControlPlatform\Win32\Debug\Arduino
avrdude -p atmega2560 -C avrdude.conf -c wiring -P com3 -b 57600 -F -U flash:r:i3_bak.hex:i -v
pause