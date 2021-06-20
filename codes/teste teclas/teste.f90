!  Programa para demonstrar GETCHARQQ
USE DFLIB
CHARACTER(1) key / 'A' /
PARAMETER (ESC = 27)
PARAMETER (NOREP = 0)
WRITE (*,*) ' Type a key: (or q to quit)'
!  Leia as teclas ESC ou at� q � pressionado
DO WHILE (ICHAR (key) .NE. ESC)
   key = GETCHARQQ()
!  Algumas teclas n�o t�m estendido ASCII representa��o
   IF(ICHAR(key) .EQ. NOREP) THEN
     key = GETCHARQQ()
     WRITE (*, 900) 'Not ASCII. Char = NA'
     WRITE (*,*)
!  	Caso contr�rio, existe apenas uma chave
   ELSE
     WRITE (*,900) 'Tecla = '
     WRITE (*,901) key
   END IF
   IF (key .EQ. 'q' ) THEN
     EXIT
   END IF
   END DO
900   FORMAT (1X, A, \)
901   FORMAT (A)
END