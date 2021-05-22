#To be inserted @ 80278ca0
.include "../../../Globals.s"
.include "../../Header.s"

.set  REG_EffectID,31
.set  REG_ItemGObj,30
.set  REG_ItemData,29
.set  REG_BoneIndex,25

# original logic
  bge Custom
  b Injection_Exit

Custom:
backup
.set  REG_FighterGObj,20
.set  REG_EffectObj,21

#Check for custom gfx
  cmpwi	REG_EffectID, EffMdlStart
  blt Exit
  cmpwi REG_EffectID, MEXEffectEnd
  bge Exit
#Check if item has a parent gobj
  lwz r3,0x518(REG_ItemData)
  mr. REG_FighterGObj,r3
  beq Exit

# Get orientation
  lfs	f1, -0x7210 (rtoc)
  lwz r3, 0xC0 (REG_ItemData)
  cmpwi r3,0
  bne Effect_NoGround
  lfs	f0, 0x378 + 0x154 (REG_ItemData)
  lfs	f2, 0x378 + 0x158 (REG_ItemData)
  fneg	f1,f0
  branchl r12,0x80022c30
Effect_NoGround:
  stfs	f1, 0x80 (sp)
# Get bone jobj
  mr r3,REG_ItemGObj
  mr r4,REG_BoneIndex
  branchl r12,0x80272cc0
  mr r5,r3
# Orientation from before
  addi r8, sp, 0x80
# Facing direction
  lfs f1, 0x2C (REG_ItemData)
  stfs	f1, 0x84 (sp)
  addi r7, sp, 0x84
# Offset
  addi r6, sp, 0x74 + 0x100
# Fighter GObj
  mr r4,REG_FighterGObj
# Effect ID
  mr r3,REG_EffectID
# Spawn Effect
  branchl r12,0x803d70a0
  mr REG_EffectObj,r3

# Unk
  lwz	r3, -0x3E68 (r13)
  cmpwi r3,0
  beq Effect_Exit_AsyncCheck
# Unk
  lbz	r0, 0x000C (r3)
  cmpwi r0,9
  bge Effect_Exit_AsyncCheck
# Unk
  lwz	r0, 0xBC0 (REG_ItemData)
  stw	r0, 0 (REG_EffectObj)
  stw	REG_EffectObj, 0xBC0 (REG_ItemData)
  b Exit
Effect_Exit_AsyncCheck:
# Unk
  mr r3,REG_ItemGObj
  mr r4,REG_EffectObj
  branchl r12,0x8006744c

Exit:
restore
branch r12,0x80278f18

Injection_Exit:

