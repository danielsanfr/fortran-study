subroutine carrega_lista(lista,nl,nc,tit,arq)

use msflib

use dialogm

include 'resource.fd'

type (xycoord) pos

type (dialog) dlg

integer message,esco,nl,nc,j,i,ii,m,iostat,ierr,tam(256,10),r,t,aux(256),a,b,iret,nls

character (512) arq(256,10),arqaux(256,10),text

character (50) tit(1,10)

character (50) lista,listaux,nlista(100)

logical retlog

retlog = dlginit(idd_dialog4,dlg)

call dlgsettitle(dlg,"Carrega lista")

retlog = dlgset(dlg,idok,"&Carregar")

retlog = dlgset(dlg,IDC_STATIC1,"       Procure a lista que deseja carregar.")

nls = 0 ; nlista = '' ; k = 0

open(unit = 3 , file = 'auxiliar.dat' , status = 'old' , iostat = ierr)

read(3,"(I3)")nls

do k = 1 , nls

read(3,"(A50)")nlista(k)

end do

retlog = dlgset ( dlg, IDC_COMBO1, nls, DLG_NUMITEMS )

do 1 k = 1 , nls

1	retlog = dlgset ( dlg, IDC_COMBO1, nlista(k), k )

6 iret = dlgmodal(dlg)

if(iret == 2) then !foi clicado o botão Cancel

	close(unit = 3 , iostat = ierr)

	nlista = '' ; nls = 0 ; nls = 0
	
	call dlguninit(dlg) !encerra o diálogo
	
	return

end if

close(unit = 3 , iostat = ierr)

retlog = dlgget( dlg, IDC_COMBO1, listaux )

call dlguninit(dlg)

close (unit = 1 , iostat = ierr)

open(unit = 1 , file = trim(adjustl(listaux)) // '.dat' , status = 'old' , iostat = ierr)
		
if(ierr /= 0) then
		
	write(*,"(A)")'Erro ao abrir esta lista. Tente digita-la novamente.'
			
	go to 6
			
end if	

read(1,"(I3,I2)")nl,nc

read(1,"(10A50)")(tit(1,m) , m = 1 , nc)

do 7 m = 1 , nl

7	read(1,"(10A512)")(arq(m,i) , i = 1 , nc)

lista = trim(adjustl(listaux))

write(*,"(A)")'Os dados foram carredados con sucesso!'

return

end subroutine