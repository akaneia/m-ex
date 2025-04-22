#To be inserted @ 8006abd4
.include "../../Globals.s"
.include "../Header.s"

# get fighter id
mr r12, r31       # get fighter gobj
lwz r12,0x2c(r12) # get fighter data
lwz r12,0x04(r12) # get fighter kind (internal)

# store id
bl  TempStorage
mflr  r3
stw r12,0x00(r3)

# check if special fighter
lwz r3,OFST_Metadata_FtIntNum(rtoc)
subi r3,r3,6
sub r3,r12,r3
cmpwi r3,0
blt Exit

addi r3,r3,0x1B
mr r12, r31       # get fighter gobj
lwz r12,0x2c(r12) # get fighter data
stw r3,0x04(r12)  # restore fighter kind (internal)
b Exit

TempStorage:
blrl
.long 0

Exit:
# perform ai
mr r3, r31
branchl r12,0x800b3900

# get stored fighter id
bl  TempStorage
mflr  r3
lwz r3,0x00(r3)

# restore fighter id
mr r12, r31       # get fighter gobj
lwz r12,0x2c(r12) # get fighter data
stw r3,0x04(r12)  # restore fighter kind (internal)
