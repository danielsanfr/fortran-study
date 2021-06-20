subroutine traco

 use msflib !biblioteca com elementos gráficos

  implicit none 
  !elimina a facilidade de não declarar variáveis

  type (xycoord) pos 
  !variável que identifica o tipo de coordenada usada

  type (qwinfo) winfo 
  !varável para informar o tamanho da janela

  integer i, ix, iy 
  !declaração de variáveis

   call moveto(345,300,pos)

 i = lineto(345,330)

  call moveto(345,340,pos)

 i = lineto(345,370)

  call moveto(345,380,pos)

 i = lineto(345,410)

  call moveto(345,420,pos)

 i = lineto(345,450)

  call moveto(370,315,pos)

 i = lineto(400,315)

  call moveto(370,355,pos)

 i = lineto(400,355)

  call moveto(370,395,pos)

 i = lineto(400,395)

  call moveto(370,435,pos)

 i = lineto(400,435)

 call moveto(330,315,pos)

 i = lineto(360,315)

  call moveto(330,355,pos)

 i = lineto(360,355)

  call moveto(330,395,pos)

 i = lineto(360,395)

  call moveto(330,435,pos)

 i = lineto(360,435)

  call moveto(385,300,pos)

 i = lineto(385,330)

  call moveto(385,340,pos)

 i = lineto(385,370)

  call moveto(385,380,pos)

 i = lineto(385,410)

  call moveto(385,420,pos)

 i = lineto(385,450)

 return

 end subroutine