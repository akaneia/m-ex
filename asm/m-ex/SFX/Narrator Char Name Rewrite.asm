#To be inserted @ 80168c6c
.include "../../Globals.s"
.include "../Header.s"

#Check if over
  lwz r12,OFST_Metadata_FtExtNum(rtoc)
  subi  r12,r12,4
  cmpw	r3, r12
  bgt Exit
#Get name SFX Definitions
  lwz r4,OFST_SFXNameDef(rtoc)
  mulli r3,r3,4
  lwzx  r3,r3,r4
  branchl r12,0x800243f4

Exit:
  lwz	r0, 0x000C (sp)
  addi	sp, sp, 8
  mtlr	r0
  blr
