	INTEGER NUMERO(10),I,UE,US
	UE = 5
	US = 6
	READ(UE,1) (NUMERO(I),I=1,10,1)
1	FORMAT(10(I2,1X),/)
C	VERIFICACAO DA EXISTENCIA DE ELEMENTOS IGUAIS A 30
	DO 10 I = 1,10,1
		IF (NUMERO(I).EQ.30) WRITE(US,2) I
2		FORMAT(1X,I3)
10	CONTINUE
	STOP
	END PROGRAM