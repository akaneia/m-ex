#To be inserted @ 80185dfc
.include "../../../Globals.s"
.include "../../Header.s"

.set REG_CharacterTable, 31
.set REG_PlayerInfo, 29
.set REG_Lookup, 28

backup

# get lookup table
  li  REG_Count,0
  lwz  REG_Lookup,OFST_GmRstPointers(rtoc)

# get this characters fighters
  lwz r3,OFST_mexData(rtoc)
  lwz r3,Arch_Fighter(r3)
  lwz r3,Arch_Fighter_DefineIDs(r3)
  lbz r4,0x10(REG_PlayerInfo)
  mulli r4,r4,3
  add REG_CharacterTable,r3,r4

# load animations for this character
.set REG_Count, 20
  li REG_Count, 0
  b Loop_Check
Loop:
# get the fighters internal ID
  lbz r3,0x0(REG_CharacterTable)
  extsb r3,r3
  cmpwi r3,-1
  beq Loop_Inc
# check if already loaded
  mulli r4,r3,GmRstPointers_Stride
  lwzx r4,r4,REG_Lookup
  cmpwi r4,0
  bne Loop_Inc

# get standalone file name
  load r3,0x80432058
  lbz r4,0x0(REG_CharacterTable)
  mulli r4,r4,4
  lwz r5,OFST_FtDemoSymbols(rtoc)
  lwzx r4,r4,r5
  lwz r4, 1 * 4 (r4)  # 1 is the index for intro
  branchl r12,0x80325a50  #strcpy
  load r3,0x80432058
  branchl r12,0x80325b04  #strlen
  load r4,0x80432058
  add r3,r3,r4
  bl Extension
  mflr r4
  branchl r12,0x80325a50  #strcpy
# check if standalone file exists on disc
  load r3,0x80432058
  branchl r12,0x8033796c
  cmpwi r3,-1
  beq SymbolLoad
# load it
  load r3,0x80432058
  branchl r12,0x80016be0
# get the correct symbol name
  lbz r4,0x0(REG_CharacterTable)
  mulli r4,r4,4
  lwz r5,OFST_FtDemoSymbols(rtoc)
  lwzx r4,r4,r5
  lwz r4, 1 * 4 (r4)  # 1 is the index for intro
  branchl r12,0x80380358
  b IndexData
SymbolLoad:
# get data from IrAls
  lbz r3,0x0(REG_CharacterTable)
  mulli r3,r3,4
  lwz r4,OFST_FtDemoSymbols(rtoc)
  lwzx r3,r3,r4
# get the correct symbol name
  lwz r4, 1 * 4 (r3)  # 1 is the index for intro
  lwz	r3, -0x50AC (r13)
  branchl r12,0x80380358
  b IndexData

IndexData:
# index it to the results anim table
  lbz r4,0x0(REG_CharacterTable)
  mulli r4,r4,GmRstPointers_Stride
  stwx r3,r4,REG_Lookup
Loop_Inc:
  addi REG_Count,REG_Count, 1
  addi REG_CharacterTable,REG_CharacterTable, 1
Loop_Check:
  cmpwi REG_Count, 2
  blt Loop
  b Exit

Extension:
blrl
.string ".dat"
.align 2

Exit:
  restore
  mr	r3, r27