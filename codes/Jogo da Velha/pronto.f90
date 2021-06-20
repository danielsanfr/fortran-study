program jogo_da_velha
use bcat

call jogador

call CLEARSCREEN($GCLEARSCREEN)

allocate(pessoas(3,3),pessoas2(3,3))

if(es == 1)call player
if(es == 2)call computador

stop

end