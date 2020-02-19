#To be inserted @ 80023578
.include "../../../../Globals.s"
.include "../../Header.s"

.set  REG_SFXID,30
.set  REG_SSMID,3

#Get SSM ID
  load  r3,0x68db8bad   #get magic number
  mulhw	r3, r3, REG_SFXID     #mult
  srawi	REG_SSMID, r3,12       #shift
  branch  r12,0x80023634
