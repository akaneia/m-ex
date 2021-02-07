#To be inserted @ 80266994
.include "../../Globals.s"
.include "../Header.s"

# get ifall archive info
  load  r3,0x804d5780
  branchl r12,0x8001819c
# get symbol from ifall
  bl  SymbolName
  mflr r4
  branchl r12,0x80380358
# check if exists
  cmpwi r3,0
  beq NoSymbol
  stw r3,OFST_stc_icons(r13)
  b Exit

NoSymbol:
  li  r3,0
  stw r3,OFST_stc_icons(r13)
  b Exit

SymbolName:
blrl
.string "Stc_icns"
.align 2

Exit:
  lwz	r3, -0x49EC (r13)