#To be inserted @ 801c2b74
.include "../../../Globals.s"
.include "../../Header.s"

.set REG_Param, 31
.set REG_Count, 30
.set REG_Freqs, 29

# use frequency of 100%
  lis	r3, 0x4330
  li r0, 100
  li r4, 100
  branch r12,0x801c2b2c