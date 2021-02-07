#To be inserted @ 80260d6c
.include "../../Globals.s"
.include "../Header.s"

lwz  r3,OFST_MnSlChrIconData(rtoc)
add	r19, r3, r0
