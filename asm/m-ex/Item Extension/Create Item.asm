#To be inserted @ 80267990
.include "../../Globals.s"
.include "../Header.s"

.set  REG_ItemGObjData,31
.set  REG_ItemFunctions,30
.set  REG_ItemData,29

backup

#Check item group
  lwz r4,OFST_ItemsAdded(rtoc)
  cmpwi r3,43
  blt CommonItems
  cmpwi r3,161
  blt FighterItems
  cmpwi r3,208
  blt PokemonItems
  cmpwi r3,CustomItemStart
  blt StageItems
  b CustomItems

CommonItems:
  lwz r4,Arch_ItemsAdded_Common(r4)
  lwz	r5, -0x497C (r13)
  b InitItem
FighterItems:
  subi  r3,r3,43
  lwz r4,Arch_ItemsAdded_Fighter(r4)
  lwz	r5, -0x4968 (r13)
  b InitItem
PokemonItems:
  subi  r3,r3,161
  lwz r4,Arch_ItemsAdded_Pokemon(r4)
  lwz	r5, -0x4970 (r13)
  b InitItem
StageItems:
  subi  r3,r3,208
  lwz r4,Arch_ItemsAdded_Stages(r4)
  load  r5,0x804a0f60
  b InitItem
CustomItems:
  subi  r3,r3,CustomItemStart
  lwz r4,Arch_ItemsAdded_Custom(r4)
  lwz r5,OFST_ItemsAdded(rtoc)
  lwz r5,Arch_ItemsAdded_RuntimeIndex(r5)
  b InitItem

InitItem:
#Get this items functions
  mulli r0,r3,0x3C
  add  REG_ItemFunctions,r4,r0
#Get this items dat pointer
  mulli r0,r3,0x4
  lwzx REG_ItemData,r5,r0
  cmpwi REG_ItemData,0
  beq ItemNotInitialized
#Store Item functions
  stw REG_ItemFunctions,0xB8(REG_ItemGObjData)
#Store item dat pointer
  stw REG_ItemData,0xC4(REG_ItemGObjData)
  b Exit

ItemNotInitialized:
#OSReport
  bl  ErrorString
  mflr  r3
  branchl r12,0x803456a8
#Assert
  bl  Assert_Name
  mflr  r3
  li  r4,0
  load  r5,0x804d3940
  branchl r12,0x80388220
#############################################
Assert_Name:
blrl
.string "m-ex"
.align 2
ErrorString:
blrl
.string "error: item not initialized\n"
.align 2
###############################################

Exit:
  restore
  branch  r12,0x80267a88
