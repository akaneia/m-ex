#To be inserted @ 801a4000
.include "../../Globals.s"
.include "../Header.s"

# clear lookup on scene changes (heap gets cleared)


# keep xFunctions before the heap (persistent)
.set REG_xFuncLookup, 12
.set REG_HeapAddr, 11
  lwz REG_xFuncLookup,OFST_XFunctionLookup(rtoc)
  lwz REG_HeapAddr, -0x3FE8 (r13)
# Check if this already exists for some reason
.set REG_LoopCount, 10
.set REG_xFuncNum, 9
.set REG_Curr, 8
.set REG_PersistNum, 7
  li REG_LoopCount, 0
  li REG_PersistNum, 0
  lwz REG_xFuncNum,xFuncLookup_Num(REG_xFuncLookup)
  addi REG_Curr, REG_xFuncLookup, xFuncLookup_Start                  # get to xFunction ptr array
  b Reloc_Index_LoopCheck
Reloc_Index_Loop:
# check if in heap
  lwz r3,0x0(REG_Curr)
  cmpw r3,REG_HeapAddr
  bge Reloc_Index_LoopInc
# before heap, its persistent
  addi r5, REG_xFuncLookup, xFuncLookup_Start             # get to xFunction ptr array
  mulli r4, REG_PersistNum, xFuncLookup_Start_Size
  stwx r3, r4, r5                         # keep ptr
  addi REG_PersistNum, REG_PersistNum, 1  # increment persistent num
Reloc_Index_LoopInc:
  addi REG_LoopCount,REG_LoopCount,1
  addi REG_Curr,REG_Curr,xFuncLookup_Start_Size
Reloc_Index_LoopCheck:
  cmpw REG_LoopCount,REG_xFuncNum
  blt Reloc_Index_Loop

# set num
  stw REG_PersistNum, xFuncLookup_Num (REG_xFuncLookup)
# clear remaining pointers
  lwz REG_xFuncLookup,OFST_XFunctionLookup(rtoc)
  addi r3,REG_xFuncLookup,xFuncLookup_Start                   # get to xFunction ptr array
  mulli r4, REG_PersistNum, xFuncLookup_Start_Size
  add r3,r3,r4
  li r4,0
  li r5, xFuncLookup_Max * xFuncLookup_Start_Size
  mulli r6, REG_PersistNum, xFuncLookup_Start_Size
  sub r5, r5, r6
  branchl r12,memset

Exit:
  lwz	r0, 0x001C (sp)