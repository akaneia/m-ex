#To be inserted @ 803d7080
.include "../../Globals.s"
.include "../Header.s"

# void KirbyStateChange(GOBJ *fighter, int state, GOBJ *ability_source, float startFrame, float animSpeed, float animBlend)

.set  REG_GObj,31
.set  REG_State,30
.set  REG_AbilityGObj,29
.set  REG_FighterData,28
.set  REG_AbilityGObjData,27
.set  REG_StateMoveLogic,26
.set  REG_Frame,31
.set  REG_Speed,30
.set  REG_Blend,29

# Init
  backup
  stfs  REG_Speed,0x80(sp)
  stfs  REG_Blend,0x84(sp)
  stfs  REG_State,0x88(sp)
  mr  REG_GObj,r3
  mr  REG_State,r4
  mr  REG_AbilityGObj,r5
  fmr  REG_Frame,f1
  fmr  REG_Speed,f2
  fmr  REG_Blend,f3
  lwz REG_AbilityGObjData,0x2C(REG_AbilityGObj)
  lwz REG_FighterData,0x2C(REG_GObj)
  
# Get move logic
  lwz r3,0x18(REG_AbilityGObjData)
  cmpw  REG_State,r3    # check if state is a special state
  blt Error
  sub r3,REG_State,r3
  mulli r3,r3,0x20
  lwz r4,0x20(REG_AbilityGObjData)  # fighters special move logic
  add REG_StateMoveLogic,r3,r4

# Enter Dummy State
  mr  r3,REG_GObj 
  li  r4,0XEF        # dummy state id
  lis  r5,0x2000  # no anim update
  li  r6,0        # no source gobj
  fmr f1,REG_Frame
  fmr f2,REG_Speed
  fmr f3,REG_Blend
  branchl r12,ActionStateChange

# Load animation data from source  
  mr  r3, REG_FighterData         # anim dest
  mr  r4, REG_AbilityGObjData     # anim source
  lwz r5,0x0(REG_StateMoveLogic)  # anim ID
  branchl r12,0x80085cd8

# Store subaction pointer
  lwz r3,0x0(REG_StateMoveLogic)    # anim ID
  mulli	r3, r3, 24
  lwz r4,0x24(REG_AbilityGObjData)  # ftcmd pointer
  add r3,r3,r4                      # this states ftcmd
  lwz r3,0xC(r3)                    # script data
  stw r3,0x3EC(REG_FighterData)

# Enter animation 
  lwz r3,0x590(REG_FighterData)
  cmpwi r3,0
  beq Error
  mr  r3,REG_GObj
  fmr f1,REG_Frame
  fmr f2,REG_Speed
  fmr f3,REG_Blend
  branchl r12,0x8006ebe8

# Unk
  li  r3,0
  stw r3,0x3E4(REG_FighterData)

# Increment state frame info
  mr  r3,REG_GObj
  branchl r12,0x8006e9b4

# Subaction update stuff
  lfs	f0, -0x778C (rtoc)
  fcmpo cr0,f0,REG_Frame
  bne SubactionSkip
SubactionStart:
  mr  r3,REG_GObj
  branchl r12,0x800c0408  # update colanims
  mr  r3,REG_GObj
  branchl r12,0x80073240  # update subaction unk
  b SubactionEnd
SubactionSkip:
  mr  r3,REG_GObj
  branchl r12,0x80073354
SubactionEnd:

# Copy callbacks from source
  lwz r3,0xC(REG_StateMoveLogic)  # unk callback
  stw r3,0x21A0(REG_FighterData)
  lwz r3,0x10(REG_StateMoveLogic) # unk callback
  stw r3,0x219C(REG_FighterData)
  lwz r3,0x14(REG_StateMoveLogic) # unk callback
  stw r3,0x21A4(REG_FighterData)
  lwz r3,0x18(REG_StateMoveLogic) # unk callback
  stw r3,0x21A8(REG_FighterData)
  lwz r3,0x1C(REG_StateMoveLogic) # unk callback
  stw r3,0x21AC(REG_FighterData)

  b Exit

Error:


Exit:
  lfs  REG_Speed,0x80(sp)
  lfs  REG_Blend,0x84(sp)
  lfs  REG_State,0x88(sp)
  restore
  blr
