#To be inserted @ 80085a58
.include "../../../Globals.s"
.include "../Header.s"

lwz  r4,OFST_MnSlChrAnimFiles(rtoc)
lwzx	r4, r4, r5
