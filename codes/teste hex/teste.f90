program teste

use msflib

type (xycoord) pos

integer i,j,n,cor

call clearscreen($gclearscreen)

do i = #000000 , #FFFFFF , #000001

call moveto(0,n,pos)

j = setcolorrgb(i)

j = lineto(1024,n)

n = n + 1

if(n == 1024) then

call sleepqq(1)

call clearscreen($gclearscreen)

n = 0

end if

end do

stop

end