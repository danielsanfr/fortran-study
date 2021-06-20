	REAL AUX,L,M,N
	INTEGER UE,US
	UE = 5
	US = 6
	READ(UE,1) L,M,N
1	FORMAT(3F5.2)
	IF (L.GT.M.OR.L.GT.N) THEN
		IF (M.LT.N) THEN
			AUX = L
			L = M
			M = AUX
		ELSE
			AUX = L
			L = N
			N = AUX
		END IF
	END IF
	IF (M.GT.N) THEN
		AUX = M
		M = N
		N = AUX
	END IF
	WRITE(US,2) L,M,N
2	FORMAT(10X,3(F5.2,5X))
	STOP
	END