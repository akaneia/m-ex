#To be inserted @ 80031ae8
.include "../../../Globals.s"
.include "../Header.s"

lwz  r31,OFST_MnSlChrDefineIDs(rtoc)
subi  r31,r31,0x20
