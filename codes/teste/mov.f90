subroutine mov

 use msflib

  type (xycoord) pos 

  !vari�vel que identifica o tipo de coordenada usada

  do ix = 0, 24, 2  
    !o passo d� o avan�o da imagem, em pixels.
    !ix � a vari�vel para mudar a posi��o do caminh�o

iy = ix

i = setcolor(14) !cor da carroceria do caminh�o ba�
!347 285
    i = ellipse($gfillinterior,342-ix,280-iy,352+ix,290+iy)   
    !"$gfillinterior" significa pintar toda a ellipse

call sleepqq(15)
    !mostra a imagem desenhada por 80 ms.

    i = setcolor(15) !apaga a imagem desenhada

i = ellipse($gfillinterior,342-ix,280-iy,352+ix,290+iy)   
    !"$gfillinterior" significa pintar toda a ellipse
 end do

return

end subroutine