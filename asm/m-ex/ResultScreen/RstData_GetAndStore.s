#To be inserted @ 8017a748
.include "../../Globals.s"
.include "../Header.s"

backup

# get reference to symbol
mr r27,r3
bl Symbol
mflr  r4
mr r3,r27
branchl r12,0x80380358 # get symbol

# Store reference to symbol
lwz r12,OFST_GmRstPointers(rtoc)
mr r4,r25
mulli r4,r4,8
add r12,r4,r12
stw r3,0x00(r12)
b Exit

Symbol:
blrl
.string "RstData"
.align 2

Exit:
mr r4,r27
restore
