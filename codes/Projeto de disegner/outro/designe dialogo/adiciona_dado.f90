subroutine adiciona_dado(lista,nc,nl,arq,tit)

use msflib

use dialogm

include 'resource.fd'

type (xycoord) pos

type (dialog) dlg

integer message,esco,nl,nc,j,i,ii,m,iostat,ierr,tam(256,10),r,t,aux(256),a,b,iret

character (512) arq(256,10),arqaux(256,10),text

character (50) tit(1,10)

character (50) lista , listaux

logical retlog

if(lista == '') then

	write(*,"(A)")'Procure um lista para que possa adicionar um dado!'

	return

end if

nl = nl + 1

retlog = dlginit(idd_dialog5,dlg)

do 1 k = nc + 1002,1011

1	retlog = dlgset(dlg,k,.false.,dlg_enable)

do 2 k = nc - 1  + 1022,1030

	retlog = dlgset(dlg,k,'')

2	retlog = dlgset(dlg,k,.false.,dlg_enable)

retlog = dlgset(dlg,1018,trim(adjustl(tit(1,1)))//':')

do 3 k = 1022,1022 + nc - 2

3	retlog = dlgset(dlg,k,tit(1,k-1020))

5 iret = dlgmodal(dlg)

if(iret == 2) then !foi clicado o botão Cancel

	arq(nl,:) = '' ; nl = nl - 1
		
	call dlguninit(dlg) !encerra o diálogo
	
	return

end if

do 4 k = 1002,1002 + nc - 1

	retlog = dlgget(dlg,k,arq(nl,k-1001))

	if(trim(adjustl(arq(nl,k-1001))) == '') then

		message = messageboxqq('Preencha todos os itens do dado, para que ele possa ser adicionado.'c,'Atenção',MB$OK.OR.MB$ICONEXCLAMATION)

		go to 5

4	end if

do 11 m = 1 , nl - 1

	if(trim(adjustl(arq(nl,1))) == trim(adjustl(arq(m,1)))) then

		do 12 i = 1 , nc

		12	if(trim(adjustl(arq(nl,i))) == trim(adjustl(arq(m,i)))) iqua = iqua + 1

		if(iqua == nc) then
			
			message = messageboxqq('Isto ja existe no bando de dados! Escreva um dado diferente.'c,'Atenção',MB$OK.OR.MB$ICONEXCLAMATION)

			go to 5

		end if

11	end if

call dlguninit(dlg)

close(unit = 1 , status = 'delete' , iostat = ierr)

open(unit = 1 , file = trim(adjustl(lista)) // '.dat' , status = 'new' , iostat = ierr)

write(1,"(I3,I2)")nl,nc

write(1,"(10A50)")(tit(1,m) , m = 1 , nc)

do 13 m = 1 , nl

13	write(1,"(10A512)")(arq(m,i) , i = 1 , nc)

return

end subroutine