#To be inserted @ 801bf200
.include "../../Globals.s"
.include "../Header.s"

# get random icon id
  lwz r3,OFST_Metadata_CSSIconCount(rtoc)
  branchl r12,0x80380580
# get icon data
  lwz r4,OFST_MnSlChrIconData(rtoc)
# get icon ID's external ID
  mulli	r3, r3, 28
  add	r3, r3, r4
  lbz	r29, 0x00DD (r3) # char id