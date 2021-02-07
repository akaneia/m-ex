#To be inserted @ 8022e90c
.include "../../Globals.s"
.include "../Header.s"

# check if exists
  lwz r12,OFST_mexMenu(r13)
  cmpwi r12,0
  beq Original
  load  r4,MenuThink
  b Exit

Original:
  lwz	r4, 0x0858 (r4)

Exit: