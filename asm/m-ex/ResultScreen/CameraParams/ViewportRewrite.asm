#To be inserted @ 8017a3e8
.include "../../../Globals.s"
.include "../../Header.s"

# get ext_id
lis r12,0x8046
ori r12,r12,0xE3C0
mulli r4,r25,4
lwzx r12,r4,r12

# check param table
lwz r3,OFST_mexData(rtoc)
lwz r3,Arch_Fighter(r3)
lwz r3,Arch_Fighter_RuntimeIntroParam(r3)
mulli r4,r12,4
lwzx r3,r4,r3

# check if custom param found
cmpwi r3,0
bne LoadCustom
li r23,0
b Exit

LoadCustom:
subi r3,r3,0x10     # header
mulli r4,r12,0x30   # number of entries before
sub r23,r3,r4

Exit:
li r3,0x13
