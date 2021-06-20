	program fatorial
	integer n,i
	real fat
	do while(.true.)
	read(*,*)n
	fat = 1
	do 1 i = n,1,-1
1	fat=fat*i
	write(*,*)fat
	end do
	stop
	end program