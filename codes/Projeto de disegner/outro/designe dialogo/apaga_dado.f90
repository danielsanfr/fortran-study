subroutine apaga_dado(lista,arq,arqux,tit,nl,nc,aux)

use msflib

use dialogm

include 'resource.fd'

type (xycoord) pos

type (dialog) dlg

integer message,esco,nl,nc,j,i,ii,m,iostat,ierr,tam(256,10),r,t,aux(256),a,b,iret

character (512) arq(256,10),arqaux(256,10),text

character (50) tit(1,10)

character (50) lista , listaux

logical retlog

if(lista == '') then

	write(*,"(A)")'Procure um lista para que possa remover um dado!'

	return

end if

a = 0 ; r = 0 ; i = 0 ; ii = 0 ; aux = 0
		
write(*,"(A34)")'Escreva o que você deseja remover.'

19 read(*,"(A50)",iostat=ierr)text

if(ierr/=0) then

	write(*,"(A54)")'Erro na leitura! Digite o que deseja apagar novamente.'

	go to 19

end if

if(trim(adjustl(text))=='sair') return

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

		if(esco == b + 1) return

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

return

end subroutine