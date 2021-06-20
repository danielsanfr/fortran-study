subroutine meteo2

use msflib !biblioteca com elementos gráficos

  implicit none 
  !elimina a facilidade de não declarar variáveis

  type (xycoord) pos 
  !variável que identifica o tipo de coordenada usada

  type (qwinfo) winfo 
  !varável para informar o tamanho da janela

  integer i, ix, iy 
  !declaração de variáveis

  do iy = 0, 316, 2
  
 i = setcolor(12) !cor da bola

 i = ellipse($gfillinterior,345-ix,35+iy,380-ix,70+iy)

call sleepqq(10)
    !mostra a imagem desenhada por 10 ms.

    i = setcolor(15) !apaga a imagem desenhada

i = ellipse($gfillinterior,346-ix,35+iy,379-ix,69+iy)

end do

i = setcolor(14) !cor da esplosao

    i = ellipse($gfillinterior,363,370,368,375)    
    !"$gfillinterior" significa pintar toda a ellipse

	 do ix = 0, 440, 6  
    !o passo dá o avanço da imagem, em pixels.
    !ix é a variável para mudar a posição do caminhão

iy = ix

i = setcolor(14) !cor da carroceria do caminhão baú
!347 285
    i = ellipse($gfillinterior,363-ix,370-iy,368+ix,375+iy)   
    !"$gfillinterior" significa pintar toda a ellipse

call sleepqq(10)
    !mostra a imagem desenhada por 80 ms.

    i = setcolor(15) !apaga a imagem desenhada

i = ellipse($gfillinterior,363-ix,370-iy,368+ix,375+iy)   
    !"$gfillinterior" significa pintar toda a ellipse
 end do

return

end subroutine