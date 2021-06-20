program teste

!MS$ attributes dllexport :: teste_senha

character (30) senha

read*,senha

call teste_senha(senha,con)

if(con == -1) then

	print*,'senha errada!'

else

	print*,'senha certa!'

end if

stop

end