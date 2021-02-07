#To be inserted @ 8005fe90
.include "../../Globals.s"
.include "../Header.s"

.set  REG_Count,5
.set  REG_EffectFileTotal,6

lwz  r3,OFST_MnSlChrEffectFilesSymbols(rtoc)
lwz  r0,(1 * 0xC) + 8(r3)