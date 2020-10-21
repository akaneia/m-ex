#To be inserted @ 801badc4
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
.set REG_Count, 8

# Init Table Loop
  li REG_Count,0
  lwz REG_Table,-19872(r13)   # get sqEventInitDataLevelTbl
  lwz r3,OFST_Metadata_FtExtNum(rtoc)
  subi  REG_SpecialFtStart,r3,masterHand

TableLoop:
# get table
  lwz REG_ThisElement,0x0(REG_Table)
# loop through its fighters
  # Init Ft Loop
  .set REG_FtCount,7
    li REG_FtCount,0
  FtLoop:
  # get ext ID
    add r4,REG_Table,REG_FtCount
    lwz r4,0x14(REG_ThisElement)
    cmpwi r4,0
    beq FtLoop_Inc
    lbz REG_ExtID,0x0(r4)
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
    stb REG_ExtID,0x0(r4)
  NormalCharacter:
  FtLoop_Inc:
    addi REG_FtCount, REG_FtCount, 1
    addi REG_ThisElement,REG_ThisElement,4
  FtLoop_Check:
    cmpwi REG_FtCount,6
    blt FtLoop

TableLoop_Inc:
  addi REG_Table,REG_Table,4
  addi REG_Count,REG_Count,1
  cmpwi REG_Count,51
  blt TableLoop
  
#########################################

Exit:
  lwz	r20, -0x4DA0 (r13)