	INTEGER TRAFEG(4,4,3)
	INTEGER DESTIN, I, J, K, ORIGEM, Q, TIPO
	INTEGER US, UE
	UE = 5
	US = 6
	DO 10 I = 1,4,1
		DO 10 J = 1,4,1
			DO 10 K = 1,3,1
				TRAFEG(I,J,K) = 0
10	CONTINUE
20	CONTINUE
	READ(UE,21) ORIGEM, DESTIN, TIPO
21	FORMAT(3(I1,1X))
	IF(ORIGEM .EQ. 0 .AND. DESTIN .EQ. 0 .AND. TIPO .EQ. 0) GO TO 30
	TRAFEG(ORIGEM, DESTIN, TIPO) = TRAFEG(ORIGEM,DESTIN,TIPO) + 1
	GO TO 20
30	CONTINUE
	DO 40 K = 1,3,1
		WRITE(US,32)K
32		FORMAT('VEICULO DO TIPO: ',I2)
		DO 40 I = 1,4,1
			WRITE(US,34) (TRAFEG(I,J,K),J=1,4,1)
34			FORMAT(4(I2,2X))
40	CONTINUE
	Q = 0
	DO 50 J = 1,4,1
		DO 50 K =1,3,1
			Q = Q + TRAFEG(1,J,K)
50	CONTINUE
	WRITE(US,52) Q
52	FORMAT(I2)
	Q = TRAFEG(4,2,3) + TRAFEG(4,4,3)
	WRITE(US,54) Q
54	FORMAT(I4)
	STOP
	END