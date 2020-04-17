#To be inserted @ 801c28f0
.include "../../../Globals.s"
.include "../../Header.s"

lwz r28,OFST_grFunction(rtoc)
subi  r28,r28,0x34
