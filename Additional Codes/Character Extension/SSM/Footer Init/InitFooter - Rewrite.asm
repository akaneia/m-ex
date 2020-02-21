#To be inserted @ 80023254
.include "../../../../Globals.s"
.include "../../Header.s"

#180 / 0xB4 = DisposableOrig
#404 / 0x194 = Disposable Copy
#628 / 0x274 = Persist Orig
#852 / 0x354 = Persist Copy

.macro backupmore
mflr r0
stw r0, 0x4(r1)
stwu	r1,-0x200(r1)	# make space for 12 registers
stmw  r20,0x8(r1)
.endm
 .macro restoremore
lmw  r20,0x8(r1)
lwz r0, 0x204(r1)
addi	r1,r1,0x200	# release the space
mtlr r0
.endm

.set  REG_MemAlloc,30
.set  REG_Count,29
.set  REG_SSMTotal,28
.set  REG_AudioGroups,27
.set  REG_CurrAudioGroup,26
.set  REG_TempStruct,25
.set  REG_Footer,24

#Init
  backupmore
#Backup
  mr  REG_CurrAudioGroup,r3
#Get Footer
  lwz REG_Footer,OFST_SSMStruct(rtoc)
  lwz REG_Footer,Arch_SSMRuntimeStruct_Footer(REG_Footer)
#Get SSM Count
  lwz REG_SSMTotal,OFST_Metadata_SSMCount(rtoc)
#ALloc temp struct
  mulli r3,REG_SSMTotal,4
  branchl r12,HSD_MemAlloc
  mr  REG_MemAlloc,r3

#Init footer
  li  REG_Count,0
  addi	REG_TempStruct, REG_MemAlloc, 0
InitTemp_Loop:
#Store ssm count
  mulli r3,REG_Count,4
  stwx REG_SSMTotal,r3,REG_Footer
#Init as 0
  li  r0,0
  stwx r0,r3,REG_TempStruct
#Inc
  addi  REG_Count,REG_Count,1
  cmpw REG_Count,REG_SSMTotal
  blt InitTemp_Loop

/*
r5 = original footer
r8 = audio groups
r9 = temps struct
r10 = current location in bank sizes
r11 = current location in footer
*/

.set  REG_UnkCount,20
#Loop through audio groups
  li  REG_UnkCount,0
  mr  REG_FooterCurr,REG_Footer

AudioGroup_LoopInit:
.set  REG_FooterCurr,21
.set  REG_TempStruct,22
.set  REG_BankSizes,23
  li  REG_Count,0
  lwz REG_AudioGroups,OFST_AudioGroups(rtoc)
  mr  REG_TempStruct,REG_MemAlloc
  lwz REG_BankSizes,OFST_SSMBankSizes(rtoc)
AudioGroup_Loop:
  lbz r0,0(REG_AudioGroups)
  extsb r0,r0
  cmpw  REG_CurrAudioGroup,r0
  bne AudioGroup_LoopInc
#Check temp struct
  lwz r0,0x0(REG_TempStruct)
  cmpwi r0,0
  bne AudioGroup_LoopInc
#compare banksize[i] with banksize[footer[i]]
  lwz r0,0(REG_BankSizes)
  lwz r3,0(REG_FooterCurr)
  rlwinm	r3, r3, 3, 0, 28
  lwz r4,OFST_SSMBankSizes(rtoc)
  lwzx   r3,r3,r4
  cmplw r3,r0
  bge AudioGroup_LoopInc

#Shift stuff around now
AudioGroup_ShiftInit:
.set  REG_ShiftCount,12
.set  REG_FooterEnd,11
  subi  r3,REG_SSMTotal,1
  mulli r3,r3,4
  add REG_FooterEnd,r3,REG_Footer
  sub REG_ShiftCount,REG_SSMTotal,REG_UnkCount
  subi  REG_ShiftCount,REG_ShiftCount,1     #sub 1 so the top value isnt copied over
  cmpw  REG_UnkCount,REG_SSMTotal
  bge AudioGroup_ShiftExit
AudioGroup_ShiftLoop:
  lwz r0,-4(REG_FooterEnd)
  stw r0,0(REG_FooterEnd)
AudioGroup_ShiftInc:
  subi  REG_FooterEnd,REG_FooterEnd,4
  subi  REG_ShiftCount,REG_ShiftCount,1
  cmpwi REG_ShiftCount,0
  bgt AudioGroup_ShiftLoop
AudioGroup_ShiftExit:
  stw REG_Count,0x0(REG_FooterCurr)
  li  r0,1
  stw r0,0x0(REG_TempStruct)

AudioGroup_LoopInc:
  addi  REG_TempStruct,REG_TempStruct,4
  addi  REG_AudioGroups,REG_AudioGroups,4
  addi  REG_BankSizes,REG_BankSizes,8
  addi  REG_Count,REG_Count,1
  cmpw  REG_Count,REG_SSMTotal
  ble AudioGroup_Loop

Unk_LoopInc:
  addi  REG_UnkCount,REG_UnkCount,1
  addi  REG_FooterCurr,REG_FooterCurr,4
  cmpw  REG_UnkCount,REG_SSMTotal
  ble AudioGroup_LoopInit

#Free temp struct
  mr  r3,REG_MemAlloc
  branchl r12,0x8037f1b0

Exit:
  restoremore
  blr
