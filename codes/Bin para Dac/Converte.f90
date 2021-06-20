program Bin

integer b1,b2,b3,b4,b5,b6,b7,b8

write(*,*) 'Este program converte de bin para dec, comece da esquerda.'

write(*,*) 'Digite o promeiro N (b1)'

read(*,*)b1

write(*,*) 'Digite o segundo N (b2)'

read(*,*)b2

write(*,*) 'Digite o terceiro N (b3)'

read(*,*)b3

write(*,*) 'Digite o quarto N (b4)'

read(*,*)b4

write(*,*) 'Digite o quinto N (b5)'

read(*,*)b5

write(*,*) 'Digite o sexto N (b6)'

read(*,*)b6

write(*,*) 'Digite o setimo N (b7)'

read(*,*)b7

write(*,*) 'Digite o oitavo N (b8)'

read(*,*)b8

write(*,*) ''

write(*,*) 'O numero em dicimal e:'

write(*,*)b1*128+b2*64+b3*32+b4*16+b5*8+b6*4+b7*2+b8*1

stop
end program