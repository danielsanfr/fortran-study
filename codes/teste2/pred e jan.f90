subroutine pred_e_jan

 use msflib !biblioteca com elementos gr�ficos

 implicit none 
  !elimina a facilidade de n�o declarar vari�veis

  type (xycoord) pos 
  !vari�vel que identifica o tipo de coordenada usada

  type (qwinfo) winfo 
  !var�vel para informar o tamanho da janela

  integer i, ix, iy 
  !declara��o de vari�veis

 i = setcolor(10)

 i = rectangle($gfillinterior,320,290,410,460)


  ! janelas
 i = setcolor(11)

 i = rectangle($gfillinterior,330,300,360,330)

 i = setcolor(11)

 i = rectangle($gfillinterior,370,300,400,330)

 i = setcolor(9)

 i = rectangle($gfillinterior,330,340,360,370)

 i = setcolor(9)

 i = rectangle($gfillinterior,370,340,400,370)

 i = setcolor(13)

 i = rectangle($gfillinterior,330,380,360,410)

 i = setcolor(13)

 i = rectangle($gfillinterior,370,380,400,410)

 i = setcolor(14)

 i = rectangle($gfillinterior,330,420,360,450)

 i = setcolor(14)

 i = rectangle($gfillinterior,370,420,400,450)
 ! janelas

return

end subroutine