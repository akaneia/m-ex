#To be inserted @ 80032094
.include "../../Globals.s"
.include "../Header.s"

lwz  r29,OFST_MnSlChrDefineIDs(rtoc)
subi  r29,r29,0x20
