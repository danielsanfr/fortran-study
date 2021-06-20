!-------------------Player x Computador-----------------------!

program computador

allocatable, integer :: pessoas(:,:)

common cor1,cor2,es,casa

integer casa1,casa2

allocate(pessoas(3,3))

write(*,*)'Jogador escolha sua cor'

read(*,*)cor1

!cor2 =

pessoas = 0

call rede()

tempo: do t = 1,5

write(*,*)'jogador 1'

20 read(*,*)casa1

j = (casa1-1)/3+1

i = mod(casa1-1,3)+1

if(pessoas(i,j).ne.0) then

   message = messageboxqq('Esta jogada não permitida!'c,'Atenção',MB$OK.OR.MB$ICONEXCLAMATION)

goto 20 ; end if

pessoas(i,j) = 1

call rede()

jog1 = 0 ; jog2 = 0

!---------------------teste da casa--------------------------!

i = 1 ; do 21 j = 1,3
21	if(pessoas(i,j)==1)jog1 = jog1 + 1

if(jog1==3) then

write(*,*)'voce e o vencedor jogador 1'

goto 15 ; end if

jog1 = 0 ; jog2 = 0 ; i = 2 ; do 22 j = 1,3

22	if(pessoas(i,j)==1)jog1 = jog1 + 1

if(jog1==3) then

write(*,*)'voce e o vencedor jogador 1'

goto 15 ; end if

jog1 = 0 ; jog2 = 0 ; i = 3 ; do 23 j = 1,3

23	if(pessoas(i,j)==1)jog1 = jog1 + 1

if(jog1==3) then

write(*,*)'voce e o vencedor jogador 1'

goto 15 ; end if

jog1 = 0 ; jog2 = 0 ; j = 1 ; do 24 i = 1,3

25	if(pessoas(i,j)==1)jog1 = jog1 + 1

if(jog1==3) then

write(*,*)'voce e o vencedor jogador 1'

goto 15 ; end if

jog1 = 0 ; jog2 = 0 ; j = 2 ; do 26 i = 1,3

26	if(pessoas(i,j)==1)jog1 = jog1 + 1

if(jog1==3) then

write(*,*)'voce e o vencedor jogador 1'

goto 15 ; end if

jog1 = 0 ; jog2 = 0 ; j = 3 ; do 27 i = 1,3

27	if(pessoas(i,j)==1)jog1 = jog1 + 1

if(jog1==3) then

write(*,*)'voce e o vencedor jogador 1'

goto 15 ; end if

jog1 = 0 ; jog2 = 0 ; do 28 i = 1,3 ; j = i

28	if(pessoas(i,j)==1)jog1 = jog1 + 1

if(jog1==3) then

write(*,*)'voce e o vencedor jogador 1'

goto 15 ; end if

jog1 = 0 ; jog2 = 0 ; do 29 i = 1,3

if(i==1) j = i + 2
if(i==2) j = i
if(i==3) j = i - 2

29	if(pessoas(i,j)==1)jog1 = jog1 + 1

if(jog1==3) then

write(*,*)'voce e o vencedor jogador 1'

goto 15 ; end if

!---------------------fim do teste---------------------------!
if(jog1==3) then

write(*,*) 'Jogador 1 ganhou!!!'

goto 15 ; end if

write(*,*)'jogador 2'

2 read(*,*)casa2

j = (casa2-1)/3+1

i = mod(casa2-1,3)+1

if(pessoas(i,j).ne.0) then

   message = messageboxqq('Esta jogada não permitida!'c,'Atenção',MB$OK.OR.MB$ICONEXCLAMATION)

goto 2 ; end if

pessoas(i,j) = 2

call rede()

jog1 = 0 ; jog2 = 0

!---------------------teste da casa--------------------------!

i = 1 ; do 20 j = 1,3
20	if(pessoas(i,j)==2)jog2 = jog2 + 1

if(jog2==3) then

write(*,*)'voce e o vencedor jogador 2'

goto 15 ; end if

jog1 = 0 ; jog2 = 0 ; i = 2 ; do 21 j = 1,3

21	if(pessoas(i,j)==2)jog2 = jog2 + 1

if(jog2==3) then

write(*,*)'voce e o vencedor jogador 2'

goto 15 ; end if

jog1 = 0 ; jog2 = 0 ; i = 3 ; do 22 j = 1,3

22	if(pessoas(i,j)==2)jog2 = jog2 + 1

if(jog2==3) then

write(*,*)'voce e o vencedor jogador 2'

goto 15 ; end if

jog1 = 0 ; jog2 = 0 ; j = 1 ; do 23 i = 1,3

23	if(pessoas(i,j)==2)jog2 = jog2 + 1

if(jog2==3) then

write(*,*)'voce e o vencedor jogador 2'

goto 35 ; end if

jog1 = 0 ; jog2 = 0 ; j = 2 ; do 24 i = 1,3

24	if(pessoas(i,j)==2)jog2 = jog2 + 1

if(jog2==3) then

write(*,*)'voce e o vencedor jogador 2'

goto 15 ; end if

jog1 = 0 ; jog2 = 0 ; j = 3 ; do 25 i = 1,3

25	if(pessoas(i,j)==2)jog2 = jog2 + 1

if(jog2==3) then

write(*,*)'voce e o vencedor jogador 2'

goto 35 ; end if

jog1 = 0 ; jog2 = 0 ; do 26 i = 1,3 ; j = i

26	if(pessoas(i,j)==2)jog2 = jog2 + 1

if(jog2==3) then

write(*,*)'voce e o vencedor jogador 2'

goto 25 ; end if

jog1 = 0 ; jog2 = 0 ; do 27 i = 1,3

if(i==1) j = i + 2
if(i==2) j = i
if(i==3) j = i - 2

27	if(pessoas(i,j)==2)jog2 = jog2 + 1

if(jog2==3) then

write(*,*)'voce e o vencedor jogador 2'

goto 35 ; end if

!---------------------fim do teste---------------------------!

print*,jog2

if(jog2==3) then

write(*,*) 'Jogador 2 ganhou!!!'

goto 35 ; end if
	
end do tempo

35 stop

end