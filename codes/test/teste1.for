	real x,y,z
	integer ue,us
	ue=5
	us=6
	read(ue,1)x,y,z
1	format(3f3.1)
	if(x.lt.y+z.and.y.lt.x+z.and.z.lt.x+y) then
	if(x.eq.y.and.x.eq.z)then
	write(us,2)
2	format(1x, 'triangulo equilatero')
	else
	if(x.eq.y.or.x.eq.z.or.y.eq.z)then
	write(us,4)
4	format(1x, 'triangulo isosceles')
	else
	write(us,6)
6	format(1x, 'triangulo escaleno')
	end if 
	end if
	else
	write(us,8)
8	format(1x,20h nao existe triangulo)
	end if
	stop
	end
