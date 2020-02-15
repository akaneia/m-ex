#To be inserted @ 80085614
.include "../../../Globals.s"
.include "../Header.s"

lwz  r4,OFST_MnSlChrCharFiles(rtoc)
lwzx	r4, r4, r27
