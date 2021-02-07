#To be inserted @ 801b3984
.include "../../Globals.s"
.include "../Header.s"

.set  masterHand,7
.set  wireMale,6
.set  wireFemale,5
.set  gigaBowser,4
.set  crazyHand,3
.set  sandbag,2
.set  popo,1

.set REG_ExtID, 0
.set REG_ExtIDNum, 10

# orig
  extsb	REG_ExtID, r3

#Check if a special character
  cmpwi REG_ExtID,0x1a
  blt NormalCharacter
  cmpwi REG_ExtID,0x20
  bgt NormalCharacter

# get special fighter index
  lwz REG_ExtIDNum,OFST_Metadata_FtExtNum(rtoc)
  mr r12,REG_ExtID
  subi r12, r12, 0x1A
# get m-ex special fighter ID
  subi  r11,REG_ExtIDNum,masterHand
  add  REG_ExtID,r11,r12

NormalCharacter:

Exit: