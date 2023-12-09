#To be inserted @ 802599ec
.include "../../Globals.s"
.include "../Header.s"

.set  REG_RandomIcon,31
.set  REG_EligibleIcons,30
.set  REG_Index,29
.set  REG_IconData,28
.set  REG_IconCount,27

#Init
  backup
  lwz REG_IconData,OFST_Menu_SSS(rtoc)
  lwz REG_IconCount,OFST_Metadata_SSSIconCount(rtoc)
  subi REG_IconCount,REG_IconCount,1                    # except the random icon

#Alloc space for n icons
  mr  r3,REG_IconCount
  branchl r12,HSD_MemAlloc
  mr  REG_EligibleIcons,r3
  li  REG_Index,0

#Loop through all stages, find ones that are eligible
.set  REG_Count,20
StageSearch_Init:
  li  REG_Count,0
StageSearch_Loop:
  mulli r3,REG_Count,SSS_Stride
  add r4,r3,REG_IconData
  lbz     r3,0x4(r4)      #Check if was selected this session
  rlwinm. r0,r3,0,0x80         
  bne StageSearch_IncLoop
/*
  lbz r3,0xA(r4)          #Check if is enabled in random stage select
  branchl r12,0x80164330
  cmpwi r3,0
  beq StageSearch_IncLoop
*/
  lbz     r3,0x4(r4)      #Check if is enabled in random stage select
  rlwinm. r0,r3,0,0x40       
  beq StageSearch_IncLoop
#Is eligible
  stbx  REG_Count,REG_Index,REG_EligibleIcons
  addi  REG_Index,REG_Index,1
StageSearch_IncLoop:
  addi  REG_Count,REG_Count,1
  cmpw  REG_Count,REG_IconCount
  blt StageSearch_Loop
#Check if no eligible stages
  cmpwi REG_Index,0
  bne StageRoll

#Reset all stages selected status
  mr  r5,REG_IconCount
  b StageReset_IncLoop
StageReset_Loop:
  mulli r4,r5,SSS_Stride
  add r4,r4,REG_IconData
  lbz     r0,0x4(r4)
  li      r3,0
  rlwimi  r0,r3,0,0x80
  stb     r0,0x4(r4)
StageReset_IncLoop:
  subi  r5,r5,1
  cmpwi r5,0
  bge StageReset_Loop
  b StageSearch_Init

StageRoll:
#Get stage icon ID
  mr  r3,REG_Index
  branchl r12,HSD_Randi
  lbzx  REG_RandomIcon,r3,REG_EligibleIcons
#Set selected status
  mulli r4,REG_RandomIcon,SSS_Stride
  add r4,r4,REG_IconData
  lbz     r0,0x4(r4)
  ori     r0,r0,0x80
  stb     r0,0x4(r4)

FreeMem:
  mr  r3,REG_EligibleIcons
  branchl r12,HSD_Free

Exit:
  mr  r3,REG_RandomIcon
  restore
  blr
