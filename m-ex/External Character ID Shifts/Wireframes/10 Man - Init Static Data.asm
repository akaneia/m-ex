#To be inserted @ 80182288
.include "../../../Globals.s"
.include "../../Header.s"

# get external count
  lwz r12,OFST_Metadata_FtExtNum(rtoc)

# check which wireframe
  lbz	r0, 0x0005 (r3)
  cmpwi r0,0x1b
  beq Male 
  cmpwi r0,0x1c
  beq Female
  b Exit   

Male:
  subi r0,r12,6
  b Exit

Female:
  subi r0,r12,5
  b Exit

Exit:
