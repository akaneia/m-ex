#To be inserted @ 80259f64
.include "../../../Globals.s"
.include "../../Header.s"

#Get pointer
  lwz r7,OFST_mexMapData(r13)
  cmpwi r7,0
  beq Original

#Use custom matanim
  lwz	r5, 0x14 (r7)
  b Exit

Original:
  lwz	r5, 0x0038 (r6)

Exit:
