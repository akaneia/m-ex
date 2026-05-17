#To be inserted @ 8011b5a0
.include "../../Globals.s"
.include "../Header.s"

lwz r3, 0x04(r31)
lwz r4,OFST_MnSlChrCostumeFileSymbols(rtoc)
slwi r3, r3, 2
lwzx r3, r3, r4

slwi r4, r0, 4

add r3, r3, r4
lwz r0, 0xC(r3)

cmpwi r0, 1
