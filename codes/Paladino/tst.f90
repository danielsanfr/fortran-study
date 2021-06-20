program paladino
integer a, b, c, d, i, k ; k = 0
do i = 1000, 9999, 9 ; a = i/1000
b = (mod(i,1000))/100 ; c = (mod(i,100))/10
d = mod(i,10) ; if((a*b*c*d)/=0) then
print*,i ; k = k + 1 ; end if ; end do
print*,k ; end program
