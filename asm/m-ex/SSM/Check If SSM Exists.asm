#To be inserted @ 80388a34
.include "../../Globals.s"
.include "../Header.s"

# check if exists
  mr	r30, r3
  cmpwi r30,-1
  bne Exit
# does not exist, complain about it

#############################################
DoesNotExist:
#OSReport
  bl  ErrorString
  mflr  r3
  mr r4,r29
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
.string "error: audio file %s does not exist\n"
.align 2
###############################################

Exit:
