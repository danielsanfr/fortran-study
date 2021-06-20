program principal_designer

use msflib

use dialogm

!include 'resource.fd'

type (xycoord) pos

type (dialog) dlg

type (qwinfo) winfo

integer esco,n,j,i,ii,m,iostat

character (512) arq(256,5),arqaux(256,5), text

open(unit = 1 , file = 'dado.dat' , status = 'old' , iostat = ierr)
open(unit = 2 , file = 'lista1.dat' , status = 'old' , iostat = ierr)
print*,ierr
read(1,"(I3)")n

do 1 m = 1 , n

1 read(2,"(2A512)")(arq(m,i),i=1,2)

oldcur = settextcursor(#0108)

iresult = DISPLAYCURSOR ($gcursoron)

do while(.true.)

print*,'1 - Adicionar'
print*,'2 - Procurar'
print*,'3 - Remover'
print*,'4 - Sair'

read(*,*)esco

select case(esco)

case(1)

n = n + 1

read(*,"(A50)")text

arq(n,1) = trim(adjustl(text))

read(*,"(A512)")text

arq(n,2) = trim(adjustl(text))

close(unit = 1 , status = 'delete' , iostat = ierr)

open(unit = 1 , file = 'dado.dat' , status = 'new' , iostat = ierr)

write(1,"(I3)")n

close(unit = 2 , status = 'delete' , iostat = ierr)

open(unit = 2 , file = 'lista1.dat' , status = 'new' , iostat = ierr)

do 6 m = 1 , n

6 write(2,"(2A512)")(arq(m,i),i=1,2)

case(2)

read(*,"(A50)")text

do m = 1,n

if(trim(adjustl(text)) == arq(m,1))goto 10

end do

write(*,"(A24)")'Não foi encontrado nada!'

10 write(*,*)(trim(adjustl(arq(m,i))),i=1,2)

case(3)

ii=0

read(*,*)text

remove:do m = 1,n

if(trim(adjustl(text)) == arq(m,1))cycle remove

ii = ii + 1

arqaux(ii,:)=arq(m,:)

end do remove

arq = arqaux

n = n - 1

close(unit = 1 , status = 'delete' , iostat = ierr)

open(unit = 1 , file = 'dado.dat' , status = 'new' , iostat = ierr)

write(1,"(I3)")n

close(unit = 2 , status = 'delete' , iostat = ierr)

open(unit = 2 , file = 'lista1.dat' , status = 'new' , iostat = ierr)

do 5 m = 1 , n

5 write(2,"(2A512)")(arq(m,i),i=1,2)

case(4)

goto 20

end select

end do

20 i = clickmenuqq(loc(winexit))

stop

end program