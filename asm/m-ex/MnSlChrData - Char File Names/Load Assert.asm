#To be inserted @ 80017924
.include "../../Globals.s"
.include "../Header.s"

cmpwi r3,-1
bne Exit

#############################################
DoesNotExist:
#OSReport
  bl  ErrorString
  mflr  r3
  load r4,0x80432058
  branchl r12,0x803456a8
#Assert
  bl  Assert_Name
  mflr  r3
  li  r4,0
  load  r5,0x804d3940
  branchl r12,0x80388220
Assert_Name:
blrl
.string "lbfile"
.align 2
ErrorString:
blrl
.string "error: file %s does not exist\n"
.align 2
###############################################


Exit:
stw	r31, 0x0008 (sp)