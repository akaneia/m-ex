#To be inserted @ 8036f3fc
.include "../../../../Globals.s"
.include "../../../Header.s"
.include "MakeMTX.s"

##
## By Ploaj
##

.set Mtx_MakeSRT,0x8037a250
.set Mtx_Concat,0x80342204
.set Mtx_Identity,0x803421a4

# repurpose the stack vec3
.set SP_X,0x0C
.set SP_Y,0x10
.set SP_Z,0x14

# check custom flag
# TODO: check additionally for robj usage?
lwz r6,0x14(r31)
rlwinm. r6, r6, 0x0 ,0x5 ,0x5
beq Orig

# load parent
lwz r6,0xC(r31)

# check if parent exists
cmpwi r6, 0
beq Orig

# multiply translation by parent scale
lfs f2, 0x2C(r6)
lfs f1, 0x38(r31)
fmuls f1, f1, f2
stfs f1, SP_X(sp)

lfs f2, 0x30(r6)
lfs f1, 0x3C(r31)
fmuls f1, f1, f2
stfs f1, SP_Y(sp)

lfs f2, 0x34(r6)
lfs f1, 0x40(r31)
fmuls f1, f1, f2
stfs f1, SP_Z(sp)

# make local matrix
addi	r3, r31, 68
addi	r4, r31, 44
addi	r5, r31, 28
addi    r6, sp, SP_X    # custom trans
branchl r12,Mtx_MakeSRT

# init scale matrix
addi r3, sp, Stack_MTX
branchl r12,Mtx_Identity

# load floating value of 1
lfs	f2, -0x16D0 (rtoc)

# load parent
lwz r6,0xC(r31)

# get scale matrix
addi r3, sp, Stack_MTX

# scale x value
lfs f1, 0x2C(r6)
fdiv f1, f2, f1
stfs f1, 0x00(r3)

# scale y value
lfs f1, 0x30(r6)
fdiv f1, f2, f1
stfs f1, 0x14(r3)

# scale z value
lfs f1, 0x34(r6)
fdiv f1, f2, f1
stfs f1, 0x28(r3)

# multiply/concat scale matrix
addi r4 ,r31 ,0x44
addi r5 ,r31 ,0x44
branchl r12,Mtx_Concat

SkipOrig:
branch r12,0x8036f410

Orig:
addi	r3, r31, 68
