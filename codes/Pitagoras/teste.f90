Program pitagoras

use msflib

use dialogm

include 'resource.fd'

type (dialog) dlg

real a,b,c

integer iproblema(3),iret

character*256 text

logical retlog

external calcula_pit, unidade

10 continue

retlog = dlginit(idd_dialog1,dlg)
!inicia o diálogo idd_dialog1

retlog = dlgset(dlg,idc_radio1,.true.)

retlog = dlgsetsub(dlg, idc_radio1, unidade)

retlog = dlgsetsub(dlg, idc_radio2, unidade)

retlog = dlgsetsub(dlg, idok, calcula_pit)

iret = dlgmodal(dlg)

call dlguninit(dlg) ! encerra o diálogo

retlog = dlginit(idd_dialog2,dlg)
iret = dlgmodal(dlg)
  if(iret == 2) then !foi clicado o botão Cancel
     call dlguninit(dlg) !encerra o diálogo
	 stop
  end if

i = runqq('write.exe','formula_pit.doc')

call dlguninit(dlg) ! encerra o diálogo

stop

end program





subroutine calcula_pit(dlg,id,icallback)

use msflib

use dialogm

include 'resource.fd'

type (dialog) dlg

integer message, iproblema(3)

real a,b,c

real*4 d,e,f

common uni

character*256 text,textc

logical retlog

!para evitar advertência:

icallback1 = icallback

id1 = id !id identifica o diálogo clicado

!modificação do que aparece em idc_edit1,

!na caixa de diálogo, quando o botão OK

!(idok) é clicado


   retlog = dlgget(dlg,idc_edit1,text) !obtenha o texto de edit1
   read(text,*,iostat = ierr)a !leia, em text, o real a(1)
   if(ierr /= 0) iproblema(1) = 1 !iproblema = 1, erro na leitura

   retlog = dlgget(dlg,idc_edit2,text) !obtenha o texto de edit2
   read(text,*,iostat = ierr)b !leia, em text, o real a(2)
   if(ierr /= 0) iproblema(2) = 1

   retlog = dlgget(dlg,idc_edit3,text) !obtenha o texto de edit3
   read(text,*,iostat = ierr)c !leia, em text, o real a(3)
   if(ierr /= 0) iproblema(3) = 1

if(iproblema(1) == 1.AND.iproblema(2) == 1.AND.iproblema(3) == 1) then
message = messageboxqq('Digito dois valores!'c,'Atenção',MB$OK.OR.MB$ICONEXCLAMATION)
iproblema(1) = 0 ; iproblema(2) = 0 ; iproblema(3) = 0
return
end if

if(iproblema(1) == 0.AND.iproblema(2) == 0.AND.iproblema(3) == 0) then
message = messageboxqq('Digite apenas dois valores!'c,'Atenção',MB$OK.OR.MB$ICONEXCLAMATION)
write(text,*)''
retlog = dlgset(dlg, idc_edit1, trim(adjustl(text)))
retlog = dlgset(dlg, idc_edit2, trim(adjustl(text)))
retlog = dlgset(dlg, idc_edit3, trim(adjustl(text)))
iproblema(1) = 0 ; iproblema(2) = 0 ; iproblema(3) = 0
return
end if

if(iproblema(1) == 1) then
   a = sqrt(b**2 + c**2)
   write(text,*)a
   if(uni == 1) d = a/100
   if(uni == 2) d = a*100
   if(uni /= 1.AND.uni /= 2) then
   message = messageboxqq('Escolha uma unidade!'c,'Atenção',MB$OK.OR.MB$ICONEXCLAMATION)
   return
   end if
   write(textc,*)d
   retlog = dlgset(dlg, idc_edit1, trim(adjustl(text)))
   retlog = dlgset(dlg, idc_static5, trim(adjustl(textc)))
   retlog = dlgset(dlg, idc_static4, "a =")
end if

if(iproblema(2) == 1) then
   b = sqrt(abs(c**2 - a**2))
   write(text,*)b
   if(uni == 1) e = b/100
   if(uni == 2) e = b*100
   if(uni /= 1.AND.uni /= 2) then
   message = messageboxqq('Escolha uma unidade!'c,'Atenção',MB$OK.OR.MB$ICONEXCLAMATION)
   return
   end if
   write(textc,*)e
   retlog = dlgset(dlg, idc_edit2, trim(adjustl(text)))
   retlog = dlgset(dlg, idc_static5, trim(adjustl(textc)))
   retlog = dlgset(dlg, idc_static4, "b =")
end if

if(iproblema(3) == 1) then
   c = sqrt(abs(b**2 - a**2))
   write(text,*)c
   if(uni == 1) f = c/100
   if(uni == 2) f = c*100
   if(uni /= 1.AND.uni /= 2) then
   message = messageboxqq('Escolha uma unidade!'c,'Atenção',MB$OK.OR.MB$ICONEXCLAMATION)
   return
   end if
   write(textc,*)f
   retlog = dlgset(dlg, idc_edit3, trim(adjustl(text)))
   retlog = dlgset(dlg, idc_static5, trim(adjustl(textc)))
   retlog = dlgset(dlg, idc_static4, "c =")
end if

iproblema(1) = 0 ; iproblema(2) = 0 ; iproblema(3) = 0

return

end subroutine




!Quando um radiobutton é selecionado, é modificado

!as unidades da caixa de dialogo

subroutine unidade(dlg,id,icallback)

use msflib

use dialogm

include 'resource.fd'

type (dialog) dlg

common uni

character*256 text

logical retlog

!para evitar advertência:

icallback1 = icallback

!modificação do que aparece na caixa de diálogo

if(id == idc_radio1) then
!if(idc_radio1 == true) then
  write(text,*)'cm'

  retlog = dlgset(dlg,idc_static1,trim(adjustl(text)))
  retlog = dlgset(dlg,idc_static2,trim(adjustl(text)))
  retlog = dlgset(dlg,idc_static3,trim(adjustl(text)))

  write(text,*)'m'

  retlog = dlgset(dlg,idc_static6,trim(adjustl(text)))

  retlog = dlgset(dlg,idc_static4,'vc =')
  retlog = dlgset(dlg,idc_static5,'')

uni = 1

end if

if(id == idc_radio2) then

  write(text,*)'m'

  retlog = dlgset(dlg,idc_static1,trim(adjustl(text)))
  retlog = dlgset(dlg,idc_static2,trim(adjustl(text)))
  retlog = dlgset(dlg,idc_static3,trim(adjustl(text)))

  write(text,*)'cm'

  retlog = dlgset(dlg,idc_static6,trim(adjustl(text)))

  retlog = dlgset(dlg,idc_static4,'vc =')
  retlog = dlgset(dlg,idc_static5,'')

  uni = 2

end if

return

end subroutine


