#To be inserted @ 80005698
.include "../../Globals.s"
.include "../Header.s"

################################################################################
# Returns
# r3: Number of CSS Icons
################################################################################
# Description:
# Returns number of CSS icons
################################################################################

  lwz r3,OFST_Metadata_CSSIconCount(rtoc)

Exit:
blr
