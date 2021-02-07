#To be inserted @ 8016e7bc
.include "../../Globals.s"
.include "../Header.s"

.set REG_MatchInit, 31
.set REG_PlayerData, 29
.set REG_Player, 28
.set REG_StcIcons,27
.set REG_Inputs,26


  backup

PlayerLoop_Init:
# get ifall archive info
  load  r3,0x804d5780
  branchl r12,0x8001819c
# get symbol from ifall
  bl  StockSymbol
  mflr r4
  branchl r12,0x80380358
  mr. REG_StcIcons,r3
  beq Exit

  li REG_Player,0
  b PlayerLoop_Check

PlayerLoop:
# Get PlayerData
  mulli r0,REG_Player,36
  addi r3,REG_MatchInit,96
  add REG_PlayerData,r3,r0

# init easter egg value to -1
  addi  r4,rtoc,OFST_EasterEgg
  li  r3,-1 
  stbx r3,r4,REG_Player

# check if human
  lbz r0,0x1(REG_PlayerData)
  cmpwi r0,0
  bne PlayerLoop_Inc

# get controller index
  mr r3,REG_Player
  branchl r12,0x8003345c

# check inputs and set easter egg value
  load  r4,0x804c20bc
  mulli r3,r3,68
  add r3,r3,r4
  lwz REG_Inputs,0x0(r3)

Loop_Init:
.set REG_Count, 20
.set REG_EggNum, 21
.set REG_Eggs, 22
.set REG_ThisName, 23
.set REG_ThisEgg, 24
  li REG_Count, 0
  lwz REG_EggNum,StcIcons_EggNum(REG_StcIcons)
  lwz REG_Eggs,StcIcons_Eggs(REG_StcIcons)
# Get this players name text
  lbz r3,0xA(REG_PlayerData)
  branchl r12,0x8023754c
  mr REG_ThisName,r3
  b Loop_Check

Loop:
# get this element
  mulli r3,REG_Count,Eggs_Stride
  add REG_ThisEgg,r3,REG_Eggs
# get this name requirement
  lwz r3,Eggs_Name(REG_ThisEgg)
  cmpwi r3,0
  beq Loop_SkipName
# check name
  cmpwi REG_ThisName,0
  beq Loop_Inc
# compare names
  mr r4,REG_ThisName
  branchl r12,0x803258e8
  cmpwi r3,0
  bne Loop_Inc
Loop_SkipName:

# check input
  lwz r3,0x0(REG_ThisEgg)
  rlwinm r3,r3,0,0x00FFFFFF # extract input bits
  and r0, r3,REG_Inputs
  cmpw  r3,r0
  bne Loop_Inc

# save stock ID
  addi  r3,rtoc,OFST_EasterEgg
  stbx REG_Count,r3,REG_Player
  b PlayerLoop_Inc

Loop_Inc:
  addi REG_Count,REG_Count,1
Loop_Check:
  cmpw REG_Count,REG_EggNum
  blt Loop

PlayerLoop_Inc:
  addi REG_Player,REG_Player,1
PlayerLoop_Check:
  cmpwi REG_Player,6
  blt PlayerLoop

 b Exit

StockSymbol:
blrl
.string "Stc_icns"
.align 2

Exit:
  restore
  mr	r3, r31