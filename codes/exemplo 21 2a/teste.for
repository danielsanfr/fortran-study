C	DECLARACAO DE VARIAVEIS
	INTEGER NUMERO,I,UE,US
	REAL MEDIA,SOMA,NOTA(10)
	UE = 5
	US = 6
C	LEITURA E SOMA DAS NOTAS
	SOMA = 0
	DO 10 I = 1,10,1
		READ(UE,1)NOTA(I)
1		FORMAT(F3.0)
		SOMA = SOMA + NOTA(I)
10	CONTINUE
C	CALCULO DA MEDIA
	MEDIA = SOMA/10
C	CALCULO DO NUMERO DE NOTAS ACIMA DA MEDIA
	NUMERO = 0
	DO 20 I = 1,10,1
		IF (MEDIA.LT.NOTA(I)) NUMERO = NUMERO + 1
20	CONTINUE
C	IMPRESSAO DOS RESULTADOS
	WRITE(US,22)MEDIA,NUMERO
22	FORMAT(1H0,F4.1,2X,I3)
	STOP
	END PROGRAM