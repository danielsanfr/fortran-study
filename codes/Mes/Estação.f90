program estacao

CHARACTER (7) J

CHARACTER (9) F

CHARACTER (5) M

CHARACTER (5) A

CHARACTER (4) M1

CHARACTER (5) J1

CHARACTER (5) J2

CHARACTER (6) A1

CHARACTER (8) S

CHARACTER (7) O

CHARACTER (8) N

CHARACTER (8) D

CHARACTER (9) m2

J='JANEIRO'
F='FEVEREIRO'
M='MARCO'
A='ABRIL'
M1='MAIO'
J1='JUNHO'
J2='JULHO'
A1='AGOSTO'
S='SETENBRO'
O='OUTUBRO'
N='NOVEMBRO'
D='DESEMBRO'

! Programa que calcula qual estação do ano pertence o mês

10 CONTINUE

WRITE(*,*) 'Escreva o mes que voce deseja'

READ(*,*)m2

SELECT CASE (m2)

CASE ('agosto','setembro','outubro')

	WRITE(*,*) 'esta na primavera'

CASE ('novembro','dezembro','janeiro')

	WRITE(*,*) 'esta no verão'

CASE ('fevereiro','março','abril')

	WRITE(*,*) 'esta no outono'

CASE ('maio','junho','julho')

	WRITE(*,*) 'esta no inverno'

CASE DEFAULT

	WRITE(*,*) 'Erro, tente novamente'

	GO TO 10

END SELECT

GO TO 10

STOP

END PROGRAM
