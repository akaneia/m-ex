#To be inserted @ 800056a0
.include "../../Globals.s"
.include "../Header.s"

# SLIPPI ALSO USES THIS FUNCTION AT THIS INJECTION

################################################################################
# Address: FN_GetSSMIndex
################################################################################
# Inputs:
# r3: kind (fighter / stage)
# r4: index
################################################################################
# Returns
# r3: SSM ID
################################################################################
# Description:
# Returns SSM ID for inputted fighter/stage ID
################################################################################

cmpwi r3,1
beq isStage

isFighter:
  lwz  r3,OFST_MnSlChrSSMFileIDs(rtoc)
  mulli r4,r4,0x10
  lbzx r3,r3,r4
  b Exit 

isStage:
  lwz r3,OFST_Map_Audio(rtoc)
  mulli r4,r4,0x3
  lbzx r3,r3,r4
  b Exit 

Exit:
blr
