#To be inserted @ 8016d950
.include "../../Globals.s"
.include "../Header.s"

.set REG_PlayerData, 29
.set REG_Count, 28
.set REG_Inputs,12
.set REG_Eggs,11
.set REG_PadID,10

# use function 8023754c to check nametag text

# init easter egg value to -1
  addi  REG_Eggs,rtoc,OFST_EasterEgg
  li  r3,-1 
  stbx r3,REG_Eggs,REG_Count

# check if human
  lbz r0,0x1(REG_PlayerData)
  cmpwi r0,0
  bne Exit

# get controller index
  mr r3,REG_Count
  branchl r12,0x8003345c
  mr REG_PadID,r3

# check inputs and set easter egg value
  load  r4,0x804c20bc
  mulli r3,REG_PadID,68
  add r3,r3,r4
  lwz REG_Inputs,0x0(r3)

# Check for furby
  rlwinm. r0,REG_Inputs,0,0x1
  beq NoFurby
# Store furby bool
  li  r3,Egg_Furby
  stbx r3,REG_Eggs,REG_Count
  b Exit
NoFurby:

# Check for dog
  rlwinm. r0,REG_Inputs,0,0x2
  beq NoDog
# Store dog bool
  li  r3,Egg_Dog
  stbx r3,REG_Eggs,REG_Count
  b Exit
NoDog:

# Check for kabi
  rlwinm. r0,REG_Inputs,0,0x4
  beq NoKabi
# Store kabi bool
  li  r3,Egg_Kabi
  stbx r3,REG_Eggs,REG_Count
  b Exit
NoKabi:


Exit:
  lbz	r0, 0x0001 (r29)