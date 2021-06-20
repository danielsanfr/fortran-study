Program Principal
use dflib
external my_mouse !subrotina que detectar� os eventos produzidos pelo mouse

write(0,*) 'Esta � a unidade "0" (janela, child window) onde os eventos ser�o detectados'

inumfonts = INITIALIZEFONTS( ) !Inicializa as fontes (letras) que ser�o utilizadas na subroutine my_mouse
!Escolha do tipo de letras a serem usadas.
ifontnum = SETFONT ('t''times new roman''h15')
!Se ifontnum for -1, a fonte requerida n�o existe. Ent�o, deve-se escolher outra fonte.
if (ifontnum.eq.-1) ifontnum = SETFONT ('t''Arial''h15')
if (ifontnum.eq.-1) ifontnum = SETFONT ('t''''h15')
if (ifontnum.eq.-1) ifontnum = SETFONT ('t''tahoma''h15')

if (ifontnum.eq.-1) ifontnum = SETFONT ('t''cac futura casual''h15')

!registra a callback (externa, deve ser declarada) que vai detectar os eventos do mouse
!o primeiro argumento (0) indica a janela em que o mouse ser� detectado
!o segundo argumento s�o os eventos que ser�o detectados
!o terceiro argumento � o nome da callback que est� sendo registrada
i = registermouseevent(0, (mouse$move .or. mouse$lbuttondown .or. mouse$rbuttondown .or. mouse$lbuttonup .or. mouse$rbuttonup .or. mouse$lbuttondblclk .or. mouse$rbuttondblclk), my_mouse)

!mouse$move: Detecta a posi��o do cursor (prompt do mouse)
!mouse$lbuttondown: detecta bot�o esquerdo (left) do mouse para baixo
!mouse$rbuttondown: detecta bot�o direito (right) do mouse para baixo
!mouse$lbuttonup: detecta bot�o esquerdo do mouse para cima
!mouse$rbuttonup: detecta bot�o direito do mouse para cima
!mouse$lbuttondblclk: detecta duplo clique do bot�o esquerdo (que deve parar embaixo)
!mouse$rbuttondblclk: detecta duplo clique do bot�o direito (que deve parar embaixo)

!loop infinito para que o programa principal n�o seja encerrado 
do while (.true.)
  call sleepqq(100)
end do

end program 


!callback que detecta os eventos do mouse (funciona em loop!!!!)
!iunit � a janela (definida em registermouseevent)
!ievent s�o os eventos (definidos em registermouseevent)
!ikeystate detecta se � um mouse$move (=0), bot�o direito 
!(ikeystate = 2) ou bot�o esquerdo (ikeystate = 1)
! ix e iy s�o as coordenadas da posi��o do mouse.

subroutine my_mouse(iunit, ievent, ikeystate, ix, iy)
use dflib ! cont�m recursos usados na execu��o da subrotina my_mouse
type (xycoord) xy !a vari�vel "xy" � necess�ria para definir uma posi��o em pixels 
character (100) text !vari�vel literal onde ser�o escritas algumas informa��es

i = setcolorrgb(#ffffff) !estabelece cor branca
i = rectangle($gfillinterior, 50, 100, 500, 130) !cria um ret�ngulo sobre o anterior

write(text, '("Coord. x = ", i4, "   Coord. y = ", i4, "   Estado: ", i1,  "   Evento: ", i2)') ix, iy, ikeystate, ievent 
i = setcolorrgb(#0000ff) !estabelece cor vermelha
call moveto(110, 110, xy) !posiciona o cursor em x = 110 e y = 110
call outgtext(trim(text))

return

end subroutine