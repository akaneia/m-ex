#To be inserted @ 801a57fc
.include "../../../Globals.s"
.include "../../Header.s"

.set  Addr_Exit,0x801a5814

.set  REG_MatchInfo,30
.set  REG_Count,28

/*
#Reset cache?
  li  r3,20
  branchl r12,0x80026f2c
*/

#Get Stage External
  lhz	r3, 0x0016 (REG_MatchInfo)
#Get Stage Internal
  branchl r12,0x8022519c
#Get Stage ssm
  lwz r4,OFST_Map_Audio(rtoc)
  mulli r3,r3,3
  add r3,r3,r4
  lbz r3,0x0(r3)
#Check if null ID
  #lwz r12,OFST_Metadata_SSMCount(rtoc)
  #cmpw  r3,r12
  #cmpwi  r3,55
  #beq Exit
#Load ssm
  branchl r12,Audio_RequestSSMLoad

#Exit
Exit:
  branch  r12,Addr_Exit
