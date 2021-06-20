!programa principal, chamado Prog_QW. Mude o nome, se for o caso
program Prog_QW

use msflib !biblioteca com muitas fun��es gr�ficas e outras.

TYPE (windowconfig) wc !define uma vari�vel para as informa��es sobre a configura��o do micro.
TYPE (qwinfo) winfo !define uma vari�vel para informa��es sobre o dimensionamento do frame e child window.
TYPE (XYCOORD) XY  !define uma vari�vel para estabelecer uma posi��o no v�deo atrav�s de coordenadas em pixels.

LOGICAL status

! Maximiza a tela principal
winfo.TYPE = QWIN$MAX
ires = SETWSIZEQQ(QWIN$FRAMEWINDOW, winfo)

! obt�m dados do sistema: n�mero de pixels, etc. 
wc.numxpixels = -1
wc.numypixels = -1
wc.numtextcols = -1
wc.numtextrows = -1
wc.numcolors = -1
! a "janela filhote" se chamar� "PROGRAMAS" mas o nome pode ser 
!mudado para o desejado. 
wc.title= "PROGRAMAS"C ! t�tulo da "janela filhote" (child window)
wc.fontsize = -1

status = SETWINDOWCONFIG(wc) ! estabelece a configura��o do micro como aquela obtida anteriormente.

     
!colore a "janela filhote"
I=SETBKCOLORRGB(#909090)
call clearscreen($gclearscreen)

!maximiza a "janela filhote"
Iresult=SETWSIZEQQ(0, winfo)

inumfonts = INITIALIZEFONTS( ) !disponibiliza os tipos de fontes do micro.  

!escolha do tipo de letras a serem usadas.  
ifontnum = SETFONT ('t''Arial''h30w15i')! h30 � a altura das letras na tela e w15 � a largura. O i refere-se a it�lico.
     
! se ifontnum for -1, a fonte requerida n�o existe. Ent�o, deve-se escolher outra fonte.

if(ifontnum.eq.-1) ifontnum = SETFONT ('t''times new roman''h30')
if(ifontnum.eq.-1) ifontnum = SETFONT ('t''courier new''h30')
if(ifontnum.eq.-1) ifontnum = SETFONT ('t''tahoma''h30')
if(ifontnum.eq.-1) ifontnum = SETFONT ('t''cac futura casual''h30')

!cor da palavra a ser escrita na tela (se voc� quiser escrever)
i= setcolor(10)! de 0 a 15
!voc� pode alterar as coordenadas onde a palavra ser� escrita
call moveto (50,170,xy) ! coordenadas (em pixels) de onde ser� escrita a palavra ou frase a seguir.

call outgtext('Teste para os futuros programas do Daniel') !escreva entre os ap�strofes uma palavra ou frase para aparecer na tela


!Loop infinito: mant�m o programa funcionando depois de executado
do while (.true.)
end do

end program ! fim do programa principal


!//////////////////////////////////////////////////////////////////////////

!Fun��o onde se define os itens do menu.
LOGICAL(4) FUNCTION INITIALSETTINGS()
USE MSFLIB
LOGICAL(4)result
external subr1, subr2, subr3, subr4, subr5, leiame

     
         !Cria um menu 1 chamado Arquivo
         result = APPENDMENUQQ(1, $MENUENABLED, '&Arquivo'C, NUL )

         !Aten��o: os nomes programa1, programa2, ..., programa5 
         !nos strings a seguir devem ser alterados de acordo com
         !as tarefas que ser�o executadas. 

         !chama a callback subr1 (externa, feita pelo programador e
         !por isso foi declarada no in�cio da fun��o initialsettings)
         result = APPENDMENUQQ(1, $MENUENABLED, 'Programa1'C, subr1)

         ! coloca um tra�o separando o primeiro item do segundo item
         !do menu
         result = APPENDMENUQQ(1, $MENUSEPARATOR, ''C,NUL )

         result = APPENDMENUQQ(1, $MENUENABLED, 'VM e Desv_pad'C, subr2)
        
         !result = APPENDMENUQQ(1, $MENUSEPARATOR, ''C, NUL )
        
         result = APPENDMENUQQ(1, $MENUENABLED, 'Tratamento de dados'C, subr3)
         
         result = APPENDMENUQQ(1, $MENUSEPARATOR, ''C, NUL )
         
         result = APPENDMENUQQ(1, $MENUENABLED, 'Equacao do 2 grau'C, subr4)

         
         result = APPENDMENUQQ(1, $MENUSEPARATOR, ''C, NUL )
         
         result = APPENDMENUQQ(1, $MENUENABLED, 'Programa5'C, subr5)
         
         result = APPENDMENUQQ(1, $MENUSEPARATOR, ''C, NUL )

         ! chama a subrotina winexit (interna, definida em msflib)
         !que termina a execu��o do programa em loop infinito
         result = APPENDMENUQQ(1, $MENUENABLED, 'Sair'C, WINEXIT)


  !Cria um menu 2 chamado Informa��es.

  result = APPENDMENUQQ(2, $MENUENABLED, '&Informa��es'C, NUL )

  !chama a callback WININDEX (subrotina interna, definida em 
  !MSFLIB) com ajuda sobre o QuickWin Application
  result = APPENDMENUQQ(2, $MENUENABLED, 'Ajuda QuickWin'C, WININDEX)
  result = APPENDMENUQQ(2, $MENUSEPARATOR, ''C, NUL )

  !chama a callback WINUSING (interna, definida em MSFLIB) com ajuda
  !sobre o uso do windows
  result = APPENDMENUQQ(2, $MENUENABLED, 'Usando a Ajuda'C, WINUSING)

  result = APPENDMENUQQ(2, $MENUSEPARATOR, ''C, NUL )

!chama a subrotina WINABOUT (interna, definida em MSFLIB) com 
!informa��es sobre o Power Station.
result = APPENDMENUQQ(2, $MENUENABLED, 'Sobre o Power Station'C, WINABOUT)
result = APPENDMENUQQ(2, $MENUSEPARATOR, ''C, NUL )

!chama a callback leiame (externa, feita pelo programador e deve
!ser declarada no in�cio da fun��o initialsettings)
result = APPENDMENUQQ(2, $MENUENABLED, 'Leiame'C, leiame)

         INITIALSETTINGS= .true.

END FUNCTION INITIALSETTINGS !fim da subrotina l�gica que cria o menu.


!//////////////////////////////////////////////////////////////////////////

!subrotinas callbacks:
!subrotinas callbacks onde voc� pode colocar programas (5 subrotinas):

subroutine subr1(ia)

USE MSFLIB
logical ia

ia = .true. !argumento da subrotina callback subr1

CALL CLEARSCREEN($GCLEARSCREEN) !apaga o que estiver escrito na tela

!para abrir uma nova child window d� os comandos abaixo (basta tirar

!o s�mbolo de coment�rio "!")
open(unit = 1, file = 'user', title = 'programa1') !aten��o: se voc� 
!abrir, lembre-se de fechar antes do return.
i = setbkcolor(12)	! colore a child window de vermelho
call clearscreen($gclearscreen) !limpa a tela
i= displaycursor($gcursoron) !ativa cursor 


!suspende os itens do menu 1 durante a execu��o desta subrotina
result = MODIFYMENUFLAGSQQ (1, 1, $MENUGRAYED)
result = MODIFYMENUFLAGSQQ (1, 2, $MENUGRAYED)
result = MODIFYMENUFLAGSQQ (1, 3, $MENUGRAYED)

result = MODIFYMENUFLAGSQQ (1, 4, $MENUGRAYED)
result = MODIFYMENUFLAGSQQ (1, 5, $MENUGRAYED)
result = MODIFYMENUFLAGSQQ (1, 6, $MENUGRAYED)
result = MODIFYMENUFLAGSQQ (1, 7, $MENUGRAYED)
result = MODIFYMENUFLAGSQQ (1, 8, $MENUGRAYED)
result = MODIFYMENUFLAGSQQ (1, 9, $MENUGRAYED)
!Obs: para suspender o menu 1 inteiro (e n�o item por item) bastaria
!dar o comando:
!result = MODIFYMENUFLAGSQQ (1, 0, $MENUGRAYED)


      !PARA FAZER SEUS C�LCULOS, CHAME UMA SUBROTINA OU...

      !INSIRA O SEU C�DIGO AQUI, E APAGUE A LINHA A SEGUIR
message = messageboxqq('Este item est� indispon�vel no momento!'c,'Aten��o',MB$OK.OR.MB$ICONEXCLAMATION.or.MB$DEFBUTTON1)


!reativa os itens do menu ap�s a execu��o desta subrotina
result = MODIFYMENUFLAGSQQ (1, 1, $MENUENABLED)
result = MODIFYMENUFLAGSQQ (1, 2, $MENUENABLED)
result = MODIFYMENUFLAGSQQ (1, 3, $MENUENABLED)
result = MODIFYMENUFLAGSQQ (1, 4, $MENUENABLED)
result = MODIFYMENUFLAGSQQ (1, 5, $MENUENABLED)

result = MODIFYMENUFLAGSQQ (1, 6, $MENUENABLED)
result = MODIFYMENUFLAGSQQ (1, 7, $MENUENABLED)
result = MODIFYMENUFLAGSQQ (1, 8, $MENUENABLED)
result = MODIFYMENUFLAGSQQ (1, 9, $MENUENABLED)
!Obs: para ativar um menu inteiro desativado com o comando result = MODIFYMENUFLAGSQQ (1, 0, $MENUGRAYED) basta dar o comando:
!result = MODIFYMENUFLAGSQQ (1, 0, $MENUENABLED)


message = messageboxqq('Este programa terminou'c,'Aten��o',MB$OK.OR.MB$ICONEXCLAMATION.or.MB$DEFBUTTON1)

i= displaycursor($gcursoroff) !desativa cursor 
close(unit = 1)

return

end subroutine


!//////////////////////////////////////////////////////////////////////////

subroutine subr2(ia)

USE MSFLIB

USE DIALOGM

INCLUDE 'RESOURCE.FD'

TYPE (DIALOG) DLG

LOGICAL RETLOG

CHARACTER (256) TEXT

common x(10) !armazena x numa �rea comum aos subprogramas

logical ia

ia = .true.

!suspende todo o menu 1 durante a execu��o desta subrotina
result = MODIFYMENUFLAGSQQ (1, 0, $MENUGRAYED)

CALL CLEARSCREEN($GCLEARSCREEN)

open(unit = 1, file = 'dados.dat') !abre o arquivo dados.dat

read(1,*)n !l�, na primeira linha do arquivo, o valor de n

read(1,*)(x(i), i = 1, n) !l�, a partir da segunda linha, o vetor x

close(unit = 1) !fecha o arquivo aberto

call calcula(n,xbarra,desv_pad) !Chamada da subrotina �calcula�.

                                !O programa �Teste3� informa
                                !o valor de n (via argumento)
                                !e os valores de x (em common).
                                !A subrotina determina xbarra e
                                !desv_pad e retorna os valores
                                !ao programa principal atrav�s
                                !dos dois �ltimos argumentos. 

RETLOG = DLGINIT(IDD_DIALOG1,DLG)

WRITE(TEXT,*) XBARRA
!escreve o real XBARRA na vari�vel caractere TEXT

RETLOG = DLGSET(DLG, IDC_STATIC1, TRIM(ADJUSTL(TEXT)))
! escreve o caractere TEXT na static text idc_static1

WRITE(TEXT,*) DESV_PAD

RETLOG = DLGSET(DLG, IDC_STATIC2, TRIM(ADJUSTL(TEXT)))

IRET = DLGMODAL(DLG)

CALL DLGUNINIT(DLG)

!write(*,*)xbarra, desv_pad !escreve, na tela, xbarra e desv_pad

!write(*,*)IRET

!retlog = dlginit(idd_dialog1,dlg)

!iret = dlgmodal(dlg)

!call dlguninit(dlg)

!reativa todo o menu ap�s a execu��o desta subrotina
result = MODIFYMENUFLAGSQQ (1, 0, $MENUENABLED)

return

end subroutine




Subroutine calcula(n,xbarra,desv_pad)

common x(10) 

xbarra = soma1(n)/float(n) !evoca a fun��o �soma1� (e
                           !�float�) para calcular
                           !o valor m�dio chamado
                           !de xbarra.

desv_pad = sqrt((soma2(n) - soma1(n)**2/n)/(n-1)) !evoca �soma1�
                                                  !e �soma2� para
                                                  !calcular

                                                  !desv_pad.

return !retorna ao programa principal
       !com xbarra e desv_pad calculados.

End Subroutine calcula 




function soma1(n) !calcula o somat�rio de x
                  !e retorna o resultado na 
                  !vari�vel soma1.
common x(10)

soma1 = 0.0

do i = 1,n
  soma1 = soma1 + x(i)
end do


return 

end function soma1




function soma2(n) !calcula o somat�rio dos quadrados de x
                  !e retorna o resultado na vari�vel soma2.

common x(10)

soma2 = 0.0

do i = 1,n
  soma2 = soma2 + x(i)**2
end do

return

end function soma2



!//////////////////////////////////////////////////////////////////////////

subroutine subr4(ia)

USE MSFLIB

USE DIALOGM

INCLUDE 'RESOURCE.FD'

TYPE (DIALOG) DLG

LOGICAL RETLOG

character (10) b

CHARACTER (256) TEXT

real a(3) !dimensionamento usando a declara��o REAL

complex xc1,xc2 !vari�veis para ra�zes complexas

logical ia

ia = .true.

!suspende todo o menu 1 durante a execu��o desta subrotina

result = MODIFYMENUFLAGSQQ (1, 0, $MENUGRAYED)

CALL CLEARSCREEN($GCLEARSCREEN)

10 continue

retlog = dlginit(idd_dialog2,dlg)
!inicia o di�logo idd_dialog2

iret = dlgmodal(dlg)
!estabele o di�logo (iret tem o valor do bot�o cliclado)

   if(iret == 2) goto 30 !then !foi clicado o bot�o Cancel
      !call dlguninit(dlg) !encerra o di�logo
      !return !retorna para initialsettings()
   !end if

   iproblema = 0 !vari�vel auxiliar na detec��o de erro na leitura

   retlog = dlgget(dlg,idc_edit1,text) !obtenha o texto de edit1
   read(text,*,iostat = ierr)a(1) !leia, em text, o real a(1)
   if(ierr /= 0) iproblema = 1 !iproblema = 1, erro na leitura

   retlog = dlgget(dlg,idc_edit2,text) !obtenha o texto de edit2
   read(text,*,iostat = ierr)a(2) !leia, em text, o real a(2)
   if(ierr /= 0) iproblema = 1

   retlog = dlgget(dlg,idc_edit3,text) !obtenha o texto de edit3

   read(text,*,iostat = ierr)a(3) !leia, em text, o real a(3)
   if(ierr /= 0) iproblema = 1

call dlguninit(dlg) ! encerra o di�logo

if(iproblema == 1) then
   message = messageboxqq('Erro na leitura!'c,'Aten��o',MB$OK.OR.MB$ICONEXCLAMATION)
   goto 10 !v� para o endere�o 10 reler os dados
end if

if(a(1) == 0.0) then !testa se a equa��o � do segundo grau

  if(a(2) == 0.0) then !testa se � equa��o do primeiro grau

message = messageboxqq('Os dados n�o s�o coerentes.'c,'Aten��o',MB$OK.OR.MB$ICONEXCLAMATION)
   
   goto 10 !v� para o endere�o 10 reler os dados
  
  end if

message = messageboxqq('Esta equa�a� n�o � do 2� grau!'c,'Aten��o',MB$OK.OR.MB$ICONEXCLAMATION.or.MB$DEFBUTTON1)

  x1 = -a(3)/a(2) !calcula a raiz da equa��o do primeiro grau

retlog = dlginit(idd_dialog4,dlg)
!inicia o di�logo idd_dialog4

WRITE(TEXT,*) x1

RETLOG = DLGSET(DLG, IDC_STATIC1, TRIM(ADJUSTL(TEXT)))

iret = dlgmodal(dlg)
!estabele o di�logo (iret tem o valor do bot�o cliclado)

call dlguninit(dlg) ! encerra o di�logo

goto 30

end if

delta = a(2)**2 - 4.0*a(1)*a(3) !c�lculo do discriminante

if(delta < 0.0)then !testa se o discriminante � maior que zero

b = 'Complexas'

   pr = -a(2)/(2.0*a(1)) !parte real

   pi = sqrt(abs(delta))/(2.0*a(1)) !parte imagin�ria

   xc1 = cmplx(pr,pi) !comando para escrever vari�vel complexa

   xc2 = cmplx(pr,-pi) !segunda raiz: conjugado

!   write(*,*)'Raizes complexas:'

!   write(*,*)' ' 

!   write(*,*)
x1 = xc1

!   write(*,*)
x2 = xc2

else

b = 'Reais'

   x1 = -a(2)/(2.0*a(1)) + sqrt(delta)/(2.0*a(1))

   x2 = -a(2)/(2.0*a(1)) - sqrt(delta)/(2.0*a(1))

!   write(*,*)'Raizes reais:'

!   write(*,*)' ' 

!   write(*,*)'x1 = ',x1

!   write(*,*)'x2 = ',x2

end if

retlog = dlginit(idd_dialog3,dlg)
!inicia o di�logo idd_dialog3

WRITE(TEXT,*) b 

RETLOG = DLGSET(DLG, IDC_STATIC1, TRIM(ADJUSTL(TEXT)))

WRITE(TEXT,*) x1

RETLOG = DLGSET(DLG, IDC_STATIC2, TRIM(ADJUSTL(TEXT)))

WRITE(TEXT,*) x2

RETLOG = DLGSET(DLG, IDC_STATIC3, TRIM(ADJUSTL(TEXT)))

iret = dlgmodal(dlg)
!estabele o di�logo (iret tem o valor do bot�o cliclado)

call dlguninit(dlg) ! encerra o di�logo

30 continue

!reativa todo o menu ap�s a execu��o desta subrotina
result = MODIFYMENUFLAGSQQ (1, 0, $MENUENABLED)

return

end subroutine


!//////////////////////////////////////////////////////////////////////////

subroutine subr3(ia)

USE MSFLIB
logical ia

ia = .true.

!suspende todo o menu 1 durante a execu��o desta subrotina
result = MODIFYMENUFLAGSQQ (1, 0, $MENUGRAYED)

CALL CLEARSCREEN($GCLEARSCREEN)

i = runqq('write.exe', 'dados.dat')

!reativa todo o menu ap�s a execu��o desta subrotina
result = MODIFYMENUFLAGSQQ (1, 0, $MENUENABLED)

return

end subroutine


!//////////////////////////////////////////////////////////////////////////

subroutine subr5(ia)

USE MSFLIB
logical ia

ia = .true.

!suspende todo o menu 1 durante a execu��o desta subrotina
result = MODIFYMENUFLAGSQQ (1, 0, $MENUGRAYED)

CALL CLEARSCREEN($GCLEARSCREEN)

      !PARA FAZER SEUS C�LCULOS, CHAME UMA SUBROTINA OU...

      !INSIRA O SEU C�DIGO AQUI, E APAGUE A LINHA A SEGUIR
       message = messageboxqq('Este item est� indispon�vel no momento!'c,'Aten��o',MB$OK.OR.MB$ICONEXCLAMATION.or.MB$DEFBUTTON1)

!reativa todo o menu ap�s a execu��o desta subrotina
result = MODIFYMENUFLAGSQQ (1, 0, $MENUENABLED)

return

end subroutine


!//////////////////////////////////////////////////////////////////////////

subroutine leiame(ia)

USE MSFLIB
logical ia

ia = .true.

       !Quando j� existir um arquivo leiame, apague os dois 
       !pr�ximos comandos de sua aplica��o   
       message = messageboxqq('Este item est� indispon�vel no momento!'c,'Aten��o',MB$OK.OR.MB$ICONEXCLAMATION.or.MB$DEFBUTTON1)
       return

       i = runqq('write.exe','leiame.doc')

return

end subroutine


