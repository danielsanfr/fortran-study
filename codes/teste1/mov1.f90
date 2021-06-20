subroutine mov1

  use msflib

  type (xycoord) pos 

  !variável que identifica o tipo de coordenada usada

  do iy = 0, 196, 2  
    !o passo dá o avanço da imagem, em pixels.
    !iy é a variável para mudar a posição do caminhão

 i = setcolor(0)

 i = ellipse($gborder,360,210-iy,375,225-iy)
 ! cabeca
 i = ellipse($gfillinterior,363,214-iy,366,217-iy)
 ! olho direito
 i = ellipse($gfillinterior,369,214-iy,372,217-iy)
 ! olho esquerdo
 call moveto(367,225-iy,pos)
 
 i = lineto(367,245-iy)
 ! corpo
  call moveto(367,225-iy,pos)
 
 i = lineto(360,234-iy)
 ! braco direito                                                            
 call moveto(367,225-iy,pos)
 
 i = lineto(374,234-iy)
 ! braco esquerdo
 call moveto(367,245-iy,pos)

 i = lineto(360,252-iy)
 ! perna direita
 call moveto(367,245-iy,pos)

 i = lineto(374,252-iy)
 ! perna esquerda


 !capa
 call moveto(367,225-iy,pos)
 
 i = lineto(363,241-iy)
                                                             
 call moveto(367,225-iy,pos)
 
 i = lineto(371,241-iy)
 
 call moveto(363,241-iy,pos)
 
 i = lineto(371,241-iy)
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

 i = ellipse($gborder,360,210-iy,375,225-iy)
 ! cabeca
 i = ellipse($gfillinterior,363,214-iy,366,217-iy)
 ! olho direito
 i = ellipse($gfillinterior,369,214-iy,372,217-iy)
 ! olho esquerdo
 call moveto(367,225-iy,pos)
 
 i = lineto(367,245-iy)
 ! corpo
  call moveto(367,225-iy,pos)
 
 i = lineto(360,234-iy)
 ! braco direito                                                            
 call moveto(367,225-iy,pos)
 
 i = lineto(374,234-iy)
 ! braco esquerdo
 call moveto(367,245-iy,pos)

 i = lineto(360,252-iy)
 ! perna direita
 call moveto(367,245-iy,pos)

 i = lineto(374,252-iy)
 ! perna esquerda


 !capa
 call moveto(367,225-iy,pos)
 
 i = lineto(363,241-iy)
                                                             
 call moveto(367,225-iy,pos)
 
 i = lineto(371,241-iy)
 
 call moveto(363,241-iy,pos)
 
 i = lineto(371,241-iy)
 ! capa

 if(iy == 196)  i = setcolor(3)
 ! retangulo de cima
 i = rectangle($gfillinterior,340,5,395,65)    

  end do

return

end subroutine