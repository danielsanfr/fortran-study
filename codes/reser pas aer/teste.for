	INTEGER VOOS(37),LDISP(37),APONT,CLIENT,I,NVOO
	INTEGER	UE,US
	UE = 5
	US = 6
	READ(UE,1)(VOOS(I),I=1,6,1),(LDISP(I),I=1,6,1)
1	FORMAT(20I4)
10	CONTINUE
		READ(UE,11) CLIENT,NVOO
11		FORMAT(I4,I4)
		IF(CLIENT.EQ.9999) GO TO 40
		I = 0
20		CONTINUE
			I = I + 1
			IF (I.EQ.6.OR.VOOS(I).EQ.NVOO) GO TO 30
		GO TO 20
30		CONTINUE
		IF (VOOS(I).EQ.NVOO) THEN
			APONT = I
		ELSE
			WRITE(US,32) CLIENT,NVOO
32			FORMAT(1H,2(I4,2X),'VOO INEXISTENTE')
			APONT = 0
		END IF
		IF (APONT.NE.0) THEN
			IF (LDISP(APONT).GT.0) THEN
				WRITE(US,34) CLIENT,NVOO
34				FORMAT(1H, 2(I4,2X),'VOO CONFIRMADO')
				LDISP(APONT) = LDISP(APONT) - 1
			ELSE
				WRITE(US,36) CLIENT,NVOO
36				FORMAT(1H,2(I4,2X),'VOO LOTADO')
			END IF
		END IF
	GO TO 10
40	CONTINUE
	STOP
	END PROGRAM