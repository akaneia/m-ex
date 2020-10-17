#To be inserted @ 801a45bc
.include "../../Globals.s"
.include "../Header.s"

.set SlippiMajor,8

.set REG_VanillaScene,31
.set REG_MEXScene,30

backup

  load REG_VanillaScene,0x803daca4
  branchl r12,0x801a50ac
  mr REG_MEXScene,r3

# Get Vanilla scene 8
VanillaScene_Loop:
  lbz	r4, 0x0001 (REG_VanillaScene)
  cmpwi r4,SlippiMajor
  beq VanillaScene_Exit
  addi  REG_VanillaScene,REG_VanillaScene,20
  b VanillaScene_Loop
VanillaScene_Exit:

# Get MEX scene 8
MEXScene_Loop:
  lbz	r4, 0x0001 (REG_MEXScene)
  cmpwi r4,SlippiMajor
  beq MEXScene_Exit
  addi  REG_MEXScene,REG_MEXScene,MajorStride
  b MEXScene_Loop
MEXScene_Exit:

# Copy
  lwz r3,0x4(REG_VanillaScene)
  stw r3,0x4(REG_MEXScene)
  lwz r3,0x8(REG_VanillaScene)
  stw r3,0x8(REG_MEXScene)
  lwz r3,0xC(REG_VanillaScene)
  stw r3,0xC(REG_MEXScene)
  lwz r3,0x10(REG_VanillaScene)
  stw r3,0x10(REG_MEXScene)

Exit:
  restore
  li r31,0