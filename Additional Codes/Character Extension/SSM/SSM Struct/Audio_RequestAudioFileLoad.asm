#To be inserted @ 800270d0
.include "../../../../Globals.s"
.include "../../Header.s"

#orig pointer is 80433710, indicated by addi 14096

lwz r31,OFST_SSMStruct(rtoc)
addi  r31,r31,SSM_DisposableOrig_OFST
