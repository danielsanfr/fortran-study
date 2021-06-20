Program Principal
use dflib
external my_mouse !subrotina que detectar� os eventos produzidos pelo mouse

i = setbkcolorrgb(#e0e0e0) !cor para o fundo de tela
call clearscreen($gclearscreen)
!ret�ngulo cheio com: 20 <= x <= 40  e 20 <= y <= 40
i = setcolorrgb(#a0a0a0) !cor estabelecida para a figura a seguir
i = rectangle($gfillinterior, 20, 20, 40, 40)
!ret�ngulo vazado envolvendo o ret�ngulo cheio
i = setcolorrgb(#707070) !cor estabelecida para a figura a seguir
i = rectangle($gborder, 19, 19, 41, 41)

!registra a callback (externa, deve ser declarada) que vai detectar os eventos do mouse

!o primeiro argumento (0) indica a janela em que o mouse ser� detectado
!o segundo argumento s�o os eventos que ser�o detectados
!o terceiro argumento � o nome da callback que est� sendo registrada
i = registermouseevent(0, (mouse$move .or. mouse$lbuttondown), my_mouse)

!loop infinito para que o programa principal n�o seja encerrado 
do while (.true.)
  call sleepqq(100)
end do

end program

!callback que detecta os eventos do mouse (funciona em loop!!!!)

!iunit � a janela (definida em registermouseevent)
!ievent s�o os eventos (definidos em registermouseevent)
!ikeystate detecta se � um mouse$move (=0) ou bot�o esquerdo (=1)
! ix e iy s�o as coordenadas da posi��o do mouse.
subroutine my_mouse(iunit, ievent, ikeystate, ix, iy)
use dflib ! cont�m recursos usados na execu��o da subrotina my_mouse
type (xycoord) xy

!detec��o do mouse sobre o ret�ngulo
if(ix <= 40 .and. ix >= 20 .and. iy <= 40 .and. iy >= 20) then

  !mouse sobre o ret�ngulo: alto relevo
  i = setcolorrgb(#ffffff)
  call moveto(40,20, xy)
  i = lineto(20, 20) 
  i = lineto(20, 40)
  i = setcolorrgb(#000000)
  i = lineto(40, 40)
  i = lineto(40, 20)
  !se o bot�o esquerdo for clicado: baixo relevo
  if(ikeystate == 1) then
    i = setcolorrgb(#000000)
    call moveto(40,20, xy)
    i = lineto(20, 20) 
    i = lineto(20, 40)
    i = setcolorrgb(#ffffff)
    i = lineto(40, 40)

    i = lineto(40, 20)
  end if  
else
  !quando o mouse sair de cima do ret�ngulo, acaba o relevo
  i = setcolorrgb(#a0a0a0) !cor estabelecida para a figura a seguir
  i = rectangle($gborder, 20, 20, 40, 40)
end if
   
return

end subroutine