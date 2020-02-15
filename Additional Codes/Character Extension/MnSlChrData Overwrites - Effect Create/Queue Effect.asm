#To be inserted @ 800a0070
.include "../../../Globals.s"
.include "../Header.s"

.set  REG_EffectData,31
.set  REG_PlayerData,30
.set  REG_PlayerGObj,26

#First QUEUE-ABLE GFX is 1301

#Check for custom gfx
  cmpwi	r31, 1301
  blt Original
CustomEffect:
  mr  r3,REG_PlayerGObj
  addi	r4, REG_PlayerData, 1548
  li  r5,6            #Effect behavior?
  mr  r6,r31          #EFfect ID
  lwz	r7, 0x05E8 (REG_PlayerData)
  rlwinm	r0, r27, 4, 0, 27
  lwzx	r7, r7, r0    #bone jobj pointer
  addi	r8, sp, 132
  addi	r9, sp, 44
  addi	r10, sp, 124
  branchl  r12,0x800676f0
  branch  r12,0x800a0084
Original:
  lis	r3, 0x803C
