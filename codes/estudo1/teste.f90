!programa principal, chamado Prog_QW. Mude o nome, se for o caso
program Prog_QW

use msflib !biblioteca com muitas funções gráficas e outras.

TYPE (windowconfig) wc !define uma variável para as informações sobre a configuração do micro.
TYPE (qwinfo) winfo !define uma variável para informações sobre o dimensionamento do frame e child window.
TYPE (XYCOORD) XY  !define uma variável para estabelecer uma posição no vídeo através de coordenadas em pixels.

LOGICAL status

! Maximiza a tela principal
winfo.TYPE = QWIN$MAX
ires = SETWSIZEQQ(QWIN$FRAMEWINDOW, winfo)

! obtém dados do sistema: número de pixels, etc. 
wc.numxpixels = -1
wc.numypixels = -1
wc.numtextcols = -1
wc.numtextrows = -1
wc.numcolors = -1
! a "janela filhote" se chamará "PROGRAMAS" mas o nome pode ser 
!mudado para o desejado. 
wc.title= "PROGRAMAS"C ! título da "janela filhote" (child window)
wc.fontsize = -1

status = SETWINDOWCONFIG(wc) ! estabelece a configuração do micro como aquela obtida anteriormente.

     
!colore a "janela filhote"
I=SETBKCOLORRGB(#909090)
call clearscreen($gclearscreen)

!maximiza a "janela filhote"
Iresult=SETWSIZEQQ(0, winfo)

inumfonts = INITIALIZEFONTS( ) !disponibiliza os tipos de fontes do micro.  

!escolha do tipo de letras a serem usadas.  
ifontnum = SETFONT ('t''Arial''h30w15i')! h30 é a altura das letras na tela e w15 é a largura. O i refere-se a itálico.
     
! se ifontnum for -1, a fonte requerida não existe. Então, deve-se escolher outra fonte.

if(ifontnum.eq.-1) ifontnum = SETFONT ('t''times new roman''h30')
if(ifontnum.eq.-1) ifontnum = SETFONT ('t''courier new''h30')
if(ifontnum.eq.-1) ifontnum = SETFONT ('t''tahoma''h30')
if(ifontnum.eq.-1) ifontnum = SETFONT ('t''cac futura casual''h30')

!cor da palavra a ser escrita na tela (se você quiser escrever)
i= setcolor(10)! de 0 a 15
!você pode alterar as coordenadas onde a palavra será escrita
call moveto (50,170,xy) ! coordenadas (em pixels) de onde será escrita a palavra ou frase a seguir.

call outgtext('Teste para os futuros programas do Daniel') !escreva entre os apóstrofes uma palavra ou frase para aparecer na tela


!Loop infinito: mantém o programa funcionando depois de executado
do while (.true.)
end do

end program ! fim do programa principal


!//////////////////////////////////////////////////////////////////////////

!Função onde se define os itens do menu.
LOGICAL(4) FUNCTION INITIALSETTINGS()
USE MSFLIB
LOGICAL(4)result
external subr1, subr2, subr3, subr4, subr5, leiame

     
         !Cria um menu 1 chamado Arquivo
         result = APPENDMENUQQ(1, $MENUENABLED, '&Arquivo'C, NUL )

         !Atenção: os nomes programa1, programa2, ..., programa5 
         !nos strings a seguir devem ser alterados de acordo com
         !as tarefas que serão executadas. 

         !chama a callback subr1 (externa, feita pelo programador e
         !por isso foi declarada no início da função initialsettings)
         result = APPENDMENUQQ(1, $MENUENABLED, 'Programa1'C, subr1)

         ! coloca um traço separando o primeiro item do segundo item
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
         !que termina a execução do programa em loop infinito
         result = APPENDMENUQQ(1, $MENUENABLED, 'Sair'C, WINEXIT)


  !Cria um menu 2 chamado Informações.

  result = APPENDMENUQQ(2, $MENUENABLED, '&Informações'C, NUL )

  !chama a callback WININDEX (subrotina interna, definida em 
  !MSFLIB) com ajuda sobre o QuickWin Application
  result = APPENDMENUQQ(2, $MENUENABLED, 'Ajuda QuickWin'C, WININDEX)
  result = APPENDMENUQQ(2, $MENUSEPARATOR, ''C, NUL )

  !chama a callback WINUSING (interna, definida em MSFLIB) com ajuda
  !sobre o uso do windows
  result = APPENDMENUQQ(2, $MENUENABLED, 'Usando a Ajuda'C, WINUSING)

  result = APPENDMENUQQ(2, $MENUSEPARATOR, ''C, NUL )

!chama a subrotina WINABOUT (interna, definida em MSFLIB) com 
!informações sobre o Power Station.
result = APPENDMENUQQ(2, $MENUENABLED, 'Sobre o Power Station'C, WINABOUT)
result = APPENDMENUQQ(2, $MENUSEPARATOR, ''C, NUL )

!chama a callback leiame (externa, feita pelo programador e deve
!ser declarada no início da função initialsettings)
result = APPENDMENUQQ(2, $MENUENABLED, 'Leiame'C, leiame)

         INITIALSETTINGS= .true.

END FUNCTION INITIALSETTINGS !fim da subrotina lógica que cria o menu.


!//////////////////////////////////////////////////////////////////////////

!subrotinas callbacks:
!subrotinas callbacks onde você pode colocar programas (5 subrotinas):

subroutine subr1(ia)

USE MSFLIB
logical ia

ia = .true. !argumento da subrotina callback subr1

CALL CLEARSCREEN($GCLEARSCREEN) !apaga o que estiver escrito na tela

!para abrir uma nova child window dê os comandos abaixo (basta tirar

!o símbolo de comentário "!")
open(unit = 1, file = 'user', title = 'programa1') !atenção: se você 
!abrir, lembre-se de fechar antes do return.
i = setbkcolor(12)	! colore a child window de vermelho
call clearscreen($gclearscreen) !limpa a tela
i= displaycursor($gcursoron) !ativa cursor 


!suspende os itens do menu 1 durante a execução desta subrotina
result = MODIFYMENUFLAGSQQ (1, 1, $MENUGRAYED)
result = MODIFYMENUFLAGSQQ (1, 2, $MENUGRAYED)
result = MODIFYMENUFLAGSQQ (1, 3, $MENUGRAYED)

result = MODIFYMENUFLAGSQQ (1, 4, $MENUGRAYED)
result = MODIFYMENUFLAGSQQ (1, 5, $MENUGRAYED)
result = MODIFYMENUFLAGSQQ (1, 6, $MENUGRAYED)
result = MODIFYMENUFLAGSQQ (1, 7, $MENUGRAYED)
result = MODIFYMENUFLAGSQQ (1, 8, $MENUGRAYED)
result = MODIFYMENUFLAGSQQ (1, 9, $MENUGRAYED)
!Obs: para suspender o menu 1 inteiro (e não item por item) bastaria
!dar o comando:
!result = MODIFYMENUFLAGSQQ (1, 0, $MENUGRAYED)


      !PARA FAZER SEUS CÁLCULOS, CHAME UMA SUBROTINA OU...

      !INSIRA O SEU CÓDIGO AQUI, E APAGUE A LINHA A SEGUIR
message = messageboxqq('Este item está indisponível no momento!'c,'Atenção',MB$OK.OR.MB$ICONEXCLAMATION.or.MB$DEFBUTTON1)


!reativa os itens do menu após a execução desta subrotina
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


message = messageboxqq('Este programa terminou'c,'Atenção',MB$OK.OR.MB$ICONEXCLAMATION.or.MB$DEFBUTTON1)

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

common x(10) !armazena x numa área comum aos subprogramas

logical ia

ia = .true.

!suspende todo o menu 1 durante a execução desta subrotina
result = MODIFYMENUFLAGSQQ (1, 0, $MENUGRAYED)

CALL CLEARSCREEN($GCLEARSCREEN)

open(unit = 1, file = 'dados.dat') !abre o arquivo dados.dat

read(1,*)n !lê, na primeira linha do arquivo, o valor de n

read(1,*)(x(i), i = 1, n) !lê, a partir da segunda linha, o vetor x

close(unit = 1) !fecha o arquivo aberto

call calcula(n,xbarra,desv_pad) !Chamada da subrotina “calcula”.

                                !O programa “Teste3” informa
                                !o valor de n (via argumento)
                                !e os valores de x (em common).
                                !A subrotina determina xbarra e
                                !desv_pad e retorna os valores
                                !ao programa principal através
                                !dos dois últimos argumentos. 

RETLOG = DLGINIT(IDD_DIALOG1,DLG)

WRITE(TEXT,*) XBARRA
!escreve o real XBARRA na variável caractere TEXT

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

!reativa todo o menu após a execução desta subrotina
result = MODIFYMENUFLAGSQQ (1, 0, $MENUENABLED)

return

end subroutine




Subroutine calcula(n,xbarra,desv_pad)

common x(10) 

xbarra = soma1(n)/float(n) !evoca a função “soma1” (e
                           !“float”) para calcular
                           !o valor médio chamado
                           !de xbarra.

desv_pad = sqrt((soma2(n) - soma1(n)**2/n)/(n-1)) !evoca “soma1”
                                                  !e “soma2” para
                                                  !calcular

                                                  !desv_pad.

return !retorna ao programa principal
       !com xbarra e desv_pad calculados.

End Subroutine calcula 




function soma1(n) !calcula o somatório de x
                  !e retorna o resultado na 
                  !variável soma1.
common x(10)

soma1 = 0.0

do i = 1,n
  soma1 = soma1 + x(i)
end do


return 

end function soma1




function soma2(n) !calcula o somatório dos quadrados de x
                  !e retorna o resultado na variável soma2.

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

real a(3) !dimensionamento usando a declaração REAL

complex xc1,xc2 !variáveis para raízes complexas

logical ia

ia = .true.

!suspende todo o menu 1 durante a execução desta subrotina

result = MODIFYMENUFLAGSQQ (1, 0, $MENUGRAYED)

CALL CLEARSCREEN($GCLEARSCREEN)

10 continue

retlog = dlginit(idd_dialog2,dlg)
!inicia o diálogo idd_dialog2

iret = dlgmodal(dlg)
!estabele o diálogo (iret tem o valor do botão cliclado)

   if(iret == 2) goto 30 !then !foi clicado o botão Cancel
      !call dlguninit(dlg) !encerra o diálogo
      !return !retorna para initialsettings()
   !end if

   iproblema = 0 !variável auxiliar na detecção de erro na leitura

   retlog = dlgget(dlg,idc_edit1,text) !obtenha o texto de edit1
   read(text,*,iostat = ierr)a(1) !leia, em text, o real a(1)
   if(ierr /= 0) iproblema = 1 !iproblema = 1, erro na leitura

   retlog = dlgget(dlg,idc_edit2,text) !obtenha o texto de edit2
   read(text,*,iostat = ierr)a(2) !leia, em text, o real a(2)
   if(ierr /= 0) iproblema = 1

   retlog = dlgget(dlg,idc_edit3,text) !obtenha o texto de edit3

   read(text,*,iostat = ierr)a(3) !leia, em text, o real a(3)
   if(ierr /= 0) iproblema = 1

call dlguninit(dlg) ! encerra o diálogo

if(iproblema == 1) then
   message = messageboxqq('Erro na leitura!'c,'Atenção',MB$OK.OR.MB$ICONEXCLAMATION)
   goto 10 !vá para o endereço 10 reler os dados
end if

if(a(1) == 0.0) then !testa se a equação é do segundo grau

  if(a(2) == 0.0) then !testa se é equação do primeiro grau

message = messageboxqq('Os dados não são coerentes.'c,'Atenção',MB$OK.OR.MB$ICONEXCLAMATION)
   
   goto 10 !vá para o endereço 10 reler os dados
  
  end if

message = messageboxqq('Esta equaçaõ não é do 2º grau!'c,'Atenção',MB$OK.OR.MB$ICONEXCLAMATION.or.MB$DEFBUTTON1)

  x1 = -a(3)/a(2) !calcula a raiz da equação do primeiro grau

retlog = dlginit(idd_dialog4,dlg)
!inicia o diálogo idd_dialog4

WRITE(TEXT,*) x1

RETLOG = DLGSET(DLG, IDC_STATIC1, TRIM(ADJUSTL(TEXT)))

iret = dlgmodal(dlg)
!estabele o diálogo (iret tem o valor do botão cliclado)

call dlguninit(dlg) ! encerra o diálogo

goto 30

end if

delta = a(2)**2 - 4.0*a(1)*a(3) !cálculo do discriminante

if(delta < 0.0)then !testa se o discriminante é maior que zero

b = 'Complexas'

   pr = -a(2)/(2.0*a(1)) !parte real

   pi = sqrt(abs(delta))/(2.0*a(1)) !parte imaginária

   xc1 = cmplx(pr,pi) !comando para escrever variável complexa

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
!inicia o diálogo idd_dialog3

WRITE(TEXT,*) b 

RETLOG = DLGSET(DLG, IDC_STATIC1, TRIM(ADJUSTL(TEXT)))

WRITE(TEXT,*) x1

RETLOG = DLGSET(DLG, IDC_STATIC2, TRIM(ADJUSTL(TEXT)))

WRITE(TEXT,*) x2

RETLOG = DLGSET(DLG, IDC_STATIC3, TRIM(ADJUSTL(TEXT)))

iret = dlgmodal(dlg)
!estabele o diálogo (iret tem o valor do botão cliclado)

call dlguninit(dlg) ! encerra o diálogo

30 continue

!reativa todo o menu após a execução desta subrotina
result = MODIFYMENUFLAGSQQ (1, 0, $MENUENABLED)

return

end subroutine


!//////////////////////////////////////////////////////////////////////////

subroutine subr3(ia)

USE MSFLIB
logical ia

ia = .true.

!suspende todo o menu 1 durante a execução desta subrotina
result = MODIFYMENUFLAGSQQ (1, 0, $MENUGRAYED)

CALL CLEARSCREEN($GCLEARSCREEN)

i = runqq('write.exe', 'dados.dat')

!reativa todo o menu após a execução desta subrotina
result = MODIFYMENUFLAGSQQ (1, 0, $MENUENABLED)

return

end subroutine


!//////////////////////////////////////////////////////////////////////////

subroutine subr5(ia)

USE MSFLIB
logical ia

ia = .true.

!suspende todo o menu 1 durante a execução desta subrotina
result = MODIFYMENUFLAGSQQ (1, 0, $MENUGRAYED)

CALL CLEARSCREEN($GCLEARSCREEN)

      !PARA FAZER SEUS CÁLCULOS, CHAME UMA SUBROTINA OU...

      !INSIRA O SEU CÓDIGO AQUI, E APAGUE A LINHA A SEGUIR
       message = messageboxqq('Este item está indisponível no momento!'c,'Atenção',MB$OK.OR.MB$ICONEXCLAMATION.or.MB$DEFBUTTON1)

!reativa todo o menu após a execução desta subrotina
result = MODIFYMENUFLAGSQQ (1, 0, $MENUENABLED)

return

end subroutine


!//////////////////////////////////////////////////////////////////////////

subroutine leiame(ia)

USE MSFLIB
logical ia

ia = .true.

       !Quando já existir um arquivo leiame, apague os dois 
       !próximos comandos de sua aplicação   
       message = messageboxqq('Este item está indisponível no momento!'c,'Atenção',MB$OK.OR.MB$ICONEXCLAMATION.or.MB$DEFBUTTON1)
       return

       i = runqq('write.exe','leiame.doc')

return

end subroutine


