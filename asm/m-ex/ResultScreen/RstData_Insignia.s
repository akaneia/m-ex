#To be inserted @ 80177024
.include "../../Globals.s"
.include "../Header.s"

.set REG_JOBJ, 29
.set REG_ID, 30
.set REG_3, 31

backup

mr REG_JOBJ, r3
mr REG_ID, r4
mr REG_3, r5

lwz r12,OFST_GmRstPointers(rtoc)
mulli r4,r4,8
lwzx r12,r4,r12
cmpwi r12, 0
beq OriginalExit

# check for insignia model
lwz r3, 0x00(r12)
lwz r3, 0x00(r3)
cmpwi r3, 0
beq OriginalExit

# insignia model found, so load and prep it
b Exit

OriginalExit:
mr r3, REG_JOBJ
mr r4, REG_ID
mr r5, REG_3
branchl r12, 0x80176bf0
restore

Exit:
