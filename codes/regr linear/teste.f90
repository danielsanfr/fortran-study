program regre
integer i
real x(4),y(4),Sx,Sy,Sxy,Sxx,Syy,a,b,r
data Sx,Sy,Sxy,Sxx,Syy,a,b,r /8*0/
do 1 i = 1,4
1	read(*,*)x(i),y(i)
do 2 i = 1,4
	Sx = Sx + x(i)
	Sy = Sy + y(i)
	Sxy = Sxy + (x(i)*y(i))
	Sxx = Sxx + (x(i)*x(i))
2	Syy = Syy + (y(i)*y(i))
a = (4*Sxy - Sx*Sy)/(4*Sxx - Sx*Sx)
b = (Sy*Sxx - Sx*Sxy)/(4*Sxx - (Sx*Sx))
!r = (4*Sxy - Sx*Sy)/(sqrt((4*Sxx - (Sx*Sx))*(4*Syy - (Sy*Sy))))
r = (4*Sxy - Sx*Sy)/(sqrt(4*Sxx - (Sx*Sx))*sqrt(4*Syy - (Sy*Sy)))
write(*,*)a,b,r
stop
end program