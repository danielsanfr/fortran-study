subroutine movimento(iy)

  use msflib

  type (xycoord) pos 

  !vari�vel que identifica o tipo de coordenada usada

  do ix = 0, 500, 2  
    !o passo d� o avan�o da imagem, em pixels.
    !ix � a vari�vel para mudar a posi��o do caminh�o

    i = setcolor(14) 
    !cor da carroceria do caminh�o ba�

    i = rectangle($gfillinterior,20+ix,215+iy,60+ix,242+iy)
    !"$gfillinterior" significa pintar todo o ret�ngulo

    i = setcolor(10) !cor da cabine do caminh�o ba�

    i = rectangle($gfillinterior,61+ix,225+iy,75+ix,242+iy) 

    i = setcolor(5)
    !cor do contorno da cabine e carroceria

    i = rectangle($gborder,20+ix,215+iy,60+ix,242+iy)

    i = rectangle($gborder,61+ix,225+iy,75+ix,242+iy)
    !"$gborder" significa desenhar s� o contorno.

    i = setcolor(0) !cor dos pneus

    i = ellipse($gfillinterior,25+ix,243+iy,31+ix,249+iy) 
    !pneu traseiro

    i = ellipse($gfillinterior,64+ix,243+iy,70+ix,249+iy) 
    !pneu dianteiro


    call sleepqq(80)
    !mostra a imagem desenhada por 80 ms.

    i = setcolor(15) !apaga a imagem desenhada

    i = rectangle($gfillinterior,20+ix,215+iy,60+ix,242+iy)

    i = rectangle($gfillinterior,61+ix,225+iy,75+ix,242+iy)

    i = ellipse($gfillinterior,25+ix,243+iy,31+ix,249+iy)

    i = ellipse($gfillinterior,64+ix,243+iy,70+ix,249+iy)

  end do

return

end subroutine