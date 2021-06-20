program dodialog

use msflib

use dialogm

include 'resource.fd'

integer iret

type (dialog) dlg

logical retlog

  retlog = dlginit(idd_dialog1,dlg)
  
  iret = dlgset(dlg,idc_tab1,1)
  iret = dlgset(dlg,idc_tab1,'teste',1)
  iret = dlgset(dlg,idc_tab1,2)
  iret = dlgset(dlg,idc_tab1,'teste2',2)
  
  iret = dlgmodal(dlg)  
  call dlguninit(dlg)

end program dodialog

