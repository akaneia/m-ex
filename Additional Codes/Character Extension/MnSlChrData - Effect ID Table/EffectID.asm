#To be inserted @ 800856d0
.include "../../../Globals.s"
.include "../Header.s"

lwz  r3,OFST_MnSlChrEffectFileIDs(rtoc)
lbzx	r3, r3, r31
