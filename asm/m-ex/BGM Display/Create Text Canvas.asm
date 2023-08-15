#To be inserted @ 802f3a48
.include "../../Globals.s"
.include "../Header.s"

.set REG_Symbol,31
.set REG_GObj,30
.set REG_Userdata,29
.set REG_Text,28
.set REG_JObj,28
.set REG_Floats,27

backup

# get ifall archive info
  load r3,0x804d6d5c
  lwz r3,0x0(r3)
  cmpwi r3,0
  beq Exit
# get symbol from ifall
  bl  BGMSymbol
  mflr r4
  branchl r12,0x80380358
  mr. REG_Symbol,r3
  beq Exit
#Create Text Canvas on this CObj
  li r3,2
  li r4,-1
  li r5,14
  li r6,15
  li r7,0
  li r8,15
  li r9,0
  li r10,19
  branchl r12,0x803a611c
  b Exit

BGMSymbol:
blrl
.string "bgm"
.align 2

Exit:
  restore
  lwz	r0, 0x002C (sp)
  