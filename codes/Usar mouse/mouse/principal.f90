Program Principal
use dflib
external my_mouse !subrotina que detectará os eventos produzidos pelo mouse

write(0,*) 'Esta é a unidade "0" (janela, child window) onde os eventos serão detectados'

inumfonts = INITIALIZEFONTS( ) !Inicializa as fontes (letras) que serão utilizadas na subroutine my_mouse
!Escolha do tipo de letras a serem usadas.
ifontnum = SETFONT ('t''times new roman''h15')
!Se ifontnum for -1, a fonte requerida não existe. Então, deve-se escolher outra fonte.
if (ifontnum.eq.-1) ifontnum = SETFONT ('t''Arial''h15')
if (ifontnum.eq.-1) ifontnum = SETFONT ('t''''h15')
if (ifontnum.eq.-1) ifontnum = SETFONT ('t''tahoma''h15')

if (ifontnum.eq.-1) ifontnum = SETFONT ('t''cac futura casual''h15')

!registra a callback (externa, deve ser declarada) que vai detectar os eventos do mouse
!o primeiro argumento (0) indica a janela em que o mouse será detectado
!o segundo argumento são os eventos que serão detectados
!o terceiro argumento é o nome da callback que está sendo registrada
i = registermouseevent(0, (mouse$move .or. mouse$lbuttondown .or. mouse$rbuttondown .or. mouse$lbuttonup .or. mouse$rbuttonup .or. mouse$lbuttondblclk .or. mouse$rbuttondblclk), my_mouse)

!mouse$move: Detecta a posição do cursor (prompt do mouse)
!mouse$lbuttondown: detecta botão esquerdo (left) do mouse para baixo
!mouse$rbuttondown: detecta botão direito (right) do mouse para baixo
!mouse$lbuttonup: detecta botão esquerdo do mouse para cima
!mouse$rbuttonup: detecta botão direito do mouse para cima
!mouse$lbuttondblclk: detecta duplo clique do botão esquerdo (que deve parar embaixo)
!mouse$rbuttondblclk: detecta duplo clique do botão direito (que deve parar embaixo)

!loop infinito para que o programa principal não seja encerrado 
do while (.true.)
  call sleepqq(100)
end do

end program 


!callback que detecta os eventos do mouse (funciona em loop!!!!)
!iunit é a janela (definida em registermouseevent)
!ievent são os eventos (definidos em registermouseevent)
!ikeystate detecta se é um mouse$move (=0), botão direito 
!(ikeystate = 2) ou botão esquerdo (ikeystate = 1)
! ix e iy são as coordenadas da posição do mouse.

subroutine my_mouse(iunit, ievent, ikeystate, ix, iy)
use dflib ! contém recursos usados na execução da subrotina my_mouse
type (xycoord) xy !a variável "xy" é necessária para definir uma posição em pixels 
character (100) text !variável literal onde serão escritas algumas informações

i = setcolorrgb(#ffffff) !estabelece cor branca
i = rectangle($gfillinterior, 50, 100, 500, 130) !cria um retângulo sobre o anterior

write(text, '("Coord. x = ", i4, "   Coord. y = ", i4, "   Estado: ", i1,  "   Evento: ", i2)') ix, iy, ikeystate, ievent 
i = setcolorrgb(#0000ff) !estabelece cor vermelha
call moveto(110, 110, xy) !posiciona o cursor em x = 110 e y = 110
call outgtext(trim(text))

return

end subroutine