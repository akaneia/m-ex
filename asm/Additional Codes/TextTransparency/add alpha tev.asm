#To be inserted at 803a9220
.include "../../Globals.s"

# GXSetTevKAlphaSel
    li r3,0
    li r4, 0x1C
    branchl r12,0x803403b4

# GXSetTevKColor
    lwz r3,0x8c(r31)    # text color
    # load r3,0x0000007f
    stw r3, 0x14(sp)
    li r3,0
    addi r4, sp, 0x14
    branchl r12,0x803402d4

Exit:
    li	r3, 128