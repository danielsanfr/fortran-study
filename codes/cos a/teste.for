	program senx

	real sen_x

	do x = 0.0,6.33,0.1

	sen_x = x - x**3/6.0 + x**5/120.0 - x**7/5040.0

	write(*,*)x,sen_x

	end do
	
	stop

	end.ÇKLK