#To be inserted @ 80178f34
.include "../../Globals.s"
.include "../Header.s"

lwz r3,OFST_Metadata_FtIntNum(rtoc)
cmpw r20,r3

lwz r3,0x30(r22)
lwz r3,0x18(r3)
lwz r3,0x4(r3)
lwz r3,0x8(r3)
lwz r3,0x8(r3)
lwz r3,0x64(r3)
li r4, 0
stw r4,0x04(r3)
