#To be inserted @ 80260c7c
.include "../../../Globals.s"
.include "../Header.s"

lwz  r30,OFST_MnSlChrIconData(rtoc)
add	r4, r30, r4
