program intro_graf_3D

use msflib

implicit none

integer nsegmentos,i,j,icor_linha,iavx,iavy

real x1(501),x2(501),y(501,501),deltax1,deltax2,f

character (30) x1ux1,x2ux2,yuy

character (50) tit

logical retlog

type (qwinfo) winfo 

type(windowconfig) wc

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

retlog = GETWINDOWCONFIG (wc)

if(wc.numxpixels < 800) THEN

  i = MESSAGEBOXQQ('A resolução do monitor deve ser 800x600 &
  ou mais!'C,'RESOLUÇÃO'C,MB$ICONQUESTION.OR.MB$DEFBUTTON1)

  call exit

end if

winfo.TYPE = QWIN$MAX  
i = SETWSIZEQQ(QWIN$FRAMEWINDOW, winfo) !maximiza a frame window

i = clickmenuqq(qwin$tile) !estilo tile

!gráfico da função definida em "function f(x1,x2)": inicialização.
nsegmentos = 200 !número de segmentos em cada linha
!da malha (pode ser 50, 100, 150, ... 500)

x1(1) = -3.0 !valor inicial de x1, poderia ser lido 

x1(nsegmentos+1) = 3.0  !valor final de x1, poderia ser lido

x2(1) = -3.0

x2(nsegmentos+1) = 3.0

deltax1 = (x1(nsegmentos+1)-x1(1))/float(nsegmentos)

deltax2 = (x2(nsegmentos+1)-x2(1))/float(nsegmentos)

!valores de y: função definida em "function f(x1,x2)" <<<<==== FUNÇÃO
!atenção: os pontos a serem ligados serão gerados a partir da função
!"f(x1,x2)" definida em "funtion f(x1,x2)" mas os pontos poderiam ser 
!lidos em um arquivo de dados.
do i = 1,nsegmentos+1

  do j = 1,nsegmentos+1

    y(i,j) = f(x1(i),x2(j))

    if(j /= nsegmentos+1) x2(j+1) = x2(j) + deltax2

  end do

  if(i /= nsegmentos+1) x1(i+1) = x1(i) + deltax1

end do

icor_linha = -1 !cor da linha da malha: 0 é preto, -1 é colorido

iavx = 250 !avanço nas coordenadas x1 (deslocamento de todo o desenho)

iavy = 30 !avanço nas coordenadas y (deslocamento de todo o desenho)

!origem do sistema de eixos: (100+iavx,280+iavy) <= posição em pixels

x1ux1 = 'X1(Ux1)' !grandeza "X1" e sua unidade

x2ux2 = 'X2(Ux2)' !grandeza "X2" e sua unidade

yuy = 'Y(Uy)' !grandeza "Y" e sua unidade

tit = '           Noções Sobre Gráficos 3D'  !título do gráfico

call graf_3D(nsegmentos,x1,y,icor_linha,iavx,iavy,x1ux1,x2ux2,yuy,tit)

do while (.true.)

end do

end program


subroutine graf_3D(nsegmentos,x1,y,icor_linha,iavx,iavy, &

x1ux1,x2ux2,yuy,tit)

  !nsegmentos: número de segmentos (igual a 500)

  !x1: valores da variável independente x1 (501 valores)


  !y: valores da variável dependente  x2 (501 valores)

  !icor_linha: cor da linha do gráfico

  !iavx: avanço de todo o grafico em x (em pixels)

  !iavy: avanço de todo o gráfico em y (em pixels)

  !x1ux1: string com informações sobre a grandeza 

  !marcada em x1 => X1(Ux1) 

  !x2ux2: string com informações sobre a grandeza

  !marcada em x2 => X2(Ux2) 

  !yuy: string com informações sobre a grandeza marcada em y => Y(Uy) 

  !tit: string com o título do gráfico

use msflib

implicit none

type (xycoord) pos

type (xycoord) poly(4)

integer nsegmentos,i,j,icor_linha,i2,i_cor

integer ixcoord(501,501),iycoord(501,501),iavx,iavy,passo

real x1(501),y(501,501),ymin,ymax

character (30) x1ux1,x2ux2,yuy

character (50) tit

!fontes

i = initializefonts()

i = SETFONT ('t''Arial''h16e')

if(i.eq.-1) i = SETFONT ('t''times new roman''h17e')

if(i.eq.-1) i = setfont ('t''courier new''h16e')

if(i.eq.-1) i = SETFONT ('t''Tahoma''h16e')

if(i.eq.-1) i = SETFONT ('t''CAC FUTURA CASUAL''h16e')

!valores máximo e mínimo de y

ymin = y(1,1)

ymax = y(1,1)

do i = 1,nsegmentos+1

  do j = 1,nsegmentos+1

    if(y(i,j) < ymin) ymin = y(i,j)

    if(y(i,j) > ymax) ymax = y(i,j)

  end do

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

call moveto(100+iavx,40+iavy,pos)

i = lineto(100+iavx,280+iavy) !eixo vertical

i = lineto(380+iavx,280+iavy) !eixo de x1

call moveto(100+iavx,280+iavy,pos) !eixo x2

i = lineto(100-ifix(160.*cos(45./180.))+iavx,280+ &

ifix(160.*cos(45./180.))+iavy) !eixo de x2 

call moveto(99+iavx,40+iavy,pos)

i = lineto(99+iavx,281+iavy) !reforço do eixo vertical (traço duplo)

i = lineto(380+iavx,281+iavy) !reforço de x1 (traço duplo)

call moveto(101+iavx,280+iavy,pos)	!reforço de x2 (traço duplo)

i = lineto(101-ifix(160.*cos(45./180.))+iavx,280+ &

ifix(160.*cos(45./180.))+iavy) !eixo de x2

!nomes dos eixos

call moveto(360+iavx,285+iavy,pos) !posição do nome do eixo x1

call outgtext(trim(x1ux1)) !nome do eixo x1

call moveto(75-ifix(160.*cos(45./180.))+iavx,285+ &

ifix(160.*cos(45./180.))+iavy,pos)

call outgtext(trim(x2ux2)) !nome do eixo x2

call moveto(60+iavx,10+iavy,pos)

call outgtext(trim(yuy))

call moveto(110+iavx,45+iavy,pos)

call outgtext(tit) !título do gráfico

i = setcolor(icor_linha) !cor da malha do gráfico

!Atenção o que vamos fazer agora é traçar o gráfico 2D para 

!y = f(x1,x2) com x2 constante: x2(1). Depois, faremos o mesmo

!para outros x2 fixos, até x2(501). A complementação a malha é

!feita fixando x1 e traçando f(x1,x2). Veja que, a rigor, faremos

!cálculos que possibilitam traçar uma malha com até 501 x 501 linhas: 

!***********************************************************************

do j = 1,nsegmentos+1  

  do i = 1,nsegmentos + 1 

    !equação da escala x

    ixcoord(i,j) = 100 - ifix(120.*cos(45./180.)*(j-1)/(nsegmentos &   

    )) + ifix(200*(x1(i)-x1(1))/(x1(nsegmentos+1)-x1(1))) + iavx 


    !equação da escala y

    iycoord(i,j) = 280 + ifix(120.*cos(45./180.)*(j-1)/(nsegmentos &  

    )) - ifix(200*(y(i,j)-ymin)/(ymax-ymin)) + iavy 

  end do

end do

!***********************************************************************

passo = nsegmentos/50 !define o avanço de cada linha no eixo.

!***********************************************************************

do j = 1,nsegmentos+1,passo !traço das linhas transversais
call sleepqq(200)
  do i = 1,nsegmentos + 1,passo !loop para traçar a linha

     if(icor_linha /= 0) then !cores por cota (4 cotas. Mude, se quiser)

       if(y(i,j) <= (ymax-ymin)/4+ymin) then

         i_cor = setcolor(2)

       else	
	
           if(y(i,j) > (ymax-ymin)/4+ymin .and. y(i,j) <= 2*(ymax&

           -ymin)/4+ymin) then
      
             i_cor = setcolor(9)
	
           else

             if(y(i,j) > 2*(ymax-ymin)/4+ymin .and. y(i,j) <= 3*(ymax&
       
             -ymin)/4+ymin) then
      
               i_cor = setcolor(12)
	
      	 else
               
               i_cor = setcolor(13)

             end if
	     
           end if
         
         end if
     
	 else

         i_cor = setcolor(7)

	 end if


       if( j <= nsegmentos .and. i <= nsegmentos) then

         poly(1)%xcoord = ixcoord(i,j+passo)
	   poly(1)%ycoord = iycoord(i,j+passo)
         poly(2)%xcoord = ixcoord(i,j)
	   poly(2)%ycoord = iycoord(i,j)
         poly(3)%xcoord = ixcoord(i+passo,j)
	   poly(3)%ycoord = iycoord(i+passo,j)
         poly(4)%xcoord = ixcoord(i+passo,j+passo)
	   poly(4)%ycoord = iycoord(i+passo,j+passo)
         i2 = POLYGON($GFILLINTERIOR, poly, INT2(4))
       end if
    
	i2 = setcolor(0)
	if(j <= nsegmentos) then

  call moveto(ixcoord(i,j),iycoord(i,j), pos)
	  i2 = lineto(ixcoord(i,j+passo),iycoord(i,j+passo))
      end if
	if(i <= nsegmentos) then
	  call moveto(ixcoord(i,j),iycoord(i,j), pos)
        i2 = lineto(ixcoord(i+passo,j),iycoord(i+passo,j))
      end if

  end do

end do
!***********************************************************************

return

end subroutine


function f(x1,x2)

real x1,x2 !aqui x1 e x2 não são vetores

   f = -exp(-x1**2 - x2**2)
   !f = sin(x1)*sin(x2)
   !f = x1 - x2**2
   !f = cos(x1)*cos(x2)
   !f = sin(x1)*sin(x2) + cos(x1)*cos(x2)
   !f = x1*x2
   !f = exp(sin(x1)*cos(x2))
   !f = exp(sin(x1)*sin(x2))
   !f = - x1**2 - X2**2


return

end function