subroutine meteo

use msflib !biblioteca com elementos gráficos

  implicit none 
  !elimina a facilidade de não declarar variáveis

  type (xycoord) pos 
  !variável que identifica o tipo de coordenada usada

  type (qwinfo) winfo 
  !varável para informar o tamanho da janela

  integer i, ix, iy 
  !declaração de variáveis

  do ix = 0, 306, 2

iy = 10 + ((ix * 2) / 3)
  
  i = setcolor(12) !cor da bola

 i = ellipse($gfillinterior,25+ix,85+iy,40+ix,100+iy)

call sleepqq(10)
    !mostra a imagem desenhada por 10 ms.

    i = setcolor(15) !apaga a imagem desenhada

i = ellipse($gfillinterior,26+ix,86+iy,39+ix,99+iy)

end do

i = setcolor(14) !cor da esplosao

    i = ellipse($gfillinterior,340,305,345,310)    
    !"$gfillinterior" significa pintar toda a ellipse

	 do ix = 0, 35  
    !o passo dá o avanço da imagem, em pixels.
    !ix é a variável para mudar a posição do caminhão

iy = ix

i = setcolor(14) !cor da carroceria do caminhão baú
!347 285
    i = ellipse($gfillinterior,340-ix,305-iy,345+ix,310+iy)   
    !"$gfillinterior" significa pintar toda a ellipse

call sleepqq(5)
    !mostra a imagem desenhada por 80 ms.

    i = setcolor(15) !apaga a imagem desenhada

i = ellipse($gfillinterior,340-ix,305-iy,345+ix,310+iy)   
    !"$gfillinterior" significa pintar toda a ellipse
 end do

return

end subroutine