################################################################################
# Address: 0x800166b4
################################################################################

.include "../../Globals.s"
.include "../Header.s"

.set STRNCMP, 0x803258a8
.set Archive_GetLocalizedFilename, 0x80016204
.set REG_FILENAME, 30

b CODE_START

STRING_BLRL:
blrl
.string "MnSlMap"

CODE_START:
  branchl r12, Archive_GetLocalizedFilename # replaced branch
  mr REG_FILENAME, r3
  backup
  
# If not slippi, continue as normal
  load r3,0x801a5014
  lwz r3,0x0(r3)
  load r4,0x40820010
  cmpw r3,r4
  bne EXIT

# if not SSS, continue as normal
  bl STRING_BLRL
  mflr r3
  mr r4, r3
  li r5, 7
  branchl r12, STRNCMP
  cmpwi r3, 0
  bne EXIT

# skip Slippi SSS
  restore
  branch r12, 0x800166bc

EXIT:
  mr r3, REG_FILENAME
  restore