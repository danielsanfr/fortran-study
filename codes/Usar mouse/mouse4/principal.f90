!programa principal, chamado Prog_QW. Mude o nome, se for o caso
program Prog_QW

use msflib !biblioteca com muitas funções gráficas e outras.

TYPE (windowconfig) wc !define uma variável para as informações sobra a configuração do micro.
TYPE (qwinfo) winfo !define uma variável para informações sobre o dimensionamento do frame e child window.
TYPE (XYCOORD) XY  !define uma variável para estabelecer uma posição no vídeo através de coordenadas em pixels.
LOGICAL status, retlog, ia

common IMENU,L,IAVZ,IDESLOCA_X,IDESLOCA_Y !troca informações com buttons e callbacks
external mouse

IA = .TRUE.

! Maximiza a tela principal
winfo.TYPE = QWIN$MAX
ires = SETWSIZEQQ(QWIN$FRAMEWINDOW, winfo)

! obtém dados do sistema: número de pixels, etc. 
wc.numxpixels = -1
wc.numypixels = -1
wc.numtextcols = -1
wc.numtextrows = -1
wc.numcolors = -1
! a "janela filhote" se chamará "PROGRAMAS" mas o nome pode ser 
!mudado para o desejado. 
wc.title= "PROGRAMAS"C ! título da "janela filhote" (child window)

wc.fontsize = -1

status = SETWINDOWCONFIG(wc) ! estabelece a configuração do micro como aquela obtida anteriormente.
     
!colore a "janela filhote"
I=SETBKCOLORRGB(#909090)
call clearscreen($gclearscreen)

!elimina a barra de status
i = clickmenuqq(QWIN$STATUS)

!Tile command
i = clickmenuqq(QWIN$TILE)

call sleepqq(200)

inumfonts = INITIALIZEFONTS( ) !disponibiliza os tipos de fontes do micro.  

!escolha do tipo de letras a serem usadas.  
ifontnum = SETFONT ('t''Arial''h30w20i')! h30 é a altura das letras na tela e w20 é a largura. O i refere-se a itálico.

     
! se ifontnum for -1, a fonte requerida não existe. Então, deve-se escolher outra fonte.
if(ifontnum.eq.-1) ifontnum = SETFONT ('t''times new roman''h30')
if(ifontnum.eq.-1) ifontnum = SETFONT ('t''courier new''h30')
if(ifontnum.eq.-1) ifontnum = SETFONT ('t''tahoma''h30')
if(ifontnum.eq.-1) ifontnum = SETFONT ('t''cac futura casual''h30')

!cor da palavra a ser escrita na tela (se você quiser escrever)
i= setcolor(10)! de 0 a 15
!você pode alterar as coordenadas onde a palavra será escrita

call moveto (180,40,xy) ! coordenadas (em pixels) de onde será escrita a palavra ou frase a seguir.
call outgtext(' ') !escreva entre os apóstrofes uma palavra ou frase para aparecer na tela


!Definições iniciais da toolbar
!*****************************************************************
!*****************************************************************
  !barra onde os botões serão desenhados
  i = setcolorrgb(#c0c0c0)
  i = rectangle($gfillinterior,0,0,2000,30)

  i = setcolorrgb(#ffffff)
  call moveto(0,0,xy)
  i = lineto(2000,0)
  i = setcolorrgb(#000000)
  call moveto(0,30,xy)
  i = lineto(2000,30)


retlog = getwindowconfig(wc)
if(wc.numxpixels < 800) then
  message = messageboxqq('Este software não funciona adequadamente nesta resolução!'c,'Atenção',MB$OK.OR.MB$ICONEXCLAMATION.or.MB$DEFBUTTON1)
  iret = SETEXITQQ (QWIN$EXITNOPERSIST)
  call exit
end if

! L: acréscimo no comprimento básico dos botões (em pixels)

L = 30

! IAVZ: avanço dos botões para a direita (em pixels) 
IAVZ = (wc.numxpixels - 800)/2 + 180

! Avanço ou recuo do descritor (Atributo do botão)
! e da área de pop-up menu
IDESLOCA_X = (wc.numxpixels - 800)/2 + 100
IDESLOCA_Y = (wc.numypixels - 600)/2-20

CALL BUTTONS(1) !nomes dos botões (o argumento 1 significa enabled).


!traços verticais separando os botões

iav = iavz
i = setcolorrgb (#707070)
call moveto (-2+iav, 3, xy)
i = lineto (-2+iav, 27) 

i = setcolorrgb (#ffffff)
call moveto (-1+iav, 3, xy)
i = lineto (-1+iav, 27) 

iav = iavz
i = setcolorrgb(#707070)
call moveto(30+IAV+L+2,3,xy)
i = lineto(30+IAV+L+2,27) 
i = setcolorrgb(#ffffff)
call moveto(30+IAV+L+3,3,xy)
i = lineto(30+IAV+L+3,27) 

iav = 30 + iav + L + 5
i = setcolorrgb(#707070)
call moveto(30+IAV+L+2,3,xy)
i = lineto(30+IAV+L+2,27) 
i = setcolorrgb(#ffffff)
call moveto(30+IAV+L+3,3,xy)
i = lineto(30+IAV+L+3,27) 

iav = 30 + iav + L + 5

i = setcolorrgb(#707070)
call moveto(30+IAV+L+2,3,xy)
i = lineto(30+IAV+L+2,27) 
i = setcolorrgb(#ffffff)
call moveto(30+IAV+L+3,3,xy)
i = lineto(30+IAV+L+3,27) 

iav = 30 + iav + L + 5
i = setcolorrgb(#707070)
call moveto(30+IAV+L+2,3,xy)
i = lineto(30+IAV+L+2,27) 
i = setcolorrgb(#ffffff)
call moveto(30+IAV+L+3,3,xy)
i = lineto(30+IAV+L+3,27) 

iav = 30 + iav + L + 5
i = setcolorrgb(#707070)
call moveto(30+IAV+L+2,3,xy)
i = lineto(30+IAV+L+2,27) 
i = setcolorrgb(#ffffff)

call moveto(30+IAV+L+3,3,xy)
i = lineto(30+IAV+L+3,27) 

iav = 30 + iav + L + 5
i = setcolorrgb(#707070)
call moveto(30+IAV+L+2,3,xy)
i = lineto(30+IAV+L+2,27) 
i = setcolorrgb(#ffffff)
call moveto(30+IAV+L+3,3,xy)
i = lineto(30+IAV+L+3,27) 

iav = 30 + iav + L + 5
i = setcolorrgb(#707070)
call moveto(30+IAV+L+2,3,xy)
i = lineto(30+IAV+L+2,27) 
i = setcolorrgb(#ffffff)
call moveto(30+IAV+L+3,3,xy)
i = lineto(30+IAV+L+3,27) 

!Região de pop-up menu ativo (pode-se criar mais de uma região e mais de 1 pop-up)

ifontnum = SETFONT ('t''Arial''h17')
if(ifontnum.eq.-1) ifontnum = SETFONT ('t''times new roman''h17')
if(ifontnum.eq.-1) ifontnum = SETFONT ('t''courier new''h17')
if(ifontnum.eq.-1) ifontnum = SETFONT ('t''tahoma''h17')
if(ifontnum.eq.-1) ifontnum = SETFONT ('t''cac futura casual''h17')
i = setcolorrgb(#000000)
call moveto(190+IDESLOCA_X,75+IDESLOCA_Y,xy)
call outgtext('Região de pop-up menu ativo')
i = setcolorrgb(#f0f0f0)
call moveto(191+IDESLOCA_X,76+IDESLOCA_Y,xy)

call outgtext('Região de pop-up menu ativo')

i = setcolorrgb(#ffffff)
i = rectangle($gfillinterior,100+IDESLOCA_X,100+IDESLOCA_Y,500+IDESLOCA_X,450+IDESLOCA_Y)
i = setcolorrgb(#000000)
i = rectangle($gborder,99+IDESLOCA_X,99+IDESLOCA_Y,501+IDESLOCA_X,451+IDESLOCA_Y)
!*****************************************************************
!*****************************************************************

ievent = mouse$move
ievent = ior(ievent,mouse$lbuttondown)
ievent = ior(ievent,mouse$rbuttondown)

i4 = registermouseevent(0, ievent, mouse)
imenu = 0

do while (.true.)
  call sleepqq(100)
end do

end program ! fim do programa principal




subroutine mouse(iunit, ievent, keystate, ix, iy)
use msflib
type (xycoord) xy
common IMENU,L,IAVZ,IDESLOCA_X,IDESLOCA_Y

! L: acréscimo no comprimento básico dos botões (em pixels)
! IAVZ: avanço dos botões para a direita (em pixels) 

iz = iunit
iz = ievent

if(imenu == 0) then


IAV = IAVZ

!1 Primeiro botão

!*******************************************************************
IF(IX > (IAV) .AND. IX < (30+IAV+L) .AND. IY > 3 .AND. IY < 27) then

  if(ibutton1 /= 1) then 
    

!botão ativado

i =	setcolorrgb(#d0d0d0)
	call moveto(1+IAV,25,xy)
	i = lineto(1+IAV,4)
	i = lineto(28+L+IAV,4)

	i =	setcolorrgb(#505050)
	call moveto(1+IAV,26,xy)
	i = lineto(29+IAV+L,26)
	i = lineto(29+L+IAV,4)

	i =	setcolorrgb(#ffffff)
	call moveto(0+IAV,3,xy)
	i = lineto(30+IAV+L,3)
	call moveto(0+IAV,3,xy)
	i = lineto(0+IAV,27)
	i =	setcolorrgb(#000000)
	i = lineto(30+IAV+L,27)
	i = lineto(30+IAV+L,3)

	!atributo do botão

    i = setcolorrgb(#ccffff)

i = rectangle($gfillinterior,100+IDESLOCA_X,460+IDESLOCA_Y,500+IDESLOCA_X,478+IDESLOCA_Y)
	i = setcolor(0)
	i = rectangle($gborder,100+IDESLOCA_X,460+IDESLOCA_Y,500+IDESLOCA_X,478+IDESLOCA_Y)

    ifontnum = SETFONT ('t''Arial''h14')
    if(ifontnum.eq.-1) ifontnum = SETFONT ('t''times new roman''h14')
    if(ifontnum.eq.-1) ifontnum = SETFONT ('t''courier new''h14')
    if(ifontnum.eq.-1) ifontnum = SETFONT ('t''tahoma''h14')
    if(ifontnum.eq.-1) ifontnum = SETFONT ('t''cac futura casual''h14')

call moveto(140+IDESLOCA_X,462+IDESLOCA_Y,xy)

call outgtext('Executa o programa 1') 
    
	!colore bitmap
    i = loadimage('novo_color.bmp',2+iav,5)

    ibutton1 = 1

  end if

	if(keystate == 1) then !botão clicado
      
	  !botão pressionado 
	  i = setcolorrgb(#505050)
	  call moveto(1+IAV,25,xy)
	  i = lineto(1+IAV,4)
	  i = lineto(28+L+IAV,4)

	  i = setcolorrgb(#d0d0d0)
	  call moveto(1+IAV,26,xy)
	  i = lineto(29+IAV+L,26)
	  i = lineto(29+L+IAV,4)

  i = setcolorrgb(#000000)

  	  call moveto(0+IAV,3,xy)
	  i = lineto(30+IAV+L,3)
	  call moveto(0+IAV,3,xy)
	  i = lineto(0+IAV,27)
	  i = setcolorrgb(#ffffff)
	  i = lineto(30+IAV+L,27)
	  i = lineto(30+IAV+L,3)

      call executa(ix, iy, keystate)

	end if

ELSE
   
  if(ibutton1 == 1) then

    !botão desativado 
	i = setcolorrgb(#c0c0c0)
	i = rectangle($gborder,0+iav,3,30+iav+L,27)
	i = rectangle($gborder,1+iav,4,29+iav+L,26)

    !apaga atributo do botão

    i = setcolorrgb(#909090)
	i = rectangle($gfillinterior,100+IDESLOCA_X,460+IDESLOCA_Y,500+IDESLOCA_X,478+IDESLOCA_Y)

    !descolore bitmap
    i = loadimage('novo.bmp',2+iav,5)

	ibutton1 = 0

  end if

END IF
!*******************************************************************

!2 Segundo botão
!*******************************************************************
IAV = 30 + IAV + L + 5
IF(IX > (IAV)	.AND. IX < (30+IAV+L)  .AND. IY > 3 .AND. IY < 27) then

  if(ibutton2 /= 1) then 

	i =	setcolorrgb(#d0d0d0)
	call moveto(1+IAV,25,xy)

i = lineto(1+IAV,4)
	i = lineto(28+L+IAV,4)

	i =	setcolorrgb(#505050)
	call moveto(1+IAV,26,xy)
	i = lineto(29+IAV+L,26)
	i = lineto(29+L+IAV,4)

	i =	setcolorrgb(#ffffff)
	call moveto(0+IAV,3,xy)
	i = lineto(30+IAV+L,3)
	call moveto(0+IAV,3,xy)
	i = lineto(0+IAV,27)
	i =	setcolorrgb(#000000)
	i = lineto(30+IAV+L,27)
	i = lineto(30+IAV+L,3)

	!atributo do botão

    i = setcolorrgb(#ccffff)
	i = rectangle($gfillinterior,100+IDESLOCA_X,460+IDESLOCA_Y,500+IDESLOCA_X,478+IDESLOCA_Y)
	i = setcolor(0)
	i = rectangle($gborder,100+IDESLOCA_X,460+IDESLOCA_Y,500+IDESLOCA_X,478+IDESLOCA_Y)

    ifontnum = SETFONT ('t''Arial''h14')
    if(ifontnum.eq.-1) ifontnum = SETFONT ('t''times new roman''h14')
    if(ifontnum.eq.-1) ifontnum = SETFONT ('t''courier new''h14')
    if(ifontnum.eq.-1) ifontnum = SETFONT ('t''tahoma''h14')
    if(ifontnum.eq.-1) ifontnum = SETFONT ('t''cac futura casual''h14')

call moveto(140+IDESLOCA_X,462+IDESLOCA_Y,xy)
	call outgtext('Executa o programa 2') 
    
    i = loadimage('abrir_color.bmp',2+iav,5)

ibutton2 = 1

  end if

	if(keystate == 1) then

	  i = setcolorrgb(#505050)
	  call moveto(1+IAV,25,xy)
	  i = lineto(1+IAV,4)
	  i = lineto(28+L+IAV,4)

	  i = setcolorrgb(#d0d0d0)
	  call moveto(1+IAV,26,xy)
	  i = lineto(29+IAV+L,26)
	  i = lineto(29+L+IAV,4)

	  i = setcolorrgb(#000000)
  	  call moveto(0+IAV,3,xy)

  i = lineto(30+IAV+L,3)
	  call moveto(0+IAV,3,xy)
	  i = lineto(0+IAV,27)
	  i = setcolorrgb(#ffffff)
	  i = lineto(30+IAV+L,27)

  i = lineto(30+IAV+L,3)

      call executa(ix, iy, keystate)

	end if

ELSE
   
  if(ibutton2 == 1) then

	i = setcolorrgb(#c0c0c0)
	i = rectangle($gborder,0+iav,3,30+iav+L,27)
	i = rectangle($gborder,1+iav,4,29+iav+L,26)
	
    !apaga atributo do botão
    i = setcolorrgb(#909090)
	i = rectangle($gfillinterior,100+IDESLOCA_X,460+IDESLOCA_Y,500+IDESLOCA_X,478+IDESLOCA_Y)

    i = loadimage('abrir.bmp',2+iav,5)
	
	ibutton2 = 0

  end if

END IF
!*******************************************************************

!3 Terceiro botão
!*******************************************************************
IAV = 30 + IAV + L + 5
IF(IX > (IAV)	.AND. IX < (30+IAV+L)  .AND. IY > 3 .AND. IY < 27) then

  if(ibutton3 /= 1) then 

	i =	setcolorrgb(#d0d0d0)
	call moveto(1+IAV,25,xy)
	i = lineto(1+IAV,4)
	i = lineto(28+L+IAV,4)

i =	setcolorrgb(#505050)
	call moveto(1+IAV,26,xy)
	i = lineto(29+IAV+L,26)
	i = lineto(29+L+IAV,4)

	i =	setcolorrgb(#ffffff)
	call moveto(0+IAV,3,xy)

i = lineto(30+IAV+L,3)
	call moveto(0+IAV,3,xy)
	i = lineto(0+IAV,27)
	i =	setcolorrgb(#000000)
	i = lineto(30+IAV+L,27)
	i = lineto(30+IAV+L,3)

	!atributo do botão
    i = setcolorrgb(#ccffff)
	i = rectangle($gfillinterior,100+IDESLOCA_X,460+IDESLOCA_Y,500+IDESLOCA_X,478+IDESLOCA_Y)
	i = setcolor(0)

i = rectangle($gborder,100+IDESLOCA_X,460+IDESLOCA_Y,500+IDESLOCA_X,478+IDESLOCA_Y)

    ifontnum = SETFONT ('t''Arial''h14')
    if(ifontnum.eq.-1) ifontnum = SETFONT ('t''times new roman''h14')
    if(ifontnum.eq.-1) ifontnum = SETFONT ('t''courier new''h14')

    if(ifontnum.eq.-1) ifontnum = SETFONT ('t''tahoma''h14')
    if(ifontnum.eq.-1) ifontnum = SETFONT ('t''cac futura casual''h14')
	
	call moveto(140+IDESLOCA_X,462+IDESLOCA_Y,xy)
	call outgtext('Executa o programa 3') 

    ibutton3 = 1

  end if

	if(keystate == 1) then

	  i = setcolorrgb(#505050)
	  call moveto(1+IAV,25,xy)
	  i = lineto(1+IAV,4)
	  i = lineto(28+L+IAV,4)

	  i = setcolorrgb(#d0d0d0)
	  call moveto(1+IAV,26,xy)
	  i = lineto(29+IAV+L,26)
	  i = lineto(29+L+IAV,4)

  i = setcolorrgb(#000000)
  	  call moveto(0+IAV,3,xy)
	  i = lineto(30+IAV+L,3)
	  call moveto(0+IAV,3,xy)
	  i = lineto(0+IAV,27)
	  i = setcolorrgb(#ffffff)
	  i = lineto(30+IAV+L,27)

  i = lineto(30+IAV+L,3)

      call executa(ix, iy, keystate)

	end if

ELSE
   
  if(ibutton3 == 1) then

	i = setcolorrgb(#c0c0c0)
	i = rectangle($gborder,0+iav,3,30+iav+L,27)
	i = rectangle($gborder,1+iav,4,29+iav+L,26)

    !apaga atributo do botão

    i = setcolorrgb(#909090)
	i = rectangle($gfillinterior,100+IDESLOCA_X,460+IDESLOCA_Y,500+IDESLOCA_X,478+IDESLOCA_Y)

	ibutton3 = 0

  end if

END IF
!*******************************************************************

!4 Quarto botão
!*******************************************************************
IAV = 30 + IAV + L + 5
IF(IX > (IAV)	.AND. IX < (30+IAV+L)  .AND. IY > 3 .AND. IY < 27) then

  if(ibutton4 /= 1) then 

	i =	setcolorrgb(#d0d0d0)
	call moveto(1+IAV,25,xy)
	i = lineto(1+IAV,4)

i = lineto(28+L+IAV,4)

	i =	setcolorrgb(#505050)
	call moveto(1+IAV,26,xy)
	i = lineto(29+IAV+L,26)
	i = lineto(29+L+IAV,4)

	i =	setcolorrgb(#ffffff)
	call moveto(0+IAV,3,xy)

i = lineto(30+IAV+L,3)
	call moveto(0+IAV,3,xy)
	i = lineto(0+IAV,27)
	i =	setcolorrgb(#000000)
	i = lineto(30+IAV+L,27)
	i = lineto(30+IAV+L,3)

	!atributo do botão
    i = setcolorrgb(#ccffff)
	i = rectangle($gfillinterior,100+IDESLOCA_X,460+IDESLOCA_Y,500+IDESLOCA_X,478+IDESLOCA_Y)
	i = setcolor(0)
	i = rectangle($gborder,100+IDESLOCA_X,460+IDESLOCA_Y,500+IDESLOCA_X,478+IDESLOCA_Y)

    ifontnum = SETFONT ('t''Arial''h14')
    if(ifontnum.eq.-1) ifontnum = SETFONT ('t''times new roman''h14')

    if(ifontnum.eq.-1) ifontnum = SETFONT ('t''courier new''h14')
    if(ifontnum.eq.-1) ifontnum = SETFONT ('t''tahoma''h14')
    if(ifontnum.eq.-1) ifontnum = SETFONT ('t''cac futura casual''h14')
	
	call moveto(140+IDESLOCA_X,462+IDESLOCA_Y,xy)
	call outgtext('Executa o programa 4') 
    
	ibutton4 = 1

  end if

	if(keystate == 1) then

	  i = setcolorrgb(#505050)

  call moveto(1+IAV,25,xy)
	  i = lineto(1+IAV,4)
	  i = lineto(28+L+IAV,4)

	  i = setcolorrgb(#d0d0d0)

  call moveto(1+IAV,26,xy)
	  i = lineto(29+IAV+L,26)
	  i = lineto(29+L+IAV,4)

	  i = setcolorrgb(#000000)
  	  call moveto(0+IAV,3,xy)
	  i = lineto(30+IAV+L,3)
	  call moveto(0+IAV,3,xy)
	  i = lineto(0+IAV,27)
	  i = setcolorrgb(#ffffff)
	  i = lineto(30+IAV+L,27)
	  i = lineto(30+IAV+L,3)

      call executa(ix, iy, keystate)


end if

ELSE
   
  if(ibutton4 == 1) then

	i = setcolorrgb(#c0c0c0)
	i = rectangle($gborder,0+iav,3,30+iav+L,27)

i = rectangle($gborder,1+iav,4,29+iav+L,26)

    !apaga atributo do botão
    i = setcolorrgb(#909090)
	i = rectangle($gfillinterior,100+IDESLOCA_X,460+IDESLOCA_Y,500+IDESLOCA_X,478+IDESLOCA_Y)

	ibutton4 = 0
  
  end if

END IF
!*******************************************************************



!5 Quinto botão
!*******************************************************************

IAV = 30 + IAV + L + 5
IF(IX > (IAV)	.AND. IX < (30+IAV+L)  .AND. IY > 3 .AND. IY < 27) then

  if(ibutton5 /= 1) then 

	i =	setcolorrgb(#d0d0d0)
	call moveto(1+IAV,25,xy)
	i = lineto(1+IAV,4)
	i = lineto(28+L+IAV,4)

	i =	setcolorrgb(#505050)
	call moveto(1+IAV,26,xy)
	i = lineto(29+IAV+L,26)
	i = lineto(29+L+IAV,4)

	i =	setcolorrgb(#ffffff)
	call moveto(0+IAV,3,xy)
	i = lineto(30+IAV+L,3)
	call moveto(0+IAV,3,xy)
	i = lineto(0+IAV,27)

i =	setcolorrgb(#000000)
	i = lineto(30+IAV+L,27)
	i = lineto(30+IAV+L,3)

	!atributo do botão

    i = setcolorrgb(#ccffff)
	i = rectangle($gfillinterior,100+IDESLOCA_X,460+IDESLOCA_Y,500+IDESLOCA_X,478+IDESLOCA_Y)
	i = setcolor(0)
	i = rectangle($gborder,100+IDESLOCA_X,460+IDESLOCA_Y,500+IDESLOCA_X,478+IDESLOCA_Y)

    ifontnum = SETFONT ('t''Arial''h14')
    if(ifontnum.eq.-1) ifontnum = SETFONT ('t''times new roman''h14')
    if(ifontnum.eq.-1) ifontnum = SETFONT ('t''courier new''h14')
    if(ifontnum.eq.-1) ifontnum = SETFONT ('t''tahoma''h14')

    if(ifontnum.eq.-1) ifontnum = SETFONT ('t''cac futura casual''h14')

call moveto(140+IDESLOCA_X,462+IDESLOCA_Y,xy)
	call outgtext('Executa o programa 5') 
 
    ibutton5 = 1

  end if

	if(keystate == 1) then

	  i = setcolorrgb(#505050)
	  call moveto(1+IAV,25,xy)
	  i = lineto(1+IAV,4)
	  i = lineto(28+L+IAV,4)

	  i = setcolorrgb(#d0d0d0)
	  call moveto(1+IAV,26,xy)
	  i = lineto(29+IAV+L,26)
	  i = lineto(29+L+IAV,4)

	  i = setcolorrgb(#000000)
  	  call moveto(0+IAV,3,xy)

  i = lineto(30+IAV+L,3)

  call moveto(0+IAV,3,xy)
	  i = lineto(0+IAV,27)
	  i = setcolorrgb(#ffffff)
	  i = lineto(30+IAV+L,27)
	  i = lineto(30+IAV+L,3)

      call executa(ix, iy, keystate)

	end if

ELSE
   
  if(ibutton5 == 1) then

	i = setcolorrgb(#c0c0c0)
	i = rectangle($gborder,0+iav,3,30+iav+L,27)
	i = rectangle($gborder,1+iav,4,29+iav+L,26)

    !apaga atributo do botão
    i = setcolorrgb(#909090)
	i = rectangle($gfillinterior,100+IDESLOCA_X,460+IDESLOCA_Y,500+IDESLOCA_X,478+IDESLOCA_Y)

    ibutton5 = 0

  end if

END IF
!*******************************************************************


!6 Sexto botão
!*******************************************************************
IAV = 30 + IAV + L + 5
IF(IX > (IAV)	.AND. IX < (30+IAV+L)  .AND. IY > 3 .AND. IY < 27) then

  if(ibutton6 /= 1) then 

	i =	setcolorrgb(#d0d0d0)
	call moveto(1+IAV,25,xy)
	i = lineto(1+IAV,4)
	i = lineto(28+L+IAV,4)

	i =	setcolorrgb(#505050)
	call moveto(1+IAV,26,xy)

i = lineto(29+IAV+L,26)
	i = lineto(29+L+IAV,4)

	i =	setcolorrgb(#ffffff)
	call moveto(0+IAV,3,xy)
	i = lineto(30+IAV+L,3)
	call moveto(0+IAV,3,xy)
	i = lineto(0+IAV,27)
	i =	setcolorrgb(#000000)
	i = lineto(30+IAV+L,27)
	i = lineto(30+IAV+L,3)

    i = loadimage('help_color.bmp',5+iav,6)

	ibutton6 = 1
	
  end if

	if(keystate == 1) then

	  i = setcolorrgb(#505050)
	  call moveto(1+IAV,25,xy)
	  i = lineto(1+IAV,4)
	  i = lineto(28+L+IAV,4)

  i = setcolorrgb(#d0d0d0)
	  call moveto(1+IAV,26,xy)
	  i = lineto(29+IAV+L,26)
	  i = lineto(29+L+IAV,4)

	  i = setcolorrgb(#000000)
  	  call moveto(0+IAV,3,xy)
	  i = lineto(30+IAV+L,3)
	  call moveto(0+IAV,3,xy)
	  i = lineto(0+IAV,27)
	  i = setcolorrgb(#ffffff)
	  i = lineto(30+IAV+L,27)
	  i = lineto(30+IAV+L,3)

      call executa(ix, iy, keystate)

	end if

ELSE

   
  if(ibutton6 == 1) then

	i = setcolorrgb(#c0c0c0)
	i = rectangle($gborder,0+iav,3,30+iav+L,27)

i = rectangle($gborder,1+iav,4,29+iav+L,26)
  
    i = loadimage('help.bmp',5+iav,6)
    ibutton6 = 0

  end if

END IF
!*******************************************************************


!Último botão. Se quiser mais um, copie o bloco em destaque,
!e cole-o no espaço reservado para o próximo botão.
!//////////////////////////////////////////////////////////////////////////
!7 
!*******************************************************************
IAV = 30 + IAV + L + 5

IF(IX > (IAV)	.AND. IX < (30+IAV+L)  .AND. IY > 3 .AND. IY < 27) then

  if(ibutton7 /= 1) then 

	i =	setcolorrgb(#d0d0d0)
	call moveto(1+IAV,25,xy)
	i = lineto(1+IAV,4)
	i = lineto(28+L+IAV,4)

	i =	setcolorrgb(#505050)
	call moveto(1+IAV,26,xy)
	i = lineto(29+IAV+L,26)
	i = lineto(29+L+IAV,4)

	i =	setcolorrgb(#ffffff)
	call moveto(0+IAV,3,xy)
	i = lineto(30+IAV+L,3)
	call moveto(0+IAV,3,xy)
	i = lineto(0+IAV,27)
	i =	setcolorrgb(#000000)

i = lineto(30+IAV+L,27)
	i = lineto(30+IAV+L,3)

 	ibutton7 = 1

  end if
  
	if(keystate == 1) then

	  i = setcolorrgb(#505050)
	  call moveto(1+IAV,25,xy)
	  i = lineto(1+IAV,4)
	  i = lineto(28+L+IAV,4)

	  i = setcolorrgb(#d0d0d0)
	  call moveto(1+IAV,26,xy)
	  i = lineto(29+IAV+L,26)
	  i = lineto(29+L+IAV,4)

	  i = setcolorrgb(#000000)
  	  call moveto(0+IAV,3,xy)
	  i = lineto(30+IAV+L,3)
	  call moveto(0+IAV,3,xy)
	  i = lineto(0+IAV,27)

  i = setcolorrgb(#ffffff)
	  i = lineto(30+IAV+L,27)
	  i = lineto(30+IAV+L,3)

      call executa(ix, iy, keystate)

	end if

ELSE
   
  if(ibutton7 == 1) then
	
	i = setcolorrgb(#c0c0c0)
	i = rectangle($gborder,0+iav,3,30+iav+L,27)
	i = rectangle($gborder,1+iav,4,29+iav+L,26)
	
	ibutton7 = 0
  
  end if

END IF
!*******************************************************************


if(keystate == 2) THEN
  call executa(ix, iy, keystate)

end if

end if !IMENU=0

return
end subroutine




subroutine executa(ix,iy,keystate)
use msflib
type (xycoord) xy
common IMENU,L,IAVZ,IDESLOCA_X,IDESLOCA_Y
logical ia

IA = .TRUE.

imenu = 100

! L: acréscimo no comprimento básico dos botões (em pixels)
! IAVZ: avanço dos botões para a direita (em pixels) 


IF(keystate == 1) THEN

      i4 = WAITONMOUSEEVENT (MOUSE$LBUTTONUP, ikeystate, ix , iy)

!1 Segundo botão
!*******************************************************************

      IAV = IAVZ
      IF(IX > (IAV) .AND. IX < (30+IAV+L) .AND. IY > 3 .AND. IY < 27) then
      
	    !apaga atributo do botão
	    i = setcolorrgb(#909090)
	    i = rectangle($gfillinterior,100+IDESLOCA_X,460+IDESLOCA_Y,500+IDESLOCA_X,478+IDESLOCA_Y)

        call subr1(ia)

	  END IF
      

!2 Segundo botão
!*******************************************************************
      IAV = 30 + IAV + L + 5
      IF(IX > (IAV) .AND. IX < (30+IAV+L) .AND. IY > 3 .AND. IY < 27) then

    !apaga atributo do botão

        i = setcolorrgb(#909090)
	    i = rectangle($gfillinterior,100+IDESLOCA_X,460+IDESLOCA_Y,500+IDESLOCA_X,478+IDESLOCA_Y)
      
        call subr2(ia)

	  END IF




!3 Terceiro botão
!*******************************************************************
      IAV = 30 + IAV + L + 5
      IF(IX > (IAV) .AND. IX < (30+IAV+L) .AND. IY > 3 .AND. IY < 27) then
      
	    !apaga atributo do botão
	    i = setcolorrgb(#909090)

    i = rectangle($gfillinterior,100+IDESLOCA_X,460+IDESLOCA_Y,500+IDESLOCA_X,478+IDESLOCA_Y)

        call subr3(ia)

  END IF



!4 Quarto botão
!*******************************************************************
      IAV = 30 + IAV + L + 5
      IF(IX > (IAV) .AND. IX < (30+IAV+L) .AND. IY > 3 .AND. IY < 27) then

	    !apaga atributo do botão
	    i = setcolorrgb(#909090)
	    i = rectangle($gfillinterior,100+IDESLOCA_X,460+IDESLOCA_Y,500+IDESLOCA_X,478+IDESLOCA_Y)

      
        call subr4(ia)

	  END IF




!5 Quinto botão
!*******************************************************************
      IAV = 30 + IAV + L + 5

      IF(IX > (IAV) .AND. IX < (30+IAV+L) .AND. IY > 3 .AND. IY < 27) then
      
	    !apaga atributo do botão
	    i = setcolorrgb(#909090)
	    i = rectangle($gfillinterior,100+IDESLOCA_X,460+IDESLOCA_Y,500+IDESLOCA_X,478+IDESLOCA_Y)

        call subr5(ia)

	  END IF



!6 Sexto botão

!*******************************************************************
      IAV = 30 + IAV + L + 5
      IF(IX > (IAV) .AND. IX < (30+IAV+L) .AND. IY > 3 .AND. IY < 27) then
      
        call ajuda(ia)

	  END IF

!Último botão. Se quiser mais um, copie o bloco em destaque,
!e cole-o no espaço reservado para o próximo botão.
!//////////////////////////////////////////////////////////////////////////
!7 
!*******************************************************************

      IAV = 30 + IAV + L + 5
      IF(IX > (IAV) .AND. IX < (30+IAV+L) .AND. IY > 3 .AND. IY < 27) then
      
        call leiame(ia)

	  END IF

END IF ! KEYSTATE = 1



!POP-UP MENU (por simplicidade, o pop-up não ficará azul na região

!apontada pelo mouse, e a subrotina será evocada em buttondown) 
!*******************************************************************
IF(IX > (100+IDESLOCA_X) .AND. IX < (500+IDESLOCA_X)  .AND. IY > 100+IDESLOCA_Y .AND. IY < 450+IDESLOCA_Y) then

if(keystate == 2) then

      i4 = WAITONMOUSEEVENT (MOUSE$RBUTTONUP, ikeystate, ix , iy)
      
	  IF(IX > (100+IDESLOCA_X) .AND. IX < (500+IDESLOCA_X) .AND. IY > 100+IDESLOCA_Y .AND. IY < 450+IDESLOCA_Y) then
      
        ixi = ix
		ixf = ix + 80
		if(ixf > 500+IDESLOCA_X) then !se o mouse não ficar o canto esquerdo, ficará o direito 

          ixf = ix
		  ixi = ix - 80
        end if

		iyi = iy
		iyf = iy + 100
        if(iyf > 450+IDESLOCA_Y) then !se o mouse não ficar no canto de cima, ficará no de baixo 

  iyf = iy
		  iyi = iy - 100
        end if

ifontnum = SETFONT ('t''Arial''h13')
if(ifontnum.eq.-1) ifontnum = SETFONT ('t''times new roman''h13')
if(ifontnum.eq.-1) ifontnum = SETFONT ('t''courier new''h13')
if(ifontnum.eq.-1) ifontnum = SETFONT ('t''tahoma''h13')
if(ifontnum.eq.-1) ifontnum = SETFONT ('t''cac futura casual''h13')

!retângulo do pop-up menu (um dos quatro vértices ficará sobre o mouse)		
		i = setcolorrgb(#c0c0c0) 
		i = rectangle($gfillinterior,ixi,iyi,ixf,iyf)

i = setcolorrgb(#000000)
		call moveto(ixi,iyf,xy)
		i = lineto(ixf,iyf)
		i = lineto(ixf,iyi)
		i = setcolorrgb(#808080)
		call moveto(ixi+1,iyf-1,xy)
		i = lineto(ixf-1,iyf-1)
		i = lineto(ixf-1,iyi+1)

		i = setcolorrgb(#ffffff)
		call moveto(ixi,iyf,xy)
		i = lineto(ixi,iyi)

        i = lineto(ixf,iyi)
		i = setcolorrgb(#e0e0e0)
		call moveto(ixi+1,iyf-1,xy)
		i = lineto(ixi+1,iyi+1)
		i = lineto(ixf-1,iyi+1)


!Primeira divisão: prog 1

i = setcolorrgb(#808080)
        call moveto(ixi+5,iyi+20,xy)
        i = lineto(ixf-5,iyi+20)
		i = setcolorrgb(#ffffff)
        call moveto(ixi+5,iyi+21,xy)
        i = lineto(ixf-5,iyi+21)
   	    i = setcolorrgb(#000000)
        call moveto(ixi+22,iyi+4,xy)  
        call outgtext('Prog 1') 

!Segunda divisão: prog 2
		i = setcolorrgb(#808080)
        call moveto(ixi+5,iyi+40,xy)
        i = lineto(ixf-5,iyi+40)
		i = setcolorrgb(#ffffff)
        call moveto(ixi+5,iyi+41,xy)

        i = lineto(ixf-5,iyi+41)
   	    i = setcolorrgb(#000000)
        call moveto(ixi+22,iyi+24,xy)  
        call outgtext('Prog 2') 

!Terceira divisão: prog 3
		i = setcolorrgb(#808080)
        call moveto(ixi+5,iyi+60,xy)
        i = lineto(ixf-5,iyi+60)
		i = setcolorrgb(#ffffff)

        call moveto(ixi+5,iyi+61,xy)
        i = lineto(ixf-5,iyi+61)
   	    i = setcolorrgb(#000000)
        call moveto(ixi+22,iyi+44,xy)  
        call outgtext('Prog 3') 

!Quarta divisão: prog 4
		i = setcolorrgb(#808080)
        call moveto(ixi+5,iyi+80,xy)
        i = lineto(ixf-5,iyi+80)
		i = setcolorrgb(#ffffff)
        call moveto(ixi+5,iyi+81,xy)
        i = lineto(ixf-5,iyi+81)
   	    i = setcolorrgb(#000000)
        call moveto(ixi+22,iyi+64,xy)  

        call outgtext('Prog 4') 

!Última divisão: prog 5
   	    i = setcolorrgb(#000000)
        call moveto(ixi+22,iyi+84,xy)  
        call outgtext('Prog 5') 

 
        i4 = WAITONMOUSEEVENT ((MOUSE$LBUTTONDOWN .OR. MOUSE$RBUTTONDOWN), ikeystate, ix , iy)
	    IF(IX > (IXI) .AND. IX < (IXF) .AND. IY > IYI .AND. IY < IYF) THEN
		  IF(IKEYSTATE == 1) THEN

		    IF(IX >= IXI .AND. IX <= IXF .AND. IY >= IYI .AND. IY < IYI+21)THEN
              i = setcolorrgb(#ffffff) 

      i = rectangle($gfillinterior,ixi,iyi,ixf,iyf)
              call subr1(ia)
			END IF

		    IF(IX >= IXI .AND. IX <= IXF .AND. IY >= IYI+21 .AND. IY < IYI+41)THEN

              i = setcolorrgb(#ffffff) 
		      i = rectangle($gfillinterior,ixi,iyi,ixf,iyf)
              call subr2(ia)
			END IF

		    IF(IX >= IXI .AND. IX <= IXF .AND. IY >= IYI+41 .AND. IY < IYI+61)THEN
              i = setcolorrgb(#ffffff) 
		      i = rectangle($gfillinterior,ixi,iyi,ixf,iyf)

              call subr3(ia)
			END IF

		    IF(IX >= IXI .AND. IX <= IXF .AND. IY >= IYI+61 .AND. IY < IYI+81)THEN
              i = setcolorrgb(#ffffff) 

      i = rectangle($gfillinterior,ixi,iyi,ixf,iyf)
              call subr4(ia)
			END IF

		    IF(IX >= IXI .AND. IX <= IXF .AND. IY >= IYI+81 .AND. IY <= IYI+100)THEN
              i = setcolorrgb(#ffffff) 
		      i = rectangle($gfillinterior,ixi,iyi,ixf,iyf)
              call subr5(ia)

END IF

          ELSE

            i = setcolorrgb(#ffffff) 
		    i = rectangle($gfillinterior,ixi,iyi,ixf,iyf)

		  END IF 
		    
		ELSE

          i = setcolorrgb(#ffffff) 

  i = rectangle($gfillinterior,ixi,iyi,ixf,iyf)
        
		END IF
				
	  END IF

	end if

END IF
!*******************************************************************


!end if !imenu =0

IMENU = 0

return
end subroutine

!///////////////////////////////////////////////////////////////////////////

!///////////////////////////////////////////////////////////////////////////


!Função onde se define os itens do menu.
LOGICAL(4) FUNCTION INITIALSETTINGS()

USE MSFLIB
LOGICAL(4)result
external subr1, subr2, subr3, subr4, subr5, leiame, ajuda
     
         ! Cria um menu 1 chamado Arquivo
         result = APPENDMENUQQ(1, $MENUENABLED, '&Arquivo'C, NUL )

         ! os nomes programa1, programa2, ..., programa5 
         !(C strings) definidos a seguir devem ser alterados

         !de acordo com as suas aplicações. 
		 
         ! chama a callback subr1 (externa, feita pelo programador
         !e, por isso, foi declarada no início da função

         !initialsettings)
	   result = APPENDMENUQQ(1, $MENUENABLED, 'Programa &1'C, subr1)
         !coloca um traço separando o primeiro do segundo item do menu
	   result = APPENDMENUQQ(1, $MENUSEPARATOR, ''C,NUL )

         result = APPENDMENUQQ(1, $MENUENABLED, 'Programa &2'C, subr2)

         result = APPENDMENUQQ(1, $MENUSEPARATOR, ''C, NUL )
         result = APPENDMENUQQ(1, $MENUENABLED, 'Programa &3'C, subr3)
         result = APPENDMENUQQ(1, $MENUSEPARATOR, ''C, NUL )

         result = APPENDMENUQQ(1, $MENUENABLED, 'Programa &4'C, subr4)
         result = APPENDMENUQQ(1, $MENUSEPARATOR, ''C, NUL )
         result = APPENDMENUQQ(1, $MENUENABLED, 'Programa &5'C, subr5)
         result = APPENDMENUQQ(1, $MENUSEPARATOR, ''C, NUL )

        !chama a subrotina WINEXIT (interna, definida em MSFLIB)

        !que termina a execução do programa em loop infinito
        result = APPENDMENUQQ(1, $MENUENABLED, '&Sair'C, WINEXIT)




         ! Cria um menu 2 chamado Informações.

         result = APPENDMENUQQ(2, $MENUENABLED, '&Informações'C, NUL )

! chama a callback subrotina de msflib com ajuda sobre o 
!QuickWin Application
result = APPENDMENUQQ(2, $MENUENABLED, 'Ajuda QuickWin'C, AJUDA)
result = APPENDMENUQQ(2, $MENUSEPARATOR, ''C, NUL )

! chama a callback WINUSING (interna, definida em msflib) com

!ajuda sobre o windows
result = APPENDMENUQQ(2, $MENUENABLED, 'Usando a Ajuda'C, WINUSING)
result = APPENDMENUQQ(2, $MENUSEPARATOR, ''C, NUL )

!chama a subrotina WINABOUT (interna, definida em msflib) com 
!informações sobre o Developer Studio.
result = APPENDMENUQQ(2, $MENUENABLED, 'Sobre o Developer Studio'C, WINABOUT)
result = APPENDMENUQQ(2, $MENUSEPARATOR, ''C, NUL )

!chama a callback leiame (externa, feita pelo programador
!e deve ser declarada)
result = APPENDMENUQQ(2, $MENUENABLED, 'Leiame'C, leiame)

         INITIALSETTINGS= .true.

END FUNCTION INITIALSETTINGS !fim da subrotina lógica que cria o menu.

  

!///////////////////////////////////////////////////////////////////////////
!///////////////////////////////////////////////////////////////////////////


! subrotinas callbacks:
! a seguir, subrotinas callbacks onde você pode colocar programas
subroutine subr1(ia)

USE MSFLIB
logical ia
common imenu !troca informações com a tollbar no programa principal

ia = .true. !argumento da subrotina callback subr1

result = MODIFYMENUFLAGSQQ (1, 0, $MENUGRAYED)

result = MODIFYMENUFLAGSQQ (2, 0, $MENUGRAYED)
imenu = 1 !calback sendo executada
CALL BUTTONS(0) !grayed toolbar

      !INSIRA UM PROGRAMA AQUI, E APAGUE A LINHA A SEGUIR
	  !VOCÊ TAMBÉM PODE CHAMAR UMA SUBROTINA...
       message = messageboxqq('Programa 1: Este item está indisponível no momento!'c,'Atenção',MB$OK.OR.MB$ICONEXCLAMATION.or.MB$DEFBUTTON1)

result = MODIFYMENUFLAGSQQ (1, 0, $MENUENABLED)

result = MODIFYMENUFLAGSQQ (2, 0, $MENUENABLED)
imenu = 0 !fim da execução da callback

CALL BUTTONS(1) !enabled toolbar

end subroutine


!///////////////////////////////////////////////////////////////////////////
!///////////////////////////////////////////////////////////////////////////


subroutine subr2(ia)

USE MSFLIB
logical ia
common imenu !troca informações com a tollbar no programa principal

ia = .true.

result = MODIFYMENUFLAGSQQ (1, 0, $MENUGRAYED)

result = MODIFYMENUFLAGSQQ (2, 0, $MENUGRAYED)
imenu = 1 !calback sendo executada

CALL BUTTONS(0) !grayed toolbar

      !INSIRA UM PROGRAMA AQUI, E APAGUE A LINHA A SEGUIR
	  !VOCÊ TAMBÉM PODE CHAMAR UMA SUBROTINA...
       message = messageboxqq('Programa 2: Este item está indisponível no momento!'c,'Atenção',MB$OK.OR.MB$ICONEXCLAMATION.or.MB$DEFBUTTON1)

result = MODIFYMENUFLAGSQQ (1, 0, $MENUENABLED)
result = MODIFYMENUFLAGSQQ (2, 0, $MENUENABLED)
imenu = 0 !fim da execução da callback

CALL BUTTONS(1) !enabled toolbar

end subroutine

!///////////////////////////////////////////////////////////////////////////
!///////////////////////////////////////////////////////////////////////////


subroutine subr3(ia)

USE MSFLIB
logical ia
common imenu !troca informações com a tollbar no programa principal

ia = .true.

result = MODIFYMENUFLAGSQQ (1, 0, $MENUGRAYED)
result = MODIFYMENUFLAGSQQ (2, 0, $MENUGRAYED)
imenu = 1 !calback sendo executada

CALL BUTTONS(0) !grayed toolbar

      !INSIRA UM PROGRAMA AQUI, E APAGUE A LINHA A SEGUIR

  !VOCÊ TAMBÉM PODE CHAMAR UMA SUBROTINA...
       message = messageboxqq('Programa 3: Este item está indisponível no momento!'c,'Atenção',MB$OK.OR.MB$ICONEXCLAMATION.or.MB$DEFBUTTON1)

result = MODIFYMENUFLAGSQQ (1, 0, $MENUENABLED)
result = MODIFYMENUFLAGSQQ (2, 0, $MENUENABLED)
imenu = 0 !fim da execução da callback
CALL BUTTONS(1) !enabled toolbar

end subroutine


!///////////////////////////////////////////////////////////////////////////
!///////////////////////////////////////////////////////////////////////////

subroutine subr4(ia)

USE MSFLIB
logical ia
common imenu !troca informações com a tollbar no programa principal

ia = .true.

result = MODIFYMENUFLAGSQQ (1, 0, $MENUGRAYED)
result = MODIFYMENUFLAGSQQ (2, 0, $MENUGRAYED)
imenu = 1 !calback sendo executada
CALL BUTTONS(0) !grayed toolbar

      !INSIRA UM PROGRAMA AQUI, E APAGUE A LINHA A SEGUIR

  !VOCÊ TAMBÉM PODE CHAMAR UMA SUBROTINA...
       message = messageboxqq('Programa 4: Este item está indisponível no momento!'c,'Atenção',MB$OK.OR.MB$ICONEXCLAMATION.or.MB$DEFBUTTON1)

result = MODIFYMENUFLAGSQQ (1, 0, $MENUENABLED)
result = MODIFYMENUFLAGSQQ (2, 0, $MENUENABLED)
imenu = 0 !fim da execução da callback
CALL BUTTONS(1) !enabled toolbar

end subroutine


!///////////////////////////////////////////////////////////////////////////
!///////////////////////////////////////////////////////////////////////////

subroutine subr5(ia)

USE MSFLIB
logical ia
common imenu !troca informações com a tollbar no programa principal

ia = .true.

result = MODIFYMENUFLAGSQQ (1, 0, $MENUGRAYED)
result = MODIFYMENUFLAGSQQ (2, 0, $MENUGRAYED)
imenu = 1 !calback sendo executada
CALL BUTTONS(0) !grayed toolbar

      !INSIRA UM PROGRAMA AQUI, E APAGUE A LINHA A SEGUIR
	  !VOCÊ TAMBÉM PODE CHAMAR UMA SUBROTINA...
       message = messageboxqq('Programa 5: Este item está indisponível no momento!'c,'Atenção',MB$OK.OR.MB$ICONEXCLAMATION.or.MB$DEFBUTTON1)

result = MODIFYMENUFLAGSQQ (1, 0, $MENUENABLED)
result = MODIFYMENUFLAGSQQ (2, 0, $MENUENABLED)

imenu = 0 !fim da execução da callback
CALL BUTTONS(1) !enabled toolbar

end subroutine


!///////////////////////////////////////////////////////////////////////////
!///////////////////////////////////////////////////////////////////////////


! subrotinas callbacks:
! a seguir, subrotinas callbacks onde você pode colocar programas
subroutine ajuda(ia)

USE MSFLIB

logical ia
common imenu !troca informações com a tollbar no programa principal


ia = .true. !argumento da subrotina callback ajuda

result = MODIFYMENUFLAGSQQ (1, 0, $MENUGRAYED)
result = MODIFYMENUFLAGSQQ (2, 0, $MENUGRAYED)
imenu = 1 !calback sendo executada
CALL BUTTONS(0) !grayed toolbar

i = clickmenuqq(loc(WININDEX))

result = MODIFYMENUFLAGSQQ (1, 0, $MENUENABLED)
result = MODIFYMENUFLAGSQQ (2, 0, $MENUENABLED)
imenu = 0 !fim da execução da callback

CALL BUTTONS(1) !enabled toolbar

end subroutine


!///////////////////////////////////////////////////////////////////////////

!///////////////////////////////////////////////////////////////////////////

subroutine leiame(ia)

USE MSFLIB
logical ia
common imenu !troca informações com a tollbar no programa principal

ia = .true.

result = MODIFYMENUFLAGSQQ (1, 0, $MENUGRAYED)
result = MODIFYMENUFLAGSQQ (2, 0, $MENUGRAYED)
imenu = 1 !calback sendo executada

CALL BUTTONS(0) !grayed toolbar

       !Quando já existir um arquivo leiame, apague 
       !as próximas três linhas na sua aplicação   

       message = messageboxqq('Leia-me: Este item está indisponível no momento!'c,'Atenção',MB$OK.OR.MB$ICONEXCLAMATION.or.MB$DEFBUTTON1)
       result = MODIFYMENUFLAGSQQ (1, 0, $MENUENABLED)
       result = MODIFYMENUFLAGSQQ (2, 0, $MENUENABLED)
       imenu = 0 !fim da execução da callback
       CALL BUTTONS(1) !enabled toolbar

       return

       i = runqq('notepad.exe','leiame.txt')

result = MODIFYMENUFLAGSQQ (1, 0, $MENUENABLED)
result = MODIFYMENUFLAGSQQ (2, 0, $MENUENABLED)

imenu = 0 !fim da execução da callback
CALL BUTTONS(1) !enabled toolbar

end subroutine


!///////////////////////////////////////////////////////////////////////////
!///////////////////////////////////////////////////////////////////////////






SUBROUTINE BUTTONS(IGRAYED)
USE MSFLIB
TYPE (XYCOORD) XY

common IMENU,L,IAVZ !troca informações com buttons e callbacks


inumfo = INITIALIZEFONTS( )

ifontnum = SETFONT ('t''Arial''h14')
if(ifontnum.eq.-1) ifontnum = SETFONT ('t''times new roman''h14')

if(ifontnum.eq.-1) ifontnum = SETFONT ('t''courier new''h14')
if(ifontnum.eq.-1) ifontnum = SETFONT ('t''tahoma''h14')
if(ifontnum.eq.-1) ifontnum = SETFONT ('t''cac futura casual''h14')

! L: acréscimo no comprimento básico dos botões (em pixels)
! IAV: avanço dos botões para a direita (em pixels) 
IAV = IAVZ


!botões: nomes dos botões 
!1 Primeiro botão
   
  if(igrayed == 1) then !igrayed = 1, button_enabled.
                        !igrayed = 0, button_grayed.  

i =	setcolorrgb(#000000)
  else
	i = setcolorrgb(#808080)

  end if
	
	call moveto(23+IAV,7,xy)
	call outgtext('Prog 1')



IAV = 30 + IAV + L + 5
!2 Segundo botão

  if(igrayed == 1) then
	i =	setcolorrgb(#000000)
  else
  	i = setcolorrgb(#808080)
  end if
	call moveto(23+IAV,7,xy)
	call outgtext('Prog 2')


IAV = 30 + IAV + L + 5
!3 Terceiro botão

  if(igrayed == 1) then
	i =	setcolorrgb(#000000)
  else
  	i = setcolorrgb(#808080)

  end if
	call moveto(21+IAV,7,xy)
	call outgtext('Prog 3')


IAV = 30 + IAV + L + 5
!4 Quarto botão

  if(igrayed == 1) then
	i =	setcolorrgb(#000000)
  else
  	i = setcolorrgb(#808080)

  end if
	call moveto(21+IAV,7,xy)
	call outgtext('Prog 4')


IAV = 30 + IAV + L + 5
!5 Quinto botão

  if(igrayed == 1) then
	i =	setcolorrgb(#000000)
  else
  	i = setcolorrgb(#808080)
  end if
	call moveto(21+IAV,7,xy)
	call outgtext('Prog 5')


IAV = 30 + IAV + L + 5
!6 Sexto botão

  if(igrayed == 1) then
	i =	setcolorrgb(#000000)
  else
  	i = setcolorrgb(#808080)
  end if
	call moveto(21+IAV,7,xy)
	call outgtext('Ajuda')

!Último botão. Se quise mais um, copie o bloco em destaque,

!e cole-o no espaço reservado para o próximo botão.
!//////////////////////////////////////////////////////////////////////////
IAV = 30 + IAV + L + 5
!7

  if(igrayed == 1) then
	i =	setcolorrgb(#000000)

  else
  	i = setcolorrgb(#808080)
  end if
	call moveto(9+IAV,7,xy)
	call outgtext('Leia-me')
!//////////////////////////////////////////////////////////////////////////

!***************************
!***************************
!próximo botão: cole aqui

!***************************
!***************************

!como os retângulos dos botões podem ser diminuídos
!veja botão 6, acima, os bitmaps podem ser carregados
!uma única vez porque não serão apagados.

if(ija == 0) then

  IAV = IAVZ

  !bitmap nos botões
  ! 1
  i = loadimage('novo.bmp',2+iav,5)


  IAV = 30 + IAV + L + 5
  ! 2
  i = loadimage('abrir.bmp',2+iav,5)


  IAV = 30 + IAV + L + 5
  ! 3
  i = loadimage(' ',5+iav,5)


  IAV = 30 + IAV + L + 5

  ! 4
  i = loadimage(' ',5+iav,5)


  IAV = 30 + IAV + L + 5
  ! 5
  i = loadimage(' ',5+iav,5)


  IAV = 30 + IAV + L + 5
  ! 6 Bitmap no botão Help
  i = loadimage('help.bmp',5+iav,6)


  IAV = 30 + IAV + L + 5
  ! 7
  i = loadimage(' ',5+iav,5)

  ija = 1

end if

RETURN

END SUBROUTINE BUTTONS