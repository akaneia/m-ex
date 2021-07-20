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

.set REG_Unk1,31
.set REG_Unk2, 30
.set REG_Unk3, 29

backup
load REG_Unk1, 0x803ddc58 # r31
load REG_Unk2, 0x80490880 # r29
load REG_Unk3, 0x803ddec8 # r28

# main classic mode tables
  addi	r3, REG_Unk1, 1312
  bl InitTable
  addi	r3, REG_Unk1, 1244
  bl InitTable
  addi	r3, REG_Unk1, 1064
  bl InitTable
  addi	r3, REG_Unk1, 828
  bl InitTable
  addi	r3, REG_Unk1, 810
  bl InitTable

# unk tables
  lwz r3,OFST_Metadata_FtExtNum(rtoc)
  stb r3,-0x7386(r13)
  stb r3,-0x7385(r13)
  stb r3,-0x7384(r13)
  
  stb r3,-0x737e(r13)
  stb r3,-0x737d(r13)
  stb r3,-0x737c(r13)
  
  stb r3,-0x7376(r13)
  stb r3,-0x7375(r13)
  stb r3,-0x7374(r13)

restore
b Exit






#####################################

InitTable:
.set REG_Table, 11
.set REG_ThisElement, 10
.set REG_SpecialFtStart, 9
.set REG_ExtID, 8

# Init Table Loop
  mr REG_Table, r3 
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
    #Check if a special character
      cmpwi REG_ExtID,0x1a
      blt NormalCharacter
    #Check if null
      cmpwi REG_ExtID,0x21
      bge Null
    # get special fighter index
      subi r3, REG_ExtID, 0x1A
    # get m-ex special fighter ID
      add  REG_ExtID,REG_SpecialFtStart,r3
    # store back
      stb REG_ExtID,0x2(r4)
      b FtLoop_Inc
    Null:
      lwz r3,OFST_Metadata_FtExtNum(rtoc)
      stb r3,0x2(r4)
      b FtLoop_Inc
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