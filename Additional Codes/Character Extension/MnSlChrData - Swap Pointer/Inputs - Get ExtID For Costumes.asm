#To be inserted @ 80260af8
.include "../../../Globals.s"
.include "../Header.s"

lwz  r3,OFST_MnSlChrData(rtoc)
add	r3, r3, r0
