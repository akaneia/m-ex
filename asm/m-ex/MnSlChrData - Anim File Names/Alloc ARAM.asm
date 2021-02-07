#To be inserted @ 80085a58
.include "../../Globals.s"
.include "../Header.s"

lwz  r4,OFST_MnSlChrAnimFileNames(rtoc)
mulli r5,r6,4
lwzx	r4, r4, r5
