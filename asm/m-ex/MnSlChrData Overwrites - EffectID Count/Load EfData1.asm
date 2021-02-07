#To be inserted @ 800672b4
.include "../../Globals.s"
.include "../Header.s"

.set  REG_EffectFileTotal,12
# note to self, the + 1 is because of a bge

lwz REG_EffectFileTotal,OFST_Metadata_EffectCount(rtoc)
addi  REG_EffectFileTotal,REG_EffectFileTotal,1
cmpw	r3, REG_EffectFileTotal
