#To be inserted @ 80036e34
.include "../../Globals.s"
.include "../Header.s"

lwz  r3,OFST_MnSlChrDefineIDs(rtoc)
subi  r0,r3,0x20
