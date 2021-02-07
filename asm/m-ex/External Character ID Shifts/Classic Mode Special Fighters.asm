#To be inserted @ 801b34f0
.include "../../Globals.s"
.include "../Header.s"


.set  masterHand,7
.set  wireMale,6
.set  wireFemale,5
.set  gigaBowser,4
.set  crazyHand,3
.set  sandbag,2
.set  popo,1





/*
328 = terminator
803de178
803de134
803de080
803ddf94
*/

  load r3,0x803de178
  bl InitTable
  load r3,0x803de134
  bl InitTable
  load r3,0x803de080
  bl InitTable
  load r3,0x803ddf94
  bl InitTable
  load r3,0x803ddf88
  bl InitTable


  b Exit



#####################################

InitTable:
.set REG_Table, 12
.set REG_ThisElement, 11
.set REG_SpecialFtStart, 10
.set REG_ExtID, 9

# Init Table Loop
  mr REG_Table,r3
  lwz r3,OFST_Metadata_FtExtNum(rtoc)
  subi  REG_SpecialFtStart,r3,masterHand

TableLoop:
# check if end
  lhz r3,0x0(REG_Table)
  cmpwi r3,328
  beq InitTable_Exit
# loop through its fighters
  # Init Ft Loop
  .set REG_FtCount,7
    li REG_FtCount,0
  FtLoop:
  # get ext ID
    add r4,REG_Table,REG_FtCount
    lbz REG_ExtID,0x2(r4)
  #Check if null
    cmpwi REG_ExtID,33
    beq FtLoop_Inc
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
    stb REG_ExtID,0x2(r4)
  NormalCharacter:
  FtLoop_Inc:
    addi REG_FtCount, REG_FtCount, 1
  FtLoop_Check:
    cmpwi REG_FtCount,4
    blt FtLoop

TableLoop_Inc:
  addi REG_Table,REG_Table,6
  b TableLoop

InitTable_Exit:
  blr

#####################################

Exit:
  lwz	r0, 0x000C (sp)