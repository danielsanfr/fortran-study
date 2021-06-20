subroutine carrega_lista(lista,nl,nc,tit,arq)

integer esco,nl,nc,j,i,ii,m,iostat,ierr,tam(256,10),r,t,aux(256),a,b

character (512) arq(256,10),arqaux(256,10),text

character (50) tit(1,10)

character (50) lista , listaux

write(*,"(A43)")'Digite a nome da lista que deseja carregar.'

6 read(*,"(A)",iostat=ierr)listaux

if(ierr/=0) then

	write(*,"(A38)")'Erro na leitura! Digite o nome denovo.'

	go to 6

end if

if(trim(adjustl(listaux)) == 'sair') return

close (unit = 1 , iostat = ierr)

open(unit = 1 , file = trim(adjustl(listaux)) // '.dat' , status = 'old' , iostat = ierr)
		
if(ierr /= 0) then
		
	write(*,"(A)")'Erro ao abrir esta lista. Tente digita-la novamente.'
			
	go to 6
			
end if	

read(1,"(I3,I2)")nl,nc

read(1,"(10A50)")(tit(1,m) , m = 1 , nc)

do 7 m = 1 , nl

7	read(1,"(10A512)")(arq(m,i) , i = 1 , nc)

lista = trim(adjustl(listaux))

write(*,"(A)")'Os dados foram carredados con sucesso!'

return

end subroutine