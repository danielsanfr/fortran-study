C	DEFINICAO DOS TIPOS DE VARIAVEIS
	INTEGER DIA,ANO
	CHARACTER BARRA1 * 1,BARRA2 * 1,MES * 3
	CHARACTER MESES(12) * 3
	INTEGER DIAMES(12)
	INTEGER I,M,TOTAL1,TOTAL2,DIFER,UE,US
	LOGICAL VALIDO
	UE=5
	US=6
C	LEITURAS
	READ(UE,1) (MESES(I),I=1,12,1)
1	FORMAT(12(A3,1X))
	READ(UE,3) (DIAMES(I),I=1,12,1)
3	FORMAT(12(I2,1X))
C	CALCULO DO TOTAL DE DIAS
	TOTAL1=21
	DO 10 I=1,5,1
	TOTAL1=TOTAL1+DIAMES(I)
10	CONTINUE
20	CONTINUE
C	LEITURA DA DATA
	READ(UE,21) DIA,BARRA1,MES,BARRA2,ANO
21	FORMAT(I2,A1,A3,A1,I4)
	IF (DIA.EQ.0.AND.BARRA1.EQ.'/'.AND.MES.EQ.'JAN'.AND. 
     * BARRA2.EQ.'/'.AND.ANO.EQ.0) GO TO 60
C	VERIFICACAO DA CORREACAO DA DATA
	IF(ANO.EQ.1985) THEN
	M=0
30	CONTINUE
	M=M+1
	IF(MES.EQ.MESES(M).OR.M.EQ.12) GO TO 40
	GO TO 30
40	CONTINUE
	IF(MES.EQ.MESES(M)) THEN
	VALIDO=.FALSE.
	END IF
	IF(VALIDO) THEN
	IF(DIA.GT.0.AND.DIA.LE.DIAMES(M)) THEN
	TOTAL2=DIA
	DO 50 I=1,M-1,1
	TOTAL2=TOTAL2+DIAMES(I)
50	CONTINUE
	DIFER=IABS(TOTAL2-TOTAL1)
	WRITE(US,52) DIA,BARRA1,MES,BARRA2,ANO,DIFER
52	FORMAT(1H,'DATA FORNECIDA = ',I2,A1,A3,A1,I4,5X,'DIFERNCA=',I3)
	ELSE
	WRITE(US,54) DIA,BARRA1,MES,BARRA2,ANO
54	FORMAT(1H,'DATA FORNECIDA= ',I2,A1,A3,A1,I4,5X,'DATA INCORRETA')
	END IF
	ELSE
	WRITE(US,54) DIA,BARRA1,MES,BARRA2,ANO
	END IF
	ELSE
	WRITE(US,54) DIA,BARRA1,MES,BARRA2,ANO
	END IF
	GO TO 20
60	CONTINUE
	STOP
	END
