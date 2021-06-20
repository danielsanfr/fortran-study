	real x,y,z
	integer ue,us
	ue = 5
	us = 6
	read(ue,1) x,y,z
1	format(3f3.1)
	if(x.LT.y+z.AND.y.LT.x+z.AND.z.LT.x+y) then
		if(x.EQ.y.AND.x.EQ.z) then
			write(us,2)
2			format(1x,'TRIANGULO EQUILATERO')
		else
			if(x.EQ.y.OR.x.EQ.z.OR.y.EQ.z) then
				write(us,4)
4				format(1x,'TRIANGULO ISOSCELES')
			else
				write(us,6)
6				format(1x,18HTRIANGULO ESCALENO)
			end if
		end if
	else
		write(us,8)
8		format(1x,20HNAO EXISTE TRIANGULO)
	end if
	stop
	end