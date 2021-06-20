program quadrado_latino

use msflib

use dialogm

type (dialog) dlg

implicit none

include 'resource.fd'

logical retlog

integer iret,a(9),iproblema

10 continue

retlog = dlginit(idd_dialog1,dlg)
!inicia o diálogo idd_dialog1

iret = dlgmodal(dlg)
!estabele o diálogo (iret tem o valor do botão cliclado)

   if(iret == 2) then !foi clicado o botão Sair
      call dlguninit(dlg) !encerra o diálogo
      stop !finaliza o programa
   end if

   if(iret == 1) then

   iproblema = 0 !variável auxiliar na detecção de erro na leitura

   retlog = dlgget(dlg,idc_edit1,text) !obtenha o texto de edit1
   read(text,*,iostat = ierr)a(1) !leia, em text, o real a(1)
   if(ierr /= 0) iproblema = 1 !iproblema = 1, erro na leitura

   retlog = dlgget(dlg,idc_edit2,text) !obtenha o texto de edit2
   read(text,*,iostat = ierr)a(2) !leia, em text, o real a(2)
   if(ierr /= 0) iproblema = 1

   retlog = dlgget(dlg,idc_edit3,text) !obtenha o texto de edit3
   read(text,*,iostat = ierr)a(3) !leia, em text, o real a(3)
   if(ierr /= 0) iproblema = 1

   retlog = dlgget(dlg,idc_edit4,text) !obtenha o texto de edit3
   read(text,*,iostat = ierr)a(4) !leia, em text, o real a(3)
   if(ierr /= 0) iproblema = 1

   retlog = dlgget(dlg,idc_edit5,text) !obtenha o texto de edit3
   read(text,*,iostat = ierr)a(5) !leia, em text, o real a(3)
   if(ierr /= 0) iproblema = 1

   retlog = dlgget(dlg,idc_edit6,text) !obtenha o texto de edit3
   read(text,*,iostat = ierr)a(6) !leia, em text, o real a(3)
   if(ierr /= 0) iproblema = 1

   retlog = dlgget(dlg,idc_edit7,text) !obtenha o texto de edit3
   read(text,*,iostat = ierr)a(7) !leia, em text, o real a(3)
   if(ierr /= 0) iproblema = 1

   retlog = dlgget(dlg,idc_edit8,text) !obtenha o texto de edit3
   read(text,*,iostat = ierr)a(8) !leia, em text, o real a(3)
   if(ierr /= 0) iproblema = 1

   retlog = dlgget(dlg,idc_edit9,text) !obtenha o texto de edit3
   read(text,*,iostat = ierr)a(9) !leia, em text, o real a(3)
   if(ierr /= 0) iproblema = 1

   if(a(1) == a(2).OR.a(2) == a(3).OR.a(1) == a(3)&
	  a(4) == a(5).OR.a(5) == a(6).OR.a(4) == a(6)&
	  a(7) == a(8).OR.a(8) == a(9).OR.a(7) == a(9)&
	  a(1) == a(4).OR.a(4) == a(7).OR.a(1) == a(3)&
	  a(1) == a(2).OR.a(2) == a(3).OR.a(1) == a(3)&
	  a(1) == a(2).OR.a(2) == a(3).OR.a(1) == a(3)) then



call dlguninit(dlg) ! encerra o diálogo

if(iproblema == 1) then
   message = messageboxqq('Erro na leitura!'c,'Atenção',MB$OK.OR.MB$ICONEXCLAMATION)
   goto 10 !vá para o endereço 10 reler os dados
end if


