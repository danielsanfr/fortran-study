Program Binario

integer a(32),x,n

read*, x

a(1) = mod(x,2)

10 continue

n = n+1
 
x = x/2

a(n+1) = mod(x,2)

if(x==0)goto 20

goto 10

20 continue

write(*,"(32I1)")(a(i),i=n,1,-1)

stop

end