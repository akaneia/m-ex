#To be inserted @ 80267a2c
.include "../../Globals.s"
.include "../Header.s"

.set  REG_ItemGObjData,31
.set  REG_ItemFunctions,30
.set  REG_ItemData,29

#If under, return to injection site
  subi	r5, r3, 208
  cmpwi r5,29
  blt Injection_Exit

backup

#Get this items functions
  lwz r3,OFST_ItemFunctions(rtoc)
  lwz	r4, 0x0010 (REG_ItemGObjData)
  subi  r4,r4,237
  mulli r0,r4,0x4
  lwzx  REG_ItemFunctions,r3,r0
#Get this items dat pointer
  lwz r3,OFST_ItemIndex(rtoc)
  mulli r0,r4,0x4
  lwzx REG_ItemData,r3,r0
#Store Item functions
  stw REG_ItemFunctions,0xB8(REG_ItemGObjData)
#Store item dat pointer
  stw REG_ItemData,0xC4(REG_ItemGObjData)

Exit:
  restore
  branch  r12,0x80267a88

Injection_Exit:
