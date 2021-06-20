program remover
use msflib
integer,allocatable :: arqui(:,:),aux(:,:)
integer i,ii,n,esco,v,lin,m
n=0
allocate(arqui(5,2),aux(5,2))
arqui = 0 ; aux = 0
do while(.true.)
read(*,*)esco
select case(esco)
case(1)
n = n+1
read(*,*)v
arqui(n,1)=v
call clearscreen($gclearscreen)
case(2)
write(*,*)(arqui(i,1),i=1,5)
call sleep(2)
call clearscreen($gclearscreen)
case(3)
m=0
read(*,*)lin
remove:do i = 1,5
if(i == lin)cycle remove
m = m+1
aux(m,1)=arqui(i,1)
end do remove
arqui = aux
n = n-1
case(4)
i = clickmenuqq(loc(winexit))
end select
end do
stop
end program