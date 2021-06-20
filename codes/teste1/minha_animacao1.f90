 program animacao1

 use msflib
 
 implicit none

 type (xycoord) pos

 type (qwinfo) winfo

 integer i,ix,ixx,iy,iyy,z,a

 winfo.TYPE = QWIN$MAX

 i = SETWSIZEQQ(QWIN$FRAMEWINDOW, winfo)

 i = setbkcolor(15)

 call clearscreen($gclearscreen)

 ix = 0 ; iy = 0

 i = clickmenuqq(QWIN$STATUS)

 i = clickmenuqq(QWIN$TILE)

 i = INITIALIZEFONTS()

 i = SETFONT ('t''times new roman''h30')

 if(1 == -1) i = SETFONT ('t''Ariel''h30')
 if(1 == -1) i = SETFONT ('t''courier new''h30')
 if(1 == -1) i = SETFONT ('t''tahoma''h30')
 if(1 == -1) i = SETFONT ('t''cac futura casual''h30')

 i = setcolor(5)

 call moveto(130,5,pos)

 call outgtext('Tecle "Enter" para o super palito começar a voar')

 i = setcolor(0)

 i = ellipse($gborder,360,210,375,225)
 ! cabeca
 i = ellipse($gfillinterior,363,214,366,217)
 ! olho direito
 i = ellipse($gfillinterior,369,214,372,217)
 ! olho esquerdo
 call moveto(367,225,pos)
 
 i = lineto(367,245)
 ! corpo
  call moveto(367,225,pos)
 
 i = lineto(360,234)
 ! braco direito                                                            
 call moveto(367,225,pos)
 
 i = lineto(374,234)
 ! braco esquerdo
 call moveto(367,245,pos)

 i = lineto(360,252)
 ! perna direita
 call moveto(367,245,pos)

 i = lineto(374,252)
 ! perna esquerda


 !capa
 call moveto(367,225,pos)
 
 i = lineto(363,241)
                                                             
 call moveto(367,225,pos)
 
 i = lineto(371,241)
 
 call moveto(363,241,pos)
 
 i = lineto(371,241)
 ! capa


  read(*,*)  !espera pelo "Enter"

    i = setcolor(15) !letras brancas: "apaga" a frase

    call moveto(130,5,pos) 
    !leva cursor para as coordenadas indicadas 

    call outgtext('Tecle "Enter" pera o super palito começar a voar') 
    !escreve o texto indicado 

 i = setcolor(1)
 ! retangulo da esquerda
 i = rectangle($gfillinterior,5,200,85,255)

 i = setcolor(2)
 ! retangulo de direita
 i = rectangle($gfillinterior,685,200,765,255)

 i = setcolor(3)
 ! retangulo de cima
 i = rectangle($gfillinterior,340,5,395,65)
 
 i = setcolor(4)
 ! retangulo de baixo
 i = rectangle($gfillinterior,340,395,395,460)

 i = setcolor(6)
 ! circulo de cima esquerdo
 i = ellipse($gfillinterior,35,5,85,55)

 i = setcolor(7)
 ! circulo de baixo esquerdo
 i = ellipse($gfillinterior,35,420,85,470)

 i = setcolor(8)
 ! circulo de cima direito
 i = ellipse($gfillinterior,690,5,740,55)

 i = setcolor(9)
 ! circulo de baixo direito
 i = ellipse($gfillinterior,690,415,740,465)

	call mov1 
 !chama a subrotina que criará o movimento
 	call mov2

	call mov3

	call mov4
 
 stop

 end program