#To be inserted at 80160b08
.include "../../Globals.s"
.include "../Header.s"

lwz r3,OFST_MnSlChrNames(rtoc)
lwzx r3,r3,r0