#To be inserted @ 802f6320
.include "../../Globals.s"
.include "../Header.s"

.set  REG_ExternalID,31
.set  REG_InternalID,30
.set  REG_CostumeID,29

# init
  backup

# get insignia ID for this external ID
  lwz r4,OFST_GmRstInsigniaIDs(rtoc)
  lbzx  r3,r3,r4

# cast to float
  xoris r3,r3,0x8000
  lfd	f1, -0x35F8 (rtoc)
  stw r3,0x84(sp)
  lis r3,0x4330
  stw r3,0x80(sp)
  lfd f2,0x80(sp)
  fsubs f1,f2,f1

Exit:
  restore

