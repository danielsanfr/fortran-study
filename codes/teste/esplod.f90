subroutine esplod

  use msflib !biblioteca com elementos gr�ficos

  implicit none 
  !elimina a facilidade de n�o declarar vari�veis

  type (xycoord) pos 
  !vari�vel que identifica o tipo de coordenada usada

  integer i
  !declara��o de vari�veis

 i = setcolor(14) !cor da esplosao

    i = ellipse($gfillinterior,342,280,352,290)    
    !"$gfillinterior" significa pintar toda a ellipse

	call mov

return

end subroutine