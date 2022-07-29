#To be inserted @ 803087a8
.include "../../Globals.s"
.include "../Header.s"
.include "/SdSymbolLookup.s"

  sdlookup 3
  cmpwi r3, 0
  beq Orig
  lwz r4, 0x08(r3)
  lwz r5, 0x0C(r3)
  addi r3, r30, 0x0
  b Exit
  
  Orig:
  li r4, 0x128
  li r5, 0x37a
  addi r3, r30, 0x0

  Exit: