#To be inserted @ 802f99c0
.include "../../Globals.s"
.include "../Header.s"
 
.set REG_Count,31
.set REG_MatAnimJoint,30
.set REG_StockJOBJ,29

backup

/* 
TODO:
THIS HAPPENS EVERY DEATH / STOCK CREATION, MAYBE STORE
A POINTER TO THIS SYMBOL TO AVOID DOING STRCMP's DURING GAMES?
*/
/*
# get symbol from ifall
  load  r3,0x804d6d5c
  lwz r3,0x0(r3)
  bl  SymbolName
  mflr r4
  branchl r12,0x80380358
*/
# check if exists
  lwz r3,OFST_stc_icons(r13)
  cmpwi r3,0
  beq Exit
  lwz REG_MatAnimJoint,0x4(r3)

# get stock icon jobjs
  li  REG_Count,0
Loop:
# Get stock icon jobj
  mr  r3,REG_StockJOBJ
  addi  r4,sp,0x80
  addi    r5,REG_Count,1
  li  r6,-1
  branchl r12,0x80011e24

# add anim
  lwz r3,0x80(sp)
  li  r4,0
  mr  r5,REG_MatAnimJoint
  li  r6,0
  branchl r12,0x8036fb5c

IncLoop:
  addi  REG_Count,REG_Count,1
  cmpwi REG_Count,7
  blt Loop

  b Exit

SymbolName:
blrl
.string "Stc_icns"
.align 2

Exit:
restore
mr	r3, r29