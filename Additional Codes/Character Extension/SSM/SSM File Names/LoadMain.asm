#To be inserted @ 80028748
.include "../../../../Globals.s"
.include "../../Header.s"

lwz  r4,OFST_MnSlChrSSMFiles(rtoc)
lwz r4,0x9FC -0x9FC(r4)
