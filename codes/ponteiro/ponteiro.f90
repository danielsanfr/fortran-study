PROGRAM pointer
	TYPE :: cadastro
		CHARACTER(10) :: descricao
		INTEGER :: numero
	END TYPE cadastro
	TYPE (cadastro), POINTER :: ptr_1, ptr_2

            	ALLOCATE (ptr_1) !Cria um local para armazenar o tipo derivado
			  !cadastro e associa ptr_1 com esse local
		
	ptr_1%descricao = 'carlos'   !Armazena valores na estrutura criada
	ptr_1%numero = 1234
	PRINT "(2A,I6)","ptr_1 = ",ptr_1
	ptr_2 => ptr_1  !Associa ptr_2 com o que o ptr_1 apontava
	NULLIFY(ptr_1)  !faz a dissociação
	IF (.NOT. ASSOCIATED (ptr_1)) THEN
			PRINT "(A)","ptr_1 esta dissociado"
	END IF
	PRINT "(2A,I6)","ptr_2 = ",ptr_2
	DEALLOCATE(ptr_2)     !Desaloca o espaço da memória e dissocia o ptr_2
End Program pointer
