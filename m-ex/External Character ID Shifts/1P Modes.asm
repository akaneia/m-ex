#To be inserted @ 8017d500
.include "../../Globals.s"
.include "../Header.s"

.set  masterHand,7
.set  wireMale,6
.set  wireFemale,5
.set  gigaBowser,4
.set  crazyHand,3
.set  sandbag,2
.set  popo,1

.set REG_ExtIDNum, 12
.set REG_ExtID, 0

# get ext ID
  lbz REG_ExtID,0x0(r24)

#Check if a special character
  cmpwi REG_ExtID,0x1a
  blt NormalCharacter
  cmpwi REG_ExtID,0x20
  bgt NormalCharacter

# get special fighter index
  lwz REG_ExtIDNum,OFST_Metadata_FtExtNum(rtoc)
  mr r3,REG_ExtID
  subi r3, r3, 0x1A
# get m-ex special fighter ID
  subi  r11,REG_ExtIDNum,masterHand
  add  REG_ExtID,r11,r3

NormalCharacter: