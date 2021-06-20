 subroutine bordas

  use msflib !biblioteca com elementos gráficos

  implicit none 
  !elimina a facilidade de não declarar variáveis

  type (xycoord) pos 
  !variável que identifica o tipo de coordenada usada

  type (qwinfo) winfo 
  !varável para informar o tamanho da janela

  integer i, ix, iy 
  !declaração de variáveis
 
 i = setcolor(0)

 i = rectangle($gborder,320,290,410,460)


 ! borda das janelas
 i = setcolor(0)

 i = rectangle($gborder,330,300,360,330)

 i = setcolor(0)

 i = rectangle($gborder,370,300,400,330)

 i = setcolor(0)

 i = rectangle($gborder,330,340,360,370)

 i = setcolor(0)

 i = rectangle($gborder,370,340,400,370)

 i = setcolor(0)

 i = rectangle($gborder,330,380,360,410)

 i = setcolor(0)

 i = rectangle($gborder,370,380,400,410)

 i = setcolor(0)

 i = rectangle($gborder,330,420,360,450)

 i = setcolor(0)

 i = rectangle($gborder,370,420,400,450)
 ! borda das janelas


 return

 end subroutine