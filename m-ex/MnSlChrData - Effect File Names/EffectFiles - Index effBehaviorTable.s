#To be inserted @ 800673e4
.include "../../Globals.s"
.include "../Header.s"

.set REG_EfFileID, 30

backup

# new stack space
  addi  r5,sp,0x80
# new stack space
  addi  r7,sp,0x84
# get symbol name
  bl  effBehaviorTable_Symbol
  mflr r8
# terminate va_arg list
  li  r9,0
branchl r12,0x80017040

# get pointers
  lwz r4,0x80(sp)
  lwz r5,0x84(sp)
  restore
  stw r4,0xC(sp)

# store symbol
  lwz r4,OFST_effBehaviorTable(rtoc)
  mulli r6,REG_EfFileID,4
  stwx r5,r4,r6

  b Exit

effBehaviorTable_Symbol:
blrl
.string "effBehaviorTable"
.align 2

Exit:
