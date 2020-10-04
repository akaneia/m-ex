#To be inserted @ 8022e630
.include "../../Globals.s"
.include "../Header.s"

.set  REG_Archive,31
.set  REG_mexMenu,30

backup

# check if exists
  bl  FileName
  mflr  r3
  branchl r12,0x8033796c
  cmpwi r3,-1
  beq NotFound

# load file
  bl  FileName
  mflr  r3
  addi  r4,sp,0x80
  bl  SymbolName
  mflr  r5
  li  r6,0
  crclr	6
  branchl r12,0x80016c64
  mr REG_Archive,r3

# store pointer to symbol
  lwz REG_mexMenu,0x80(sp)
  stw REG_mexMenu,OFST_mexMenu(r13)

# create new canvas
  li  r3,OptDef_TextSisID
  li  r4,0
  li  r5,7
  li  r6,8
  li  r7,128
  li  r8,5
  li  r9,128
  li  r10,0
  branchl r12,0x803a611c

# index archive
  load  r3,0x804d1110
  stw REG_Archive,(OptDef_TextSisID * 4)(r3)

# index text symbol
  lwz r3,mexMenu_DescSis(REG_mexMenu)
  load  r4,0x804d1124
  stw r3,(OptDef_TextSisID * 4)(r4)

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