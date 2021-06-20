program test

use dflib

Use MSFWIN

integer i

i = WinExec('notepad.exe arquivo.txt',sw_maximize)

i = runqq('write.exe', 'dados.dat')

pause

stop

end program