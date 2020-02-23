#To be inserted @ 8005ff40
.include "../../Globals.s"
.include "../Header.s"

.set  REG_EffectData,31
.set  REG_PlayerGObj,30

#If under, return to injection site
  cmpwi r0,87
  ble Injection_Exit

backup

#Get expanded effect table
  lwz r3,OFST_EffectCreate(rtoc)
#Get this effects data
  subi  r0,r28,1299
  mulli r0,r0,0xC
  add  REG_EffectData,r3,r0
#Check effect type
  lwz r3,0x4(REG_EffectData)
  cmpwi r3,0
  bne Effect_Particle

Effect_Model:
#Pop some arg off the va_list
  addi	r3, sp, 508 + 0x100
  li  r4,1
  branchl r12,0x80322620
#Create Effect
  lwz r5,0x0(r3)
  lwz r3,0x0(REG_EffectData)
  mr  r4,REG_PlayerGObj
  lwz r12,0x8(REG_EffectData)
  mtctr r12
  bctrl
  b Exit

Effect_Particle:
#Pop some arg off the va_list
  addi	r3, sp, 508 + 0x100
  li  r4,1
  branchl r12,0x80322620
#Create Effect
  lwz r6,0x0(r3)
  li  r3,0
  lwz r5,0x0(REG_EffectData)
#Get effect file ID from effect ID
  load  r4,0x10624dd3
  mulhw  r4,r4,r5
  srawi	r4,r4,6
  lwz r12,0x8(REG_EffectData)
  mtctr r12
  bctrl
  b Exit

Exit:
  restore
  branch  r12,0x80061d40

Injection_Exit:
