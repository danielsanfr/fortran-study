program Determinante

write(*,*) 'Digite a11'

read(*,*)a11

write(*,*) 'Digite a12'

read(*,*)a12

write(*,*) 'Digite a13'

read(*,*)a13

write(*,*) 'Digite a21'

read(*,*)a21

write(*,*) 'Digite a22'

read(*,*)a22

write(*,*) 'Digite a23'

read(*,*)a23

write(*,*) 'Digite a31'

read(*,*)a31

write(*,*) 'Digite a32'

read(*,*)a32

write(*,*) 'Digite a33'

read(*,*)a33

write(*,*) 'O determinante e:'

write(*,*)((a11*a22*a33)+(a21*a32*a13)+(a31*a12*a23))-((a13*a22*31)+(a23*a32*a11)+(a33*a12*a21))

stop
end program