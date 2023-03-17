#To be inserted at xx803753b4
#.include "../Globals.s"
#.include "Header.s"

# r3 - size of MxPt if it exists
.macro MxPt_GetSize

#Check if file exists
  bl  FileName_MxPt
  mflr  r3
  branchl r12,0x8033796c
  cmpwi r3,-1
  beq File_Not_Found
#Get size of MxPt.dat
  bl  FileName_MxPt
  mflr  r3
  branchl r12,0x800163d8
  b File_Found
File_Not_Found:
  li r3, 0
File_Found:

.endm

.macro MxPt_Load

.set  REG_HeapID,26
.set  REG_mexPatch,26
.set  REG_Header,25
.set  REG_MxPtFILE,22
.set  REG_MxPtSize,23

#Alloc header
  mr  r3,REG_HeapID
  li  r4,68
  branchl r12,0x80343ef0
  mr  REG_Header,r3
#Alloc from this heap
  mr  r3,REG_HeapID
  mr  r4,REG_MxPtSize
  branchl r12,0x80343ef0
  mr  REG_MxPtFILE,r3
#Load file here
  bl  FileName_MxPt
  mflr  r3
	mr r4, REG_MxPtFILE
	addi	r5, sp, 0x80
	branchl	r12,0x8001668C
#Init Archive
  lwz r5,0x80(sp)
  mr  r3,REG_Header   #store header
  mr  r4,REG_MxPtFILE      #file
  branchl r12,0x80016a54
#Get symbol offset
  mr  r3,REG_Header
  bl  SymbolName_MxPt
  mflr  r4
  branchl r12,0x80380358
  mr.  REG_mexPatch,r3
  beq mexPatch_Skip
#Reloc
  mr r3,REG_mexPatch
  branchl r12,Reloc
#Overload
  mr  r3,REG_mexPatch
  li  r4,0
  li  r5,0
  bl  Overload
mexPatch_Skip:
  b End_Load

##############################################
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

End_Load:

.endm