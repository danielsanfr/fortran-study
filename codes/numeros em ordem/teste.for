C		DECLARACAO DAS VARIAVEIS sorting
	REAL A(200)
	REAL AUX
	INTEGER I,J,N
	INTEGER UE,US
	UE = 5
	US = 6
	READ(UE,1)N
1	FORMAT(I2)
	READ(UE,3)(A(I),I=1,N,1)
3	FORMAT(16(F3.1))
C		ORDENACAO DE A
	DO 30 J = 2,N,1
		AUX = A(J)
		I = J
10		CONTINUE
			I = I - 1
			IF(I.EQ.1.OR.AUX.GT.A(I)) GOTO 20
			A(I+1) = A(I)
		GOTO 10
20		CONTINUE
		IF(AUX.GT.A(I))THEN
			A(I+1) = AUX
		ELSE
			A(I+1) = A(I)
			A(I) = AUX
		END IF
30	CONTINUE
	WRITE(US,32)(A(I),I=1,N,1)
32	FORMAT(1H0,(16(F3.1,1X)/1H ))
	STOP
	END