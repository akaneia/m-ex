#To be inserted at 8009cb68
.include "../../Globals.s"
.include "../Header.s"

# compare current index with amount defined in PlXX.dat
  cmpw r4,r0
  blt Original
Over:
  branch r12,0x8009cf6c

Original:
  branch r12,0x8009cb70