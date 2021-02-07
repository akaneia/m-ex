#To be inserted @ 800056bc
.include "../../Globals.s"
.include "../Header.s"

#input
# r3 = player index
# r4 = external ID
# r5 = costume ID
# r6 = isNull

branch r12, 0x8025D5AC # CSS_UpdateCharCostume?

EXIT:
  blr
