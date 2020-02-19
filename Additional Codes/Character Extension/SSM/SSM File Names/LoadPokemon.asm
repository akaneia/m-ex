#To be inserted @ 80028920
.include "../../../../Globals.s"
.include "../../Header.s"

lwz  r4,OFST_MnSlChrSSMFileNames(rtoc)
lwz r4,0xA00 -0x9FC(r4)
