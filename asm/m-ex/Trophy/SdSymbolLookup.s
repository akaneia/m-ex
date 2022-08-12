.macro sdlookup sd_index

backup

# backup r3 and r4
mr r10, r3
mr r11, r4

# sd file
  lis r3, 0x804d
  ori r3, r3, 0x1110
  li r4, \sd_index
  mulli r4, r4, 4
  add r3, r3, r4
  lwz r3, 0x00(r3)

# string
  bl  SymbolName
  mflr  r4

# archive get symbol
  branchl r12, 0x80380358
  b ExitLookup

SymbolName:
blrl
.string "offset"
.align 2

ExitLookup:

# restore r3 and r4
mr r10, r3
mr r11, r4

restore

.endm