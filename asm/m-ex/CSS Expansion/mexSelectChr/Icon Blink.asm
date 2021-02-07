#To be inserted @ 80260c8c
.include "../../../Globals.s"
.include "../../Header.s"

#Check for mexSelectChr
  lwz r3,OFST_mexSelectChr(r13)
  cmpwi r3,0
  beq Original

#Get icons jobj
  lwz	r3, OFST_mexSelectChr_IconJoint (r13)
  addi  r4,sp,0x98
  addi  r5,r20,1
  li  r6,-1
  crclr	6
  branchl r12,0x80011e24

#Skip original code
  branch  r12,0x80260cdc

Original:
  lbz	r0, -0x49AB (r13)
