	INTEGER A(10),B(10),C(10),NA,NB,I,RES
	OPEN(1,FILE='A.txt',STATUS='OLD')
	OPEN(2,FILE='B.txt',STATUS='OLD')
	OPEN(3,FILE='C.txt',STATUS='NEW')
	READ(*,*)NA
	READ(1,"(I)")(A(I),I=1,NA)
	READ(*,*)NB
	READ(2,"(I)")(B(J),J=1,NB)
	AUX = 0
	AA:DO I = 1,NA
		J = 0
10		CONTINUE
		J = J+AUX+1
		IF(J>NB) THEN
			RES = I
			GOTO 20
		END IF
		IF(A(I).LT.B(J)) THEN
			WRITE(3,"(I)")A(I)
			CYCLE AA
		ELSE
			WRITE(3,"(I)")B(J)
			AUX = AUX+1
			GOTO 10
		END IF
	END DO AA
20	CONTINUE
	WRITE(3,"(I,/)")(A(I),I=RES,NA)
	STOP
	END