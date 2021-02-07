#To be inserted @ 800159b4
.include "../../Globals.s"
.include "../Header.s"

.set    REG_Count,12
.set    REG_Curr,11
.set    REG_HeapHi,26
.set    REG_HeapLo,29
.set    REG_ARAMHeapHi,27
.set    REG_ARAMHeapLo,28

# init
    li  REG_Count,0
Loop:
# Get curr
    mulli   r3,REG_Count,0x1C
    addi r4,r31,0x48
    add REG_Curr,r3,r4

# Check if enabled
    lwz r3,0x14(REG_Curr)
    cmpwi  r3,0
    bne IncLoop
# Check X
    lwz r3,0x10(REG_Curr)
    cmpwi   r3,0
    beq IncLoop
    cmpwi   r3,1
    beq NewLo
    cmpwi   r3,2
    beq NewHi
    cmpwi   r3,3
    beq IncLoop
    cmpwi   r3,4
    beq NewARAMLo
    cmpwi   r3,5
    beq IncLoop

NewLo:
    lwz	r3, 0x0008 (REG_Curr)   # heap start
    lwz	r0, 0x000C (REG_Curr)   # heap size
    add	r0, r3, r0
    cmplw REG_HeapLo,r0
    bge IncLoop
    mr  REG_HeapLo,r0
    b   IncLoop

NewHi:
    lwz	r0, 0x0008 (REG_Curr)   # heap start
    cmplw REG_HeapHi,r0
    ble IncLoop
    mr  REG_HeapHi,r0
    b   IncLoop

NewARAMLo:
    lwz	r3, 0x0008 (REG_Curr)   # heap start
    lwz	r0, 0x000C (REG_Curr)   # heap size
    add	r0, r3, r0
    cmplw REG_ARAMHeapLo,r0
    bge IncLoop
    mr  REG_ARAMHeapLo,r0
    b   IncLoop

IncLoop:
    addi    REG_Count,REG_Count,1
    cmpwi   REG_Count,PersistHeapNum-2
    blt Loop

branch  r12,0x80015acc