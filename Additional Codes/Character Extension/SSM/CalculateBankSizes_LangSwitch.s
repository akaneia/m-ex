#To be inserted @ 80027adc
.include "../../../Globals.s"
.include "../Header.s"


addi	r28, r3, 0

backup

#Init ssm bank sizes
.set  REG_Count,31
.set  REG_SSMCount,30
  li  REG_Count,0
  lwz REG_SSMCount,OFST_Metadata(rtoc)
  lwz REG_SSMCount,OFST_Metadata_SSMCount(REG_SSMCount)
BankInitLoop:
#Get language
  branchl r12,0x8000ae90
  cmpwi r3,1
  beq BankInitLoop_US
BankInitLoop_JPN:
  bl  JPNAudioPath
  mflr  r4
  b BankInitLoop_CopyPath
BankInitLoop_US:
  bl  USAudioPath
  mflr  r4
  b BankInitLoop_CopyPath
BankInitLoop_CopyPath:
  addi  r3,sp,0x80
  branchl r12,strcpy
BankInitLoop_GetSSMString:
#Copy to path
  addi    r3,sp,0x80
  branchl r12,strlen
  addi  r4,sp,0x80
  add r3,r3,r4
#Get ssm string
  lwz r4,OFST_MnSlChrSSMFileNames(rtoc)
  mulli r0,REG_Count,4
  lwzx  r4,r4,r0
  branchl r12,strcpy
#Get size
  addi    r3,sp,0x80
  branchl r12,0x800163d8
#Store to table
  lwz r4,OFST_SSMBankSizes(rtoc)
  mulli r0,REG_Count,8
  stwx  r3,r4,r0
BankInitIncLoop:
  addi  REG_Count,REG_Count,1
  cmpw  REG_Count,REG_SSMCount
  blt BankInitLoop

  b Exit

JPNAudioPath:
blrl
.string "audio/"
.align 2
USAudioPath:
blrl
.string "audio/us/"
.align 2

Exit:
  restore
