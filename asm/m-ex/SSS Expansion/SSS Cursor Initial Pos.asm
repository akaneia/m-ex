#To be inserted @ 8025b39c
.include "../../Globals.s"
.include "../Header.s"

lwz r6,OFST_mexData(rtoc)
lwz r6,Arch_Menu(r6)
lwz r6,Arch_Menu_MenuParam(r6)
addi r6,r6,MenuParam_SSSCursorPos

Exit: