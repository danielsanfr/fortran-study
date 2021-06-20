!  Programa para demonstrar GETCHARQQ
USE DFLIB
CHARACTER(1) key / 'A' /
PARAMETER (ESC = 27)
PARAMETER (NOREP = 0)
WRITE (*,*) ' Type a key: (or q to quit)'
!  Leia as teclas ESC ou até q é pressionado
DO WHILE (ICHAR (key) .NE. ESC)
   key = GETCHARQQ()
!  Algumas teclas não têm estendido ASCII representação
   IF(ICHAR(key) .EQ. NOREP) THEN
     key = GETCHARQQ()
     WRITE (*, 900) 'Not ASCII. Char = NA'
     WRITE (*,*)
!  	Caso contrário, existe apenas uma chave
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