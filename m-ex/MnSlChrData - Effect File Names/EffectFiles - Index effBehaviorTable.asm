#To be inserted @ 80067430
.include "../../Globals.s"
.include "../Header.s"

.set REG_EfFileID, 30

# orignal line
  stw	r0, 0x0008 (r31)

# attempt to get effect archive
  lwz  r3,OFST_MnSlChrEffectFilesSymbols(rtoc)
  mulli r4,REG_EfFileID,12
  add r3,r3,r4
  lwz r3,0x0(r3)
  branchl r12,0x8001819c
  cmpwi r3,0
  beq DoesNotExist

# get symbol
  bl  effBehaviorTable_Symbol
  mflr  r4
  branchl r12,0x80380358

# store symbol
  lwz r4,OFST_effBehaviorTable(rtoc)
  mulli r5,REG_EfFileID,4
  stwx r3,r4,r5

  b Exit

effBehaviorTable_Symbol:
blrl
.string "effBehaviorTable"
.align 2

###############################################
DoesNotExist:
#OSReport
  bl  ErrorString
  mflr  r3
  mr  r4,REG_EfFileID
  branchl r12,0x803456a8
#Assert
  bl  Assert_Name
  mflr  r3
  li  r4,0
  load  r5,0x804d3940
  branchl r12,0x80388220
Assert_Name:
  blrl
  .string "m-ex"
  .align 2
ErrorString:
  blrl
  .string "Error: effect file %d not loaded\n"
  .align 2
###############################################

Exit:
