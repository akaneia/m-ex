#To be inserted @ 803087c4
.include "../../Globals.s"
.include "../Header.s"
.include "/SdSymbolLookup.s"

  sdlookup 3
  cmpwi r3, 0
  beq Orig
  lwz r4, 0x10(r3)
  lwz r5, 0x14(r3)
  addi r3, r30, 0x0
  b Exit
  
  Orig:
  li r4, 0x24E
  li r5, 0x380
  addi r3, r30, 0x0

  Exit: