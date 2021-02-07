#To be inserted @ 8002785c
.include "../../../Globals.s"
.include "../../Header.s"

backup

# clear audio cache
  li  r3,12
  branchl r12,0x80026f2c

Multispawn:
# check multispawn?
  branchl r12,0x8016b184
  cmpwi r3,0
  beq LoadFighterSSMs
# load player one's external ID
  li  r3,0
  branchl r12,0x80032330
  lwz r4,OFST_Metadata_FtExtNum(rtoc)
  cmpw  r3,r4
  bgt LoadFighterSSMs
# load this fighter's ssm
  lwz  r4,OFST_MnSlChrSSMFileIDs(rtoc)
  mulli r3,r3,0x10
  lbzx  r3,r3,r4
  branchl r12,Audio_RequestSSMLoad
# load in all multispawners' ssms
.set  REG_Count,20
  li  REG_Count,0
Multispawn_Loop:
# get this multispawners ext ID
  mr  r3,REG_Count
  branchl r12,0x80169370
  lwz r4,OFST_Metadata_FtExtNum(rtoc)
  cmpw  r3,r4
  bgt Multispawn_IncLoop
# load this fighter's ssm
  lwz  r4,OFST_MnSlChrSSMFileIDs(rtoc)
  mulli r3,r3,0x10
  lbzx  r3,r3,r4
  branchl r12,Audio_RequestSSMLoad
# the original code checks for kirby and loads KirbyTM.ssm, im not gonna do this idk if its covered
Multispawn_IncLoop:
  addi  REG_Count,REG_Count,1
  cmpwi REG_Count,3
  blt Multispawn_Loop
  b CheckForKirbyEvent

LoadFighterSSMs:
# load all fighter ssms
.set  REG_Count,20
  li  REG_Count,0
LoadFighterSSMs_Loop:
# check if player exists
  mr  r3,REG_Count
  branchl r12,0x8003241c
  cmpwi r3,3
  beq LoadFighterSSMs_IncLoop
# get their fighters external ID
  mr  r3,REG_Count
  branchl r12,0x80032330
# check if exists
  lwz r4,OFST_Metadata_FtExtNum(rtoc)
  cmpw  r3,r4
  bgt LoadFighterSSMs_IncLoop
# load their ssm
  lwz  r4,OFST_MnSlChrSSMFileIDs(rtoc)
  mulli r3,r3,0x10
  lbzx  r3,r3,r4
  branchl r12,Audio_RequestSSMLoad
LoadFighterSSMs_IncLoop:
  addi  REG_Count,REG_Count,1
  cmpwi REG_Count,4
  blt LoadFighterSSMs_Loop




CheckForKirbyEvent:
# get stage ID
  lwz	r3, -0x6CB8 (r13)
  cmpwi r3,217
  beq CheckForKirbyEvent_Load
  cmpwi r3,229
  beq CheckForKirbyEvent_Load
  b CheckForUnkEvent
CheckForKirbyEvent_Load:
# request load
  li  r3,12
  li  r5,0x0002
  li  r6,0x4000
  branchl r12,0x8002702c
CheckForUnkEvent:
# get stage ID
  lwz	r3, -0x6CB8 (r13)
  cmpwi r3,70
  beq CheckForUnkEvent_Load
  cmpwi r3,71
  beq CheckForUnkEvent_Load
  b SetStageDSP
CheckForUnkEvent_Load:
# request load
  li  r3,12
  li  r5,0x0000
  li  r6,0x0C00
  branchl r12,0x8002702c






SetStageDSP:
# get internal stage ID
  lwz	r3, -0x6CB8 (r13)
  branchl r12,0x8022519c
# get dsp level
  mulli r3,r3,3
  lwz r4,OFST_Map_Audio(rtoc)
  add r4,r4,r3
  lbz r3,0x1(r4)
# store it
  stw	r3, -0x7DC8 (r13)






LoadStageSSM:
# get internal stage ID
  lwz	r3, -0x6CB8 (r13)
  branchl r12,0x8022519c
#Get Stage ssm
  lwz r4,OFST_Map_Audio(rtoc)
  mulli r3,r3,3
  add r3,r3,r4
  lbz r3,0x0(r3)
#Check if null ID
  #lwz r12,OFST_Metadata_SSMCount(rtoc)
  #cmpw  r3,r12
  #cmpwi  r3,55
  #beq AsyncLoad
#Load ssm
  branchl r12,Audio_RequestSSMLoad




AsyncLoad:
# update audio
  branchl r12,0x80027168
  b AsyncLoad_Check
AsyncLoad_Wait:
# idle
  load  r3,0x800195d0
  branchl r12,0x80388b0c
AsyncLoad_Check:
# check something
  branchl r12,0x80027488
  cmpwi r3,1
  beq AsyncLoad_Wait

#Exit
Exit:
  restore
  blr
