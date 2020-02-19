#To be inserted @ 8025ff10
.include "../../../Globals.s"
.include "../Header.s"

lwz  r31,OFST_MnSlChrIconData(rtoc)
add	r31, r31, r29
