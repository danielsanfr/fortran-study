program Bin

integer b(8)

real a, b1

!10 continue

write(*,*) 'Digite o promeiro A "com 4 bits"'

read(*,*)b(1),b(2),b(3),b(4)

!if (b(1)/=1.OR.b(1)/=0) go to 10

write(*,*) 'Digite o quinto B "tb com 4 bits"'

read(*,*)b(5),b(6),b(7),b(8)

if ((b(1)<0.AND.b(1)>1).OR.(b(2)<0.AND.b(2)>1).OR.(b(3)<0.AND.b(3)>1).OR.(b(4)<0.AND.b(4)>1))

a = b(1)*8+b(2)*4+b(3)*2+b(4)*1
write(*,*)a

b1 = b(5)*8+b(6)*4+b(7)*2+b(8)*1
write(*,*)b1

if (a<b1) then

write(*,*) 'B é maior que A, por isso ñ da para responder por complemento de 2'

end if

!write(*,*)b(1)*128+b(2)*64+b(3)*32+b(4)*16+b(5)*8+b(6)*4+b(7)*2+b(8)*1

stop
end program