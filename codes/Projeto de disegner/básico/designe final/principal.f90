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

	winfo.TYPE = QWIN$MAX 

	i = SETWSIZEQQ(QWIN$FRAMEWINDOW, winfo) 

	call clearscreen($gclearscreen)

	i = clickmenuqq(QWIN$STATUS)   

	i = clickmenuqq(QWIN$TILE)

oldcur = settextcursor(#0108)

iresult = DISPLAYCURSOR ($gcursoron)

t = 0 ; lista = ''

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

		nl = 0 ; nc = 0

		arq(:,:) = '' ; tit(:,:) = ''

		write(*,"(A29)")'Escreva o nome da nova lista.'

		3 read(*,"(A)",iostat=ierr)lista

		if(ierr/=0) then

			write(*,"(A45)")'Erro na leitura! Digite o nome denovo.'

			go to 3

		end if

		if(trim(adjustl(lista)) == '') then

			write(*,"(A31)")'Escreva um nome para o arquivo!'

			go to 3

		end if

		if(trim(adjustl(lista)) == 'sair') go to 1
		
		close(unit = 1 , iostat = ierr)

		open(unit = 1 , file = trim(adjustl(lista)) // '.dat' , status = 'new' , iostat = ierr)
		
		if(ierr /= 0) then
		
			write(*,"(A56)")'Erro ao criar uma nova lista. Tente digita-la novamente.'
			
			go to 3
			
		end if

		write(*,"(A36)")'Digite o numero de colunas desejado.'

		4 read(*,"(I2)",iostat=ierr)nc

		if(ierr/=0) then

			write(*,"(A45)")'Erro na leitura! Digite o numero de colunas novamente.'

			go to 4

		end if

		if(nc > 10) then

			write(*,"(A48)")'O maximo de colunas 10! Digite outra quantidade.'

			go to 4

		end if

		write(*,"(A31)")'Escreva os titulos das colunas.'

		do 5 m = 1 , nc

		5	read(*,"(A50)")tit(1,m)
		
		write(1,"(I3,I2)")nl,nc

		write(1,"(10A50)")(tit(1,m) , m = 1 , nc)

		write(*,"(A36)")'A nova lista foi criada com sucesso.'

	case(2)

		write(*,"(A40)")'Digite a nome da lista que deseja carregar.'

		6 read(*,"(A)",iostat=ierr)lista

		if(ierr/=0) then

			write(*,"(A38)")'Erro na leitura! Digite o nome denovo.'

			go to 6

		end if

		if(trim(adjustl(lista)) == 'sair') go to 1

		close (unit = 1 , iostat = ierr)

		open(unit = 1 , file = trim(adjustl(lista)) // '.dat' , status = 'old' , iostat = ierr)
		
		if(ierr /= 0) then
		
			write(*,"(A)")'Erro ao abrir esta lista. Tente digita-la novamente.'
			
			go to 6
			
		end if	

		read(1,"(I3,I2)")nl,nc

		read(1,"(10A50)")(tit(1,m) , m = 1 , nc)

		do 7 m = 1 , nl

		7	read(1,"(10A512)")(arq(m,i) , i = 1 , nc)

		write(*,"(A)")'Os dados foram carredados con sucesso!'

	case(3)

		write(*,"(A41)")'Digite o nome da lista que deseja apagar.'

		8 read(*,"(A)",iostat=ierr)listaux

		if(ierr/=0) then

			write(*,"(A38)")'Erro na leitura! Digite o nome denovo.'

			go to 8

		end if

		if(trim(adjustl(listaux)) == 'sair') go to 1

		if(trim(adjustl(listaux)) == trim(adjustl(lista))) then

			write(*,"(A77)")'Esta lista esta em uso. Procure outra lista para que possa apagar esta lista,'

			write(*,"(A)")'ou apague outra lista.'

			go to 1

		end if

		open(unit = 2 , file = trim(adjustl(listaux)) // '.dat' , status = 'old' , iostat = ierr)

		if(ierr /= 0) then

			write(*,"(A)")'Erro ao tentar apagrar esta lista. Tente novamente.'

			go to 8

		end if

		close(unit = 2 , status = 'delete' , iostat = ierr)

	case(4)

		if(lista == '') then

			write(*,"(A)")'Procure um lista para que possa adicionar um dado!'

			go to 1

		end if

		nl = nl + 1

		write(*,"(A36)")'Escreva o que você deseja adicionar.'

		do 9 m = 1 , nc

			10 read(*,"(A512)",iostat=ierr)arq(nl,m)

			if(ierr/=0) then

				write(*,"(A48)")'Erro na leitura! Digite a informação novamente.'

				go to 10

			end if

			if(trim(adjustl(arq(nl,m)))=='sair') then
				
				arq(nl,:) = ''

				nl = nl - 1

				go to 1

		9	end if

		do 11 m = 1 , nl - 1

			if(trim(adjustl(arq(nl,1))) == trim(adjustl(arq(m,1)))) then

				do 12 i = 1 , nc

				12	if(trim(adjustl(arq(nl,i))) == trim(adjustl(arq(m,i)))) iqua = iqua + 1

				if(iqua == nc) then

					write(*,"(A33)")'Isto ja existe no bando de dados!'

					arq(nl,:) = ''

					nl = nl - 1

					write(*,"(A,1x)")(trim(adjustl(arq(m,i))) , i = 1 , nc)

					go to 1

				end if

		11	end if

		close(unit = 1 , status = 'delete' , iostat = ierr)

		open(unit = 1 , file = trim(adjustl(lista)) // '.dat' , status = 'new' , iostat = ierr)

		write(1,"(I3,I2)")nl,nc

		write(1,"(10A50)")(tit(1,m) , m = 1 , nc)

		do 13 m = 1 , nl

		13	write(1,"(10A512)")(arq(m,i) , i = 1 , nc)

	case(5)

		if(lista == '') then

			write(*,"(A)")'Procure um lista para que possa procurar um dado!'

			go to 1

		end if

		a = 0 ; m = 0 ; ii = 0 ; aux = 0

		write(*,"(A35)")'Escreva o que você deseja procurar.'

		14 read(*,"(A50)",iostat=ierr)text

		if(ierr/=0) then

			write(*,"(A56)")'Erro na leitura! Digite o que deseja procurar novamente.'

			go to 14

		end if

		if(trim(adjustl(text))=='sair')go to 1

		do 15 m = 1 , nl

        	if(trim(adjustl(text)) == trim(adjustl(arq(m,1)))) then

				write(*,"(I3,1x,'-',10(1x,A))")m , (trim(adjustl(arq(m,i))) , i = 1 , nc)

				ii = ii + 1

				aux(ii) = m

		15	end if

		select case(ii)

			case(0)

				write(*,"(A24)")'Não foi encontrado nada!'

			case default

				a = m

				write(*,"(I3,1x,'-',1x,A)") a + 1 , 'Sair'

				16	read(*,"(I3)")esco

				if(esco == a + 1) go to 1

				do 17 m = 1 , ii

					if(esco == aux(m)) then

						write(*,"(10(A,10x))")(trim(adjustl(tit(1,i))) , i = 1 , nc)

						write(*,"(10(A,5x))")(trim(adjustl(arq(aux(m),i))) , i = 1 , nc)

						go to 18

				17	end if

				write(*,"(A)")'Escolha uma opção valida!'

				go to 16

				18 continue

		end select

	case(6)

		if(lista == '') then

			write(*,"(A)")'Procure um lista para que possa remover um dado!'

			go to 1

		end if

		a = 0 ; r = 0 ; i = 0 ; ii = 0 ; aux = 0
		
		write(*,"(A34)")'Escreva o que você deseja remover.'

		19 read(*,"(A50)",iostat=ierr)text

		if(ierr/=0) then

			write(*,"(A54)")'Erro na leitura! Digite o que deseja apagar novamente.'

			go to 19

		end if

		if(trim(adjustl(text))=='sair')go to 1

		do 20 m = 1 , nl

        	if(trim(adjustl(text)) == arq(m,1)) then

				write(*,"(I3,1x,'-',10(1x,A))")m , (trim(adjustl(arq(m,i))) , i = 1 , nc)

				a = a + 1

				aux(a) = m

		20	end if

		select case(a)

			case(0)

				write(*,"(A24)")'Não foi encontrado nada que podese ser apagado.'

			case default

				b = m

				write(*,"(I3,1x,'-',1x,A)") b + 1 , 'Sair'

				21	read(*,"(I3)")esco

				if(esco == b + 1) go to 1

				r = nl

				do 22 m = 1 , a

					if(esco == aux(m)) then

						remove: do j = 1 , nl

							if(esco == j) then

								nl = nl - 1

								cycle remove

							end if

							ii = ii + 1

							arqaux(ii,:) = arq(j,:)

						end do remove

				22	end if

				if(r == nl) then

					write(*,"(A25)")'Escolha uma opção valida!'

					go to 21

				end if

				arq = arqaux

				close(unit = 1 , status = 'delete' , iostat = ierr)

				open(unit = 1 , file = trim(adjustl(lista)) // '.dat' , status = 'new' , iostat = ierr)

				write(1,"(I3,I2)")nl,nc

				write(1,"(10A50)")(tit(1,m) , m = 1 , nc)

				do 24 m = 1 , nl

				24 write(1,"(10A512)")(arq(m,i) , i = 1 , nc)

				23 continue

		end select

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