#To be inserted @ 801a40c8
.include "../../../Globals.s"
.include "../../Header.s"

.set    REG_scFunction,30
.set    REG_Archive,29
.set    REG_MinorScene,26

backup

# check if major has a file
  lwz  r3,0x10(REG_MinorScene)
  cmpwi r3,0
  beq   NoFile

# load file
  lwz  r3,0x10(REG_MinorScene)
  branchl r12,0x80016be0
  mr REG_Archive,r3

# get scFunction symbol
  mr r3,REG_Archive
  bl  SymbolName
  mflr  r4
  branchl r12,0x80380358
  mr. REG_scFunction,r3
  beq   Exit

#Reloc
  mr r3, REG_scFunction
  branchl r12,Reloc

# zero return struct
  addi  r3,sp,0x80   # return struct
  li r4,0
  li r5, 5 * 3
  branchl r12,0x80003100

#Overload
  mr  r3,REG_scFunction
  addi  r4,sp,0x80   # return struct
  bl  Overload

# load minor_think
  lwz r3,0x80 + 0 * 4(sp)
  cmpwi r3,0
  beq SkipThink
# Overload minor_think
  stw r3,0x4(REG_MinorScene)
SkipThink:

# load minor_load
  lwz r3,0x80 + 1 * 4(sp)
  cmpwi r3,0
  beq SkipLoad
# Overload minor_load
  stw r3,0x8(REG_MinorScene)
SkipLoad:

# load minor_unload
  lwz r3,0x80 + 2 * 4(sp)
  cmpwi r3,0
  beq SkipUnload
# Overload minor_unload
  stw r3,0xC(REG_MinorScene)
SkipUnload:

#Flush instruction cache so code can be run from this file
  lwz  r3,0x20(REG_Archive)   # file start
  lwz  r4,0x0(REG_Archive)   # file size 
  branchl r12,0x80328f50

b   Exit

###########################################

Overload:
# r3 = ftX
# r4 = table
#Copy function pointers - init
.set  REG_ftX,12
.set  REG_ThisElement,11
.set  REG_Code,10
.set  REG_OverloadTable,9
.set  REG_Count,8
.set  REG_RelocTable,7
  mr  REG_ftX,r3
  mr  REG_OverloadTable,r4
  lwz REG_RelocTable,ftX_FunctionRelocTable(REG_ftX)
  lwz REG_Code,0x0(REG_ftX)
  li  REG_Count,0
  b Overload_CheckLoop
Overload_Loop:
#Get this element
  mulli r3,REG_Count,8
  add REG_ThisElement,r3,REG_RelocTable

Overload_TableIndex:
#Get ram offset for this function
  lwz r3,FunctionRelocTable_ReplaceWith(REG_ThisElement)
  add r3,r3,REG_Code
#Update table
  lwz r4,FunctionRelocTable_ReplaceThis(REG_ThisElement)
  mulli r4,r4,4
  stwx  r3,r4,REG_OverloadTable
  b Overload_IncLoop

Overload_IncLoop:
  addi  REG_Count,REG_Count,1
Overload_CheckLoop:
  lwz r3,ftX_FunctionRelocTableCount(REG_ftX)
  cmpw  REG_Count,r3
  blt Overload_Loop
Overload_Exit:
  blr
############################################

SymbolName:
blrl
.string "mnFunction"
.align 2

NoFile:
Exit:
    restore
    mr	r3, r25