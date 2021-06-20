program quadradinho

use msflib

type (xycoord) pos

external my_mouse

!i = setcolor (10)

i = rectangle($gfillinterior,10,10,60,60)

i = registermouseevent(0,(mouse$move.or.mouse$lbuttondown.or.mouse$lbuttonup), my_mouse)

do while (.true.)

end do

stop

end program



subroutine my_mouse(iunit, ievent, ikeystate, ix, iy)

use dflib

type (xycoord) xy

integer k

if(ix >= 10.and.ix <= 60.and.iy >= 10.and.iy <= 60.and.ikeystate == 1) k = 1

if(k == 1.and.ikeystate == 1) then

call clearscreen($gclearscreen)

!i = setcolor(10)

i = rectangle($gfillinterior,ix-25,iy-25,ix+25,iy+25)

end if

return

end subroutine