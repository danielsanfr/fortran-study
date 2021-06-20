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
ifontnum = SETFONT ('t''Arial''h30w20i')! h30 � a altura das letras na tela e w20 � a largura. O i refere-se a it�lico.
     
! se ifontnum for -1, a fonte requerida n�o existe. Ent�o, deve-se escolher outra fonte.

if(ifontnum.eq.-1) ifontnum = SETFONT ('t''times new roman''h30')
if(ifontnum.eq.-1) ifontnum = SETFONT ('t''courier new''h30')
if(ifontnum.eq.-1) ifontnum = SETFONT ('t''tahoma''h30')
if(ifontnum.eq.-1) ifontnum = SETFONT ('t''cac futura casual''h30')

!cor da palavra a ser escrita na tela (se voc� quiser escrever)
i= setcolor(10)! de 0 a 15
!voc� pode alterar as coordenadas onde a palavra ser� escrita
call moveto (50,170,xy) ! coordenadas (em pixels) de onde ser� escrita a palavra ou frase a seguir.

call outgtext(' ') !escreva entre os ap�strofes uma palavra ou frase para aparecer na tela


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

         result = APPENDMENUQQ(1, $MENUENABLED, 'Programa2'C, subr2)
        
         result = APPENDMENUQQ(1, $MENUSEPARATOR, ''C, NUL )
        
         result = APPENDMENUQQ(1, $MENUENABLED, 'Programa3'C, subr3)
         
         result = APPENDMENUQQ(1, $MENUSEPARATOR, ''C, NUL )
         
         result = APPENDMENUQQ(1, $MENUENABLED, 'Programa4'C, subr4)

         
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
!open(unit = 1, file = 'user', title = 'programa1') !aten��o: se voc� 
!abrir, lembre-se de fechar antes do return.
!i = setbkcolor(12)	! colore a child window de vermelho
!call clearscreen($gclearscreen) !limpa a tela
!i= displaycursor($gcursoron) !ativa cursor 


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


!message = messageboxqq('Este programa terminou'c,'Aten��o',MB$OK.OR.MB$ICONEXCLAMATION.or.MB$DEFBUTTON1)

!i= displaycursor($gcursoroff) !desativa cursor 
!close(unit = 1)

return

end subroutine


!//////////////////////////////////////////////////////////////////////////

subroutine subr2(ia)

USE MSFLIB
use dialogm
include 'resource.fd'
type (dialog) dlg
logical retlog
logical ia
character (256) text
common x(10) !armazena x numa �rea comum aos subprogramas

ia = .true.

!suspende todo o menu 1 durante a execu��o desta subrotina
result = MODIFYMENUFLAGSQQ (1, 0, $MENUGRAYED)

CALL CLEARSCREEN($GCLEARSCREEN)

      !PARA FAZER SEUS C�LCULOS, CHAME UMA SUBROTINA OU...
      !INSIRA O SEU C�DIGO AQUI, E APAGUE A LINHA A SEGUIR


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
								
retlog = dlginit(IDD_DIALOG1,DLG)

write(text,*)xbarra

retlog = dlgset(dlg,idc_static1,trim(adjustl(text)))

write(text,*)desv_pad

retlog = dlgset(dlg,idc_static2,trim(adjustl(text)))

iret = dlgmodal(dlg)

call dlguninit(dlg)

!write(*,*)iret

!write(*,*)xbarra, desv_pad !escreve, na tela, xbarra e desv_pad

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

subroutine subr3(ia)

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

subroutine subr4(ia)

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