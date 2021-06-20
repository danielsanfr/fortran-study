! Programa para resolver equacoes de uma variavel pelo metodo da BISSECAO
      PROGRAM Biseccion
      IMPLICIT NONE
      REAL F
      REAL tol
      REAL a,b,z
      INTEGER nummax,cont
      
      WRITE(*,*)"Introduza o numero maximo de interaçoes:"
	READ(*,*) nummax
      WRITE(*,*)"Introduza a tolerancia:"
      READ(*,*) tol
      WRITE(*,*)"Introduza o intervalo:"
      WRITE(*,*)"INICIO:"
      READ(*,*) a
      WRITE(*,*)"FIN"
      READ(*,*) b
      IF ((a.GT.b).OR.(F(a).EQ.0).OR.(F(b).EQ.0)) THEN
         STOP 'Intervalo Incorreto o eh uma raiz de da funcao'
      ENDIF   
! COMPROVAMOS QUE EXISTE Ao MENOS UM ZERO NESTE INTERVALO
      IF ((F(a)*F(b)).LE.0) THEN
         WRITE(*,*)"Comprovacao correta"
      ELSE
         STOP 'Comprovacao incorreta.NO EXISTEM ZEROS NO INTERVALO'               
      ENDIF
      cont=0
      DO WHILE(cont.NE.nummax)
        cont=cont+1
        z=(a+b)/2

        IF (F(a)*F(z).LT.0) THEN
           b=z
        ELSE
           a=z
        ENDIF
        IF ((b-a).LT.tol) THEN
           WRITE(*,*)"O RESULTADO APROXIMADADO EH:",z
           STOP
        ENDIF
        WRITE(*,*)"O RESULTADO EH:",z      
      ENDDO
      WRITE(*,*)"O RESULTADO FINAL EH:",z
      STOP
      
      END
      
      
      
      
      FUNCTION F(X)
      F=X**3-4*x**2+x+6
      END       