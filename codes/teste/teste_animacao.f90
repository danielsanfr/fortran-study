program minha_animacao

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

    i = SETFONT ('t''times new roman''h30') !fonte a ser utilizada 
    !se i for –1, então a fonte solicitada não está
    !disponível no micro e outra deve ser escolhida
    if(i .eq. -1) i = SETFONT ('t''Arial''h30')
    if(i .eq. -1) i = SETFONT ('t''courier new''h30')

    if(i .eq. -1) i = SETFONT ('t''tahoma''h30')
    if(i .eq. -1) i = SETFONT ('t''cac futura casual''h30')

    i = setcolor(2) !cor verde

    call moveto(150,5,pos) 
    !leva cursor para as coordenadas indicadas 

    call outgtext('Tecle "Enter" para iniciar')
    !escreve o texto indicado em x = 150 e y = 5

	 i = setcolor(9) !a pista é azul

    call moveto(20,100+iy,pos) 
    !leva cursor para as coordenadas indicadas 

    i = lineto(360,330+iy) 
    !traça um linha até a posição indicada

i = setcolor(0) !cor da bola

 i = ellipse($gfillinterior,27+ix,87+iy,50+ix,107+iy)
 ! bola
 i = ellipse($gborder,340+ix,270+iy,355+ix,285+iy)
 ! cabeca
i = ellipse($gfillinterior,343+ix,274+iy,346+ix,277+iy)
 ! olho direito
 i = ellipse($gfillinterior,349+ix,274+iy,352+ix,277+iy)
 ! olho esquerdo
 call moveto(347,285+iy,pos)
 
 i = lineto(347,305+iy)
 ! corpo
  call moveto(347,285+iy,pos)
 
  i = lineto(340,292+iy)
 ! braco direito
  call moveto(347,285+iy,pos)
 
 i = lineto(354,292+iy)
 ! braco esquerdo
 call moveto(347,305+iy,pos)

 i = lineto(340,312+iy)
 ! perna direita
 call moveto(347,305+iy,pos)

 i = lineto(354,312+iy)
 ! perna esquerda
 read(*,*)  !espera pelo "Enter"

    i = setcolor(15) !letras brancas: "apaga" a frase

    call moveto(150,5,pos) 
    !leva cursor para as coordenadas indicadas 

    call outgtext('Tecle "Enter" para iniciar')
	
	!escreve o texto indicado 

    call movimento(iy) 
    !chama a subrotina que criará o movimento

	i = setcolor(15) !cor da bola

 i = ellipse($gfillinterior,27,89,50,109)
 ! bola
 i = ellipse($gborder,340,270,355,285)
 ! cabeca
i = ellipse($gfillinterior,343,274,346,277)
 ! olho direito
 i = ellipse($gfillinterior,349,274,352,277)
 ! olho esquerdo
 call moveto(347,285,pos)
 
 i = lineto(347,305)
 ! corpo
  call moveto(347,285,pos)
 
  i = lineto(340,292)
 ! braco direito
  call moveto(347,285,pos)
 
 i = lineto(354,292)
 ! braco esquerdo
 call moveto(347,305,pos)

 i = lineto(340,312)
 ! perna direita
 call moveto(347,305,pos)

 i = lineto(354,312)
 ! perna esquerda

 call esplod

 pause

stop

end program