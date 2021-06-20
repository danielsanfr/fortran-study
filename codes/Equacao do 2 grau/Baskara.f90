program baskara

double precision a,b,c,x1,x2,x,Delta

complex xc1,xc2

integer menu,aperte

10 continue

write(*,*) ''

write(*,*) '1-Calcular'

write(*,*) '2-Sair'

read(*,*,iostat = ierr)menu

select case(menu)

case(1)

20 continue

write(*,*) 'a*x**2+b*x+c=0'

write(*,*) 'Digite o valor de a:'

read(*,*,iostat = ierr)a

if(ierr/=0) then

write(*,*) 'Erro, tente novamente'

goto 20

end if

write(*,*) 'Digite o valor de b:'

read(*,*,iostat = ierr)b

if(ierr/=0) then

write(*,*) 'Erro, tente novamente'

goto 20

end if

write(*,*) 'Digite o valor de c:'

read(*,*,iostat = ierr)c

if(ierr/=0) then

write(*,*) 'Erro, tente novamente'

goto 20

end if

if(a==0) then

if(b==0) then

write(*,*) 'Os dados nao sao coerentes'

goto 10

end if

write(*,*) 'Esta equacao nao e do 2 grau'

x=-c/b

write(*,*) 'x=',x

goto 10

end if

write(*,*) ''

Delta=(b**2)-4*a*c

write(*,*) 'Delta=',Delta

if(delta<0) then

write(*,*) 'Solucao vazia'

write(*,*) ''

write(*,*) '    Porem posso responder com numeros complexo'
write(*,*) 'entretanto vc so ira aprender la pro 2 ano ou 3.'

5 continue

write(*,*) ''

write(*,*) 'Se quiser aperte 1'

write(*,*) 'Se nao aperte qualquer um outro numero'

read(*,*,iostat = ierr)aperte

if(ierr/=0) then

goto 10

end if

select case(aperte)

case(1)

pr = -b/(2*a) !parte real

pi = sqrt(abs(delta))/(2*a) !parte imaginária

xc1 = cmplx(pr,pi) !comando para escrever variável complexa

xc2 = cmplx(pr,-pi) !segunda raiz: conjugado

write(*,*) ''

write(*,*)'Raizes complexas:'

write(*,*)'x1 = ',xc1

write(*,*)'x2 = ',xc2

goto 10

case default

goto 10

end select

end if

write(*,*) ''

x1=((-1*b)-sqrt(delta))/(2*a)

write(*,*) 'x1=',x1

x2=((-1*b)+sqrt(delta))/(2*a)

write(*,*) 'x2=',x2

goto 10

case(2)

write(*,*) 'Tchau'

pause

stop

case default

write(*,*) 'Erro, tente denovo'

goto 10

end select

stop

end program