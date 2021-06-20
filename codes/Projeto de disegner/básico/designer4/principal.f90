program principal_designer

use msflib

use dialogm

!include 'resource.fd'

type (xycoord) pos

type (dialog) dlg

type (qwinfo) winfo

integer esco,n,j,i,ii,m,iostat,ierr,tam(256,5),r,test

character (512) arq(256,5),arqaux(256,5), text

character (3) textaux(2)

CHARACTER(1) key / 'A' /

parameter (esc = 27)

parameter (noret = 0)

open(unit = 1 , file = 'dado.dat' , status = 'old' , iostat = ierr)

open(unit = 2 , file = 'lista1.dat' , status = 'old' , iostat = ierr)

read(1,"(I3)")n

do 1 m = 1 , n

	1 read(2,"(2A512)")(arq(m,i),i=1,2)

oldcur = settextcursor(#0108)

iresult = DISPLAYCURSOR ($gcursoron)

do while(.true.)

2 write(*,"(A13)")'1 - Adicionar'
write(*,"(A12)")'2 - Procurar'
write(*,"(A11)")'3 - Remover'
write(*,"(A17)")'4 - Limpar a tela'
write(*,"(A8)")'5 - Sair'

key = GETCHARQQ()

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

		write(*,"(A36)")'Escreva o que você deseja adicionar.'

		3 read(*,"(A50)",iostat=ierr)text

		if(ierr/=0) then

		write(*,"(A48)")'Erro na leitura! Digite a informação novamente.'

		go to 3

		end if

		if(trim(adjustl(text))=='sair')go to 2

		do m = 1 , n

			if(trim(adjustl(text))==trim(adjustl(arq(m,1)))) then

			write(*,"(A33)")'Isto ja existe no bando de dados!'

			write(*,"(A,1x,A)")(trim(adjustl(arq(m,i))),i=1,2)

			go to 2

			end if

		end do

		n = n + 1

		arq(n,1) = trim(adjustl(text))

		tam(n,1) = len(trim(adjustl(text)))

		4 read(*,"(A512)",iostat=ierr)text

		if(ierr/=0) then

		write(*,"(A47)")'Erro na leitura! Digite a informação novamente.'

		go to 4

		end if

		arq(n,2) = trim(adjustl(text))

		tam(n,2) = len(trim(adjustl(text)))

		close(unit = 1 , status = 'delete' , iostat = ierr)

		open(unit = 1 , file = 'dado.dat' , status = 'new' , iostat = ierr)

		write(1,"(I3)")n

		close(unit = 2 , status = 'delete' , iostat = ierr)

		open(unit = 2 , file = 'lista1.dat' , status = 'new' , iostat = ierr)

		do 5 m = 1 , n

		5 write(2,"(2A512)")(arq(m,i),i=1,2)

	case(2)

		write(*,"(A35)")'Escreva o que você deseja procurar.'

		6 read(*,"(A50)",iostat=ierr)text

		if(ierr/=0) then

		write(*,"(A56)")'Erro na leitura! Digite o que deseja procurar novamente.'

		go to 6

		end if

		if(trim(adjustl(text))=='sair')go to 2

		do 7 m = 1,n

		if(trim(adjustl(text)) == arq(m,1)) then

		write(*,"(A,1x,A)")(trim(adjustl(arq(m,i))),i=1,2)

		goto 8

		7 end if

		write(*,"(A24)")'Não foi encontrado nada!'

		8 continue

	case(3)

		write(*,"(A34)")'Escreva o que você deseja remover.'

		ii=0

		9 read(*,"(A50)",iostat=ierr)text

		if(ierr/=0) then

		write(*,"(A54)")'Erro na leitura! Digite o que deseja apagar novamente.'

		go to 9

		end if

		if(trim(adjustl(text))=='sair')go to 2

		r = n

		remove:do m = 1,n

		if(trim(adjustl(text)) == arq(m,1)) then

		n = n - 1

		cycle remove

		end if

		ii = ii + 1

		arqaux(ii,:) = arq(m,:)

		end do remove

		arq = arqaux

		if(r == n)go to 10

		close(unit = 1 , status = 'delete' , iostat = ierr)

		open(unit = 1 , file = 'dado.dat' , status = 'new' , iostat = ierr)

		write(1,"(I3)")n

		close(unit = 2 , status = 'delete' , iostat = ierr)

		open(unit = 2 , file = 'lista1.dat' , status = 'new' , iostat = ierr)

		do 11 m = 1 , n

		11 write(2,"(2A512)")(arq(m,i),i=1,2)

		go to 12

		10 write(*,"(A24)")'Não foi encontrado nada.'

		12 continue

	case(4)

		call clearscreen($gclearscreen)

	case(5)

		i = clickmenuqq(loc(winexit))

	case default

		write(*,"(A25)")'Escolha uma opção valida!'

end select

end do

stop

end program