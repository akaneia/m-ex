#To be inserted @ 80018d80
.include "../../Globals.s"
.include "../Header.s"

# if heap kind 2 and 3
    lwz	r0, 0 (r30)
    cmpwi   r0,2
    beq Enable
    cmpwi   r0,3
    beq Enable
    b   Exit

Enable:
# Enable Custom Heap
    li  r3,6
    li  r4,0
    branchl r12,0x800158d0

Exit:
    lwz	r0, 0 (r30)