#To be inserted @ 8025aca0
.include "../../../Globals.s"
.include "../../Header.s"
#Check for mexMapData
  lwz	r3, -0x4A0C (r13)
  bl  mexMapData
  mflr  r4
  branchl r12,0x80380358
  cmpwi r3,0
  beq Original
#Store pointer
  stw r3,OFST_mexMapData(r13)

/*
plan is to go

positions model
iconmodel
randomIcon
branch to 8025ad68
place branch to 8025b31c at 8025ada4
*/

.set  REG_mexMapData,30
.set  REG_PositionsJObj,29
#Init
  backup
  mr  REG_mexMapData,r3

InitPositionsModel:
  .set  REG_GObj,20
  .set  REG_JObj,21
  #Create GObj
    li  r3,4
    li  r4,5
    li  r5,128
    branchl r12,0x803901f0
    mr  REG_GObj,r3
  #Load joint
    lwz r3,0xC(REG_mexMapData)
    branchl r12,0x80370e44
    mr  REG_PositionsJObj,r3
  #Store object pointer
    mr  r3,REG_GObj
    lbz	r4, -0x3E57 (r13)
    mr  r5,REG_PositionsJObj
    branchl r12,0x80390a70
  #Add GX Link
    mr  r3,REG_GObj
    load  r4,0x80391070
    li  r5,4
    li  r6,130
    branchl r12,0x8039069c
  #Add proc
    mr  r3,REG_GObj
    load  r4,0x8022eae0
    li  r5,4
    branchl r12,0x8038fd54
  #Add anim
    mr  r3,REG_PositionsJObj
    lwz r4,0x10(REG_mexMapData)
    li  r5,0
    li  r6,0
    branchl r12,0x8036fb5c
  #Animate All Children
  .set  REG_ThisJObj,22
    lwz  REG_ThisJObj,0x10(REG_PositionsJObj)    #get child
  InitPositionsModel_Loop:
    mr  r3,REG_ThisJObj
    lfs	f1, -0x3640 (rtoc)
    branchl r12,0x8036f8bc
    mr  r3,REG_ThisJObj
    branchl r12,0x80370928
  InitPositionsModel_IncLoop:
    lwz  REG_ThisJObj,0x8(REG_ThisJObj)    #get sibling
    cmpwi REG_ThisJObj,0
    bne InitPositionsModel_Loop

InitStageUnlock:
  .set  REG_IconData,20
  .set  REG_Count,21
  lwz REG_IconData,OFST_Menu_SSS(rtoc)
  li  REG_Count,0
  InitStageUnlock_Loop:
  #Check if unlocked
    lwz	r3, 0x1C (REG_IconData)
    branchl r12,0x80164430
    cmpwi r3,0
    beq InitStageUnlock_Locked
  InitStageUnlock_Unlocked:
    li  r0,2
    b InitStageUnlock_Store
  InitStageUnlock_Locked:
    li  r0,1
  InitStageUnlock_Store:
    stb r0,0x8(REG_IconData)
  #Inc Loop
    addi  REG_IconData,REG_IconData,SSS_Stride
    addi  REG_Count,REG_Count,1
    #lwz r3,OFST_Metadata_SSSIconCount(rtoc)
    cmpwi REG_Count,29
    blt InitStageUnlock_Loop

InitIconsModel:
  .set  REG_GObj,20
  .set  REG_JObj,21
  .set  REG_Count,22
  .set  REG_IconData,23
  .set  REG_ThisPosJoint,24
  li  REG_Count,0
  lwz REG_IconData,OFST_Menu_SSS(rtoc)
  lwz REG_ThisPosJoint,0x10(REG_PositionsJObj)
  InitIconsModel_Loop:
  #Skip random icon
    #cmpwi REG_Count,RandomIconID
    #beq InitIconsModel_IncLoop
  #Create GObj
    li  r3,4
    li  r4,5
    li  r5,128
    branchl r12,0x803901f0
    mr  REG_GObj,r3
  #Load joint
    lwz r3,0x0(REG_mexMapData)
    branchl r12,0x80370e44
    mr  REG_JObj,r3
  #Store object pointer
    mr  r3,REG_GObj
    lbz	r4, -0x3E57 (r13)
    mr  r5,REG_JObj
    branchl r12,0x80390a70
  #Add GX Link
    mr  r3,REG_GObj
    load  r4,0x80391070
    li  r5,4
    li  r6,131
    branchl r12,0x8039069c
  #Add proc
    mr  r3,REG_GObj
    load  r4,0x8022eae0
    li  r5,3
    branchl r12,0x8038fd54
  #Add Anim
    mr  r3,REG_JObj
    lwz r4,0x4(REG_mexMapData)
    lwz r5,0x8(REG_mexMapData)
    li  r6,0
    branchl r12,0x8036fb5c
  #Attach JObj to nth position model jobj
    mr  r3,REG_JObj
    mr  r4,REG_ThisPosJoint
    bl  JOBjAttach
  #Store to icon data
    stw REG_JObj,0x0(REG_IconData)
  #Animate based on icon status
    lbz r0,0x8(REG_IconData)
    cmpwi r0,1
    beq InitIconsModel_Invisible
    blt InitIconsModel_Hidden
  InitIconsModel_Shown:
  #Anim
    mr  r3,REG_JObj
    lbz r4,0x9(REG_IconData)
    lfs	f1, -0x3640 (rtoc)
    branchl r12,0x8036f8bc
  #Model Preview Unk
    /*
    lbz r3,0x9(REG_IconData)
    subi  r3,r3,22
    xoris r3,r3,0x8000
    */
    addi  r3,REG_Count,2
    xoris r3,r3,0x8000
    stw r3,0x84(sp)
    lis r3,0x4330
    stw r3,0x80(sp)
    lfd f1, -0x3648 (rtoc)
    lfd f0,0x80(sp)
    fsubs f1,f0,f1
    mr  r3,REG_JObj
    li  r4,16
    branchl r12,0x8036f7b0
    mr  r3,REG_JObj
    branchl r12,0x80370928
    mr  r3,REG_JObj
    li  r4,6
    li  r5,1024
    load  r6,0x8036414c
    li  r7,6
    li  r8,0
    li  r9,0
    crclr 6
    branchl r12,0x80364c08
    b InitIconsModel_IncLoop
  InitIconsModel_Invisible:
  #Set as invisible
    li  r0,0
    stb r0,0x8(REG_IconData)
  InitIconsModel_Hidden:
  #Can still select?
    mr  r3,REG_JObj
    li  r4,16
    branchl r12,0x80371d9c
    b InitIconsModel_IncLoop
  InitIconsModel_IncLoop:
    addi  REG_Count,REG_Count,1
    addi  REG_IconData,REG_IconData,SSS_Stride
    lwz REG_ThisPosJoint,0x8(REG_ThisPosJoint)
    cmpwi REG_ThisPosJoint,0
    bne InitIconsModel_Loop

InitRandomIcon:
  .set  REG_GObj,20
  .set  REG_JObj,21
  #Create GObj
    li  r3,4
    li  r4,5
    li  r5,128
    branchl r12,0x803901f0
    mr  REG_GObj,r3
  #Load joint
    lwz	r3, -0x4A08 (r13)
    lwz	r3, 0x0010 (r3)
    branchl r12,0x80370e44
    mr  REG_JObj,r3
  #Store object pointer
    mr  r3,REG_GObj
    lbz	r4, -0x3E57 (r13)
    mr  r5,REG_JObj
    branchl r12,0x80390a70
  #Add GX Link
    mr  r3,REG_GObj
    load  r4,0x80391070
    li  r5,4
    li  r6,131
    branchl r12,0x8039069c
  #Add proc
    mr  r3,REG_GObj
    load  r4,0x8022eae0
    li  r5,4
    branchl r12,0x8038fd54
  #Add anim
    mr  r3,REG_JObj
    li  r4,0
    li  r5,0
    li  r6,0
    branchl r12,0x8036fb5c
  #Get 28th position model jobj
    mr  r3,REG_PositionsJObj
    addi  r4,sp,0x80
    lwz r5,OFST_Metadata_SSSIconCount(rtoc)
    #li  r5,7
    li  r6,-1
    crclr 6
    branchl r12,0x80011e24
  #Attach
    mr  r3,REG_JObj
    lwz r4,0x80(sp)
    bl  JOBjAttach
  #Anim
    mr  r3,REG_JObj
    lfs	f1, -0x3640 (rtoc)
    branchl r12,0x8036f8bc
    mr  r3,REG_JObj
    li  r4,16
    lfs	f1, -0x3608 (rtoc)
    branchl r12,0x8036f7b0
    mr  r3,REG_JObj
    branchl r12,0x80370928
  #Anim2
    mr  r3,REG_JObj
    li  r4,6
    li  r5,1024
    load  r6,0x8036414c
    li  r7,0
    li  r8,0
    li  r9,0
    crclr 6
    branchl r12,0x80364c08
  #Store joint to icon data
    lwz r3,OFST_Menu_SSS(rtoc)
    stw REG_JObj,SSS_Stride*29(r3)

#Skip original icon init
  restore
  branch  r12,0x8025b31c

mexMapData:
blrl
.string "mexMapData"
.align 2

JOBjAttach:
.set  REG_ToAttach,31
.set  REG_AttachTo,30
#Init
  backup
  mr  REG_ToAttach,r3
  mr  REG_AttachTo,r4
#Attach rotation and position
  branchl r12,0x8000c2f8

#Attach Scale
.set  REG_RObj,29
  branchl r12,0x8037C444    #alloc robj
  mr	REG_RObj, r3
  load  r4,0x90000008
  branchl r12,0x8037AE90    #set flags
  addi	r3, REG_RObj, 0
  addi	r4, REG_AttachTo, 0
  branchl r12,0x8037CC90
  addi	r3, REG_ToAttach, 0
  addi	r4, REG_RObj, 0
  branchl r12,0x80371C68

JOBjAttach_Exit:
  restore
  blr

Original:
#Store null pointer to mexMapData
  li  r3,0
  stw r3,OFST_mexMapData(r13)
#Orig codeline
  li	r3, 4
