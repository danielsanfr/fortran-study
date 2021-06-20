	PROGRAM PI
	REAL A,B,S,P
	INTEGER K,US
	US = 6
	S = 0.0
	DO 1 K = 0 , 11
1	S = S + ((-1.0)**K)/(((2.0*K)+1.0)**3)
	P = (S*32.0)**(1.0/3.0)
	WRITE(US,"(F24.22)")P
	STOP
	END