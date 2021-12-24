#To be inserted @ 80026f2c
.include "../../Globals.s"
.include "../Header.s"

/*
0x01 = unloads main, pokemon, nr_name, end
0x02 = unloads nr_title, nr_select, nr_1p, nr_vs
0x04 = unloads character ssms + null.ssm
0x08 = unloads stage ssms + last.ssm
0x10 = unloads ending, 1pend
*/

.set REG_Flags,31
.set REG_ToLoadOrig, 30
.set REG_Count, 29
.set REG_SSMNum, 28

# init
  backup
  mr REG_Flags,r3

# loop through all ssms
SSMLoop_Init:
  lwz REG_ToLoadOrig,OFST_SSMStruct(rtoc)
  lwz REG_ToLoadOrig,Arch_SSMRuntimeStruct_ToLoadOrig(REG_ToLoadOrig)
  lwz REG_SSMNum,OFST_Metadata_SSMCount(rtoc)
  li REG_Count,0
  b SSMLoop_Check
SSMLoop:
.set REG_SSMGroup, 12
# get this ssm's group
  mr r3,REG_Count
  bl GetGroup

# check group 1
  rlwinm. r0, REG_Flags, 0, 0x1
  beq SSMLoop_SkipGroup1
# must be group 1 or 2
  cmpwi r3,1
  beq SSMLoop_Reset
  cmpwi r3,2
  beq SSMLoop_Reset
SSMLoop_SkipGroup1:

# check group 2
  rlwinm. r0, REG_Flags, 0, 0x2
  beq SSMLoop_SkipGroup2
# must be group 3
  cmpwi r3,3
  beq SSMLoop_Reset
SSMLoop_SkipGroup2:

# check group 4
  rlwinm. r0, REG_Flags, 0, 0x4
  beq SSMLoop_SkipGroup4
# must be group 4
  cmpwi r3,4
  beq SSMLoop_Reset
SSMLoop_SkipGroup4:

# check group 8
  rlwinm. r0, REG_Flags, 0, 0x8
  beq SSMLoop_SkipGroup8
# must be group 5
  cmpwi r3,5
  beq SSMLoop_Reset
SSMLoop_SkipGroup8:

# check group 10
  rlwinm. r0, REG_Flags, 0, 0x10
  beq SSMLoop_SkipGroup10
# must be group 6
  cmpwi r3,6
  beq SSMLoop_Reset
SSMLoop_SkipGroup10:
  b SSMLoop_Inc

SSMLoop_Reset:
  li r0, -1
  mulli r3, REG_Count, 4
  stwx r0, r3, REG_ToLoadOrig

SSMLoop_Inc:
  addi REG_Count, REG_Count, 1
SSMLoop_Check:
  cmpw REG_Count, REG_SSMNum
  blt SSMLoop
  b Injection_Exit

##################
GetGroup:
# r3 = ssm id

# get lookup table
  lwz r4,OFST_mexData(rtoc)
  lwz r4,Arch_FGM(r4)
  lwz r4,Arch_FGM_LookupTable(r4)
# get ssm data
  mulli r3,r3,FGM_LookupTable_Stride
  add r3,r3,r4
# get group id
  lbz r3,0x0(r3)
  blr
##################

Injection_Exit:
  restore
  blr