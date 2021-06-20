program bin

use dflib

use dfport

integer b(64), i, c, x

character (256) text

50 write(*,*)'Digite o numero decimal'

read(*,*)x

if(x>=0.and.x <= 3)n = 2
if(x>=4.and.x <= 7)n = 3
if(x>=8.and.x <= 15)n = 4
if(x>=16.and.x <= 31)n = 5
if(x>=32.and.x <= 63)n = 6
if(x>=64.and.x <= 127)n = 7
if(x>=128.and.x <= 255)n = 8

do i = 1, 64

b(i) = mod(x,2)

x = x/2

!if(x==1)write(*,*)x

!write(*,*)b(i)

if(x==0)go to 1

end do

1 write(*,"(8(I1))")(b(i),i=n,1,-1)

!write(*,*)text

goto 50

stop

end program