#To be inserted at 800186a8
.include "../Globals.s"
.include "Header.s"

stw	r0, 0x0054 (sp)

# copy struct onto stack
addi r3, sp, 0x28
bl Files
mflr r4
li r5, 0x30
branchl r12,0x800031f4

b Exit

Files:
blrl
# IfAll
.long 0x02000000    # 0x0 = heap id
.long 0x804d37ec    # 0x4 = file name
.long 0x00000000    # 0x8 = unk
# EfMnData
.long 0x03000000
.long 0x803ba6c8
.long 0x0000001f
# EfCoData
.long 0x03000000
.long 0x803ba6d8
.long 0x00000000
# ItCo
.long 0x02000000
.long 0x804d37e4
.long 0x00000000


Exit:
