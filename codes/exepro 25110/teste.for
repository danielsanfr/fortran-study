C		DECLARACAO DAS VARIAVEIS sorting
	INTEGER A(10),B(10),C(10),N,NA,NB,I,RES
	INTEGER UE,US
	OPEN(1,FILE='A.txt',STATUS='OLD')
	OPEN(2,FILE='B.txt',STATUS='OLD')
	OPEN(3,FILE='C.txt',STATUS='NEW')
	UE = 5
	US = 6
	READ(*,*)NA
	READ(1,"(I)")(C(I),I=1,NA)
	READ(*,*)NB
	READ(2,"(I)")(C(NA+J),J=1,NB)
C		ORDENACAO DE A
	DO 30 J = 2,NA+NB,1
		AUX = C(J)
		I = J
10		CONTINUE
			I = I - 1
			IF(I.EQ.1.OR.AUX.GT.C(I)) GOTO 20
			C(I+1) = C(I)
		GOTO 10
20		CONTINUE
		IF(AUX.GT.C(I))THEN
			C(I+1) = AUX
		ELSE
			C(I+1) = C(I)
			C(I) = AUX
		END IF
30	CONTINUE
	WRITE(US,32)(C(I),I=1,NA+NB,1)
	WRITE(3,33)(C(I),I=1,NA+NB,1)
32	FORMAT(1H0,10(I,1X))
33	FORMAT(10(I,1X,/))
	STOP
	END