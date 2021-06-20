Program Binario
integer x(32),a
n = 1
20 read(*,*)a
x(n) = mod(a,2)
10 a = a/2 ; n = n + 1
x(n) = mod(a,2) ; write(text,*)x(n)
if(a==0)then
	print*,(x(n),n = n,1)
	goto 20
end if
goto 10
end program