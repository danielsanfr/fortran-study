	INTEGER N,TRIMES,X,UE,US
	REAL C,MN,REND,I
	UE = 5
	US = 6
	READ(UE,1) C,I,X
1	FORMAT(2F7.2,I2)
	MN = C
	N = 4*X
	DO 10 TRIMES = 1 , N
		REND = I*MN
		MN = C*(1+I)**TRIMES
		WRITE(US,2) REND,MN
2	FORMAT(1X,'RENDIMENTO = ',F15.2/1X,'MONTANTE = ',F15.2)
10	CONTINUE
	STOP
	END