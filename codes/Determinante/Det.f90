program Det

DOUBLE PRECISION a11,a12,a13,a21,a22,a23,a31,a32,a33,det1,det2

integer menu,submenu

10 continue

write(*,*) ''

write(*,*) '1-Calcular'
write(*,*) '2-Sair'

read(*,*,iostat=ierr)menu

if(ierr/=0) then

write(*,*) 'Erro, tente novamente'

go to 10

end if

select case (menu)

case(1)

20 continue

write(*,*) ''

write(*,*) '2-Ordem 2'
write(*,*) '3-Ordem 3'

read(*,*,iostat=ierr)submenu

if(ierr/=0) then

write(*,*) 'Erro,tente novamente'

go to 20

end if

select case(submenu)

case(2)

30 continue

write(*,*) ''

write(*,*) 'Digite o valor de a11'

read(*,*,iostat=ierr)a11

if(ierr/=0) then

write(*,*) 'Erro, tente novamente'

go to 30

end if

write(*,*) 'Digite o valor de a12'

read(*,*,iostat=ierr)a12

if(ierr/=0) then

write(*,*) 'Erro, tente novamente'

go to 30

end if

write(*,*) 'Digite o valor de a21'

read(*,*,iostat=ierr)a21

if(ierr/=0) then

write(*,*) 'Erro, tente novamente'

go to 30

end if

write(*,*) 'Digite o valor de a22'

read(*,*,iostat=ierr)a22

if(ierr/=0) then

write(*,*) 'Erro, tente novamente'

go to 30

end if

write(*,*) ''

write(*,*) 'O determinante e'
det1=(a11*a22)-(a12*a21)
write(*,*)det1

go to 10

case(3)

40 continue

write(*,*) ''

write(*,*) 'Digite o valor de a11'

read(*,*,iostat=ierr)a11

if(ierr/=0) then

write(*,*) 'Erro, tente novamente'

go to 40

end if

write(*,*) 'Digite o valor de a12'

read(*,*,iostat=ierr)a12

if(ierr/=0) then

write(*,*) 'Erro, tente novamente'

go to 40

end if

write(*,*) 'Digite o valor de a13'

read(*,*,iostat=ierr)a13

if(ierr/=0) then

write(*,*) 'Erro, tente novamente'

go to 40

end if

write(*,*) 'Digite o valor de a21'

read(*,*,iostat=ierr)a21

if(ierr/=0) then

write(*,*) 'Erro, tente novamente'

go to 40

end if

write(*,*) 'Digite o valor de a22'

read(*,*,iostat=ierr)a22

if(ierr/=0) then

write(*,*) 'Erro, tente novamente'

go to 40

end if

write(*,*) 'Digite o valor de a23'

read(*,*,iostat=ierr)a23

if(ierr/=0) then

write(*,*) 'Erro, tente novamente'

go to 40

end if

write(*,*) 'Digite o valor de a31'

read(*,*,iostat=ierr)a31

if(ierr/=0) then

write(*,*) 'Erro, tente novamente'

go to 40

end if

write(*,*) 'Digite o valor de a32'

read(*,*,iostat=ierr)a32

if(ierr/=0) then

write(*,*) 'Erro, tente novamente'

go to 40

end if

write(*,*) 'Digite o valor de a33'

read(*,*,iostat=ierr)a33

if(ierr/=0) then

write(*,*) 'Erro, tente novamente'

go to 40

end if

write(*,*) ''

write(*,*) 'O determinante e'
det2=((a11*a22*a33)+(a21*a32*a13)+(a31*a12*a23))-((a13*a22*a31)+(a23*a32*a11)+(a33*a12*a21))
write(*,*)det2

go to 10

case default

write(*,*) 'Erro, tente novamente'

go to 20

end select

case(2)

write(*,*) 'Tchau'

pause

stop

case default

write(*,*) 'Erro, tente novamente'

go to 10

end select

stop

end