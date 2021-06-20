Program Binario
character*256 text
integer x(32),a
n = 1
20 read(*,*)a
x(n) = mod(a,2)
10 a = a/2 ; n = n + 1
x(n) = mod(a,2)
if(a==0)then
	goto 20
end if
!goto 10
	write(text,*)(x(n),n=32,1,-1)
	print*,text
end program