	INTEGER PAR,SOMA,US
	US = 6
	SOMA = 0
	PAR = 100
10	IF (PAR.GT.200) GO TO 20
	SOMA = SOMA + PAR
	PAR = PAR + 2
	GO TO 10
20	CONTINUE
	WRITE(US,22)SOMA
22	FORMAT(1X, 'SOMA = ',I5)
	STOP
	END