#To be inserted @ 80268720
.include "../../../Globals.s"
.include "../Header.s"

.set  REG_ItemData,30

#If under, return to injection site
  subi	r0, r4, 208
  cmpwi r0,29
  blt Injection_Exit

backup

#Get expanded item table
  lwz r3,OFST_ItemFunctions(rtoc)
#Get this items data
  subi  r0,r4,237
  mulli r0,r0,0x0
  lwzx  REG_ItemData,r3,r0
#Get GX Link
  lwz r4,0x3C(REG_ItemData)
  addi	r3, r31, 0
  li  r5,6
  li  r6,0
  branchl r12,0x8039069c
Exit:
  restore
  branch  r12,0x80268748

Injection_Exit:
