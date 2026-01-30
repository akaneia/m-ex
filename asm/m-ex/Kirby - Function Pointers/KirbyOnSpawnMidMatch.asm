#To be inserted @ 800857e0
.include "../../Globals.s"
.include "../Header.s"

cmpwi r3, 4
bne IsKirby
blr

IsKirby:
branch r3, 0x800eee9c