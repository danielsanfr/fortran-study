subroutine teste_senha(senha)

!MS$ attributes dllimport :: teste_senha

integer con

character (30) senha

if(trim(adjustl(senha)) == '123456') then

	con = 1

else

	con = -1

end if

return

end subroutine