subroutine mov

 use msflib

  type (xycoord) pos 

  !variável que identifica o tipo de coordenada usada

  do ix = 0, 100, 2  
    !o passo dá o avanço da imagem, em pixels.
    !ix é a variável para mudar a posição do caminhão

iy = ix

i = setcolor(14) !cor da carroceria do caminhão baú
!347 285
    i = ellipse($gfillinterior,275-ix,220-iy,285+ix,230+iy)   
    !"$gfillinterior" significa pintar toda a ellipse

call sleepqq(10)
    !mostra a imagem desenhada por 80 ms.

    i = setcolor(15) !apaga a imagem desenhada

i = ellipse($gfillinterior,275-ix,220-iy,285+ix,230+iy)   
    !"$gfillinterior" significa pintar toda a ellipse
 end do

return

end subroutine