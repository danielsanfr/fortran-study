subroutine adiciona_dado(lista,nc,nl,arq,tit)

integer esco,nl,nc,j,i,ii,m,iostat,ierr,tam(256,10),r,t,aux(256),a,b

character (512) arq(256,10),arqaux(256,10),text

character (50) tit(1,10)

character (50) lista , listaux

if(lista == '') then

	write(*,"(A)")'Procure um lista para que possa adicionar um dado!'

	return

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

		return

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

			return

		end if

11	end if

close(unit = 1 , status = 'delete' , iostat = ierr)

open(unit = 1 , file = trim(adjustl(lista)) // '.dat' , status = 'new' , iostat = ierr)

write(1,"(I3,I2)")nl,nc

write(1,"(10A50)")(tit(1,m) , m = 1 , nc)

do 13 m = 1 , nl

13	write(1,"(10A512)")(arq(m,i) , i = 1 , nc)

return

end subroutine