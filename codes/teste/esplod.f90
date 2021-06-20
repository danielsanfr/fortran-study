subroutine esplod

  use msflib !biblioteca com elementos gráficos

  implicit none 
  !elimina a facilidade de não declarar variáveis

  type (xycoord) pos 
  !variável que identifica o tipo de coordenada usada

  integer i
  !declaração de variáveis

 i = setcolor(14) !cor da esplosao

    i = ellipse($gfillinterior,342,280,352,290)    
    !"$gfillinterior" significa pintar toda a ellipse

	call mov

return

end subroutine