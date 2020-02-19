#To be inserted @ 800856e4
.include "../../../Globals.s"
.include "../Header.s"

lwz  r4,OFST_MnSlChrAnimFileNames(rtoc)
lwzx	r4, r4, r26
