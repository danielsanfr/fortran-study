program datahora

USE DFPORT

USE MSFLIB

character(8) hora

do

hora = CLOCK ()

call sleepqq(1000)

CALL CLEARSCREEN($GCLEARSCREEN)

write (*,*) hora

end do

end

