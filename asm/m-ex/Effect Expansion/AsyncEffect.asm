#To be inserted @ 800a0070
.include "../../Globals.s"
.include "../Header.s"

.set  REG_EffectID,31
.set  REG_FighterData,30
.set  REG_FighterGObj,26
.set  REG_BoneIndex,27

#Check for custom gfx
  cmpwi	REG_EffectID, EffMdlStart
  blt Original
  cmpwi REG_EffectID, MEXEffectEnd
  bge Original

.set  REG_EffectObj, 20
backup

# Get orientation
  lfs	f1, -0x7210 (rtoc)
  lwz r3, 0xE0 (REG_FighterData)
  cmpwi r3,0
  bne Effect_NoGround
  lfs	f0, 0x0844 (REG_FighterData)
  lfs	f2, 0x0848 (REG_FighterData)
  fneg	f1,f0
  branchl r12,0x80022c30
Effect_NoGround:
  stfs	f1, 0x80 (sp)
  addi r8, sp, 0x80
# Facing direction
  lfs f1, 0x2C (REG_FighterData)
  stfs	f1, 0x84 (sp)
  addi r7, sp, 0x84
# Offset
  addi r6, sp, 0x84 + 0x100
# Get bone jobj
  lwz	r5, 0x05E8 (REG_FighterData)
  rlwinm	r0, REG_BoneIndex, 4, 0, 27
  lwzx r5,r5,r0
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
  lwz	r0, 0x60C (REG_FighterData)
  stw	r0, 0 (REG_EffectObj)
  stw	REG_EffectObj, 0x60C (REG_FighterData)
  b Effect_Exit_Return
Effect_Exit_AsyncCheck:
# Unk
  mr r3,REG_FighterGObj
  mr r4,REG_EffectObj
  branchl r12,0x8006744c

Effect_Exit_Return:
  restore
  branch r12,0x800a0084

Original:
  lis	r3, 0x803C
