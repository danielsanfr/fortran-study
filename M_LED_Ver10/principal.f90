program matriz

use msflib

use dialogm

implicit none

include 'resource.fd'

type (dialog) dlg

integer i,j,k,iret,iproblema,iostat,ierr,iletra,tam_fra,ii,jj,kk,tam_pala,aux,op,length, message,kkk,ij

logical retlog,ret

character*25 letra(52,4)

character*256 frase

character(255)		:: caminho

character ($maxpath)	:: dir

external palavra

!Obtém o diretório atual
Dir = FILE$CURDRIVE
length = GETDRIVEDIRQQ (dir)
if(length .GT. 0) then
  caminho = dir(1:length)
else
  message = messageboxqq ('Falha obtendo o diretório!'C,'Teste Open_Save'C,MB$OK.OR.MB$ICONEXCLAMATION.or.MB$DEFBUTTON1)

  call exit
end if  

open(unit = 1,file = 'dados.dat',status = 'old')

do 2 i = 1,52
	
	do 3 j = 1,4

3		read(1,"(A)")letra(i,j)

2	read(1,*)

close(unit = 1)

10 continue

retlog = dlginit(idd_dialog1,dlg)

iret = dlgmodal(dlg)


	if(iret == 2) then !foi clicado o botão Cancel

		call dlguninit(dlg) !encerra o diálogo

		call clearscreen($gclearscreen)

		i = clickmenuqq(loc(winexit))
	
	end if

	iproblema = 0 !variável auxiliar na detecção de erro na leitura

	retlog = dlgget(dlg,idc_edit1,frase)

call dlguninit(dlg)

open(unit = 1,file = 'Frase.asm',status = 'old')
close(unit = 1 , status = 'delete')

open(unit = 1,file = 'Frase.asm',status = 'new')

write(1,"(A6)")'FRASE:'
write(1,*)''

tam_fra = len(trim(adjustl(frase)))

k = 0 ; aux = 0

constru:do ii = 1,tam_fra

	if(aux >= ii) cycle constru

	k = k + 1

	if (k > 13) then

		message = MESSAGEBOXQQ('As palavras devem conter no máximo 13 caracteres!'C,'Atenção!'C,MB$ICONEXCLAMATION.OR.MB$OK.OR.MB$DEFBUTTON1)
		
		goto 10

	end if

	if (frase(ii:ii) == ' ') then
		
		kk = 0

		do 5 jj = ii+1,tam_fra

			kk = kk + 1

5			if (frase(jj:jj) == ' ') goto 6

			if (k+kk > 13) then

				k = k - 1 ; tam_pala = k ; aux = ii ; op = 0

				call palavra(ii,k,kk,kkk,tam_pala,tam_fra,frase,letra,op)

				k = 0 ; jj = 0

			end if

6			if (k+kk >= tam_fra) kk = 0

			if (k+kk < 11) then
			
				kkk = 0

				do 7 ij = ii+kk+1,tam_fra

					kkk = kkk + 1

7					if (frase(ij:ij) == ' ') goto 8

				if (k+kk+kkk <= 13) then

					tam_pala = k + kk + kkk ; aux = ii + kk + kkk ; op = 3

					call palavra(ii,k,kk,kkk,tam_pala,tam_fra,frase,letra,op)

					kk = 0 ; k = 0 ; kkk = 0

					cycle constru

				end if

8				if (k+kk+kkk-1 <= 13) then

					tam_pala = k + kk + kkk - 1 ; aux = ii + kk + kkk ; op = 3

					call palavra(ii,k,kk,kkk,tam_pala,tam_fra,frase,letra,op)

					kk = 0 ; k = 0 ; kkk = 0

					cycle constru

				else

					go to 9
					
				end if
				
			end if

9			if (k+kk-1 <= 13) then

					k = k - 1 ; tam_pala = k + kk ; aux = ii + kk ; op = 1

					if (ii+kk == len(trim(adjustl(frase)))) then
					
						kk = kk + 1 ; tam_pala = tam_pala + 1

					end if

					call palavra(ii,k,kk,kkk,tam_pala,tam_fra,frase,letra,op)

					kk = 0 ; k = 0 ; jj = 0
				
			else

				k = k - 1 ; tam_pala = k ; aux = ii ; op = 0

				call palavra(ii,k,kk,kkk,tam_pala,tam_fra,frase,letra,op)

				k = 0 ; jj = 0

			end if

	end if

end do constru

if (k > 0.AND.k <= 13) then

	op = 2 ; tam_pala = k

	call palavra(ii,k,kk,kkk,tam_pala,tam_fra,frase,letra,op)

else

	if (k >= 13) then

		message = MESSAGEBOXQQ('As palavras devem conter no máximo 13 caracteres!'C,'Atenção!'C,MB$ICONEXCLAMATION.OR.MB$OK.OR.MB$DEFBUTTON1)
		
		goto 10

	end if

end if

write(1,"(8x,A6)")'RETURN'

close(unit = 1)

i = runqq(trim(adjustl(caminho))//'\MPASM Suite\MPASMWIN.exe','M_Ver10.asm')

call clearscreen($gclearscreen)

i = clickmenuqq(loc(winexit))

stop

end program