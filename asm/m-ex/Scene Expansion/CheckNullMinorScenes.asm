#To be inserted @ 801a4038
.include "../../Globals.s"
.include "../Header.s"

# Get minor scenes
  lwz	r5, 0x0010 (r3)
  cmpwi r5,0
  beq NoExist
  b Exit

###############################################
NoExist:
#OSReport
  bl  ErrorString
  mflr  r3
  load r4,0x80479D30
  lbz r4,0x0(r4)
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
.string "error: major %d has no minor scenes defined\n"
.align 2
###############################################

Exit:

