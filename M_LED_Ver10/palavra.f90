subroutine palavra(ii,k,kk,kkk,tam_pala,tam_fra,frase,letra,op)

integer i,j,iletra,ii,k,kk,num,op,tam_fra,tam_pala,kkk

character*25 letra(52,4)

character*256 frase

character*1 letr

external caractere

num = 0

if(op == 0) then

do 1 i = ii-k,ii-1

	num = num + 1

	letr = frase(i:i)

	call caractere(letr,iletra)

	if(num < 10) then

		if(iletra > 10) then
		write(1,"(12x,A9)")trim(adjustl(letra(iletra,1)))
		else
		write(1,"(12x,A8)")trim(adjustl(letra(iletra,1)))
		end if
		write(1,"(12x,A13,I1)")trim(adjustl(letra(iletra,2))),num
		write(1,"(12x,A10)")trim(adjustl(letra(iletra,3)))
		write(1,"(12x,A17,I1)")trim(adjustl(letra(iletra,4))),num
	else
		if(iletra > 10) then
		write(1,"(12x,A9)")trim(adjustl(letra(iletra,1)))
		else
		write(1,"(12x,A8)")trim(adjustl(letra(iletra,1)))
		end if
		write(1,"(12x,A13,I2)")trim(adjustl(letra(iletra,2))),num
		write(1,"(12x,A10)")trim(adjustl(letra(iletra,3)))
		write(1,"(12x,A17,I2)")trim(adjustl(letra(iletra,4))),num
	end if

1	continue

write(1,*)''

if(tam_pala >= 10) write(1,"(12x,A10,I2)")'MOVLW    .',tam_pala
if(tam_pala < 10) write(1,"(12x,A10,I1)")'MOVLW    .',tam_pala
write(1,"(12x,A21,/)")'MOVWF    QUANT_CARACT'
			
write(1,"(12x,A15,/)")'CALL    CAPTURA'

write(1,"(12x,A21,/)")'CALL    LIMPAR_MATRIZ'

end if

if(op == 1) then

do 2 i = ii-k,ii+kk-1

	num = num + 1

	letr = frase(i:i)

	call caractere(letr,iletra)

	if(num < 10) then
		if(iletra > 10) then
		write(1,"(12x,A9)")trim(adjustl(letra(iletra,1)))
		else
		write(1,"(12x,A8)")trim(adjustl(letra(iletra,1)))
		end if
		write(1,"(12x,A13,I1)")trim(adjustl(letra(iletra,2))),num
		write(1,"(12x,A10)")trim(adjustl(letra(iletra,3)))
		write(1,"(12x,A17,I1)")trim(adjustl(letra(iletra,4))),num
	else
		if(iletra > 10) then
		write(1,"(12x,A9)")trim(adjustl(letra(iletra,1)))
		else
		write(1,"(12x,A8)")trim(adjustl(letra(iletra,1)))
		end if
		write(1,"(12x,A13,I2)")trim(adjustl(letra(iletra,2))),num
		write(1,"(12x,A10)")trim(adjustl(letra(iletra,3)))
		write(1,"(12x,A17,I2)")trim(adjustl(letra(iletra,4))),num
	end if

2	continue

write(1,*)''

if(tam_pala >= 10) write(1,"(12x,A10,I2)")'MOVLW    .',tam_pala
if(tam_pala < 10) write(1,"(12x,A10,I1)")'MOVLW    .',tam_pala
write(1,"(12x,A21,/)")'MOVWF    QUANT_CARACT'
			
write(1,"(12x,A15,/)")'CALL    CAPTURA'

write(1,"(12x,A21,/)")'CALL    LIMPAR_MATRIZ'

end if

if(op == 2) then

do 3 i = ii-k,tam_fra

	num = num + 1

	letr = frase(i:i)

	call caractere(letr,iletra)

	if(num < 10) then
		if(iletra > 10) then
		write(1,"(12x,A9)")trim(adjustl(letra(iletra,1)))
		else
		write(1,"(12x,A8)")trim(adjustl(letra(iletra,1)))
		end if
		write(1,"(12x,A13,I1)")trim(adjustl(letra(iletra,2))),num
		write(1,"(12x,A10)")trim(adjustl(letra(iletra,3)))
		write(1,"(12x,A17,I1)")trim(adjustl(letra(iletra,4))),num
	else
		if(iletra > 10) then
		write(1,"(12x,A9)")trim(adjustl(letra(iletra,1)))
		else
		write(1,"(12x,A8)")trim(adjustl(letra(iletra,1)))
		end if
		write(1,"(12x,A13,I2)")trim(adjustl(letra(iletra,2))),num
		write(1,"(12x,A10)")trim(adjustl(letra(iletra,3)))
		write(1,"(12x,A17,I2)")trim(adjustl(letra(iletra,4))),num
	end if

3	continue

write(1,*)''

if(tam_pala >= 10) write(1,"(12x,A10,I2)")'MOVLW    .',tam_pala
if(tam_pala < 10) write(1,"(12x,A10,I1)")'MOVLW    .',tam_pala
write(1,"(12x,A21,/)")'MOVWF    QUANT_CARACT'
			
write(1,"(12x,A15,/)")'CALL    CAPTURA'

write(1,"(12x,A21,/)")'CALL    LIMPAR_MATRIZ'

end if

if(op == 3) then

do 4 i = ii-k+1,ii+kk+kkk

	num = num + 1

	letr = frase(i:i)

	call caractere(letr,iletra)

	if(num < 10) then
		if(iletra > 10) then
		write(1,"(12x,A9)")trim(adjustl(letra(iletra,1)))
		else
		write(1,"(12x,A8)")trim(adjustl(letra(iletra,1)))
		end if
		write(1,"(12x,A13,I1)")trim(adjustl(letra(iletra,2))),num
		write(1,"(12x,A10)")trim(adjustl(letra(iletra,3)))
		write(1,"(12x,A17,I1)")trim(adjustl(letra(iletra,4))),num
	else
		if(iletra > 10) then
		write(1,"(12x,A9)")trim(adjustl(letra(iletra,1)))
		else
		write(1,"(12x,A8)")trim(adjustl(letra(iletra,1)))
		end if
		write(1,"(12x,A13,I2)")trim(adjustl(letra(iletra,2))),num
		write(1,"(12x,A10)")trim(adjustl(letra(iletra,3)))
		write(1,"(12x,A17,I2)")trim(adjustl(letra(iletra,4))),num
	end if

4	continue

write(1,*)''

if(tam_pala >= 10) write(1,"(12x,A10,I2)")'MOVLW    .',tam_pala
if(tam_pala < 10) write(1,"(12x,A10,I1)")'MOVLW    .',tam_pala
write(1,"(12x,A21,/)")'MOVWF    QUANT_CARACT'
			
write(1,"(12x,A15,/)")'CALL    CAPTURA'

write(1,"(12x,A21,/)")'CALL    LIMPAR_MATRIZ'

end if

return

end subroutine