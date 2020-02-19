#To be inserted at 800690e8
.include "../../Globals.s"
.include "Header.s"

.set  REG_PlayerData,30
.set  REG_Header,29
.set  REG_InternalID,28

backup

#Get main dat file string
  lwz	REG_InternalID, 0x0004 (r30)
  lwz r3,OFST_MnSlChrCharFileNames(rtoc)
  mulli r0,REG_InternalID,8
  lwzx  r3,r3,r0
#Get header
  branchl r12,0x8001819c
  mr  REG_Header,r3

#Get symbol offset from file
  bl  SymbolName
  mflr  r4
  branchl r12,0x80380358
  cmpwi r3,0
  beq Exit

#Copy function pointers
  lwz r4,0x0(r3)
  lwz r5,OFST_FighterOnLoad(rtoc)
  mulli r6,REG_InternalID,4
  stwx  r4,r6,r5

#Flush instruction cache so code can be run from this file
  lwz r3,0x40(REG_Header)
  lwz r4,0x0(REG_Header)
  branchl r12,0x80328f50

  b Exit

SymbolName:
blrl
.string "ftFunction"
.align 2

Exit:
  restore
  lwz	r4, 0x0004 (r30)
