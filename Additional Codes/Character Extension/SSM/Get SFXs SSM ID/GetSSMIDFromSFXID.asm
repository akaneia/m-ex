#To be inserted @ 80023148
.include "../../../../Globals.s"
.include "../../Header.s"

.set  REG_SFXID,3
.set  REG_SSMID,3

#Get SSM ID
  load  r4,0x68db8bad   #get magic number
  mulhw	r4, r4, REG_SFXID     #mult
  srawi	REG_SSMID, r4,12       #shift
  blr
