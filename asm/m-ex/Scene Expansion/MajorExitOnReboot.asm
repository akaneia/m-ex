#To be inserted @ 801a4234
.include "../../Globals.s"
.include "../Header.s"

# normally, the major exit isn't executed on a reboot. instead, the reboot 
# re-initializes every major scene like on startup. this normally isn't an issue,
# but if a major wants to modify data for the duration of the major and cleanup
# upon leaving, rebooting will bypass this cleanup.

# get major scene data
.set REG_CurrMajor,12
.set REG_MajorDesc,11
  branchl r12,0x801a50ac
  mr REG_MajorDesc,r3
  load REG_CurrMajor,0x80479D30
  lbz REG_CurrMajor,0x0(REG_CurrMajor)
MajorSearch_Loop:
  lbz r3,0x1(REG_MajorDesc)
# check if terminating id
  lwz r4,OFST_MetaData_TermMajor(rtoc)
  cmplw	r3, r4
  beq Exit
# check if it is the current major
  cmpw r3,REG_CurrMajor
  beq MajorSearch_LoopEnd
MajorSearch_LoopInc:
  addi	REG_MajorDesc, REG_MajorDesc, MajorStride
  b MajorSearch_Loop
MajorSearch_LoopEnd:

# exec func
  lwz r12,0x8(REG_MajorDesc)
  cmpwi r12,0
  beq Exit
  mtlr r12
  blrl

Exit:
  branchl r12,0x8015fba4