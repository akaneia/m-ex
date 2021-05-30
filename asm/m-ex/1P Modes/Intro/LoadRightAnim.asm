#To be inserted @ 80185fd4
.include "../../../Globals.s"
.include "../../Header.s"

.set REG_CharacterTable, 31
.set REG_PlayerInfo, 30
.set REG_Lookup, 29

backup

# get lookup table
  li  REG_Count,0
  lwz r3,OFST_mexData(rtoc)
  lwz r3,Arch_Fighter(r3)
  lwz REG_Lookup,Arch_Fighter_RuntimeIntroPointers(r3)

# get this characters fighters
  lwz r3,OFST_mexData(rtoc)
  lwz r3,Arch_Fighter(r3)
  lwz r3,Arch_Fighter_DefineIDs(r3)
  lbz r4,0x0D(REG_PlayerInfo)
  mulli r4,r4,3
  add REG_CharacterTable,r3,r4

# load animations for this character
.set REG_Count, 20
  li REG_Count, 0
  b Loop_Check
Loop:
# get the fighters internal ID
  lbz r3,0x0(REG_CharacterTable)
  exstb r3,r3
  cmpwi r3,-1
  beq Loop_Inc
# check if already loaded
  mulli r4,r3,RuntimeIntroPointers_Stride
  lwzx r4,r4,REG_Lookup
  cmpwi r4,0
  bne Loop_Inc
# load it
  lwz r3,OFST_mexData(rtoc)
  lwz r3,Arch_Fighter(r3)
  lwz r4,Arch_Fighter_IntroFilenames(r3)
  lbz r3,0x0(REG_CharacterTable)
  mulli r3,r3,IntroFilenames_Stride
  lwzx r3,r3,r4
  branchl r12,0x80016be0
# index it
  lbz r4,0x0(REG_CharacterTable)
  mulli r4,r4,RuntimeIntroPointers_Stride
  stwx r3,r4,REG_Lookup
Loop_Inc:
  addi REG_Count,REG_Count, 1
  addi REG_CharacterTable,REG_CharacterTable, 1
Loop_Check:
  cmpwi REG_Count, 2
  blt Loop

Exit:
  restore
  mr	r3, r27