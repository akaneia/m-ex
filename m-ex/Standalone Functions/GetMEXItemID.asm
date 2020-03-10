#To be inserted @ 803d7064
.include "../../Globals.s"
.include "../Header.s"

.set  REG_PlayerGObj,31
.set  REG_ArticleID,30
.set  REG_PlayerData,29
.set  REG_MEXItemLookup,28

backup

#Backup args
  mr  REG_PlayerGObj,r3
  mr  REG_ArticleID,r4

#Get internal ID
  lwz REG_PlayerData,0x2C(REG_PlayerGObj)
#Get table from mxdt
  lwz r3,OFST_mexData(rtoc)
  lwz r3,Arch_Fighter(r3)
  lwz r3,Arch_Fighter_MEXItemLookup(r3)
  lwz r4,0x4(REG_PlayerData)
  mulli r4,r4,MEXItemLookup_Stride
  add REG_MEXItemLookup,r3,r4
#Check if exists
  lwz r3,0x0(REG_MEXItemLookup)
  cmpw  REG_ArticleID,r3
  bgt DoesNotExist
#Get external item ID from internal
  lwz r3,0x4(REG_MEXItemLookup)
  lwz r4,0x4(REG_PlayerData)
  mulli r4,REG_ArticleID,2
  lhzx r3,r3,r4
  b Exit

#############################################
DoesNotExist:
#OSReport
  bl  ErrorString
  mflr  r3
  mr  r4,REG_ArticleID
  branchl r12,0x803456a8
#Assert
  bl  Assert_Name
  mflr  r3
  li  r4,0
  load  r5,0x804d3940
  branchl r12,0x80388220
Assert_Name:
blrl
.string "m-ex"
.align 2
ErrorString:
blrl
.string "error: fighter does not have article ID %d\n"
.align 2
###############################################

Exit:
  restore
  blr
