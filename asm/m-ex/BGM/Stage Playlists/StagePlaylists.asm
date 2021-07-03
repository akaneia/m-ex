#To be inserted @ 801c24f8
.include "../../../Globals.s"
.include "../../Header.s"

.set  REG_StageExtID,31
.set  REG_Arg2,30
.set  REG_Arg3,29
.set  REG_Playlist,28

#Init
  backup
  mr  REG_StageExtID,r3
  mr  REG_Arg2,r4
  mr  REG_Arg3,r5
#Check if this stage has a playlist
  mr  r3,REG_StageExtID
  branchl r12,0x8022519c
  lwz r4,OFST_mexData(rtoc)
  lwz r4,Arch_Map(r4)
  lwz r4,Arch_Map_Playlists(r4)
  mulli r3,r3,Playlists_Stride
  add REG_Playlist,r3,r4


#Init count loop
.set  REG_SongList,27
.set  REG_LoopCount,26
.set  REG_PercentTotal,25
.set  REG_BGMNum,24
#Get num of songs on playlist
  lwz REG_BGMNum,0x0(REG_Playlist)
  lwz REG_SongList,0x4(REG_Playlist)
  cmpwi REG_BGMNum,0
  beq Original
  li  REG_LoopCount,0
  li  REG_PercentTotal,0
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
.set  REG_RNG,23
  mr  REG_RNG,r3
  li  REG_LoopCount,0
  li  REG_PercentTotal,0
CheckRNG:
#Get offset
  mulli r3,REG_LoopCount,4
  add r4,r3,REG_SongList
#Check if 0 chance
  lhz r3,0x2(r4)
  cmpwi r3,0
  beq CheckRNG_Skip
#Increment percent toal
  add REG_PercentTotal,REG_PercentTotal,r3
  subi  r3,REG_PercentTotal,1
  cmpw REG_RNG,r3
  ble CheckRNG_Found
#Get next
CheckRNG_Skip:
  addi  REG_LoopCount,REG_LoopCount,1
  cmpw REG_LoopCount,REG_BGMNum
  blt CheckRNG

CheckRNG_Found:
  lhz r3,0x0(r4)
  extsh r3,r3
  cmpwi r3,-1
  beq InvalidSong
StoreHPS:
  stw	r3, 0x0 (REG_Arg3)

Exit:
  li  r3,0
  restore
  blr

#############################################
InvalidSong:
#OSReport
  bl  InvalidSongString
  mflr  r3
  addi r4, REG_LoopCount, 1
  branchl r12,0x803456a8
#Assert
  bl  Assert_Name
  mflr  r3
  li  r4,0
  load  r5,0x804d3940
  branchl r12,0x80388220
#############################################
Assert_Name:
blrl
.string "m-ex"
.align 2
InvalidSongString:
blrl
.string "error: song %d has an invalid id\n"
.align 2
###############################################

Original:
  mr  r3, REG_StageExtID
  mr  r4, REG_Arg2
  mr  r5, REG_Arg3
  restore
  mflr  r0
