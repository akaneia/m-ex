#To be inserted @ 801c2a48
.include "../../../Globals.s"
.include "../../Header.s"

.set REG_Param, 31
.set REG_Count, 30
.set REG_Freqs, 29

# init
  mr REG_Freqs, r3
  lwz REG_Param, 0x0 (r31)
  li REG_Count,0

Loop:
# get base frequency from grgoundparam
  mulli r3, REG_Count, 0x2
  addi r3, r3, 0x6A
  lhzx r3, r3, REG_Param
# store frequency
  mulli r4, REG_Count, 0x4
  stwx r3, r4, REG_Freqs

LoopInc:
  addi REG_Count, REG_Count, 1
LoopCheck:
  cmpwi REG_Count, 35      # item count = 35, expand this one day maybe lol
  blt Loop

Exit:
  branch r12,0x801c2ac4