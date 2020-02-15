#To be inserted @ 800232dc
.include "../../../../Globals.s"
.include "../../Header.s"

#180 / 0xB4 = SSM_DisposableOrig_OFST
#404 / 0x194 = SSM_DisposableCopy_OFST
#628 / 0x274 = SSM_PersistentOrig_OFST
#852 / 0x354 = SSM_PersistentCopy_OFST
#    / 0x424 = Footer

lwz r5,OFST_SSMStruct(rtoc)
addi  r5,r5,SSM_Footer_OFST #+ 4*4
