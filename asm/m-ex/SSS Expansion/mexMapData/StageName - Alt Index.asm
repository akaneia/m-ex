#To be inserted @ 8025a014
.include "../../../Globals.s"
.include "../../Header.s"

#Get pointer
  lwz r4,OFST_mexMapData(r13)
  cmpwi r4,0
  beq Original

#Use joint index as text index
  lhz	r29, 0 (r28)
  b Exit

Original:
  lwz	r29, 0x0024 (sp)

Exit:
