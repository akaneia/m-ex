#To be inserted @ 800056a8
.include "../../Globals.s"
.include "../Header.s"

.set  REG_SSMID,3
.set  REG_ToLoadOrig,12

#Check if null ssm ID
  cmpwi  REG_SSMID,55
  beq Exit

#Check if null ssm ID
  lwz r4,OFST_Metadata_SSMCount(rtoc)
  cmpw  REG_SSMID,r4
  bge Exit

#Get Disposable Orig
  lwz REG_ToLoadOrig,OFST_SSMStruct(rtoc)
  lwz REG_ToLoadOrig,Arch_SSMRuntimeStruct_ToLoadOrig(REG_ToLoadOrig)
#Queue up ssm load
  li  r4,1
  mulli REG_SSMID,REG_SSMID,4
  stwx  r4,REG_SSMID,REG_ToLoadOrig

Exit:
  blr
