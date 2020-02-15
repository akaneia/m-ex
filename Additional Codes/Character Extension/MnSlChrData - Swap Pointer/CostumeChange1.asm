#To be inserted @ 802601d4
.include "../../../Globals.s"
.include "../Header.s"

lwz  r3,OFST_MnSlChrData(rtoc)
addi  r3,r3,0xDD
lbzx	r3, r3, r0
