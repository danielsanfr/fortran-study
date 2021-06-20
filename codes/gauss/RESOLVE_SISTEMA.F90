
      PROGRAM RESOLVE_SISTEMA
      IMPLICIT NONE
      INTEGER dim,i,j
            

      REAL A[ALLOCATABLE](:,:)
      REAL solucion[ALLOCATABLE](:)
      
	
	WRITE(*,*)"Solucao de sistemas de equacoes pelo metodo de Gauss"
	WRITE(*,*)""
	WRITE(*,*)""

	WRITE(*,*)"DIGITE A DIMENSAO DA MATRIZ:"
      READ(*,*) dim
      

      ALLOCATE(A(dim,dim+1))
      ALLOCATE(solucion(dim))

      DO i=1,dim,1
         DO j=1,dim+1,1
            IF (j.NE.dim+1) THEN
              WRITE(*,*)"INTRODUZA O COEFICIENTE PARA A",i,j
              READ(*,*) A(i,j)
            ELSE
              WRITE(*,*)"INTRODUZA O TERMO INDEPENDIENTE B",i     
              READ(*,*) A(i,j)
            ENDIF
         ENDDO
      ENDDO


      CALL Gauss(dim,A,solucion)
      
      DO i=1,dim,1
      WRITE(*,*)"X",i," VALE:",solucion(i)
      ENDDO
      
      END
      

      
      SUBROUTINE Gauss(n,B,sol)
      
      INTEGER n
      REAL B(n,n+1),sol(n)
      INTEGER i,j,p,k
      REAL aux
      cont=1
      p=1
      DO j=1,n-1,1
         p=j
         DO WHILE ((B(p,j).EQ.0).AND.(p.LE.n))
            p=p+1
         ENDDO
         IF (p.EQ.n+1) THEN
            WRITE(*,*)"NAO EXISTE SOLUCAO UNICA"
            STOP
         ENDIF       
         IF (p.NE.j) THEN
            DO i=1,n+1,1
               aux=B(i,j)
               B(i,j)=B(p,j)
               B(p,j)=aux   
            ENDDO
         ENDIF
         DO i=j+1,n,1
            DO k=1,n+1,1   
               aux=B(i,j)/B(k,k)
               B(i,k)=(B(i,k)-aux*B(k,k))
            ENDDO      
         ENDDO
      ENDDO   
         
         IF (B(n,n).EQ.0) THEN
            WRITE(*,*)"NAO EXISTE SOLUCAO UNICA"
            STOP
         ENDIF
         DO i=1,n,1
            sol(i)=0.
         ENDDO
         sol(n)=B(n,n+1)/B(n,n)
         DO i=n-1,1,1
            DO j=i+1,n,1
               sol(i)=sol(i)+((B(i,n+1)-B(i,j)*sol(j))/B(i,i))
            ENDDO
         ENDDO
            
      RETURN
      END
