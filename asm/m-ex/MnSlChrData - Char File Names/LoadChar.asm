#To be inserted @ 80085614
.include "../../Globals.s"
.include "../Header.s"

lwz  r4,OFST_MnSlChrCharFileNames(rtoc)
lwzx	r4, r4, r27
