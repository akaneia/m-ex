#To be inserted @ 8000569c
.include "../../Globals.s"
.include "../Header.s"

################################################################################
# Address: FN_GetFighterNum
################################################################################
# Inputs:
################################################################################
# Returns
# r3: number of fighters in the game
################################################################################
# Description:
# Returns number of fighters in the game
################################################################################


  lwz r3,OFST_Metadata_FtExtNum(rtoc)

Exit:
blr
