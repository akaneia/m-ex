################################################################################
# Address: 0x800163f8
# Skips Slippi's GetFileSize
################################################################################

.include "../../Globals.s"
.include "../Header.s"

.set Archive_GetLocalizedFilename, 0x80016204
.set REG_FILENAME, 30
.set REG_LR, 20

CODE_START:
  branchl r12, Archive_GetLocalizedFilename # replaced branch
  mr REG_FILENAME, r3
  backup

# If not slippi, continue as normal
  load r3, 0x801a5014
  lwz r3, 0x0(r3)
  load r4, 0x40820010
  cmpw r3, r4
  beq EXIT

# check if we're coming from the SSS
  lwz r3, 0(sp) # traverse stack
  lwz r3, 0(r3)
  lwz r3, 0(r3)
  lwz REG_LR, 0x4(r3)

  load r3, 0x8025a9dc
  cmpw REG_LR, r3
  beq SKIP_SSS
  load r3, 0x8025a9ec
  cmpw REG_LR, r3
  beq SKIP_SSS
  b EXIT

  SKIP_SSS:
    restore
    mr r3, REG_FILENAME
    branch r12, 0x80016400

EXIT:
  restore
  mr r3, REG_FILENAME