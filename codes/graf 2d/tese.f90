program intro_graf_2D

use msflib

implicit none

integer nsegmentos,i,icor_linha,iavx,iavy

real x(501),y(501),deltax,f

character (30) xux,yuy

character (50) tit

logical retlog

type (qwinfo) winfo 

!estabelecimentos

!prepara��o do menu gr�fico: descarte de menus defaults indesej�veis

retlog = DELETEMENUQQ (6, 0) !help

retlog = DELETEMENUQQ (5, 0) !window

retlog = DELETEMENUQQ (3, 0) !view

retlog = DELETEMENUQQ (2, 1) !select text

i = setbkcolorrgb(#f5f5f5) !cor do fundo de tela:  "cinza claro" 

                           !(para distinguir a linha de contorno
				   !de sele��o do gr�fico, que � branca)
call clearscreen($gclearscreen)
winfo.TYPE = QWIN$MAX  
i = SETWSIZEQQ(QWIN$FRAMEWINDOW, winfo) !maximiza a frame window
i = clickmenuqq(qwin$tile) !estilo tile

!gr�fico da fun��o definida em "function f(x)": inicializa��o.
nsegmentos = 499 !n�mero de segmentos (m�ximo igual a 500, m�nimo = 2)
x(1) = -25.0 !valor inicial de x, poderia ser lido 

x(nsegmentos+1) = 25.0  !valor final de x, poderia ser lido
deltax = (x(nsegmentos+1)-x(1))/float(nsegmentos)

!valores de y: fun��o definida em "function f(x)" <<<<==== FUN��O
!aten��o: os pontos a serem ligados ser�o gerados a partir da fun��o
!"f(x)" definida em "funtion f(x)" mas os pontos poderiam ser lidos
!em um arquivo de dados.
y(1) = f(x(1)) 
do i = 2,nsegmentos + 1
  if(i /= nsegmentos + 1) x(i) = x(i-1) + deltax

  y(i) = f(x(i))
end do

icor_linha = 12	!cor da linha do gr�fico
iavx = 80 ! avan�o nas coordenadas x (deslocamento de todo o desenho)
iavy = 50 ! avan�o nas coordenadas y (deslocamento de todo o desenho)
!origem do sistema de eixos: (100+iavx,280+iavy) <= posi��o em pixels
xux = 'X(Ux)' !grandeza "X" e sua unidade
yuy = 'Y(Uy)' !grandeza "Y" e sua unidade
tit = '           Oi prof Luiz Carlos'  !t�tulo do gr�fico

call graf_2D(nsegmentos,x,y,icor_linha,iavx,iavy,xux,yuy,tit)

do while (.true.)
end do
end program


subroutine graf_2D(nsegmentos,x,y,icor_linha,iavx,iavy,xux,yuy,tit)
  !nsegmentos: n�mero de segmentos (de 2 a 500) a serem ligados
  !x: valores da vari�vel independente (de 3 a 501)
  !y: valores da vari�vel dependente  (de 3 a 501)
  !icor_linha: cor da linha do gr�fico
  !iavx: avan�o de todo o grafico em x (em pixels)

  !iavy: avan�o de todo o gr�fico em y (em pixels)
  !xux: string com informa��es sobre a grandeza marcada em x => X(Ux) 
  !yuy: string com informa��es sobre a grandeza marcada em y => Y(Uy) 
  !tit: string com o t�tulo do gr�fico
use msflib
implicit none
type (xycoord) pos
integer nsegmentos,i,icor_linha,i2
integer ixcoord(nsegmentos+1),iycoord(nsegmentos+1),iavx,iavy
real x(nsegmentos+1),y(nsegmentos+1),ymin,ymax
character (30) xux,yuy,text

character (50) tit

!fontes
i = initializefonts()
i = SETFONT ('t''Arial''h16e')
if(i.eq.-1) i = SETFONT ('t''times new roman''h17e')
if(i.eq.-1) i = setfont ('t''courier new''h16e')
if(i.eq.-1) i = SETFONT ('t''Tahoma''h16e')
if(i.eq.-1) i = SETFONT ('t''CAC FUTURA CASUAL''h16e')

!valores m�ximo e m�nimo de y
ymin = y(1)
ymax = y(1)
do i = 1,nsegmentos+1
  if(y(i) < ymin) ymin = y(i)
  if(y(i) > ymax) ymax = y(i)

end do
!testa se a fun��o � constante
if( ymax <= ymin) then
  ymin = ymax - 1.0 !isso � apenas para desenhar um m�ximo e um
                    !um m�nimo. O valor do m�nimo n�o � relevante. 
end if

!comprimento de cada eixo: 260 (y) e 280 (x) pixels. �til 200 pixels.
!origem do sistema de eixos: (100+iavx,280+iavy) <= posi��o em pixels
!desenho dos eixos.
i = setcolor(0) !eixos de cor preta
call moveto(100+iavx,20+iavy,pos)

i = lineto(100+iavx,280+iavy) !linha vertical
i = lineto(380+iavx,280+iavy) !linha horizontal
call moveto(99+iavx,20+iavy,pos)
i = lineto(99+iavx,281+iavy) !refor�o na linha vertical (tra�o duplo)
i = lineto(380+iavx,281+iavy) !refor�o na linha horizontal (tra�o duplo)

!pequenos tra�os representando m�ximos e m�nimos e os seus valores
!x
call moveto(100+iavx,281+iavy,pos)
i = lineto(100+iavx,285+iavy) 
write(text,'(e10.4)')x(1) !escreve o valor de x(1) no caractere text

call moveto(65+iavx,292+iavy,pos)
call outgtext(trim(text))
call moveto(300+iavx,281+iavy,pos)
i = lineto(300+iavx,285+iavy) 
write(text,'(e10.4)')x(nsegmentos+1) !escreve o valor de x(nsegmentos+1) 
call moveto(265+iavx,292+iavy,pos)
call outgtext(trim(text))
call moveto(200+iavx,281+iavy,pos) !define o meio do comprimento �til
i = lineto(200+iavx,285+iavy) 

!y
call moveto(99+iavx,280+iavy,pos)

i = lineto(95+iavx,280+iavy) 
write(text,'(e10.4)')ymin !escreve o valor de ymin no caractere text
call moveto(17+iavx,272+iavy,pos)
call outgtext(trim(text))
call moveto(99+iavx,80+iavy,pos)
i = lineto(95+iavx,80+iavy) 
write(text,'(e10.4)')ymax !escreve o valor de ymax no caractere text
call moveto(17+iavx,72+iavy,pos)
call outgtext(trim(text))
call moveto(99+iavx,180+iavy,pos) !define o meio do comprimento �til

i = lineto(95+iavx,180+iavy)

!nomes dos eixos
call moveto(180+iavx,315+iavy,pos) !posiciona para escrever um nome
call outgtext(trim(xux)) !nome e unidade da grandeza no eixo x
CALL SETGTEXTROTATION (900)	!giro de 90� no texto a ser escrito em y
call moveto(60+iavx,220+iavy,pos) !posiciona para escrever um nome
call outgtext(trim(yuy)) !nome e unidade da grandeza no eixo y

CALL SETGTEXTROTATION (0) !retorna para o �ngulo zero normal
call moveto(110+iavx,30+iavy,pos) !posiciona para escrever um nome
call outgtext(tit) !t�tulo do gr�fico

!linha do gr�fico <<== GR�FICO PROPRIAMENTE DITO
!***********************************************************************
i = setcolor(icor_linha) !cor da linha do gr�fico

!equa��o da escala x
ixcoord(1) = 100 + ifix(200*(x(1)-x(1))/(x(nsegmentos+1)-x(1))) + iavx 

!equa��o da escala y
iycoord(1) = 280 - ifix(200*(y(1)-ymin)/(ymax-ymin)) +iavy 
!PS: lembre-se que o "y = 0" para a tela � em cima. Por isso, 
!    a equa��o da escala y tem o "280 -". 

call moveto(ixcoord(1),iycoord(1),pos) !posiciona o cursor 

do i = 1,nsegmentos + 1 !loop para tra�ar a linha
  !equa��o da escala x
  ixcoord(i) = 100 + ifix(200*(x(i)-x(1))/(x(nsegmentos+1)-x(1))) + iavx 
  !equa��o da escala y

  iycoord(i) = 280 - ifix(200*(y(i)-ymin)/(ymax-ymin)) + iavy 
  i2 = lineto(ixcoord(i),iycoord(i))
  call sleepqq(20) !d� a sensa��o de "anima��o". Se n�o quiser, tire!
end do
!***********************************************************************

return
end subroutine


function f(x)
real x !aqui x n�o � um vetor
   f = sin(x)/x !defini��o da fun��o (cuidado na defini��o do n�mero
                !de pontos para n�o gerar uma opera��o ilegal)
return
end function