#To be inserted @ 801b5204
.include "../../Globals.s"
.include "../Header.s"


.set  masterHand,7
.set  wireMale,6
.set  wireFemale,5
.set  gigaBowser,4
.set  crazyHand,3
.set  sandbag,2
.set  popo,1


InitTable:
.set REG_Table, 12
.set REG_ThisElement, 11
.set REG_SpecialFtStart, 10
.set REG_ExtID, 9

# Init Table Loop
  load REG_Table,0x803de650
  lwz r3,OFST_Metadata_FtExtNum(rtoc)
  subi  REG_SpecialFtStart,r3,masterHand

TableLoop:
# check if end
  lbz r3,0x0(REG_Table)
  cmpwi r3,255
  beq Exit
# loop through its fighters
  # Init Ft Loop
  .set REG_FtCount,7
    li REG_FtCount,0
  FtLoop:
  # get ext ID
    add r4,REG_Table,REG_FtCount
    lbz REG_ExtID,0xA(r4)
  #Check if a special character
    cmpwi REG_ExtID,0x1a
    blt NormalCharacter
    cmpwi REG_ExtID,0x21
    bge NullCharacter
  SpecialCharacter:
  # get special fighter index
    subi r3, REG_ExtID, 0x1A
  # get m-ex special fighter ID
    add  REG_ExtID,REG_SpecialFtStart,r3
  # store back
    stb REG_ExtID,0xA(r4)
    b FtLoop_Inc
  NullCharacter:
    lwz r3,OFST_Metadata_FtExtNum(rtoc)
    stb r3,0xA(r4)   # store back
    b FtLoop_Inc

  NormalCharacter:
  FtLoop_Inc:
    addi REG_FtCount, REG_FtCount, 1
  FtLoop_Check:
    cmpwi REG_FtCount,3
    blt FtLoop

TableLoop_Inc:
  addi REG_Table,REG_Table,16
  b TableLoop

Exit:
  lwz	r0, 0x000C (sp)
