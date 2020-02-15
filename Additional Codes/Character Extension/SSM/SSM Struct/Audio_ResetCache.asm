#To be inserted @ 80026fc8
.include "../../../../Globals.s"
.include "../../Header.s"

#orig pointer is 80433710, indicated by addi 14096

lwz r28,OFST_SSMStruct(rtoc)
addi  r28,r28,SSM_DisposableOrig_OFST
