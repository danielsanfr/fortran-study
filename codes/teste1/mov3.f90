subroutine mov3

  use msflib

  type (xycoord) pos 

  !variável que identifica o tipo de coordenada usada

  do ix = 0, 712, 2  
    !o passo dá o avanço da imagem, em pixels.
    !ix é a variável para mudar a posição do caminhão

 i = setcolor(0)

 i = ellipse($gborder,33+ix,210,48+ix,225)
 ! cabeca
 i = ellipse($gfillinterior,42+ix,219,45+ix,222)
 ! olho direito
 i = ellipse($gfillinterior,42+ix,214,45+ix,217)
 ! olho esquerdo
 call moveto(33+ix,218,pos)
 
 i = lineto(13+ix,218)
 ! corpo

 call moveto(33+ix,218,pos)
 ! braço direito
 i = lineto(26+ix,209)

 call moveto(33+ix,218,pos)
 ! braço esquerdo
 i = lineto(26+ix,227)

  call moveto(13+ix,218,pos)
 ! perna direita
 i = lineto(6+ix,209)

  call moveto(13+ix,218,pos)
 ! perna esquerda
 i = lineto(6+ix,227)


 ! capa
 call moveto(33+ix,218,pos)
 
 i = lineto(17+ix,214)
                                                             
 call moveto(33+ix,218,pos)
 
 i = lineto(17+ix,222)
 
 call moveto(17+ix,214,pos)
 
 i = lineto(17+ix,222)
 ! capa


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
    

    call sleepqq(10)
    !mostra a imagem desenhada por 80 ms.

    i = setcolor(15)

 i = ellipse($gborder,33+ix,210,48+ix,225)
 ! cabeca
 i = ellipse($gfillinterior,42+ix,219,45+ix,222)
 ! olho direito
 i = ellipse($gfillinterior,42+ix,214,45+ix,217)
 ! olho esquerdo
 call moveto(33+ix,218,pos)
 
 i = lineto(13+ix,218)
 ! corpo

 call moveto(33+ix,218,pos)
 ! braço direito
 i = lineto(26+ix,209)

 call moveto(33+ix,218,pos)
 ! braço esquerdo
 i = lineto(26+ix,227)

  call moveto(13+ix,218,pos)
 ! perna direita
 i = lineto(6+ix,209)

  call moveto(13+ix,218,pos)
 ! perna esquerda
 i = lineto(6+ix,227)


 ! capa
 call moveto(33+ix,218,pos)
 
 i = lineto(17+ix,214)
                                                             
 call moveto(33+ix,218,pos)
 
 i = lineto(17+ix,222)
 
 call moveto(17+ix,214,pos)
 
 i = lineto(17+ix,222)
 ! capa


 if(ix == 712)   i = setcolor(2)
 ! retangulo de direita
 i = rectangle($gfillinterior,685,200,765,255)    

  end do

return

end subroutine