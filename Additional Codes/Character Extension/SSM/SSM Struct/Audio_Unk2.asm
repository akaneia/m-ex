#To be inserted @ 8002749c
.include "../../../../Globals.s"
.include "../../Header.s"

#orig pointer is 80433710, indicated by addi 14096
#180 / 0xB4 = SSM_DisposableOrig_OFST
#404 / 0x194 = SSM_DisposableCopy_OFST
#628 / 0x274 = SSM_PersistentOrig_OFST
#852 / 0x354 = SSM_PersistentCopy_OFST
#    / 0x424 = Footer


lwz r6,OFST_SSMStruct(rtoc)
addi  r5,r6,SSM_DisposableCopy_OFST
addi  r6,r6,SSM_PersistentOrig_OFST
