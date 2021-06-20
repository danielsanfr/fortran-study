subroutine mov4

  use msflib

  type (xycoord) pos 

  !variável que identifica o tipo de coordenada usada

  do ix = 0, 712, 2  
    !o passo dá o avanço da imagem, em pixels.
    !ix é a variável para mudar a posição do palito

	iy = (10 + (ix * 2.5)) / 4

 i = setcolor(0)

 i = ellipse($gborder,48+ix,445-iy,63+ix,460-iy)
 ! cabeca
 i = ellipse($gfillinterior,54+ix,447-iy,57+ix,450-iy)
 ! olho direito
 i = ellipse($gfillinterior,58+ix,453-iy,61+ix,456-iy)
 ! olho esquerdo
 call moveto(51+ix,457-iy,pos)
 
 i = lineto(33+ix,471-iy)
 ! corpo

 call moveto(51+ix,457-iy,pos)
 ! braço direito
 i = lineto(38+ix,455-iy)

 call moveto(51+ix,457-iy,pos)
 ! braço esquerdo
 i = lineto(51+ix,470-iy)

 call moveto(33+ix,471-iy,pos)
 ! perna direita
 i = lineto(20+ix,469-iy)

 call moveto(33+ix,471-iy,pos)
 ! perna esquerda
 i = lineto(33+ix,484-iy)


 ! capa
 call moveto(51+ix,457-iy,pos)
 
 i = lineto(36+ix,461-iy)
                                                            
 call moveto(51+ix,457-iy,pos)
 
 i = lineto(43+ix,471-iy)
 
 call moveto(36+ix,461-iy,pos)
 
 i = lineto(43+ix,471-iy)
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

 i = ellipse($gborder,48+ix,445-iy,63+ix,460-iy)
 ! cabeca
 i = ellipse($gfillinterior,54+ix,447-iy,57+ix,450-iy)
 ! olho direito
 i = ellipse($gfillinterior,58+ix,453-iy,61+ix,456-iy)
 ! olho esquerdo
 call moveto(51+ix,457-iy,pos)
 
 i = lineto(33+ix,471-iy)
 ! corpo

 call moveto(51+ix,457-iy,pos)
 ! braço direito
 i = lineto(38+ix,455-iy)

 call moveto(51+ix,457-iy,pos)
 ! braço esquerdo
 i = lineto(51+ix,470-iy)

 call moveto(33+ix,471-iy,pos)
 ! perna direita
 i = lineto(20+ix,469-iy)

 call moveto(33+ix,471-iy,pos)
 ! perna esquerda
 i = lineto(33+ix,484-iy)


 ! capa
 call moveto(51+ix,457-iy,pos)
 
 i = lineto(36+ix,461-iy)
                                                            
 call moveto(51+ix,457-iy,pos)
 
 i = lineto(43+ix,471-iy)
 
 call moveto(36+ix,461-iy,pos)
 
 i = lineto(43+ix,471-iy)
 ! capa


 if(ix == 712)     i = setcolor(8)
 ! circulo de cima direito
 i = ellipse($gfillinterior,690,5,740,55)

   end do

return

end subroutine