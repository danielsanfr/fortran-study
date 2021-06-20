subroutine adiciona_lista(nl,nc,arq,tit,lista,listaux)

integer esco,nl,nc,j,i,ii,m,iostat,ierr,tam(256,10),r,t,aux(256),a,b

character (512) arq(256,10),arqaux(256,10),text

character (50) tit(1,10)

character (50) lista , listaux

write(*,"(A29)")'Escreva o nome da nova lista.'

3 read(*,"(A)",iostat=ierr)listaux

if(ierr/=0) then

	write(*,"(A45)")'Erro na leitura! Digite o nome denovo.'

	go to 3

end if

if(trim(adjustl(listaux)) == '') then

	write(*,"(A31)")'Escreva um nome para o arquivo!'

	go to 3

end if

if(trim(adjustl(listaux)) == 'sair') return

close(unit = 1 , iostat = ierr)

open(unit = 1 , file = trim(adjustl(listaux)) // '.dat' , status = 'new' , iostat = ierr)
		
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

lista = trim(adjustl(listaux))

write(*,"(A36)")'A nova lista foi criada com sucesso.'

return

end subroutine