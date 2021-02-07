#To be inserted @ 80026ef0
.include "../../../Globals.s"
.include "../../Header.s"

lwz  r0,OFST_MnSlChrSSMFileIDs(rtoc)
addi  r0,r0,0x2f0
