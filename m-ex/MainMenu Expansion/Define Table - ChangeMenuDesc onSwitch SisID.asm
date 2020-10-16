#To be inserted @ 80229ad8
.include "../../Globals.s"
.include "../Header.s"

  lwz r3,OFST_mexMenu(r13)
  cmpwi r3,0
  beq NoMxMn
  li  r3,OptDef_TextSisID
  b Exit
NoMxMn:
  li  r3,0
  b Exit
Exit:
  li  r4,0