subroutine movimento(iy)

  use msflib

  type (xycoord) pos 

  !variável que identifica o tipo de coordenada usada

  do ix = 0, 306, 2

iy = (ix * 2) / 3
  
  i = setcolor(0) !cor da bola

 i = ellipse($gfillinterior,27+ix,87+iy,50+ix,107+iy)

call sleepqq(20)
    !mostra a imagem desenhada por 10 ms.

    i = setcolor(15) !apaga a imagem desenhada

i = ellipse($gfillinterior,27+ix,87+iy,50+ix,107+iy)

end do

return

end subroutine