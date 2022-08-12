#To be inserted @ 80312ac8
.include "../../Globals.s"
.include "../Header.s"
.include "/SdSymbolLookup.s"

  sdlookup 0
  cmpwi r3, 0
  beq Orig
  
  lwz r4,0x00(r3)
  addi r4, r4, 13
  b Exit
  
  Orig:
  li r4, 0x13b

  Exit:

