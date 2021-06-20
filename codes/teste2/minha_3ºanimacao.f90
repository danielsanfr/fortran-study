program anima

  use msflib !biblioteca com elementos gráficos

  implicit none 
  !elimina a facilidade de não declarar variáveis

  type (xycoord) pos 
  !variável que identifica o tipo de coordenada usada

  type (qwinfo) winfo 
  !varável para informar o tamanho da janela

  integer i, ix, iy 
  !declaração de variáveis

    winfo.TYPE = QWIN$MAX 
    !tamanho máximo para a tela

    i = SETWSIZEQQ(QWIN$FRAMEWINDOW, winfo) 
    !Maximiza a janela principal

    i = setbkcolor(15) 
    !colore a tela de branco, mas ela deve ser limpa 

    call clearscreen($gclearscreen)
    !limpa a cor antiga e aparece o branco

 i = clickmenuqq(QWIN$STATUS)   
    !Elimina barra de status

    i = clickmenuqq(QWIN$TILE)  
    !janela filhote no estilo tile

    i = INITIALIZEFONTS( ) 
    !disponibiliza fontes para escrever na tela

    i = SETFONT ('t''Arial''h30') !fonte a ser utilizada 
    !se i for –1, então a fonte solicitada não está
    !disponível no micro e outra deve ser escolhida
    if(i .eq. -1) i = SETFONT ('t''times new roman''h30')
    if(i .eq. -1) i = SETFONT ('t''courier new''h30')

    if(i .eq. -1) i = SETFONT ('t''tahoma''h30')
    if(i .eq. -1) i = SETFONT ('t''cac futura casual''h30')

  read(*,*)

 call pred_e_jan

 call bordas

 call traco

 call meteo

 call meteo1

 call meteo2

pause

stop

end program