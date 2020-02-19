#To be inserted @ 80026e10
.include "../../../../Globals.s"
.include "../../Header.s"

lwz  r4,OFST_MnSlChrSSMFileNames(rtoc)
lwzx  r4,r4,r29
