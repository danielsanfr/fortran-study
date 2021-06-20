	program danilo
	integer t , a , b
	a = 90000000.0 ; b = 200000000.0 ; t = 0
	do while(.true.)
	t = t + 1
	a = a + a*0.03
	b = b + b*0.015
!	if(mod(t,4) == 0) write(*,"(I3,I12,I12)")t,a,b
	if(a >= b)go to 1
	end do
1	print*,t,a,b
	stop
	end