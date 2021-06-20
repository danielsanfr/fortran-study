Program Principal
use dflib
type (xycoord) xy
character (100) text !variável literal onde serão escritas algumas informações

inumfonts = INITIALIZEFONTS( ) !Inicializa as fontes
!Escolha do tipo de letras a serem usadas.

ifontnum = SETFONT ('t''Arial''h15')
!Se ifontnum for -1, a fonte requerida não existe. Então, deve-se escolher outra fonte.
if (ifontnum.eq.-1) ifontnum = SETFONT ('t''times new roman''h15')
if (ifontnum.eq.-1) ifontnum = SETFONT ('t''courier new''h15')
if (ifontnum.eq.-1) ifontnum = SETFONT ('t''tahoma''h15')
if (ifontnum.eq.-1) ifontnum = SETFONT ('t''cac futura casual''h15')

i = setcolorrgb(#FFFFFF) !cor estabelecida para a figura a seguir

i = rectangle($gborder, 20, 20, 300, 45)
  call moveto(35, 25, xy) !posiciona o cursor em x = 35 e y = 25
  call outgtext('Fim: clique com o botão direito aqui dentro')


!loop infinito para que o programa principal não seja encerrado 
do while (.true.)
  iret = WAITONMOUSEEVENT ((mouse$lbuttondown .or. mouse$rbuttondown), keystate, ix, iy) 
  i = setcolorrgb(#ffffff) !estabelece cor branca
  i = rectangle($gfillinterior, 50, 100, 430, 130) !cria um retângulo sobre o anterior

  write(text, '("Coord. x = ", i4, "   Coord. y = ", i4, "   Estado: ", i1)') ix, iy, keystate
  i = setcolorrgb(#0000ff) !estabelece cor vermelha
  call moveto(110, 110, xy) !posiciona o cursor em x = 110 e y = 110
  call outgtext(trim(text))
  if(keystate == 2 .and. ix >= 20 .and. ix <= 300 .and. iy >= 20 .and. iy <= 45) call exit
end do

end program