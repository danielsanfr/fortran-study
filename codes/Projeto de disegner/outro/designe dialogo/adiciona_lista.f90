subroutine adiciona_lista(nl,nc,arq,tit,lista,listaux)

use msflib

use dialogm

include 'resource.fd'

type (xycoord) pos

type (dialog) dlg

integer message,esco,nl,nc,nl2,nc2,j,i,ii,k,m,iostat,ierr,tam(256,10),r,t,aux(256),a,b,iret,nls

character (512) arq(256,10),arqaux(256,10),text

character (50) tit(1,10),titaux(1,10)

character (50) lista,listaux,nlista(100)

character (2) num

logical retlog

retlog = dlginit(idd_dialog1,dlg)

retlog = dlgset ( dlg, IDC_COMBO1, 9, DLG_NUMITEMS )

do 1 k = 1 , 9

	write(num,"(I2)")k+1

1	retlog = dlgset ( dlg, IDC_COMBO1, num, k )

iret = dlgmodal(dlg)

if(iret == 2) then !foi clicado o botão Cancel
	
	call dlguninit(dlg) !encerra o diálogo
	
	return

end if

retlog = dlgget( dlg, IDC_COMBO1, num )

read(num,"(I2)",iostat=ierr)nc2

call dlguninit(dlg)

retlog = dlginit(idd_dialog2,dlg)

do 2 k = 	nc2 + 1003,1012

2	retlog = dlgset(dlg,k,.false.,dlg_enable)

4 iret = dlgmodal(dlg)

if(iret == 2) then !foi clicado o botão Cancel
	
	call dlguninit(dlg) !encerra o diálogo
	
	return

end if

retlog = dlgget( dlg, IDC_EDIT1, listaux )

if(trim(adjustl(listaux)) == '') then

	message = messageboxqq('Escreva o nome da lista. Para que possa ser criada.'c,'Atenção',MB$OK.OR.MB$ICONEXCLAMATION)
				
	go to 4
			
end if

do 3 k = 1003 , 1003 + nc2 - 1

	retlog = dlgget( dlg, k, text )

	read(text,"(A)",iostat=ierr)titaux(1,k-1002)

	if(trim(adjustl(titaux(1,k-1002))) == '') then

		message = messageboxqq('Escreva todos os nomes dos títulos para que a lista seja criada'c,'Atenção',MB$OK.OR.MB$ICONEXCLAMATION)

		go to 4

3	end if

call dlguninit(dlg)

nl2 = 0 ; arqaux(:,:) = '' 

open(unit = 2 , file = trim(adjustl(listaux)) // '.dat' , status = 'new' , iostat = ierr)

if(ierr /= 0) then

	message = messageboxqq('Erro ao criar uma nova lista. Tente digitar o nome da lista novamente.'c,'Atenção',MB$OK.OR.MB$ICONEXCLAMATION)
				
	go to 4
			
end if

write(2,"(I3,I2)")nl2,nc2

write(2,"(10A50)")(titaux(1,m) , m = 1 , nc2)

close(unit = 2 , iostat = ierr)

message = messageboxqq('A nova lista foi criada com sucesso.'c,'Confirmação',MB$OK.OR.MB$ICONEXCLAMATION)

open(unit = 2 , file = 'auxiliar.dat' , status = 'old' , iostat = ierr)

read(2,"(I3)")nls

do k = 1 , nls

read(2,"(A50)")nlista(k)

end do

close(unit = 2 , status = 'delete' , iostat = ierr)

nls = nls + 1

nlista(nls) = trim(adjustl(listaux))

open(unit = 2 , file = 'auxiliar.dat' , status = 'new' , iostat = ierr)

write(2,"(I3)")nls

do k = 1 , nls

write(2,"(A50)")nlista(k)

end do

close(unit = 2 , iostat = ierr)

return

end subroutine