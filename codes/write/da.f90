program writ

integer k

real lquad

read(*,*)k

l = 3**k

lquad = 500/float(l)

ix = 50

iy = 50

do i = 1,l
	
	do j = 1,l

ix1 = ix+lquad*(i-1)

write(*,*)'1x1=',ix1

end do

end do

do i = 1,l
	
	do j = 1,l

ix2 = ix+lquad*i

write(*,*)'ix2=',ix2

end do

end do

do i = 1,l
	
	do j = 1,l

iy1 = iy+lquad*(j-1)

write(*,*)'iy1=',iy1

end do

end do

do i = 1,l
	
	do j = 1,l

iy2 = iy+lquad*j

write(*,*)'iy2=',iy2

end do

end do

stop

end program
