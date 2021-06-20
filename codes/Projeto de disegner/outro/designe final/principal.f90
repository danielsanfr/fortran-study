program principal_designer

use msflib

use dialogm

!include 'resource.fd'

type (xycoord) pos

type (dialog) dlg

type (qwinfo) winfo

integer esco,nl,nc,j,i,ii,m,iostat,ierr,tam(256,10),r,t,aux(256),a,b

character (512) arq(256,10),arqaux(256,10),text

character (50) tit(1,10)

character (50) lista , listaux

CHARACTER(1) key / 'A' /

parameter (esc = 27)

parameter (noret = 0)

external adiciona_dado,adiciona_lista,apaga_dado,apaga_lista,carrega_lista,procura_dado

	winfo.TYPE = QWIN$MAX 

	i = SETWSIZEQQ(QWIN$FRAMEWINDOW, winfo) 

	call clearscreen($gclearscreen)

	i = clickmenuqq(QWIN$STATUS)   

	i = clickmenuqq(QWIN$TILE)

oldcur = settextcursor(#0108)

iresult = DISPLAYCURSOR ($gcursoron)

t = 0 ; lista = '' ; listaux = ''

do while(.true.)

!1 t = t + 1

!if (mod(t,3) == 0) then

!	call sleep(2)

!	call clearscreen($gclearscreen)

!end if

1 write(*,"(A24)")'1 - Adicionar nova lista'
write(*,"(A22)")'2 - Procurar uma lista'
write(*,"(A16)")'3 - Apagar lista'
write(*,"(A18)")'4 - Adicionar dado'
write(*,"(A17)")'5 - Procurar dado'
write(*,"(A16)")'6 - Remover dado'
write(*,"(A17)")'7 - Limpar a tela'
write(*,"(A8)")'8 - Sair'

2 key = GETCHARQQ()

if (ichar(key).EQ.noret)then

	key = GETCHARQQ()

	write(*,"(A45)")'Erro na leitura! Digite a sua escolha denovo.'

else

	read(key,"(I1)",iostat=ierr)esco

	if(ierr/=0) then

		write(*,"(A45)")'Erro na leitura! Digite a sua escolha denovo.'

		go to 2

	end if

end if

select case(esco)

	case(1)

		call adiciona_lista(nl,nc,arq,tit,lista,listaux)		

	case(2)

		call carrega_lista(lista,nl,nc,tit,arq)

	case(3)

		call apaga_lista(lista)

	case(4)

		call adiciona_dado(lista,nc,nl,arq,tit)

	case(5)

		call procura_dado(lista,arq,nc,nl,aux)

	case(6)

		call apaga_dado(lista,arq,arqux,tit,nl,nc,aux)

	case(7)

		call clearscreen($gclearscreen)

	case(8)

		i = clickmenuqq(loc(winexit))

	case default

		write(*,"(A25)")'Escolha uma opção valida!'

end select

end do

stop

end program