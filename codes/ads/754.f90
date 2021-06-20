program tst

character (8) N

character (8) g

character (7) T

character (7) M

character (5) M1

g='gabinete'

T='teclado'

M='monitor'

M1='mouse'

10 continue

write(*,*) 'Escreva o nome do item'

read(*,*,iostat=ierr)N

if(ierr/=0) then

write(*,*) 'Erro, tente de novo'

go to 10

end if

select case(N)

case('gabinete')

write(*,*) 'Custa 99.90 reais'

go to 10

case('teclado')

write(*,*) 'Custa 20.00 reais'

go to 10

case('monitor')

write(*,*) 'Custa 450.00 reais'

go to 10

case('mouse')

write(*,*) 'Custa 15.00 reais'

go to 10

case default

write(*,*) 'Erro, tente novamente'

go to 10

end select

stop

end program