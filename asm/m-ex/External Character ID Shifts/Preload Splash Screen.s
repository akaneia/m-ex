#To be inserted @ 801b38d8
.include "../../Globals.s"
.include "../Header.s"

.set  masterHand,7
.set  wireMale,6
.set  wireFemale,5
.set  gigaBowser,4
.set  crazyHand,3
.set  sandbag,2
.set  popo,1

.set REG_PreloadTable, 27
.set REG_Count, 12
.set REG_ThisPreload, 11
.set REG_SpecialFtStart, 10
.set REG_ExtID, 9


# Init loop
  li REG_Count,0
  lwz r3,OFST_Metadata_FtExtNum(rtoc)
  subi  REG_SpecialFtStart,r3,masterHand
Loop:
# get ext ID
  mulli r3,REG_Count,8
  add REG_ThisPreload,r3,REG_PreloadTable
  lwz REG_ExtID,0x8(REG_ThisPreload)
#Check if a special character
  cmpwi REG_ExtID,0x1a
  blt NormalCharacter
  cmpwi REG_ExtID,0x20
  bgt NormalCharacter
# get special fighter index
  subi r3, REG_ExtID, 0x1A
# get m-ex special fighter ID
  add  REG_ExtID,REG_SpecialFtStart,r3
# store back
  stw REG_ExtID,0x8(REG_ThisPreload)
NormalCharacter:
Loop_Inc:
  addi REG_Count, REG_Count, 1
Loop_Check:
  cmpwi REG_Count,6
  blt Loop

Exit:
  branchl r12,0x80018254