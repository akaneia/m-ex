#To be inserted @ 801a43ec
.include "../../../Globals.s"
.include "../../Header.s"

.set    REG_MajorScene,30
.set    REG_Archive,29
.set    REG_FileSize,28
.set    REG_File,27
.set    REG_scFunction,26
.set    REG_HeapSize,25
.set    REG_EntryNum,20

#ftX struct
  .set  ftX_Code,0x0
  .set  ftX_InstructionRelocTable,0x4
  .set  ftX_InstructionRelocTableCount,0x8
  .set  ftX_FunctionRelocTable,0xC
    .set  FunctionRelocTable_ReplaceThis,0x0
    .set  FunctionRelocTable_ReplaceWith,0x4
  .set  ftX_FunctionRelocTableCount,0x10

backup

# check if major has a file
  lwz  r3,0x14(REG_MajorScene)
  cmpwi r3,0
  beq   NoFile

# check if file on disc exists
  branchl r12,0x8033796c
  mr. REG_EntryNum,r3
  beq NoFile

# get file size
  lwz  r3,0x14(REG_MajorScene)
  branchl   r12,0x800163d8
  mr    REG_FileSize,r3

# round up align heap start
  lwz r3,OFST_HeapRuntime(rtoc)
  lwz r3, ((6) * 0x1C) + 0x10 + 0x8 (r3)
  addi r3,r3,31
  rlwinm r3,r3,0,0,26

# File data = heap start
  mr REG_File, r3

# determine next spot (align(filesize))
  addi r3,REG_FileSize,31
  rlwinm r3,r3,0,0,26
  add   REG_Archive,REG_File,r3

# determine end (align(archivesize))
  li r3, 68 + 31
  rlwinm r3,r3,0,0,26
  add r3, REG_Archive, r3

# now get heap size
  lwz r5,OFST_HeapRuntime(rtoc)
  lwz r4, ((6) * 0x1C) + 0x10 + 0x8 (r5)
  sub r3, r3, r4

# update heap size
  stw r3, ((6) * 0x1C) + 0x10 + 0xC (r5)

# init some load bool
  li	r0, 0
  stw	r0, -0x52D8 (r13)

# load file
  mr r3, REG_EntryNum        # file entrynum
  li r4, 0                   # offset
  mr r5, REG_File            # addr
  addi r6,REG_FileSize,31    # bytes to load  
  rlwinm r6,r6,0,0,26        # bytes to load     
  li r7,33                   # main ram (i think)
  li r8, 1                   # honestly no idea
  load r9,0x8001615c         # callback
  li r10, 0                  # no idea for this either
  branchl   r12,0x8038f6d4

WaitForFile:
  branchl   r12,0x800161a0
  cmpwi r3,0
  beq  WaitForFile
  
# init archive
  mr r3,REG_Archive
  mr r4,REG_File
  mr r5,REG_FileSize
  branchl r12,0x80016a54

# get scFunction symbol
  mr r3,REG_Archive
  bl  SymbolName
  mflr  r4
  branchl r12,0x80380358
  mr. REG_scFunction,r3
  beq   Exit

#Reloc
  lwz r3,ftX_InstructionRelocTableCount(REG_scFunction)  #count
  lwz r4,ftX_Code(REG_scFunction)                        #code
  lwz r5,ftX_InstructionRelocTable(REG_scFunction)       #reloc table
  branchl r12,Reloc

# zero return struct
  addi  r3,sp,0x80   # return struct
  li r4,0
  li r5, 5 * 4
  branchl r12,0x80003100

#Overload
  mr  r3,REG_scFunction
  addi  r4,sp,0x80   # return struct
  bl  Overload

# load minor_scene
  lwz r3,0x80 + 0 * 4(sp)
  cmpwi r3,0
  beq SkipMinors
# Overload minor scene table
  stw r3,0x10(REG_MajorScene)
SkipMinors:

# load major_load
  lwz r3,0x80 + 1 * 4(sp)
  cmpwi r3,0
  beq SkipMajorLoad
# Overload major_load
  stw r3,0x4(REG_MajorScene)
SkipMajorLoad:

# load major_unload
  lwz r3,0x80 + 2 * 4(sp)
  cmpwi r3,0
  beq SkipMajorUnload
# Overload major_unload
  stw r3,0x8(REG_MajorScene)
SkipMajorUnload:

# load css_load
  lwz r3,0x80 + 3 * 4(sp)
  stw r3,OFST_scCSSLoad(rtoc)

# load sss_load
  lwz r3,0x80 + 4 * 4(sp)
  stw r3,OFST_scSSSLoad(rtoc)

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
.string "scFunction"
.align 2

NoFile:
# set heap size to 0
    lwz r3,OFST_HeapRuntime(rtoc)
    addi r3,r3,0x10
    li  r4,0
    stw r4, ((6) * 0x1C) + 0xC (r3)

Exit:
    restore
    li	r0, 0