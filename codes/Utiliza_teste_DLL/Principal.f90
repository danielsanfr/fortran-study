PROGRAM PRINCIPAL

!MS$ ATTRIBUTES DLLIMPORT :: MEU_TESTE

write (* , *)'escreva "a" e "b"'

read(*,*)a,b

call MEU_TESTE(a,b,s)

write(*,*)'soma: s =',s

STOP

END PROGRAM