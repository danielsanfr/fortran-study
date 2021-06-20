program relogio

use dflib

integer a,b,c

do a = 0, 24 ; do b = 0, 59 ; do c = 0, 59

if(mod(c,2)==0) then

write(*,*)a,':',b,c

go to 1 ; end if

write(*,*)a,' ',b,c

1 call sleepqq(1000)

call clearscreen($gclearscreen)

end do ; end do ; end do

stop

end program