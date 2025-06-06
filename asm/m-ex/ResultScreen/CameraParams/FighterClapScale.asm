#To be inserted @ 8017a900
.include "../../../Globals.s"
.include "../../Header.s"

# get custom param
add r12,r3,r0
lwz r3,OFST_mexData(rtoc)
lwz r3,Arch_Fighter(r3)
lwz r3,Arch_Fighter_RuntimeIntroParam(r3)
mr r4,r25
mulli r4,r4,4
lwzx r3,r4,r3

# check if custom param found
cmpwi r3,0
bne LoadCustom
mr r3,r12
b Exit

LoadCustom:
addi r3,r3,0xC

Exit:
