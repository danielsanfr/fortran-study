	INTEGER US
	REAL A
	US = 6
	DO 10 A = 7.8,6.1,-0.1
		WRITE(US,2) A
2		FORMAT(1X,F3.1)
10	CONTINUE
	STOP
	END