#To be inserted @ 800bebc8
.include "../../Globals.s"
.include "../Header.s"

.set REG_AnimSymbolPtr, 31
.set REG_AnimArchive, 30
.set REG_FtKind, 29
.set REG_SymbolName, 28

backup
mr REG_FtKind, r3

# get symbol from dat
  mr r3, REG_AnimArchive      # anim archive
  lwz r4,OFST_FtDemoSymbols(rtoc)
  mulli r0,REG_FtKind,4
  lwzx r4,r4,r0               # string array
  mulli r0,r5,4
  lwzx REG_SymbolName,r4,r0               # symbol string
  mr r4, REG_SymbolName
  branchl r12,0x80380358
# check if it exists
  cmpwi r3,0
  beq NoExist

# store pointer to anim data
  stw	r3, 0 (REG_AnimSymbolPtr)
  b Exit


###############################################
NoExist:
# OSReport
  bl  ErrorString
  mflr  r3
  mr  r4, REG_FtKind
# symbol string
  mr r5, REG_SymbolName
  branchl r12,0x803456a8
#Assert
  bl  Assert_Name
  mflr  r3
  li  r4,0
  load  r5,0x804d3940
  branchl r12,0x80388220
Assert_Name:
blrl
.string "m-ex"
.align 2
ErrorString:
blrl
.string "error: fighter %d has no symbol %s\n"
.align 2
###############################################


Exit:
  restore
  branch r12,0x800bebf0