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
  mr REG_scFunction,r3

b   Exit

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