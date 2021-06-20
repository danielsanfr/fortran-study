module bcat
use dflib
use dfport
TYPE (rccoord) pos
integer,allocatable	:: pessoas(:,:),pessoas2(:,:)
integer				:: i,j,ii,jj,l,iz,jz,ninfec,nimune,aux(2),inf,t
real				:: a,b,z
integer				   casa1,casa2
common cor1,cor2,es,casa
contains

subroutine rede()
integer ix,iy,cor
common cor1,cor2,es,casa
real lquad
call CLEARSCREEN($GCLEARSCREEN)
lquad = 350/float(3)
ix = 50
iy = 50
avx = 150
avy = 50
do 1 i = 1,3
	do 1 j = 1,3
		select case(pessoas(i,j))
		case(0)
			cor = 15
		case(1)
			cor = cor1
		case(2)
			cor = cor2
		end select
		call setcolor(cor)
		call rectangle($gfillinterior,ix+lquad*(i-1)+avx,iy+lquad*(j-1)+avy,ix+lquad*i+avx,iy+lquad*j+avy)
		call setcolor(0)
1		call rectangle($gborder,ix+lquad*(i-1)+avx,iy+lquad*(j-1)+avy,ix+lquad*i+avx,iy+lquad*j+avy)
end subroutine

subroutine jogador

common cor1,cor2,es,casa

41 print*,"1 - Player x Player"

print*,"2 - Player x Computador"

read*,es

if(es /= 1.and.es /= 2) goto 41

return

end subroutine


!-------------------Player x Player-----------------------!

subroutine Player

common cor1,cor2,es,casa

40 write(*,*)'Jogador 1 escolha sua cor'

read(*,*)cor1

write(*,*)'Jogador 2 escolha sua cor'

read(*,*)cor2

if(cor1 == cor2) goto 40

pessoas = 0

call rede()

tempo: do t = 1,5

write(*,*)'jogador 1'

2 read(*,*)casa1

j = (casa1-1)/3+1

i = mod(casa1-1,3)+1

if(pessoas(i,j).ne.0) then

   message = messageboxqq('Jogada não permitida!'c,'Atenção',MB$OK.OR.MB$ICONEXCLAMATION)

goto 2 ; end if

pessoas(i,j) = 1

call rede()

jog1 = 0 ; jog2 = 0

!---------------------teste da casa--------------------------!

i = 1 ; do 3 j = 1,3
3	if(pessoas(i,j)==1)jog1 = jog1 + 1

if(jog1==3) then

write(*,*)'voce e o vencedor jogador 1'

goto 15 ; end if

jog1 = 0 ; jog2 = 0 ; i = 2 ; do 4 j = 1,3

4	if(pessoas(i,j)==1)jog1 = jog1 + 1

if(jog1==3) then

write(*,*)'voce e o vencedor jogador 1'

goto 15 ; end if

jog1 = 0 ; jog2 = 0 ; i = 3 ; do 5 j = 1,3

5	if(pessoas(i,j)==1)jog1 = jog1 + 1

if(jog1==3) then

write(*,*)'voce e o vencedor jogador 1'

goto 15 ; end if

jog1 = 0 ; jog2 = 0 ; j = 1 ; do 6 i = 1,3

6	if(pessoas(i,j)==1)jog1 = jog1 + 1

if(jog1==3) then

write(*,*)'voce e o vencedor jogador 1'

goto 15 ; end if

jog1 = 0 ; jog2 = 0 ; j = 2 ; do 7 i = 1,3

7	if(pessoas(i,j)==1)jog1 = jog1 + 1

if(jog1==3) then

write(*,*)'voce e o vencedor jogador 1'

goto 15 ; end if

jog1 = 0 ; jog2 = 0 ; j = 3 ; do 8 i = 1,3

8	if(pessoas(i,j)==1)jog1 = jog1 + 1

if(jog1==3) then

write(*,*)'voce e o vencedor jogador 1'

goto 15 ; end if

jog1 = 0 ; jog2 = 0 ; do 9 i = 1,3 ; j = i

9	if(pessoas(i,j)==1)jog1 = jog1 + 1

if(jog1==3) then

write(*,*)'voce e o vencedor jogador 1'

goto 15 ; end if

jog1 = 0 ; jog2 = 0 ; do 10 i = 1,3

if(i==1) j = i + 2
if(i==2) j = i
if(i==3) j = i - 2

10	if(pessoas(i,j)==1)jog1 = jog1 + 1

if(jog1==3) then

write(*,*)'voce e o vencedor jogador 1'

goto 15 ; end if

!---------------------fim do teste---------------------------!
if(t == 5) then
write(*,*)'ninguem ganhou!'
goto 15
end if

write(*,*)'jogador 2'

11 read(*,*)casa2

j = (casa2-1)/3+1

i = mod(casa2-1,3)+1

if(pessoas(i,j).ne.0) then

   message = messageboxqq('Jogada não permitida!'c,'Atenção',MB$OK.OR.MB$ICONEXCLAMATION)

goto 11 ; end if

pessoas(i,j) = 2

call rede()

jog1 = 0 ; jog2 = 0

!---------------------teste da casa--------------------------!

i = 1 ; do 12 j = 1,3
12	if(pessoas(i,j)==2)jog2 = jog2 + 1

if(jog2==3) then

write(*,*)'voce e o vencedor jogador 2'

goto 15 ; end if

jog1 = 0 ; jog2 = 0 ; i = 2 ; do 13 j = 1,3

13	if(pessoas(i,j)==2)jog2 = jog2 + 1

if(jog2==3) then

write(*,*)'voce e o vencedor jogador 2'

goto 15 ; end if

jog1 = 0 ; jog2 = 0 ; i = 3 ; do 14 j = 1,3

14	if(pessoas(i,j)==2)jog2 = jog2 + 1

if(jog2==3) then

write(*,*)'voce e o vencedor jogador 2'

goto 15 ; end if

jog1 = 0 ; jog2 = 0 ; j = 1 ; do 16 i = 1,3

16	if(pessoas(i,j)==2)jog2 = jog2 + 1

if(jog2==3) then

write(*,*)'voce e o vencedor jogador 2'

goto 15 ; end if

jog1 = 0 ; jog2 = 0 ; j = 2 ; do 17 i = 1,3

17	if(pessoas(i,j)==2)jog2 = jog2 + 1

if(jog2==3) then

write(*,*)'voce e o vencedor jogador 2'

goto 15 ; end if

jog1 = 0 ; jog2 = 0 ; j = 3 ; do 18 i = 1,3

18	if(pessoas(i,j)==2)jog2 = jog2 + 1

if(jog2==3) then

write(*,*)'voce e o vencedor jogador 2'

goto 15 ; end if

jog1 = 0 ; jog2 = 0 ; do 19 i = 1,3 ; j = i

19	if(pessoas(i,j)==2)jog2 = jog2 + 1

if(jog2==3) then

write(*,*)'voce e o vencedor jogador 2'

goto 15 ; end if

jog1 = 0 ; jog2 = 0 ; do 20 i = 1,3

if(i==1) j = i + 2
if(i==2) j = i
if(i==3) j = i - 2

20	if(pessoas(i,j)==2)jog2 = jog2 + 1

if(jog2==3) then

write(*,*)'voce e o vencedor jogador 2'

goto 15 ; end if

!---------------------fim do teste---------------------------!
end do tempo

15 return

end subroutine




!-------------------Player x Computador-----------------------!

subroutine computador

common cor1,cor2,es,casa

50 write(*,*)'Jogador escolha sua cor'

read(*,*)cor1

cor2 = mod(irand(),15)

if(cor1 == cor2) goto 50

pessoas = 0

call rede()

tempo: do t = 1,5

write(*,*)'jogador 1'

21 read(*,*)casa1

j = (casa1-1)/3+1

i = mod(casa1-1,3)+1

if(pessoas(i,j).ne.0) then

   message = messageboxqq('Esta jogada não permitida!'c,'Atenção',MB$OK.OR.MB$ICONEXCLAMATION)

goto 21 ; end if

pessoas(i,j) = 1

call rede()

jog1 = 0 ; jog2 = 0

!---------------------teste da casa--------------------------!

i = 1 ; do 22 j = 1,3
22	if(pessoas(i,j)==1)jog1 = jog1 + 1

if(jog1==3) then

write(*,*)'voce e o vencedor jogador 1'

goto 35 ; end if

jog1 = 0 ; jog2 = 0 ; i = 2 ; do 23 j = 1,3

23	if(pessoas(i,j)==1)jog1 = jog1 + 1

if(jog1==3) then

write(*,*)'voce e o vencedor jogador 1'

goto 35 ; end if

jog1 = 0 ; jog2 = 0 ; i = 3 ; do 24 j = 1,3

24	if(pessoas(i,j)==1)jog1 = jog1 + 1

if(jog1==3) then

write(*,*)'voce e o vencedor jogador 1'

goto 35 ; end if

jog1 = 0 ; jog2 = 0 ; j = 1 ; do 25 i = 1,3

25	if(pessoas(i,j)==1)jog1 = jog1 + 1

if(jog1==3) then

write(*,*)'voce e o vencedor jogador 1'

goto 35 ; end if

jog1 = 0 ; jog2 = 0 ; j = 2 ; do 26 i = 1,3

26	if(pessoas(i,j)==1)jog1 = jog1 + 1

if(jog1==3) then

write(*,*)'voce e o vencedor jogador 1'

goto 35 ; end if

jog1 = 0 ; jog2 = 0 ; j = 3 ; do 27 i = 1,3

27	if(pessoas(i,j)==1)jog1 = jog1 + 1

if(jog1==3) then

write(*,*)'voce e o vencedor jogador 1'

goto 35 ; end if

jog1 = 0 ; jog2 = 0 ; do 28 i = 1,3 ; j = i

28	if(pessoas(i,j)==1)jog1 = jog1 + 1

if(jog1==3) then

write(*,*)'voce e o vencedor jogador 1'

goto 35 ; end if

jog1 = 0 ; jog2 = 0 ; do 29 i = 1,3

if(i==1) j = i + 2
if(i==2) j = i
if(i==3) j = i - 2

29	if(pessoas(i,j)==1)jog1 = jog1 + 1

if(jog1==3) then

write(*,*)'voce e o vencedor jogador 1'

goto 35 ; end if

!---------------------fim do teste---------------------------!
if(t == 5) then
write(*,*)'voce nao ganhou!'
goto 35
end if

30 casa2 = mod(irand(),9)

if(casa2 == 0)casa2 = 1

j = (casa2-1)/3+1

i = mod(casa2-1,3)+1

if(pessoas(i,j).ne.0) goto 30

pessoas(i,j) = 2

call rede()

jog1 = 0 ; jog2 = 0

!---------------------teste da casa--------------------------!

i = 1 ; do 31 j = 1,3
31	if(pessoas(i,j)==2)jog2 = jog2 + 1

if(jog2==3) then

write(*,*)'Jogador 1 perdeu!'

goto 35 ; end if

jog1 = 0 ; jog2 = 0 ; i = 2 ; do 32 j = 1,3

32	if(pessoas(i,j)==2)jog2 = jog2 + 1

if(jog2==3) then

write(*,*)'Jogador 1 perdeu!'

goto 35 ; end if

jog1 = 0 ; jog2 = 0 ; i = 3 ; do 33 j = 1,3

33	if(pessoas(i,j)==2)jog2 = jog2 + 1

if(jog2==3) then

write(*,*)'Jogador 1 perdeu!'

goto 35 ; end if

jog1 = 0 ; jog2 = 0 ; j = 1 ; do 34 i = 1,3

34	if(pessoas(i,j)==2)jog2 = jog2 + 1

if(jog2==3) then

write(*,*)'Jogador 1 perdeu!'

goto 35 ; end if

jog1 = 0 ; jog2 = 0 ; j = 2 ; do 36 i = 1,3

36	if(pessoas(i,j)==2)jog2 = jog2 + 1

if(jog2==3) then

write(*,*)'Jogador 1 perdeu!'

goto 35 ; end if

jog1 = 0 ; jog2 = 0 ; j = 3 ; do 37 i = 1,3

37	if(pessoas(i,j)==2)jog2 = jog2 + 1

if(jog2==3) then

write(*,*)'Jogador 1 perdeu!'

goto 35 ; end if

jog1 = 0 ; jog2 = 0 ; do 38 i = 1,3 ; j = i

38	if(pessoas(i,j)==2)jog2 = jog2 + 1

if(jog2==3) then

write(*,*)'Jogador 1 perdeu!'

goto 35 ; end if

jog1 = 0 ; jog2 = 0 ; do 39 i = 1,3

if(i==1) j = i + 2
if(i==2) j = i
if(i==3) j = i - 2

39	if(pessoas(i,j)==2)jog2 = jog2 + 1

if(jog2==3) then

write(*,*)'Jogador 1 perdeu!'

goto 35 ; end if
!---------------------fim do teste---------------------------!

end do tempo

write(*,*)'ninguem ganhou!'

35 return

end subroutine


end module