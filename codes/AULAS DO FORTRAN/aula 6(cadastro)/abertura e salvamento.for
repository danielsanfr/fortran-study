	integer ue,us
	real salaro,salmin
	character funcio * 20,cargo * 10
	ue = 5
	us = 6
	open(unit=ue,file='CADASTRO',status='old')
	open(unit=ue,file='MARAJAS',status='new')

C	leitura do salario minimo
	
	read(ue,11)salmin
11	format(f9.2)

C	criação do arquivo de funcionarios
C	com mais de 30 salarios

20	continue

	read(ue,21,end=30)funcio,cargo,salaro
21	format(a20,a10,f12.2)
	if(salaro.gt.30*salmin)then
	write(ue,22)funcio,cargo,salaro
22	format(1h0,a20,a10,f12.2)
	end if
	
	goto 20
	
30	continue
	
C	fechamento do arquivo

	endfile us
	close(unit=us,status='keep')
	close(unit=ue,status='keep')

	stop
	end