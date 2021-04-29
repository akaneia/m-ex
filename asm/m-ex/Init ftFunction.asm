#To be inserted at 80068b40
.include "../Globals.s"
.include "Header.s"

.set  REG_PlayerData,31
.set  REG_Header,29
.set  REG_InternalID,28
.set  REG_ftFunction,27
.set  REG_itFunction,27
.set  REG_kbFunction,27
.set  REG_clearCache,26

backup

#Init reg
  li  REG_clearCache,0

#Get main dat file string
  lwz	REG_InternalID, 0x0004 (REG_PlayerData)
  lwz  r3,OFST_ftDataPointers(rtoc)
  mulli r4,REG_InternalID,ftDataPointers_Stride
  add r3,r3,r4
  lwz  REG_Header,0x4(r3)
#Get symbol offset from file
  mr  r3,REG_Header
  bl  ftFunctionString
  mflr  r4
  branchl r12,0x80380358
  mr.  REG_ftFunction,r3
  beq ftFunction_Skip

#Reloc
  mr r3, REG_ftFunction
  branchl r12,Reloc
#Overload
  mr  r3,REG_ftFunction
  lwz r4,OFST_mexData(rtoc)
  lwz r4,Arch_FighterFunc(r4)
  mr  r5,REG_InternalID
  bl  Overload
  li  REG_clearCache,1
ftFunction_Skip:

#Get symbol offset from file
  mr  r3,REG_Header
  mr  r4,REG_InternalID
  li  r5,0    #fighter
  branchl r12,itFunctionInit
  or  REG_clearCache,REG_clearCache,r3

  b CheckToFlushCache

ftFunctionString:
blrl
.string "ftFunction"
.align 2
kbFunctionString:
blrl
.string "kbFunction"
.align 2
mexPatchString:
blrl
.string "mexPatch"
.align 2

###########################################

Overload:
# r3 = ftX
# r4 = table
# r5 = player_data
#Copy function pointers - init
.set  REG_ftX,12
.set  REG_ThisElement,11
.set  REG_Code,10
.set  REG_OverloadTable,9
.set  REG_Count,8
.set  REG_RelocTable,7
.set  REG_InternalID,6
  mr  REG_ftX,r3
  mr  REG_OverloadTable,r4
  mr  REG_InternalID,r5
  lwz REG_RelocTable,ftX_FunctionRelocTable(REG_ftX)
  lwz REG_Code,0x0(REG_ftX)
  li  REG_Count,0
  b Overload_CheckLoop
Overload_Loop:
#Get this element
  mulli r3,REG_Count,8
  add REG_ThisElement,r3,REG_RelocTable
#Check if using index or function address
  lwz r3,FunctionRelocTable_ReplaceThis(REG_ThisElement)
  rlwinm. r0,r3,0,0x80000000
  bne Overload_FuncAddr

Overload_TableIndex:
#Get the table whose entry we are overloading
  mulli r3,r3,4
  lwzx  r4,r3,REG_OverloadTable
#Get ram offset for code
  lwz r3,FunctionRelocTable_ReplaceWith(REG_ThisElement)
  add r3,r3,REG_Code
#Update table entry
  mulli r5,REG_InternalID,4
  stwx  r3,r4,r5
  b Overload_IncLoop
Overload_FuncAddr:
#Get ram offset for code
  lwz r4,FunctionRelocTable_ReplaceWith(REG_ThisElement)
  add r4,r4,REG_Code
#Store branch to this code
  sub r4,r4,r3                          #Difference relative to branch addr
  rlwinm  r4,r4,0,6,29                  #extract bits for offset
  oris  r4,r4,0x4800                    #Create branch instruction from it
  stw r4,0x0(r3)         #place branch instruction
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
CheckToFlushCache:
  cmpwi REG_ftFunction,0
  beq Exit
FlushCache:
#Flush instruction cache so code can be run from this file
  lwz r3,0x40(REG_Header)
  lwz r4,0x0(REG_Header)
  branchl r12,0x80328f50
Exit:
  restore
  li	r0, 0
