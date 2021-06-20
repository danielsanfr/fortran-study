subroutine mov2

  use msflib

  type (xycoord) pos 

  !variável que identifica o tipo de coordenada usada

  do iy = 0, 366, 2  
    !o passo dá o avanço da imagem, em pixels.
    !iy é a variável para mudar a posição do caminhão

 i = setcolor(0)

 i = ellipse($gborder,360,386-iy,375,401-iy)
 ! cabeca
 i = ellipse($gfillinterior,363,390-iy,366,393-iy)
 ! olho direito
 i = ellipse($gfillinterior,369,390-iy,372,393-iy)
 ! olho esquerdo
 call moveto(367,401-iy,pos)
 
 i = lineto(367,421-iy)
 ! corpo
  call moveto(367,401-iy,pos)
 
 i = lineto(360,410-iy)
 ! braco direito                                                            
 call moveto(367,401-iy,pos)
 
 i = lineto(374,410-iy)
 ! braco esquerdo
 call moveto(367,421-iy,pos)

 i = lineto(360,428-iy)
 ! perna direita
 call moveto(367,421-iy,pos)

 i = lineto(374,428-iy)
 ! perna esquerda


 !capa
 call moveto(367,401-iy,pos)
 
 i = lineto(363,417-iy)
                                                             
 call moveto(367,401-iy,pos)
 
 i = lineto(371,417-iy)
 
 call moveto(363,417-iy,pos)
 
 i = lineto(371,417-iy)
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
  
 i = ellipse($gborder,360,386-iy,375,401-iy)
 ! cabeca
 i = ellipse($gfillinterior,363,390-iy,366,393-iy)
 ! olho direito
 i = ellipse($gfillinterior,369,390-iy,372,393-iy)
 ! olho esquerdo
 call moveto(367,401-iy,pos)
 
 i = lineto(367,421-iy)
 ! corpo
  call moveto(367,401-iy,pos)
 
 i = lineto(360,410-iy)
 ! braco direito                                                            
 call moveto(367,401-iy,pos)
 
 i = lineto(374,410-iy)
 ! braco esquerdo
 call moveto(367,421-iy,pos)

 i = lineto(360,428-iy)
 ! perna direita
 call moveto(367,421-iy,pos)

 i = lineto(374,428-iy)
 ! perna esquerda


 !capa
 call moveto(367,401-iy,pos)
 
 i = lineto(363,417-iy)
                                                             
 call moveto(367,401-iy,pos)
 
 i = lineto(371,417-iy)
 
 call moveto(363,417-iy,pos)
 
 i = lineto(371,417-iy)
 ! capa


 if(iy == 360) i = setcolor(3)
 ! retangulo de cima
 i = rectangle($gfillinterior,340,5,395,65)
  end do

return

end subroutine