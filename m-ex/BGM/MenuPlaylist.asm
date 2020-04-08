#To be inserted @ 8015ed1c
.include "../../Globals.s"
.include "../Header.s"

#Init count loop
.set  REG_SongList,30
.set  REG_LoopCount,29
.set  REG_PercentTotal,28
.set  REG_BGMNum,27
  backup
  lwz r3,OFST_mexData(rtoc)
  lwz r3,Arch_BGM(r3)
  lwz REG_SongList,Arch_BGM_MenuPlaylist(r3)
  lwz REG_BGMNum,Arch_BGM_MenuPlaylistNum(r3)
  li  REG_LoopCount,0
  li  REG_PercentTotal,0
#If none, play main menu
  cmpwi REG_BGMNum,0
  bne CountPercents
  li  r3,52
  b StoreHPS
CountPercents:
#Get offset
  mulli r3,REG_LoopCount,4
  add r4,r3,REG_SongList
#Increment percent total
  lhz r3,0x2(r4)
  add REG_PercentTotal,REG_PercentTotal,r3
#Get next
  addi  REG_LoopCount,REG_LoopCount,1
  cmpw REG_LoopCount,REG_BGMNum
  blt CountPercents

RollRNG:
  mr  r3,REG_PercentTotal
  branchl r12,HSD_Randi
#Init count loop
.set  REG_RNG,26
  mr  REG_RNG,r3
  li  REG_LoopCount,0
  li  REG_PercentTotal,0
CheckRNG:
#Get offset
  mulli r3,REG_LoopCount,4
  add r4,r3,REG_SongList
#Increment percent toal
  lhz r3,0x2(r4)
  add REG_PercentTotal,REG_PercentTotal,r3
  subi  r3,REG_PercentTotal,1
  cmpw REG_RNG,r3
  ble CheckRNG_Found
#Get next
  addi  REG_LoopCount,REG_LoopCount,1
  cmpw REG_LoopCount,REG_BGMNum
  blt CheckRNG

CheckRNG_Found:
  lhz r3,0x0(r4)

StoreHPS:
  stb	r3, 0x0001 (r31)
  b Injection_Exit

Injection_Exit:
  restore
  lwz	r0, 0x001C (sp)
