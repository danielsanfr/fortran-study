	INTEGER IDADE,NDEPEN,CALORI,SEXO,ESTCIV,INSTRU,MENDIA
     *		NARQ,UE1,UE2,UE3,US,FDA1,FDA2,FDA3
	DIMENSION IDADE(3),SALARO(3),NDEPEN(3),CALORI(3),SEXO(3),
     *		  ESTCIV(3),INSTRU(3),PATRIM(3)
	UE1 = 2
	UE2 = 3
	UE3 = 4
	US  = 5
	OPEN(UE1,FILE='REG1.TXT',STATUS='OLD')
	OPEN(UE2,FILE='REG2.TXT',STATUS='OLD')
	OPEN(UE3,FILE='REG3.TXT',STATUS='OLD')
	OPEN(US,FILE='TOTL.TXT',STATUS='NEW')
	READ(UE1,10,IOSTAT=FDA1)IDADE(1),SALARO(1),NDEPEN(1),
     *	PATRIM(1),CALORI(1),SEXO(1),ESTCIV(1),INSTRU(1)
11	READ(UE2,10,IOSTAT=FDA2)IDADE(2),SALARO(2),NDEPEN(2),
     *	PATRIM(2),CALORI(2),SEXO(2),ESTCIV(2),INSTRU(2)
12	READ(UE3,10,IOSTAT=FDA3)IDADE(3),SALARO(3),NDEPEN(3),
     *	PATRIM(3),CALORI(3),SEXO(3),ESTCIV(3),INSTRU(3)
10	FORMAT(I2,1X,F9.2,1X,I2,1X,F10.0,1X,I3,1X,A3,1X,A4,1X,A4)
20	CONTINUE
		IF((FDA1.NE.0).AND.(FDA2.NE.0).AND.(FDA3.NE.0))GO TO 80
		MENIDA = 999
		IF(IDADE(1).LT.MENIDA.AND.(FDA1.EQ.0))THEN
			MENIDA = IDADE(1)
			NARQ = 1
		END IF
		IF(IDADE(2).LT.MENIDA.AND.(FDA2.EQ.0))THEN
			MENIDA = IDADE(2)
			NARQ = 2
		END IF
		IF(IDADE(3).LT.MENIDA.AND.(FDA3.EQ.0))THEN
			MENIDA = IDADE(3)
			NARQ = 3
		END IF
		IF(NARQ.EQ.1)THEN
			WRITE(US,40)IDADE(1),SALARO(1),NDEPEN(1),PATRIM(1),
     *			 CALORI(1),SEXO(1),ESTCIV(1),INSTRU(1)
40			FORMAT(1X,I2,1X,F9.2,1X,I2,1X,F10.0,1X,I3,1X,A3,1X,A4,
     *			   1X,A4)
			READ(UE1,10,IOSTAT=FDA1)IDADE(1),SALARO(1),NDEPEN(1),
     *			PATRIM(1),CALORI(1),SEXO(1),ESTCIV(1),INSTRU(1)
		ELSE
			IF(NARQ.EQ.2)THEN
				WRITE(US,40)IDADE(2),SALARO(2),NDEPEN(2),PATRIM(2),
     *				 CALORI(2),SEXO(2),ESTCIV(2),INSTRU(2)
				READ(UE2,10,IOSTAT=FDA2)IDADE(2),SALARO(2),NDEPEN(2),
     *				PATRIM(2),CALORI(2),SEXO(2),ESTCIV(2),INSTRU(2)
			ELSE
				IF(NARQ.EQ.3)THEN
					WRITE(US,40)IDADE(3),SALARO(3),NDEPEN(3),
     *					 PATRIM(3),CALORI(3),SEXO(3),
     *					 ESTCIV(3),INSTRU(3)
					READ(UE3,10,IOSTAT=FDA3)IDADE(3),SALARO(3),
     *					NDEPEN(3),PATRIM(3),CALORI(3),SEXO(3),
     *					ESTCIV(3),INSTRU(3)
				END IF
			END IF
		END IF
	GO TO 20
80	CONTINUE
	CLOSE(UE1,STATUS='KEEP')
	CLOSE(UE2,STATUS='KEEP')
	CLOSE(UE3,STATUS='KEEP')
	ENDFILE US
	CLOSE(US,STATUS='KEEP')
	STOP
	END