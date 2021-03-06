C	DEFINIÇÃO DAS VARIAVEIS
	
	CHARACTER * 16 NOME(4,4) , PRODUT(7)
	INTEGER QUANTI(4,4)
	INTEGER OCORRE(7)
	LOGICAL TESTE
	INTEGER I,J,K,UE,US
	UE = 5
	US = 6

C	QUANTI - QUANTIDADE DE CADA TIPO DE MATERIAL
C	NOME   - NOME DE CADA MATERIAL ARMAZENADO
C	OCORRE - ACUMULADOR DE QUANTIDADE DE CADA MATERIAL
C	PRODUT - NOME DOS MATERIAIS
C	I,J,K  - VARIAVEIS AUXILIARES

C	ATRIBUIÇÃO DOS VALORES INICIAIS

	DO 10 I = 1,4
		OCORRE(I) = 0
10	CONTINUE

C	LEITURA DO PATIO

	DO 20 I = 1,4,1
		READ(UE,11)(QUANTI(I,J),NOME(I,J),J=1,4,1)
11	FORMAT(4(I4,A16))
20	CONTINUE

C	LEITURA DOS NOMES DOS MATERIAIS

	READ(UE,21)(PRODUT(I),I=1,7,1)
21	FORMAT(A16)

C	DETERMINAÇÃO DE QUANTIDADE DE CADA MATERIAL NO PATIO

	DO 30 I = 1,7,1
		DO 30 J = 1,4,1
			DO 30 K = 1,4,1
				TEST = .TRUE.
				IF(NOME(J,K).NE.PRODUT(I))TESTE = .FALSE.
				IF(TESTE)OCORRE(I) = QUANTI(J,K) + OCORRE(I)
30	CONTINUE

C	ESCRITA DA QUANTIDADE CALCULADA

	WRITE(US,32)
32	FORMAT(1H1,'PRODUTO',20X,'QUANTIDADE',
     *		1H ,'-------',20X,'-------')
	DO 40 I = 1,7,1
	WRITE(US,34)PRODUT(I),OCORRE(I)
34	FORMAT(1H ,A16,13X,I5)

40	CONTINUE

	STOP
	END