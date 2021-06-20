program klaiton
real i,rmt
character (15) text
do 2 i = 0.1,2.0,0.1
	write(*,*)i
	write(text,*)i
	open(1,file='ELEM_'//trim(adjustl(text))//'.txt',status = 'new')
	rmt = (i*3**(1/2))/8
	write(1,*)rmt
2	close(1)
stop
end program