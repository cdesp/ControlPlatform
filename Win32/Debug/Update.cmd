if exist NewVersion.dld (
PING 1.1.1.1 -n 1 -w 3000 >NUL
Del newbrain.exe
Rename NewVersion.dld NewBrain.exe  
Start "" Newbrain.exe
) 
exit