################################################################################
# Address: 0x800166b4
################################################################################

.include "../../Globals.s"
.include "../Header.s"

.set STRNCMP, 0x803258a8
.set Archive_GetLocalizedFilename, 0x80016204
.set REG_FILENAME, 30
.set REG_LR, 20

CODE_START:
  branchl r12, Archive_GetLocalizedFilename # replaced branch
  mr REG_FILENAME, r3
  backup
  
# If not slippi, continue as normal
  load r3,0x801a5014
  lwz r3,0x0(r3)
  load r4,0x40820010
  cmpw r3,r4
  beq EXIT

# check if we're coming from the SSS
  lwz r0, 0x4(sp)
  load r3, 0x8025a9dc
  cmpw r0, r3
  beq SKIP_SSS
  load r3, 0x8025a9ec
  cmpw r0, r3
  beq SKIP_SSS
  b EXIT

  SKIP_SSS:
    restore
    branch r12, 0x800166bc

EXIT:
  restore
  mr r3, REG_FILENAME