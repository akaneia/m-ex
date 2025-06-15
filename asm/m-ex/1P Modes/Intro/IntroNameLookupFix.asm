#To be inserted @ 80160e2c
.include "../../../Globals.s"
.include "../../Header.s"

cmpwi r27,0x21
blt Original

li r26,0

Original:
cmpwi r3,0