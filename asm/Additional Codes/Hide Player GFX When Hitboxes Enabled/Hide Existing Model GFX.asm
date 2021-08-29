#To be inserted at 8005c040
.include "../../Globals.s"

# Get function addr
  bl  GX_Callback
  mflr r4
  b Injection_Exit

GX_Callback:
blrl
.set REG_GObj, 31
.set REG_Pass, 30

# Init
  backup
  mr REG_GObj,r3
  mr REG_Pass,r4

# Get effect data
  lwz r3,0x2C(REG_GObj)
  cmpwi r3,0
  beq GX_Render
# Get effect parent
  lwz r3,0x8(r3)
  cmpwi r3,0
  beq GX_Render
#Check if this is a player GObj
  lhz r4,0x0(r3)
  cmpwi r4,0x4
  bne GX_Render
#Get player's hitbox visibility flag
  lwz r3,0x2C(r3)
  lbz r4,0x21FC(r3)
  rlwinm. r0,r4,0,30,30
  bne GX_Exit

GX_Render:
  mr r3, REG_GObj
  mr r4, REG_Pass
  branchl r12,0x80391070

GX_Exit:
  restore
  blr




Injection_Exit:
