#To be inserted at 80179e20
.include "../../Globals.s"

.set REG_LOOP, 14

li REG_LOOP,0

LoopStart:
mr r3,REG_LOOP
branchl r12,0x80034110 # GetFighterGOBJ
cmpwi r3,0
beq IncrementLoop

# Show model
lwz r3,0x2C(r3)
lbz r4,0x21fc(r3)
ori r4,r4,1
stb r4,0x21fc(r3)

IncrementLoop:
addi REG_LOOP,REG_LOOP,1
cmpwi REG_LOOP,6
blt LoopStart

Exit:
lwz r0,0x24(sp)
