#To be inserted at 8026b40c
.include "../../Globals.s"
.include "../Header.s"

.set  REG_ArticleData,30
.set  REG_ArticleID,29
.set  REG_StageID,28
.set  REG_StageItemLookup,27

#Is this a custom stage item?
  cmpwi r4,CustomEffectStart
  blt Original

backup

#Backup args
  mr  REG_ArticleData,r3
  subi  REG_ArticleID,r4,CustomEffectStart

#Get internal ID
  load  r3,0x8049e6c8
  lwz REG_StageID,0x88(r3)
#Get table from mxdt
  lwz r3,OFST_mexData(rtoc)
  lwz r3,Arch_Map(r3)
  lwz r3,Arch_Map_StageItemLookup(r3)
  mulli r4,REG_StageID,StageItemLookup_Stride
  add REG_StageItemLookup,r3,r4
#Check if exists
  lwz r3,0x0(REG_StageItemLookup)
  cmpw  REG_ArticleID,r3
  bge DoesNotExist

Index:
#Get external item ID from internal
  lwz r3,0x4(REG_StageItemLookup)
  mulli r4,REG_ArticleID,2
  lhzx r3,r3,r4
#Get runtime index
  lwz r4,OFST_ItemsAdded(rtoc)
  lwz r4,Arch_ItemsAdded_RuntimeIndex(r4)
#Correctly index item
  subi  r3,r3,CustomItemStart
#Store article data
  mulli r3,r3,4
  stwx  REG_ArticleData,r3,r4
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
.string "Error: stageitem %d not found in MxDt\n"
.align 2
###############################################

Exit:
  restore
  blr

Original:
  lis r5,0x804A
