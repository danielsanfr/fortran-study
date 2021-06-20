	program ed 
	integer n,i
	real*8 y(10001),h,x0,xn,x
	read(*,*) n
	x0=0.0
	xn=1.0
	i=1
	y(i)=1
	h=(xn-x0)/n
	do 1 x=0,xn-h,h
	i=i+1
1	y(i)=y(i-1)+h*x*y(i-1)
C1	write(*,*) x,y(i)
	write(*,*) x,y(i)
	stop
	end