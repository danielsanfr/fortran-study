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

!preparação do menu gráfico: descarte de menus defaults indesejáveis

retlog = DELETEMENUQQ (6, 0) !help

retlog = DELETEMENUQQ (5, 0) !window

retlog = DELETEMENUQQ (3, 0) !view

retlog = DELETEMENUQQ (2, 1) !select text

i = setbkcolorrgb(#f5f5f5) !cor do fundo de tela:  "cinza claro" 

                           !(para distinguir a linha de contorno
				   !de seleção do gráfico, que é branca)
call clearscreen($gclearscreen)
winfo.TYPE = QWIN$MAX  
i = SETWSIZEQQ(QWIN$FRAMEWINDOW, winfo) !maximiza a frame window
i = clickmenuqq(qwin$tile) !estilo tile

!gráfico da função definida em "function f(x)": inicialização.
nsegmentos = 499 !número de segmentos (máximo igual a 500, mínimo = 2)
x(1) = -25.0 !valor inicial de x, poderia ser lido 

x(nsegmentos+1) = 25.0  !valor final de x, poderia ser lido
deltax = (x(nsegmentos+1)-x(1))/float(nsegmentos)

!valores de y: função definida em "function f(x)" <<<<==== FUNÇÃO
!atenção: os pontos a serem ligados serão gerados a partir da função
!"f(x)" definida em "funtion f(x)" mas os pontos poderiam ser lidos
!em um arquivo de dados.
y(1) = f(x(1)) 
do i = 2,nsegmentos + 1
  if(i /= nsegmentos + 1) x(i) = x(i-1) + deltax

  y(i) = f(x(i))
end do

icor_linha = 12	!cor da linha do gráfico
iavx = 80 ! avanço nas coordenadas x (deslocamento de todo o desenho)
iavy = 50 ! avanço nas coordenadas y (deslocamento de todo o desenho)
!origem do sistema de eixos: (100+iavx,280+iavy) <= posição em pixels
xux = 'X(Ux)' !grandeza "X" e sua unidade
yuy = 'Y(Uy)' !grandeza "Y" e sua unidade
tit = '           Oi prof Luiz Carlos'  !título do gráfico

call graf_2D(nsegmentos,x,y,icor_linha,iavx,iavy,xux,yuy,tit)

do while (.true.)
end do
end program


subroutine graf_2D(nsegmentos,x,y,icor_linha,iavx,iavy,xux,yuy,tit)
  !nsegmentos: número de segmentos (de 2 a 500) a serem ligados
  !x: valores da variável independente (de 3 a 501)
  !y: valores da variável dependente  (de 3 a 501)
  !icor_linha: cor da linha do gráfico
  !iavx: avanço de todo o grafico em x (em pixels)

  !iavy: avanço de todo o gráfico em y (em pixels)
  !xux: string com informações sobre a grandeza marcada em x => X(Ux) 
  !yuy: string com informações sobre a grandeza marcada em y => Y(Uy) 
  !tit: string com o título do gráfico
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

!valores máximo e mínimo de y
ymin = y(1)
ymax = y(1)
do i = 1,nsegmentos+1
  if(y(i) < ymin) ymin = y(i)
  if(y(i) > ymax) ymax = y(i)

end do
!testa se a função é constante
if( ymax <= ymin) then
  ymin = ymax - 1.0 !isso é apenas para desenhar um máximo e um
                    !um mínimo. O valor do mínimo não é relevante. 
end if

!comprimento de cada eixo: 260 (y) e 280 (x) pixels. Útil 200 pixels.
!origem do sistema de eixos: (100+iavx,280+iavy) <= posição em pixels
!desenho dos eixos.
i = setcolor(0) !eixos de cor preta
call moveto(100+iavx,20+iavy,pos)

i = lineto(100+iavx,280+iavy) !linha vertical
i = lineto(380+iavx,280+iavy) !linha horizontal
call moveto(99+iavx,20+iavy,pos)
i = lineto(99+iavx,281+iavy) !reforço na linha vertical (traço duplo)
i = lineto(380+iavx,281+iavy) !reforço na linha horizontal (traço duplo)

!pequenos traços representando máximos e mínimos e os seus valores
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
call moveto(200+iavx,281+iavy,pos) !define o meio do comprimento útil
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
call moveto(99+iavx,180+iavy,pos) !define o meio do comprimento útil

i = lineto(95+iavx,180+iavy)

!nomes dos eixos
call moveto(180+iavx,315+iavy,pos) !posiciona para escrever um nome
call outgtext(trim(xux)) !nome e unidade da grandeza no eixo x
CALL SETGTEXTROTATION (900)	!giro de 90° no texto a ser escrito em y
call moveto(60+iavx,220+iavy,pos) !posiciona para escrever um nome
call outgtext(trim(yuy)) !nome e unidade da grandeza no eixo y

CALL SETGTEXTROTATION (0) !retorna para o ângulo zero normal
call moveto(110+iavx,30+iavy,pos) !posiciona para escrever um nome
call outgtext(tit) !título do gráfico

!linha do gráfico <<== GRÁFICO PROPRIAMENTE DITO
!***********************************************************************
i = setcolor(icor_linha) !cor da linha do gráfico

!equação da escala x
ixcoord(1) = 100 + ifix(200*(x(1)-x(1))/(x(nsegmentos+1)-x(1))) + iavx 

!equação da escala y
iycoord(1) = 280 - ifix(200*(y(1)-ymin)/(ymax-ymin)) +iavy 
!PS: lembre-se que o "y = 0" para a tela é em cima. Por isso, 
!    a equação da escala y tem o "280 -". 

call moveto(ixcoord(1),iycoord(1),pos) !posiciona o cursor 

do i = 1,nsegmentos + 1 !loop para traçar a linha
  !equação da escala x
  ixcoord(i) = 100 + ifix(200*(x(i)-x(1))/(x(nsegmentos+1)-x(1))) + iavx 
  !equação da escala y

  iycoord(i) = 280 - ifix(200*(y(i)-ymin)/(ymax-ymin)) + iavy 
  i2 = lineto(ixcoord(i),iycoord(i))
  call sleepqq(20) !dá a sensação de "animação". Se não quiser, tire!
end do
!***********************************************************************

return
end subroutine


function f(x)
real x !aqui x não é um vetor
   f = sin(x)/x !definição da função (cuidado na definição do número
                !de pontos para não gerar uma operação ilegal)
return
end function