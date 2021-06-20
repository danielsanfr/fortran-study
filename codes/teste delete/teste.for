	program deletar
	OPEN(UNIT = 1, FILE = 'DADO.TXT', STATUS = 'OLD', IOSTAT = IERR)
	CLOSE(UNIT = 1, STATUS ='DELETE',IOSTAT = IERR)
	stop
	end