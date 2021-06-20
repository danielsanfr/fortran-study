subroutine meteo1

use msflib !biblioteca com elementos gr�ficos

  implicit none 
  !elimina a facilidade de n�o declarar vari�veis

  type (xycoord) pos 
  !vari�vel que identifica o tipo de coordenada usada

  type (qwinfo) winfo 
  !var�vel para informar o tamanho da janela

  integer i, ix, iy 
  !declara��o de vari�veis

  do ix = 0, 296, 2

iy = 10 + ((ix * 2) / 3)
  
  i = setcolor(12) !cor da bola

 i = ellipse($gfillinterior,675-ix,95+iy,690-ix,110+iy)

call sleepqq(10)
    !mostra a imagem desenhada por 10 ms.

    i = setcolor(15) !apaga a imagem desenhada

i = ellipse($gfillinterior,676-ix,95+iy,689-ix,109+iy)

end do

i = setcolor(14) !cor da esplosao

    i = ellipse($gfillinterior,383,305,388,310)    
    !"$gfillinterior" significa pintar toda a ellipse

	 do ix = 0, 35  
    !o passo d� o avan�o da imagem, em pixels.
    !ix � a vari�vel para mudar a posi��o do caminh�o

iy = ix

i = setcolor(14) !cor da carroceria do caminh�o ba�
!347 285
    i = ellipse($gfillinterior,383-ix,305-iy,388+ix,310+iy)   
    !"$gfillinterior" significa pintar toda a ellipse

call sleepqq(5)
    !mostra a imagem desenhada por 80 ms.

    i = setcolor(15) !apaga a imagem desenhada

i = ellipse($gfillinterior,383-ix,305-iy,388+ix,310+iy)   
    !"$gfillinterior" significa pintar toda a ellipse
 end do

return

end subroutine