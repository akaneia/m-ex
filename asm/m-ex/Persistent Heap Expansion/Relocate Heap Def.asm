#To be inserted @ 80015f88
.include "../../Globals.s"
.include "../Header.s"

# get file size for ifall.usd
    bl  FileName
    mflr r3
    branchl r12,0x800163d8

# add to base value
    load r4,0x41C644
    add r3,r3,r4

# get persistent heap setup table
    bl  HeapSetup
    mflr r4
    stw r3, (1 * 0x10) + 0xC (r4)


# Exit
    mr    r0,r4
    li r6, -1
    b   Exit

FileName:
blrl
.string "IfAll.usd"
.align 2

HeapSetup:
blrl
# unk
.long 2     # heap ID (PreloadHeapKind in m-ex header)
.long 1     # heap location
.long 6     # heap priority
.long 0x800     # heap size

# persistent (ifall, itco, efco, efmndata, etc)
.long 3     # heap ID (PreloadHeapKind in m-ex header)
.long 1     # heap location
.long 2     # heap priority
.long 0x4fa690     # heap size

# fighter cache
.long 4     # heap ID (PreloadHeapKind in m-ex header)
.long 2     # heap location
.long 6     # heap priority
.long 6599680 - FighterHeapReduction # heap size

# animation cache
.long 5     # heap ID (PreloadHeapKind in m-ex header)
.long 4     # heap location
.long 6     # heap priority
.long 0x96c800     # heap size

# CUSTOM scene file heap
.long 6     # heap ID (PreloadHeapKind in m-ex header)
.long 1     # heap location
.long 3     # heap to start after
.long 0x20     # heap size

# terminator
.long PersistHeapNum     # heap ID

Exit:
