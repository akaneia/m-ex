#To be inserted at 80397838
.include "../../Globals.s"
.include "../Header.s"

.set REG_FileSize, 31

backup

# check if exists
  bl FileName
  mflr r3
  branchl r12,0x8033796c
  cmpwi r3,-1
  beq FileNotFound

# get file size
  bl FileName
  mflr r3
  branchl r12,0x800163d8
  mr REG_FileSize, r3

# check if heap can load this
  branchl r12,0x80375404  # get heap id
  cmpwi r3,-1
  beq NullDebug
  branchl r12,0x80344168      # get mem in this heap
  addi r4, REG_FileSize, 68   # archive header alloc as well  
  cmpw r4, r3
  bge NullDebug

# check if persist heap has something
  lwz r3,OFST_HeapRuntime(rtoc)
  lwz r3,0x28(r3)
  cmpwi r3,0 
  bne NullDebug

# load it
  bl FileName
  mflr r3
  branchl r12,0x80016be0

# get debug symbol from file
  bl SymbolName
  mflr r4
  branchl r12,0x80380358
  stw r3, -0x5004(r13)
  b Exit

FileNotFound:
  bl ErrorString
  mflr r3
  branchl r12,0x803456a8
NullDebug:
  li r3,0
  stw r3, -0x5004(r13)
  b Exit

###########################################

FileName:
blrl
.string "MxDb.dat"
.align 2
SymbolName:
blrl
.string "mexDebug"
.align 2
ErrorString:
blrl
.string "Warning: MxDb.dat not found on disc\ndol symbols will not be identified."
.align 2

###########################################

Exit:
# Stack Trace
  lwz r3, -0x5014(r13)
  li r4,16
  branchl r12,0x80394a48

# Check to output instruction
  lwz r3, -0x5008(r13)
  cmpwi r3,-1
  beq NoInstruction
# Instruction
  lwz r3, -0x5008(r13)
  lwz r4, -0x500c(r13)
  lwz r5, -0x5010(r13)
  lwz r6, -0x5014(r13)
  branchl r12,0x80394b18
NoInstruction:

  restore
  li	r3, 0