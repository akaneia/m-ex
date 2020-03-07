#To be inserted @ 80268684
.include "../../Globals.s"
.include "../Header.s"

.set  REG_ItemGObjData,20
.set  REG_ItemDisplayFunc,21
.set  REG_ItemData,30
.set  REG_ItemGObj,31

backup

#Check item group
  lwz r3,0x8(REG_ItemData)
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
  load  r4,0x803f1418
  b InitItem
FighterItems:
  subi  r3,r3,43
  load  r4,0x803f2f28
  b InitItem
PokemonItems:
  subi  r3,r3,161
  load  r4,0x803f2310
  b InitItem
StageItems:
  subi  r3,r3,208
  load  r4,0x803f4ca8
  b InitItem
CustomItems:
  #subi  r3,r3,CustomItemStart
  load  r4,0x8026eecc
  b InitItem_SkipCallbackGet

InitItem:
#Get this items display function
  mulli r0,r3,0x4
  lwzx r4,r4,r0
InitItem_SkipCallbackGet:
  li  r5,6
  li  r6,0
  mr  r3,REG_ItemGObj
  branchl r12,0x8039069c

Exit:
  restore
  branch  r12,0x80268748
