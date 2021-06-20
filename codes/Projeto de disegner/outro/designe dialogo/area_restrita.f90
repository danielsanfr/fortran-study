subroutine area_restrita(pro)

!MS$ attributes dllimport :: confirma_senha

use msflib

use dialogm

include 'resource.fd'

type (xycoord) pos

type (dialog) dlg

integer message,j,i,iostat,ierr,iret,pro,con

character (30) senha

logical retlog

1 retlog = dlginit(idd_dialog3,dlg)

iret = dlgmodal(dlg)

if(iret == 2) then !foi clicado o botão Cancel
	
	call dlguninit(dlg) !encerra o diálogo
	
	return

end if

retlog = dlgget(dlg,idc_edit1,senha) !obtenha o texto de edit1

call dlguninit(dlg)

call confirma_senha(senha,con)

if(con == 1) then

	message = messageboxqq('Senha aceita!'c,'Confirmação',MB$OK.OR.MB$ICONEXCLAMATION)

	pro = 1

	iproblema = 0

else

	message = messageboxqq('Senha incorreta!'c,'Confirmação',MB$OK.OR.MB$ICONEXCLAMATION)
	
	iproblema = iproblema + 1

	pro = -1

	if(iproblema == 3) then

		message = messageboxqq('A senha foi digitada três vezes incorretamente. O programa será fechado!'c,'Atenção',MB$OK.OR.MB$ICONEXCLAMATION)
	
		i = clickmenuqq(loc(winexit))

	end if

	go to 1

end if

return

end subroutine