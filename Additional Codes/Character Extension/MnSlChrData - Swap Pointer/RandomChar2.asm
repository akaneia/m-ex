#To be inserted @ 8025fcb8
.include "../../../Globals.s"
.include "../Header.s"

lwz  r4,OFST_MnSlChrData(rtoc)
add	r4, r4, r29
