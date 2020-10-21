#To be inserted @ 80036f5c
.include "../../Globals.s"
.include "../Header.s"

lwz  r30,OFST_MnSlChrDefineIDs(rtoc)
subi  r30,r30,0x20
