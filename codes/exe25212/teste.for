	INTEGER I,J,ADM,ATIVIDA(4)
	REAL MATERIA(4,7),CUSTOUN(1,7),CUSTOAT(4),CUSTOL(4),ENCARGS(4)
	REAL CUSTOTT,MATERTT(7)
	OPEN(UNIT=1,FILE="materiais.dat",STATUS="OLD")
	OPEN(UNIT=2,FILE="custoun.dat",STATUS="OLD")
	CUSTOAT = 0.0
	CUSTOL = 0.0
	ENCARGS = 0.0
	CUSTOTT = 0.0
	MATERTT = 0.0
	DO I = 1,4
		IF(I.EQ.1)READ(2,10)(CUSTOUN(I,J),J=1,7)
		READ(1,10)(MATERIA(I,J),J=1,7)
	END DO
	DO I = 1,4
		IF(I.EQ.1) THEN
			WRITE(*,10)(CUSTOUN(I,J),J=1,7)
			WRITE(*,*)
		END IF
		WRITE(*,10)(MATERIA(I,J),J=1,7)
	END DO
10	FORMAT(7(F5.1,2X))
C	LEITURA DA TAXA DE ADMINISTRACAO
	READ(*,20)ADM
	READ(*,20)(ATIVIDA(I),I=1,4)
20	FORMAT(4(I3,1X))
C	======================ETAPA D.1 E D.2==========================
	DO I = 1,4
		DO J = 1,7
			CUSTOAT(I)=CUSTOAT(I)+ATIVIDA(I)*MATERIA(I,J)*CUSTOUN(1,J)
		END DO
		CUSTOAT(I)=CUSTOAT(I)*(1.+ADM/100.)
		CUSTOL(I)=CUSTOAT(I)*1.36
	END DO
C	=========================ETAPA D.3=============================
	DO I = 1,4
		DO J = 4,5
			ENCARGS(I)=ENCARGS(I)+ATIVIDA(I)*MATERIA(I,J)*CUSTOUN(1,J)
		END DO
		ENCARGS(I) = ENCARGS(I)*0.16
	END DO
C	=========================ETAPA D.4=============================
	DO I = 1,4
		CUSTOTT = CUSTOTT + CUSTOL(I)+ENCARGS(I)
	END DO
	WRITE(*,*)CUSTOTT
	PAUSE
C	=========================ETAPA D.5=============================
	DO J = 1,7
		DO I = 1,4
			MATERTT(J) = MATERTT(J) + MATERIA(I,J)*ATIVIDA(I)
		END DO
	END DO 
	WRITE(*,*)(MATERTT(J),I=1,7)
	STOP
	END