#To be inserted at 80015f7c
.include "../Globals.s"
.include "Header.s"

# get file size for ifall.usd
    bl  FileName
    mflr r3
    branchl r12,0x800163d8

# add to base value
    load r4,0x41C644
    add r3,r3,r4

# get persistent heap setup table
    load r4,0x803ba380
    stw r3, (1 * 0x10) + 0xC (r4)

    b Exit

FileName:
blrl
.string "IfAll.usd"
.align 2

Exit:
li	r6, -1