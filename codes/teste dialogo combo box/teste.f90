use msflib
use dialogm
type (dialog) dlg
include 'resource.fd'
INTEGER j, num, test, i
  INTEGER, ALLOCATABLE :: values(:)
  LOGICAL retlog

retlog = dlginit(idd_dialog1,dlg)
 retlog = DlgSet ( dlg, IDC_COMBO1, 3, DLG_NUMITEMS )
  retlog = DlgSet ( dlg, IDC_COMBO1, "Moe", 1 )
  retlog = DlgSet ( dlg, IDC_COMBO1, "Larry", 2 )
  retlog = DlgSet ( dlg, IDC_COMBO1, "Curly", 3 )

  retlog = DLGSET ( dlg, IDC_COMBO1, 4)
  retlog = DLGSET ( dlg, IDC_COMBO1, "Shemp", 4)


iret = dlgmodal(dlg)
 if(iret == 2) then
      call dlguninit(dlg)
      stop
   end if


  retlog = DLGGET (dlg, IDC_COMBO1, num, DLG_NUMITEMS)
  ALLOCATE (values(num))
  j = 1
  test = -1
  DO WHILE (test .NE. 0)
     retlog = DLGGET (dlg, IDC_COMBO1, values(j), j)
     test = values(j)
     j = j + 1
  END DO

call dlguninit(dlg)
print*,j
print*,(values(i),i=1,j)
  end