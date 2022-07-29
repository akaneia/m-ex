#To be inserted @ 80308654
.include "../../Globals.s"
.include "../Header.s"
.include "/SdSymbolLookup.s"

  sdlookup 3
  cmpwi r3, 0
  beq Orig
  lwz r4, 0x00(r3)
  lwz r5, 0x04(r3)
  addi r3, r30, 0x0
  b Exit
  
  Orig:
  li r4, 0x2
  li r5, 0x374
  addi r3, r30, 0x0

  Exit:

