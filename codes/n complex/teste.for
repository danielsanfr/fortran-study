	program n_complex
	real t1,t2,r1,r2,z1,z2
	complex z
	character*1 op
	read(*,*)op,r1,t1,r2,t2
	if(op.EQ.'m')then
		z1 = r1*r2
		z2 = t1+t2
		write(*,*)z1,'*','exp','(i*',z2,')'
	end if
	if(op.EQ.'d')then
		z1 = r1/r2
		z2 = t1-t2
		write(*,*)z1,'/','exp','(i*',z2,')'
	end if
	stop
	end