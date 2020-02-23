#To be inserted @ 80262b20
.include "../../Globals.s"
.include "../Header.s"

lwz  r3,OFST_MnSlChrIconData(rtoc)
add	r3, r3, r0
