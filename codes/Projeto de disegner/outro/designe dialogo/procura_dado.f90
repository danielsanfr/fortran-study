subroutine procura_dado(lista,arq,nc,nl,aux)

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

	write(*,"(A)")'Procure um lista para que possa procurar um dado!'

	return

end if

a = 0 ; m = 0 ; ii = 0 ; aux = 0

write(*,"(A35)")'Escreva o que você deseja procurar.'

14 read(*,"(A50)",iostat=ierr)text

if(ierr/=0) then

	write(*,"(A56)")'Erro na leitura! Digite o que deseja procurar novamente.'

	go to 14

end if

if(trim(adjustl(text))=='sair') return

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

		if(esco == a + 1) return

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

return

end subroutine