subroutine apaga_lista(lista)

use msflib

use dialogm

include 'resource.fd'

type (xycoord) pos

type (dialog) dlg

integer message,esco,nl,nc,j,i,ii,m,k,iostat,ierr,tam(256,10),r,t,aux(256),a,b,iret,nls

character (512) arq(256,10),arqaux(256,10),text

character (50) tit(1,10)

character (50) lista,listaux,nlista(100),nlistaux(100)

logical retlog

retlog = dlginit(idd_dialog4,dlg)

call dlgsettitle(dlg,"Apaga lista")

retlog = dlgset(dlg,idok,"&Apagar")

retlog = dlgset(dlg,IDC_STATIC1,"       Procure a lista que deseja apagar.")

nls = 0 ; nlista = '' ; k = 0

open(unit = 3 , file = 'auxiliar.dat' , status = 'old' , iostat = ierr)

read(3,"(I3)")nls

do k = 1 , nls

read(3,"(A50)")nlista(k)

end do

retlog = dlgset ( dlg, IDC_COMBO1, nls, DLG_NUMITEMS )

do 1 k = 1 , nls

1	retlog = dlgset ( dlg, IDC_COMBO1, nlista(k), k )

8 iret = dlgmodal(dlg)

if(iret == 2) then !foi clicado o botão Cancel

	close(unit = 3 , iostat = ierr)

	nlista = '' ; nls = 0 ; nls = 0
	
	call dlguninit(dlg) !encerra o diálogo
	
	return

end if

close(unit = 3 , status = 'delete' , iostat = ierr)

retlog = dlgget( dlg, IDC_COMBO1, listaux )

call dlguninit(dlg)

open(unit = 2 , file = trim(adjustl(listaux)) // '.dat' , status = 'old' , iostat = ierr)

if(ierr /= 0) then

	write(*,"(A)")'Erro ao tentar apagrar esta lista. Tente novamente.'

	go to 8

end if

close(unit = 2 , status = 'delete' , iostat = ierr)

do i = 1 , nls

	if(trim(adjustl(nlista(i))) == trim(adjustl(listaux))) cycle
	
	ii = ii + 1

	nlistaux(ii) = nlista(i)

end do

nlista = nlistaux

nls = nls - 1

open(unit = 3 , file = 'auxiliar.dat' , status = 'new' , iostat = ierr)

write(3,"(I3)")nls

do k = 1 , nls

write(3,"(A50)")nlista(k)

end do

close(unit = 3 , iostat = ierr)

return

end subroutine