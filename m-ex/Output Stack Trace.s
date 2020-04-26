#To be inserted at 8038adc0
.include "../Globals.s"
.include "Header.s"

.set  REG_SP,31
.set  REG_Count,30

backup

# Header
  bl  Header
  mflr  r3
  branchl r12,OSReport

# Init loop
  li  REG_Count,0
  mr  REG_SP,sp

Loop:
  bl  StringFormatter
  mflr  r3
  lwz r4,0x4(REG_SP)
  branchl r12,OSReport
IncLoop:
# first check if there are anymore
  lwz REG_SP,0x0(REG_SP)
  cmpwi REG_SP,0
  beq Exit
  cmpwi REG_SP,-1
  beq Exit
  addi  REG_Count,REG_Count,1
  cmpwi REG_Count,15
  blt Loop
  b Exit

Header:
blrl
.string "Stack trace for this frame is:\n\n"
.align 2
StringFormatter:
blrl
.string "%X\n"
.align 2

Exit:
  restore
  lwz	r0, 0x000C (sp)
