#To be inserted @ 8025dbe0
.include "../../../Globals.s"
.include "../Header.s"

lwz  r3,OFST_MnSlChrData(rtoc)
add	r3, r3, r0
