program teste1 !com as modifica��es recomendadas

real a(3) !dimensionamento usando a declara��o REAL

10 continue

write(*,*)' X**3+p*X+q=0'

write(*,*) 'Escreva os valores de a, p e q'

read(*,*,iostat = ierr) (a(i), i = 1,3) !leitura com DO impl�cito

if(ierr /= 0) then !ierr diferente de zero: houve erro na leitura

  write(*,*)' Erro lendo os valores de a, p e q. '

  goto 10 !ir para o endere�o 10 refazer as leituras

end if

if(a(1)/=1) then

a(2)=a(2)/a(1)
a(3)=a(3)/a(1)
a(1)=a(1)/a(1)

write(*,*)a(1),a(2),a(3)

end if

if(a(1) == 0.0) then !testa se a equa��o � do segundo grau

  if(a(2) == 0.0) then !testa se � equa��o do primeiro grau

    write(*,*)' ' 

    write(*,*)'Os dados n�o s�o coerentes.'

    stop !encerra a execu��o

  end if

  x1 = -a(3)/a(2) !calcula a raiz da equa��o do primeiro grau 

  write(*,*)' ' 

  write(*,20)x1

  20 format(' A equa��o � do primeiro grau:    x = ',e12.6)

  stop !p�ra o programa

end if

d = (a(3)**2)/4.+(a(2)**3)/27. !c�lculo do discriminante

write(*,*)d

if(a(1)==1.and.d.ge.0)then !testa se o discriminante � maior que zero

  x=((-a(3)/2.)+sqrt(d))**(1/3.)+((-a(3)/2.)-sqrt(d))**(1/3.)

   write(*,*)'x = ',x

end if

stop

end program