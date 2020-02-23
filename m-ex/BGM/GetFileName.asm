#To be inserted @ 80023f90
.include "../../Globals.s"
.include "../Header.s"

lwz r4,OFST_BGMFileNames(rtoc)
lwzx  r4,r4,r0
