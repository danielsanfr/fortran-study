program anima

  use msflib !biblioteca com elementos gráficos

  implicit none 
  !elimina a facilidade de não declarar variáveis

  type (xycoord) pos 
  !variável que identifica o tipo de coordenada usada

  type (qwinfo) winfo 
  !varável para informar o tamanho da janela

  integer i, ix, iy 
  !declaração de variáveis

    winfo.TYPE = QWIN$MAX 
    !tamanho máximo para a tela

    i = SETWSIZEQQ(QWIN$FRAMEWINDOW, winfo) 
    !Maximiza a janela principal

    i = setbkcolor(15) 
    !colore a tela de branco, mas ela deve ser limpa 

    call clearscreen($gclearscreen)
    !limpa a cor antiga e aparece o branco

    iy = 0 
    !iy permite mudar a posição vertical do desenho

    ix = 0 
    !define a posição inicial do caminhão na horizontal

    i = clickmenuqq(QWIN$STATUS)   
    !Elimina barra de status

    i = clickmenuqq(QWIN$TILE)  
    !janela filhote no estilo tile

    i = INITIALIZEFONTS( ) 
    !disponibiliza fontes para escrever na tela

    i = SETFONT ('t''Arial''h30') !fonte a ser utilizada 
    !se i for –1, então a fonte solicitada não está
    !disponível no micro e outra deve ser escolhida
    if(i .eq. -1) i = SETFONT ('t''times new roman''h30')
    if(i .eq. -1) i = SETFONT ('t''courier new''h30')

    if(i .eq. -1) i = SETFONT ('t''tahoma''h30')
    if(i .eq. -1) i = SETFONT ('t''cac futura casual''h30')

    i = setcolor(5) !cor magenta

    call moveto(150,5,pos) 
    !leva cursor para as coordenadas indicadas 

    call outgtext('Tecle "Enter" para iniciar')
    !escreve o texto indicado em x = 150 e y = 5

    i = setcolor(9) !a pista é azul

    call moveto(10,250+iy,pos) 
    !leva cursor para as coordenadas indicadas 

    i = lineto(590,250+iy) 
    !traça um linha até a posição indicada

    ! caminhão
    !ix é a variável para mudar a posição do caminhão
    i = setcolor(14) !cor da carroceria do caminhão baú

    i = rectangle($gfillinterior,20+ix,215+iy,60+ix,242+iy)   
    !"$gfillinterior" significa pintar todo o retângulo

    i = setcolor(10) !cor da cabine do caminhão baú

    i = rectangle($gfillinterior,61+ix,225+iy,75+ix,242+iy) 

    i = setcolor(5) !cor do contorno da cabine e carroceria

    i = rectangle($gborder,20+ix,215+iy,60+ix,242+iy)
    !"$gborder": significa desenhar só o contorno.

    i = rectangle($gborder,61+ix,225+iy,75+ix,242+iy)

    i = setcolor(0) !cor dos pneus

    i = ellipse($gfillinterior,25+ix,243+iy,31+ix,249+iy) 
    !pneu traseiro

    i = ellipse($gfillinterior,64+ix,243+iy,70+ix,249+iy) 
    !pneu dianteiro

	!-----------------Novo Caminhão------------------------!

	i = setcolor(14) !cor da carroceria do caminhão baú

    i = rectangle($gfillinterior,510+ix,215+iy,550+ix,242+iy)   
    !"$gfillinterior" significa pintar todo o retângulo

    i = setcolor(10) !cor da cabine do caminhão baú

    i = rectangle($gfillinterior,495+ix,225+iy,509+ix,242+iy) 

    i = setcolor(5) !cor do contorno da cabine e carroceria

    i = rectangle($gborder,510+ix,215+iy,550+ix,242+iy)
    !"$gborder": significa desenhar só o contorno.

    i = rectangle($gborder,495+ix,225+iy,509+ix,242+iy)

    i = setcolor(0) !cor dos pneus

    i = ellipse($gfillinterior,539+ix,243+iy,545+ix,249+iy) 
    !pneu traseiro

    i = ellipse($gfillinterior,498+ix,243+iy,504+ix,249+iy) 
    !pneu dianteiro

	!-----------------------Fim------------------------------!

    read(*,*)  !espera pelo "Enter"

    i = setcolor(15) !letras brancas: "apaga" a frase

    call moveto(150,5,pos) 
    !leva cursor para as coordenadas indicadas 

    call outgtext('Tecle "Enter" para iniciar') 
    !escreve o texto indicado 

    call movimento(iy) 
    !chama a subrotina que criará o movimento

	call mov

stop

end program




subroutine movimento(iy)

  use msflib

  type (xycoord) pos 

  !variável que identifica o tipo de coordenada usada

  do ix = 0, 212, 2  
    !o passo dá o avanço da imagem, em pixels.
    !ix é a variável para mudar a posição do caminhão

    i = setcolor(14) 
    !cor da carroceria do caminhão baú

    i = rectangle($gfillinterior,20+ix,215+iy,60+ix,242+iy)
    !"$gfillinterior" significa pintar todo o retângulo

    i = setcolor(10) !cor da cabine do caminhão baú

    i = rectangle($gfillinterior,61+ix,225+iy,75+ix,242+iy) 

    i = setcolor(5)
    !cor do contorno da cabine e carroceria

    i = rectangle($gborder,20+ix,215+iy,60+ix,242+iy)

    i = rectangle($gborder,61+ix,225+iy,75+ix,242+iy)
    !"$gborder" significa desenhar só o contorno.

    i = setcolor(0) !cor dos pneus

    i = ellipse($gfillinterior,25+ix,243+iy,31+ix,249+iy) 
    !pneu traseiro

    i = ellipse($gfillinterior,64+ix,243+iy,70+ix,249+iy) 
    !pneu dianteiro

		!-----------------Novo Caminhão------------------------!

	i = setcolor(14) !cor da carroceria do caminhão baú

    i = rectangle($gfillinterior,510-ix,215+iy,550-ix,242+iy)   
    !"$gfillinterior" significa pintar todo o retângulo

    i = setcolor(10) !cor da cabine do caminhão baú

    i = rectangle($gfillinterior,495-ix,225+iy,509-ix,242+iy) 

    i = setcolor(5) !cor do contorno da cabine e carroceria

    i = rectangle($gborder,510-ix,215-iy,550-ix,242-iy)
    !"$gborder": significa desenhar só o contorno.

    i = rectangle($gborder,495-ix,225+iy,509-ix,242+iy)

    i = setcolor(0) !cor dos pneus

    i = ellipse($gfillinterior,539-ix,243+iy,545-ix,249+iy) 
    !pneu traseiro

    i = ellipse($gfillinterior,498-ix,243+iy,504-ix,249+iy) 
    !pneu dianteiro

	!-----------------------Fim------------------------------!

if(ix==212)goto 1

    call sleepqq(20)
    !mostra a imagem desenhada por 80 ms.

    i = setcolor(15) !apaga a imagem desenhada

    i = rectangle($gfillinterior,20+ix,215+iy,60+ix,242+iy)

    i = rectangle($gfillinterior,61+ix,225+iy,75+ix,242+iy)

    i = ellipse($gfillinterior,25+ix,243+iy,31+ix,249+iy)

    i = ellipse($gfillinterior,64+ix,243+iy,70+ix,249+iy)

	!-----------------Novo Caminhão------------------------!

    i = rectangle($gfillinterior,510-ix,215+iy,550-ix,242+iy)   

    i = rectangle($gfillinterior,495-ix,225+iy,509-ix,242+iy) 

    i = rectangle($gborder,510-ix,215-iy,550-ix,242-iy)

    i = rectangle($gborder,495-ix,225+iy,509-ix,242+iy)

    i = ellipse($gfillinterior,539-ix,243+iy,545-ix,249+iy) 

    i = ellipse($gfillinterior,498-ix,243+iy,504-ix,249+iy) 

	!-----------------------Fim------------------------------!

  end do

1 return

end subroutine