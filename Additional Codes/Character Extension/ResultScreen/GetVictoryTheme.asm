#To be inserted @ 80160400
.include "../../../Globals.s"
.include "../Header.s"

backup

#Check if over
  cmpwi r3,33 + NumOfAddedChars
  bgt Error
#Get name SFX Definitions
  lwz r4,OFST_GmRstVictoryTheme(rtoc)
  mulli r3,r3,4
  lwzx  r3,r3,r4
  b Exit

Error:
  li  r3,-1
Exit:
  restore
  blr
