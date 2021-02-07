#To be inserted at 80160a24
.include "../../Globals.s"
.include "../Header.s"

lwz r4,OFST_MnSlChrNames(rtoc)
lwzx r3,r4,r0
