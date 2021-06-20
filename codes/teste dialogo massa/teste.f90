program principal

use msflib

use dialogm

include 'resource.fd'

type (dialog) dlg

type (xycoord) pos

integer a,b,c,d,iproblema,iret

character*256 text

logical retlog

retlog = dlginit(idd_dialog1,dlg)
!inicia o diálogo idd_dialog1
iret = dlgmodal(dlg)

   if(iret == 2) then !foi clicado o botão Cancel
      call dlguninit(dlg) !encerra o diálogo
      stop !retorna para initialsettings()
   end if

   iproblema = 0 !variável auxiliar na detecção de erro na leitura

   retlog = dlgget(dlg,idc_edit1,text) !obtenha o texto de edit1
   read(text,*,iostat = ierr)a !leia, em text, o real a(1)
   if(ierr /= 0) iproblema = 1 !iproblema = 1, erro na leitura

   retlog = dlgget(dlg,idc_edit2,text) !obtenha o texto de edit2
   read(text,*,iostat = ierr)b !leia, em text, o real a(2)
   if(ierr /= 0) iproblema = 1

   retlog = dlgget(dlg,idc_edit3,text) !obtenha o texto de edit3
   read(text,*,iostat = ierr)c !leia, em text, o real a(3)
   if(ierr /= 0) iproblema = 1

   retlog = dlgget(dlg,idc_edit4,text) !obtenha o texto de edit3
   read(text,*,iostat = ierr)d !leia, em text, o real a(3)
   if(ierr /= 0) iproblema = 1

   i = setcolor(11)
   i = rectangle($gfillinterior,a,b,c,d)

call dlguninit(dlg) ! encerra o diálogo

stop

end program