#To be inserted @ 80088008
.include "../../../Globals.s"
.include "../../Header.s"

.set  REG_SFXID,3
.set  REG_SSMID,3

#Get SSM ID
  li  r4,10000
  mullw 	REG_SSMID, r4, REG_SFXID     #mult
  stw REG_SSMID,0x18(sp)

#Exit
  li  r3,0
