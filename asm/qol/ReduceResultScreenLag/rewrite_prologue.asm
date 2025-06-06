#To be inserted at 80179de0
.include "../../Globals.s"

.set REG_LOOP, 14
.set REG_SHOW, 15

mr r31,r3

li REG_LOOP,0
mr REG_SHOW,r4

LoopStart:
mr r3,REG_LOOP
branchl r12,0x80034110 # GetFighterGOBJ
cmpwi r3,0
beq IncrementLoop

# Show or hide model
lwz r3,0x2C(r3)
lbz r4,0x21fc(r3)

# Check if we should show or hide model
cmpw REG_SHOW,REG_LOOP
beq ShowModel
andi. r4, r4, 0xFE
b StoreByte

ShowModel:
ori r4,r4,1

StoreByte:
stb r4,0x21fc(r3)

IncrementLoop:
addi REG_LOOP,REG_LOOP,1
cmpwi REG_LOOP,6
blt LoopStart

Exit:
lwz r3,0x28(r31)
