subroutine apaga_lista(lista)

integer esco,nl,nc,j,i,ii,m,iostat,ierr,tam(256,10),r,t,aux(256),a,b

character (512) arq(256,10),arqaux(256,10),text

character (50) tit(1,10)

character (50) lista , listaux

write(*,"(A41)")'Digite o nome da lista que deseja apagar.'

8 read(*,"(A)",iostat=ierr)listaux

if(ierr/=0) then

	write(*,"(A38)")'Erro na leitura! Digite o nome denovo.'

	go to 8

end if

if(trim(adjustl(listaux)) == 'sair') return

if(trim(adjustl(listaux)) == trim(adjustl(lista))) then

	write(*,"(A77)")'Esta lista esta em uso. Procure outra lista para que possa apagar esta lista,'

	write(*,"(A)")'ou apague outra lista.'

	return

end if

open(unit = 2 , file = trim(adjustl(listaux)) // '.dat' , status = 'old' , iostat = ierr)

if(ierr /= 0) then

	write(*,"(A)")'Erro ao tentar apagrar esta lista. Tente novamente.'

	go to 8

end if

close(unit = 2 , status = 'delete' , iostat = ierr)

return

end subroutine