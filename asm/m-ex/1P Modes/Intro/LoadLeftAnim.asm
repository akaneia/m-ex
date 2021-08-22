#To be inserted @ 80185db4
.include "../../../Globals.s"
.include "../../Header.s"

.set REG_PlayerInfo, 31
.set REG_CharacterTable, 30
.set REG_Lookup, 29
.set REG_Anim, 28
.set REG_Params, 27
.set REG_Count, 26

backup

# get lookup table
  lwz  REG_Lookup,OFST_GmRstPointers(rtoc)

# get this characters fighters
  lwz r3,OFST_mexData(rtoc)
  lwz r3,Arch_Fighter(r3)
  lwz r3,Arch_Fighter_DefineIDs(r3)
  lbz r4,0x0D(REG_PlayerInfo)
  mulli r4,r4,3
  add REG_CharacterTable,r3,r4

# load animations for this character
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
  mr r20, r3
# get the correct symbol name
  lbz r4,0x0(REG_CharacterTable)
  mulli r4,r4,4
  lwz r5,OFST_FtDemoSymbols(rtoc)
  lwzx r4,r4,r5
  lwz r4, 1 * 4 (r4)  # 1 is the index for intro
  branchl r12,0x80380358
  mr. REG_Anim, r3
  beq NoSymbol
# get params
  mr r3, r20
  bl gmIntroEasyTable
  mflr r4
  branchl r12,0x80380358
  mr REG_Params, r3
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
  mr REG_Anim, r3
  li REG_Params, 0
  b IndexData

IndexData:
# index it to the results anim table
  lbz r4,0x0(REG_CharacterTable)
  mulli r4,r4,GmRstPointers_Stride
  stwx REG_Anim,r4,REG_Lookup
# index params to the table
  lbz r4,0x0(REG_CharacterTable)
  mulli r4,r4,RuntimeIntroParam_Stride
  lwz r3,OFST_mexData(rtoc)
  lwz r3,Arch_Fighter(r3)
  lwz r3,Arch_Fighter_RuntimeIntroParam(r3)
  stwx REG_Params,r4,r3
Loop_Inc:
  addi REG_Count,REG_Count, 1
  addi REG_CharacterTable,REG_CharacterTable, 1
Loop_Check:
  cmpwi REG_Count, 2
  blt Loop
  b Exit

#############################################
NoSymbol:
#OSReport
  bl  ErrorString
  mflr  r3
# get symbol name lookup
  lbz r4,0x0(REG_CharacterTable)
  mulli r4,r4,4
  lwz r5,OFST_FtDemoSymbols(rtoc)
  lwzx r4,r4,r5
# get the correct symbol name
  lwz r4, 1 * 4 (r4)  # 1 is the index for intro
  mr r5,r4
  branchl r12,0x803456a8
#Assert
  bl  Assert_Name
  mflr  r3
  li  r4,0
  load  r5,0x804d3940
  branchl r12,0x80388220
Assert_Name:
blrl
.string "m-ex"
.align 2
ErrorString:
blrl
.string "error: %s.dat does not have symbol %s\n"
.align 2
###############################################

Extension:
blrl
.string ".dat"
.align 2

gmIntroEasyTable:
blrl
.string "gmIntroEasyTable"
.align 2


Exit:
  restore
  mr	r3, r27