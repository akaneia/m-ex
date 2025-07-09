#To be inserted @ 8039f0a8
.include "../../Globals.s"
.include "../Header.s"

# the purpose of this patch is to make it possible
# to spawn generators from the current generators
# without having to know its full id
# this is because m-ex can shift around particle slots

cmpwi r5,1000
bge Exit

mulli r3,r27,1000
add r5, r5, r3

Exit:
cmpw r5, r0
