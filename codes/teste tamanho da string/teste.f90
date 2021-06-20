 CHARACTER (15) C (50)
  CHARACTER (25) D
CHARACTER(11) STR(100)
print*,LEN (STR)
print*,LEN('A phrase with 5 trailing blanks. ')

D='daniel'

print*,LEN (C)
print*,LEN (trim(adjustl(D)))
stop
end
