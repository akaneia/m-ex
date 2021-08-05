#To be inserted @ 80005690
.include "../../Globals.s"
.include "../Header.s"

################################################################################
# Inputs
# r3 = text ptr
# r4 = ext stage id
################################################################################
# Description
# Checks to run alternate stage name logic (non-applicable to vanilla melee)
################################################################################

.set REG_Text,31
.set REG_StageID,30
.set REG_Data,29

# Init
  backup
  mr REG_Text, r3
  mr REG_StageID, r4
  bl DATA
  mflr REG_Data

# get internal stage ID from external
  mr r3,REG_StageID
  branchl r12,0x8022519c
  mr REG_StageID,r3
# Get stage name from internal ID
  lwz r3,OFST_mexData(rtoc)
  lwz r3,Arch_Map(r3)
  lwz r3,Arch_Map_StageNames(r3)
  mulli r4,REG_StageID,4
  lwzx r4,r3,r4
# Display stage name
  mr r3,REG_Text
  lfs f1,0x0(REG_Data)
  lfs f2,0x4(REG_Data)
  branchl r12,0x803a6b98
# scale text
  mr r4,r3 
  mr r3,REG_Text
  lfs f1,0x8(REG_Data)
  lfs f2,0xC(REG_Data)
  branchl r12,0x803a7548
  b EXIT

DATA:
blrl
.float 80 # text x pos
.float -10 # text y pos
.float 0.6 # text X scale
.float 0.6 # text Y scale

EXIT:
li r3,1
restore
blr
