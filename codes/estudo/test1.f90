program anima

  use msflib !biblioteca com elementos gr�ficos

  use dialogm !use caixa de dialogo

  implicit none 
  !elimina a facilidade de n�o declarar vari�veis

!variaveis da caixa de dialogo
!type (dialog) dlg

!include 'resource.fd'

!logical pushed_state1, pushed_state2, pushed_state3, pushed_state4

!logical retlog

!integer iret, message
!acaba essa declaracao

  type (xycoord) pos 
  !vari�vel que identifica o tipo de coordenada usada

  type (qwinfo) winfo 
  !var�vel para informar o tamanho da janela

  integer i, ix, iy 
  !declara��o de vari�veis

      winfo.TYPE = QWIN$MAX 
    !tamanho m�ximo para a tela

    i = SETWSIZEQQ(QWIN$FRAMEWINDOW, winfo) 
    !Maximiza a janela principal

    i = setbkcolor(15) 
    !colore a tela de branco, mas ela deve ser limpa 

    call clearscreen($gclearscreen)
    !limpa a cor antiga e aparece o branco

    iy = 0 
    !iy permite mudar a posi��o vertical do desenho

    ix = 0 
    !define a posi��o inicial do caminh�o na horizontal

    i = clickmenuqq(QWIN$STATUS)   
    !Elimina barra de status

    i = clickmenuqq(QWIN$TILE)  
    !janela filhote no estilo tile

    i = INITIALIZEFONTS( ) 
    !disponibiliza fontes para escrever na tela

    i = SETFONT ('t''Arial''h30') !fonte a ser utilizada 
    !se i for �1, ent�o a fonte solicitada n�o est�
    !dispon�vel no micro e outra deve ser escolhida
    if(i .eq. -1) i = SETFONT ('t''times new roman''h30')
    if(i .eq. -1) i = SETFONT ('t''courier new''h30')

    if(i .eq. -1) i = SETFONT ('t''tahoma''h30')
    if(i .eq. -1) i = SETFONT ('t''cac futura casual''h30')

    i = setcolor(5) !cor magenta

    call moveto(150,5,pos) 
    !leva cursor para as coordenadas indicadas 

    call outgtext('Tecle "Enter" para iniciar')
    !escreve o texto indicado em x = 150 e y = 5

    i = setcolor(9) !a pista � azul

    call moveto(10,250+iy,pos) 
    !leva cursor para as coordenadas indicadas 

    i = lineto(590,250+iy) 
    !tra�a um linha at� a posi��o indicada

    ! caminh�o
    !ix � a vari�vel para mudar a posi��o do caminh�o
    i = setcolor(14) !cor da carroceria do caminh�o ba�

    i = rectangle($gfillinterior,20+ix,215+iy,60+ix,242+iy)   
    !"$gfillinterior" significa pintar todo o ret�ngulo

    i = setcolor(10) !cor da cabine do caminh�o ba�

    i = rectangle($gfillinterior,61+ix,225+iy,75+ix,242+iy) 

    i = setcolor(5) !cor do contorno da cabine e carroceria

    i = rectangle($gborder,20+ix,215+iy,60+ix,242+iy)
    !"$gborder": significa desenhar s� o contorno.

    i = rectangle($gborder,61+ix,225+iy,75+ix,242+iy)

    i = setcolor(0) !cor dos pneus

    i = ellipse($gfillinterior,25+ix,243+iy,31+ix,249+iy) 
    !pneu traseiro

    i = ellipse($gfillinterior,64+ix,243+iy,70+ix,249+iy) 
    !pneu dianteiro

    read(*,*)  !espera pelo "Enter"

    i = setcolor(15) !letras brancas: "apaga" a frase

    call moveto(150,5,pos) 
    !leva cursor para as coordenadas indicadas 

    call outgtext('Tecle "Enter" para iniciar') 
    !escreve o texto indicado 

	10 continue

    call movimento(iy) 
    !chama a subrotina que criar� o movimento
	
	20 continue

	i = getwsizeqq(0,QWIN$SIZEMAX,winfo)

  winfo.y = 0

  winfo.x = 0

  winfo.h = winfo.h/1.5

  i = SetWSizeQQ(0, winfo)

  winfo.y = winfo.h / 2

  open(unit = 1, file = 'user', title = 'Nova Janela')

  i = SetWSizeQQ(1, winfo)

  i = setbkcolorrgb(#ffffff)

  call clearscreen($gclearscreen)
  
  i = setcolor(9) 

  call moveto(10,250+iy,pos) 

  i = lineto(590,250+iy) 

  call movimento(iy)

  close(1)

stop

end program