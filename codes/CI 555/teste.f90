Program ci555

use msflib

use dialogm

include 'resource.fd'

type (dialog) dlg

real a,b,c

integer iproblema(3),iret

character*256 text

logical retlog

external calcula_555,zerar !, unidade

10 continue

retlog = dlginit(idd_dialog1,dlg)
!inicia o di�logo idd_dialog1

!retlog = dlgset(dlg,idc_radio1,.true.)

!retlog = dlgsetsub(dlg, idc_radio1, unidade)

!retlog = dlgsetsub(dlg, idc_radio2, unidade)

retlog = dlgsetsub(dlg, idok, calcula_555)
retlog = dlgsetsub(dlg, idok2, zerar)

iret = dlgmodal(dlg)

  if(iret == 2) then !foi clicado o bot�o Cancel
     call dlguninit(dlg) !encerra o di�logo
	 stop
  end if

call dlguninit(dlg) ! encerra o di�logo

i = clickmenuqq(loc(winexit))

stop

end program





subroutine calcula_555(dlg,id,icallback)

use msflib

use dialogm

include 'resource.fd'

type (dialog) dlg

integer message, iproblema(3)

real ra,rb,c

real*4 t,ta,tb,f

common uni

character*256 text,textc

logical retlog

!para evitar advert�ncia:

icallback1 = icallback

id1 = id !id identifica o di�logo clicado

!modifica��o do que aparece em idc_edit1,

!na caixa de di�logo, quando o bot�o OK

!(idok) � clicado


   retlog = dlgget(dlg,idc_edit2,text) !obtenha o texto de edit1
   read(text,*,iostat = ierr)ra !leia, em text, o real a(1)
   if(ierr /= 0) iproblema(1) = 1 !iproblema = 1, erro na leitura

   retlog = dlgget(dlg,idc_edit3,text) !obtenha o texto de edit2
   read(text,*,iostat = ierr)rb !leia, em text, o real a(2)
   if(ierr /= 0) iproblema(2) = 1

   retlog = dlgget(dlg,idc_edit4,text) !obtenha o texto de edit3
   read(text,*,iostat = ierr)c !leia, em text, o real a(3)
   if(ierr /= 0) iproblema(3) = 1

if(iproblema(1) == 1.OR.iproblema(2) == 1.OR.iproblema(3) == 1) then
message = messageboxqq('Todos os valores s�o necessarios. Prencha todos eles!!'c,'Aten��o',MB$OK.OR.MB$ICONEXCLAMATION)
iproblema(1) = 0 ; iproblema(2) = 0 ; iproblema(3) = 0
return
end if

!if(iproblema(1) == 0.AND.iproblema(2) == 0.AND.iproblema(3) == 0) then
!message = messageboxqq('Digite apenas dois valores!'c,'Aten��o',MB$OK.OR.MB$ICONEXCLAMATION)
!write(text,*)''
!retlog = dlgset(dlg, idc_edit1, trim(adjustl(text)))
!retlog = dlgset(dlg, idc_edit2, trim(adjustl(text)))
!retlog = dlgset(dlg, idc_edit3, trim(adjustl(text)))
!iproblema(1) = 0 ; iproblema(2) = 0 ; iproblema(3) = 0
!return
!end if

!if(iproblema(1) == 1) then
!   a = sqrt(b**2 + c**2)
!   write(text,*)a
!   if(uni == 1) d = a/100
!   if(uni == 2) d = a*100
!   if(uni /= 1.AND.uni /= 2) then
!   message = messageboxqq('Escolha uma unidade!'c,'Aten��o',MB$OK.OR.MB$ICONEXCLAMATION)
!   return
!   end if
!   write(textc,*)d
!   retlog = dlgset(dlg, idc_edit1, trim(adjustl(text)))
!   retlog = dlgset(dlg, idc_static5, trim(adjustl(textc)))
!   retlog = dlgset(dlg, idc_static4, "a =")
!end if

!if(iproblema(2) == 1) then
!   b = sqrt(abs(c**2 - a**2))
!   write(text,*)b
!   if(uni == 1) e = b/100
!   if(uni == 2) e = b*100
!   if(uni /= 1.AND.uni /= 2) then
!   message = messageboxqq('Escolha uma unidade!'c,'Aten��o',MB$OK.OR.MB$ICONEXCLAMATION)
!   return
!   end if
!   write(textc,*)e
!   retlog = dlgset(dlg, idc_edit2, trim(adjustl(text)))
!   retlog = dlgset(dlg, idc_static5, trim(adjustl(textc)))
!   retlog = dlgset(dlg, idc_static4, "b =")
!end if

!if(iproblema(3) == 1) then
!   c = sqrt(abs(b**2 - a**2))
!   write(text,*)c
!   if(uni == 1) f = c/100
!   if(uni == 2) f = c*100
!   if(uni /= 1.AND.uni /= 2) then
!   message = messageboxqq('Escolha uma unidade!'c,'Aten��o',MB$OK.OR.MB$ICONEXCLAMATION)
!   return
!   end if
!   write(textc,*)f
!   retlog = dlgset(dlg, idc_edit3, trim(adjustl(text)))
!   retlog = dlgset(dlg, idc_static5, trim(adjustl(textc)))
!   retlog = dlgset(dlg, idc_static4, "c =")
!end if

!iproblema(1) = 0 ; iproblema(2) = 0 ; iproblema(3) = 0

ta = 0.693 * (ra+rb) * c
tb = 0.693 * rb * c
!t = ta+tb
!f = (1 / t) * 1000
!t = ((ra+(2*rb))*c)/1000
f = 1.44 / (c* (ra+(rb*2)))*1000
!t = ((1 / f) * 1000)
t = ((1 / f) * 1000) - 1.9499 !ajuste de erro do periodo

write(textc,*)ta
retlog = dlgset(dlg, idc_edit5, trim(adjustl(textc)))
write(textc,*)tb
retlog = dlgset(dlg, idc_edit6, trim(adjustl(textc)))
write(textc,*)t
retlog = dlgset(dlg, idc_edit7, trim(adjustl(textc)))
write(textc,"(F7.3)")f
retlog = dlgset(dlg, idc_edit8, trim(adjustl(textc)))
write(textc,"(F8.5)")f / 1000
retlog = dlgset(dlg, idc_edit9, trim(adjustl(textc)))

iproblema(1) = 0 ; iproblema(2) = 0 ; iproblema(3) = 0

return

end subroutine




!Quando um radiobutton � selecionado, � modificado

!as unidades da caixa de dialogo

subroutine zerar(dlg,id,icallback)

use msflib

use dialogm

include 'resource.fd'

type (dialog) dlg

common uni

character*256 text

logical retlog

!para evitar advert�ncia:

icallback1 = icallback

!modifica��o do que aparece na caixa de di�logo

!if(id == idc_radio1) then
!if(idc_radio1 == true) then
!  write(text,*)'cm'

!  retlog = dlgset(dlg,idc_static1,trim(adjustl(text)))
!  retlog = dlgset(dlg,idc_static2,trim(adjustl(text)))
!  retlog = dlgset(dlg,idc_static3,trim(adjustl(text)))

!  write(text,*)'m'

!  retlog = dlgset(dlg,idc_static6,trim(adjustl(text)))

!  retlog = dlgset(dlg,idc_static4,'vc =')
!  retlog = dlgset(dlg,idc_static5,'')

!uni = 1

!end if

!if(id == idc_radio2) then

!  write(text,*)'m'

!  retlog = dlgset(dlg,idc_static1,trim(adjustl(text)))
!  retlog = dlgset(dlg,idc_static2,trim(adjustl(text)))
!  retlog = dlgset(dlg,idc_static3,trim(adjustl(text)))

!  write(text,*)'cm'

!  retlog = dlgset(dlg,idc_static6,trim(adjustl(text)))

!  retlog = dlgset(dlg,idc_static4,'vc =')
!  retlog = dlgset(dlg,idc_static5,'')

!  uni = 2

!end if

do 25 i = 1001 , 1010

25	retlog = dlgset(dlg,i,'0')

return

end subroutine