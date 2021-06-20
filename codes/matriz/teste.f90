integer,allocatable :: a(:,:),b(:,:),c(:,:)
integer :: i,j,k
allocate(a(2,2),b(2,3),c(2,3))
print*,"digite a primeira matriz"
read(*,20)((a(i,j),j = 1,2),i = 1,2)
20 format(2(2(i3)))
write(*,1)((a(i,j),j=1,2),i=1,2)
1 format(2(2(2x,i3)/))
print*,"digite a segunda matriz"
read(*,25)((b(i,j),j = 1,3),i = 1,2)
25 format(2(3(i3)))
write(*,15)((b(i,j),j=1,3),i=1,2)
15 format(2(3(2x,i3)/))
do 2 i = 1,2 ; do 2 j = 1,3 ;c(i,j) = 0 ; do 2 k = 1,2
c(i,j) = c(i,j) + a(i,k)*b(k,j)
2 end do
write(*,3)((c(i,j),j=1,3),i=1,2)
3 format(2(3(2x,i3)/))
stop ; end