program tst

integer casa,linha,coluna

1 read(*,*)casa

linha = (casa-1)/3+1

coluna = mod(casa-1,3)+1

print*,linha,coluna

goto 1

stop

end program