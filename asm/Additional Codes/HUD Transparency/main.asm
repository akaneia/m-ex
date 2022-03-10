#To be inserted at 802f6690
.include "../../Globals.s"

.set REG_GObj,31
.set REG_GObjData,30

#Manager Data
.set mgr_size,0x24
.set mgr_stockcurr,0x0
.set mgr_stockfinal,0x4
.set mgr_insigcurr,0x8
.set mgr_insigfinal,0xC
.set mgr_pcntcurr,0x10
.set mgr_pcntfinal,0x14
.set mgr_posx,0x18
.set mgr_posy,0x1c
.set mgr_posz,0x20

backup

#Create GObj
  li  r3,14
  li  r4,15
  li  r5,0
  branchl r12,GObj_Create
  mr  REG_GObj,r3
#Allocate Space
  li	r3,mgr_size * 6
  branchl r12,HSD_MemAlloc
  mr	REG_GObjData,r3
#Zero
  li	r4, mgr_size * 6
  branchl r12,ZeroAreaLength
#Initialize
  mr	r6,REG_GObjData
  mr	r3,REG_GObj
  li	r4,4
  load	r5,HSD_Free
  branchl r12,GObj_AddUserData
#Add Process
  mr	r3,REG_GObj
  bl	Mgr_Think
  mflr  r4
  li	r5,19
  branchl r12,GObj_AddProc
#Init mgr struct
  bl Floats
  mflr r3
  mr r4,REG_GObjData
  li r5,0
MgrInit_Loop:
  lfs f1,0x8(r3)
  stfs f1,mgr_stockcurr(r4)
  lfs f1,0xC(r3)
  stfs f1,mgr_insigcurr(r4)
  lfs f1,0x10(r3)
  stfs f1,mgr_pcntcurr(r4)
  addi r5,5,1
  addi r4,r4,mgr_size
  cmpwi r5,6
  blt MgrInit_Loop
  b Exit

##############################

Mgr_Think:
blrl
.set REG_MgrData,31
.set REG_Floats,30

backup
lwz REG_MgrData,0x2C(r3)
bl Floats
mflr REG_Floats

# Init all HUD transparency
.set REG_Count,20
.set REG_ThisHUD,21
  li REG_Count,0
  mr REG_ThisHUD,REG_MgrData
Mgr_InitLoop:
# check if hud exists
  load r3, 0x804A10C8
  mulli r4, REG_Count, 0x68
  add r3, r3, r4
  lwz r3,0x0(r3)
  cmpwi r3, 0
  beq Mgr_InitInc
# do stuff
  lfs f1,0x8(REG_Floats)
  stfs f1,mgr_stockfinal(REG_ThisHUD)
  lfs f1,0xC(REG_Floats)
  stfs f1,mgr_insigfinal(REG_ThisHUD)
  lfs f1,0x10(REG_Floats)
  stfs f1,mgr_pcntfinal(REG_ThisHUD)
# Get this HUD elements pos
  mr r3,REG_Count
  branchl r12,0x802f3424
# Get onscreen coords
  mr  r4,r3
  load r3,0x804a0fd8    # get hud camera gobj
  lwz	r3, 0x0000 (r3)
  lwz	r3, 0x0028 (r3)   # get hud camera cobj
  addi r5,REG_ThisHUD, mgr_posx
  li r6,0
  branchl r12,0x8000e210
Mgr_InitInc:
  addi REG_Count,REG_Count,1
  addi REG_ThisHUD,REG_ThisHUD,mgr_size
  cmpwi REG_Count,6
  blt Mgr_InitLoop

# Check for collisions
.set REG_Fighter,20
.set REG_FighterData,21
  lwz	r3, -0x3E74 (r13)
  lwz REG_Fighter,0x20(r3)
  b MgrColl_FtCheck
MgrColl_FtLoop:
# Get Fighter Data
  lwz REG_FighterData,0x2C(REG_Fighter)
# Check if player is dead
  lbz r3,0x221f(REG_FighterData)
  rlwinm. r0,r3,0,0x40
  bne MgrColl_FtInc
# Check if player is invisible
  lbz r3,0x221e(REG_FighterData)
  rlwinm. r0,r3,0,0x80
  bne MgrColl_FtInc

# Get player box
# Boxes go Up, Down, Left, Right
  lfs f1,0x6F0 + 0x8 (REG_FighterData)
  lfs f2,0x6F0 + 0x88 (REG_FighterData)
  fadds f2,f1,f2
  stfs f2,0x80(sp)    # up
  lfs f2,0x6F0 + 0x90 (REG_FighterData)
  fadds f2,f1,f2
  stfs f2,0x84(sp)    # down
  lfs f1,0x6F0 + 0x4 (REG_FighterData)
  lfs f2,0x6F0 + 0x9C (REG_FighterData)
  fadds f2,f1,f2
  stfs f2,0x88(sp)    # left
  lfs f2,0x6F0 + 0x94 (REG_FighterData)
  fadds f2,f1,f2
  stfs f2,0x8C(sp)    # right
  
# Convert these coords to screen
  branchl r12,0x80030a50
  lwz	r29, 0x0028 (r3)
  li r3,0
  stw r3,0x68(sp) # Z
# Top Left
  lfs f1,0x88(sp)
  stfs f1,0x60(sp)
  lfs f1,0x80(sp)
  stfs f1,0x64(sp)
  mr r3,r29
  addi r4,sp,0x60   # point position
  addi r5,sp,0x70
  li r6,0
  branchl r12,0x8000e210
  lfs f1,0x70(sp)    # left
  stfs f1,0x88(sp)
  lfs f1,0x74(sp)     # bottom
  stfs f1,0x80(sp)
# Bot Right
  lfs f1,0x8C(sp)
  stfs f1,0x60(sp)
  lfs f1,0x84(sp)
  stfs f1,0x64(sp)
  mr r3,r29
  addi r4,sp,0x60   # point position
  addi r5,sp,0x70
  li r6,0
  branchl r12,0x8000e210
  lfs f1,0x70(sp)    # right
  stfs f1,0x8C(sp)
  lfs f1,0x74(sp)     # bottom
  stfs f1,0x84(sp)

  # Check if colliding with any HUD
  .set REG_Count,22
  .set REG_HUDPos,23
  .set REG_ThisHUD,24
    li REG_Count,0
  MgrColl_HUDLoop:
    mulli r3, REG_Count, mgr_size
    add REG_ThisHUD, REG_MgrData, r3
  # check if hud exists
    load r3, 0x804A10C8
    mulli r4, REG_Count, 0x68
    add r3, r3, r4
    lwz r3,0x0(r3)
    cmpwi r3, 0
    beq MgrColl_HUDInc
  # Check if fighter is within this HUDs area
  # Boxes go Up, Down, Left, Right
  # ft.left < hud.right
    lfs f1,mgr_posx(REG_ThisHUD)    # hud X
    lfs f2,0x14(REG_Floats)         # width
    fadds f1,f1,f2
    lfs f2,0x88(sp)
    fcmpo cr0,f2,f1
    bge MgrColl_HUDInc
  # ft.right > hud.left
    lfs f1,mgr_posx(REG_ThisHUD)    # hud X
    lfs f2,0x14(REG_Floats)   # width
    fsubs f1,f1,f2
    lfs f2,0x8C(sp)
    fcmpo cr0,f2,f1
    ble MgrColl_HUDInc
  # ft.top > hud.bottom
    lfs f1,mgr_posy(REG_ThisHUD)    # hud Y
    lfs f2,0x18(REG_Floats)   # height
    fsubs f1,f1,f2
    lfs f2,0x84(sp)
    fcmpo cr0,f2,f1
    ble MgrColl_HUDInc
  # ft.bottom < hud.top
    lfs f1,mgr_posy(REG_ThisHUD)    # hud Y
    lfs f2,0x18(REG_Floats)   # height
    fadds f1,f1,f2
    lfs f2,0x80(sp)
    fcmpo cr0,f2,f1
    bge MgrColl_HUDInc
  # is within, set new transparency 
    mulli r3,REG_Count,mgr_size
    add r3,r3,REG_MgrData
    lfs f2,0x0(REG_Floats)    # multipler
    lfs f1,0x8(REG_Floats)
    fmuls f1,f1,f2
    stfs f1,mgr_stockfinal(r3)
    lfs f1,0xC(REG_Floats)
    fmuls f1,f1,f2
    stfs f1,mgr_insigfinal(r3)
    lfs f1,0x10(REG_Floats)
    fmuls f1,f1,f2
    stfs f1,mgr_pcntfinal(r3)
  MgrColl_HUDInc:
    addi REG_Count,REG_Count,1
    cmpwi REG_Count,6
    blt MgrColl_HUDLoop

MgrColl_FtInc:
  lwz REG_Fighter,0x8(REG_Fighter)
MgrColl_FtCheck:
  cmpwi REG_Fighter,0
  bne MgrColl_FtLoop

# Update Transparency
  .set REG_Count,20
  .set REG_ThisHUD,21
    li REG_Count,0
  MgrUpdate_HUDLoop:
    mulli r3,REG_Count,mgr_size
    add REG_ThisHUD,r3,REG_MgrData

  # check if hud exists
    load r3, 0x804A10C8
    mulli r4, REG_Count, 0x68
    add r3, r3, r4
    lwz r3,0x0(r3)
    cmpwi r3, 0
    beq MgrUpdate_HUDInc

    # Update stocks
    load r3,0x804a1380
    mulli r4,REG_Count,0x50
    add r3,r3,r4
    lwz r3,0x0(r3)
    cmpwi r3,0
    beq 0xC
    addi r4,REG_ThisHUD, 0 * mgr_size 
    bl ElementUpdate

    # Update insignia
    load r3,0x804a10c8
    mulli r4,REG_Count,0x64
    add r3,r3,r4
    lwz r3,0x4(r3)
    cmpwi r3,0
    beq 0xC
    addi r4,REG_ThisHUD, 1 * 0x8 
    bl ElementUpdate

    # Update percent
    load r3,0x804a10c8
    mulli r4,REG_Count,0x64
    add r3,r3,r4
    lwz r3,0x0(r3)
    cmpwi r3,0
    beq 0xC
    addi r4,REG_ThisHUD, 2 * 0x8 
    bl ElementUpdate

  MgrUpdate_HUDInc:
    addi REG_Count,REG_Count,1
    cmpwi REG_Count,6
    blt MgrUpdate_HUDLoop

Mgr_Exit:
  restore
  blr

##############################

ElementUpdate:
# r3 = gobj
# r4 = mgr data

.set REG_JObj, 31
.set REG_MgrData, 30
.set REG_Floats,29

backup
lwz  REG_JObj,0x28(r3)
mr  REG_MgrData,r4
bl Floats
mflr  REG_Floats

# check if already at destination transparency
  lfs f1,0x0(REG_MgrData)   # curr
  lfs f2,0x4(REG_MgrData)   # final
  lfs f3,0x4(REG_Floats)    # step amt
  fcmpo cr0,f1,f2
  beq ElementUpdate_Exit

# Check whether to add or sub
  bgt ElementUpdate_Sub

ElementUpdate_Add:
# add to curr
  fadds f1,f1,f3
# check if over destination
  fcmpo cr0,f1,f2
  ble ElementUpdate_SetAlpha
# use destination alpha
  fmr f1,f2
  b ElementUpdate_SetAlpha

ElementUpdate_Sub:
# add to curr
  fsubs f1,f1,f3
# check if under destination
  fcmpo cr0,f1,f2
  bge ElementUpdate_SetAlpha
# use destination alpha
  fmr f1,f2
  b ElementUpdate_SetAlpha

ElementUpdate_SetAlpha:
  stfs f1,0x0(REG_MgrData)   # update curr
  mr  r3,REG_JObj
  bl  JOBJ_SetAllAlpha
  

ElementUpdate_Exit:
  restore
  blr

##############################  

JOBJ_SetAllAlpha:
# r3 = jobj
# f1 = alpha

.set REG_JObj, 31
.set REG_DObj, 30

# backup jobj
  mflr r0
  stw	r0, 0x0004 (sp)
  stwu	sp, -0x001C (sp)
  stw	REG_JObj, 0x0014 (sp)
  stw	REG_DObj, 0x0018 (sp)
  mr REG_JObj,r3

# set all mobj alpha
  lwz REG_DObj,0x18(REG_JObj)
  b JOBJ_SetAllAlpha_DObjCheck
JOBJ_SetAllAlpha_DObjLoop:
  lwz r3,0x8(REG_DObj)   # get mobj
  cmpwi r3,0
  beq JOBJ_SetAllAlpha_DObjInc
  lwz r3,0xC(r3)          # get material
  cmpwi r3,0
  beq JOBJ_SetAllAlpha_DObjInc
  stfs f1,0xC(r3)          # set alpha
JOBJ_SetAllAlpha_DObjInc:
  lwz REG_DObj,0x4(REG_DObj)
JOBJ_SetAllAlpha_DObjCheck:
  cmpwi REG_DObj,0
  bne JOBJ_SetAllAlpha_DObjLoop

# run on child
  lwz r3,0x10(REG_JObj)
  cmpwi r3,0
  beq 0x8
  bl  JOBJ_SetAllAlpha
# run on sibling
  lwz r3,0x8(REG_JObj)
  cmpwi r3,0
  beq 0x8
  bl  JOBJ_SetAllAlpha

JOBJ_SetAllAlpha_Exit:
  lwz	REG_DObj, 0x0018 (sp)
  lwz	REG_JObj, 0x0014 (sp)
  lwz r0,0x20(sp)
  addi	sp, sp, 0x001C
  mtlr r0
  blr

##############################

Floats:
blrl
.float 0.4 # Final Transparency Multipler
.float 0.08 # Transparency Step
.float 0.999 # Stock Default Transparency
.float 0.699 # Insignia Default Transparency
.float 0.999 # Percent Default Transparency
.float 65     # HUD Collision Width
.float 65     # HUD Collision Height

.float 2     # Fighter Position Divisor

Exit:
  restore
  lwz	r0, 0x001C (sp)