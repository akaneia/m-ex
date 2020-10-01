#To be inserted @ 8022e630
.include "../../Globals.s"
.include "../Header.s"

backup

# load file
  bl  FileName
  mflr  r3
  addi  r4,sp,0x80
  bl  SymbolName
  mflr  r5
  li  r6,0
  crclr	6
  branchl r12,0x80016c64
  cmpwi r3,0
  beq NotFound

# store pointer to symbol
  lwz r3,0x80(sp)
  stw r3,OFST_mexMenu(r13)

/*
# index text symbol
  lwz r3,mexMenu_DescText(r3)
  load  r4,0x804d1124
  stw r3,(SisID * 4)(r4)
*/

  b Exit

NotFound:
  li  r3,0
  stw r3,OFST_mexMenu(r13)
  b Exit

FileName:
blrl
.string "MxMn.dat"
.align 2

SymbolName:
blrl
.string "mexMenu"
.align 2

Exit:
  restore
  li	r3, 3