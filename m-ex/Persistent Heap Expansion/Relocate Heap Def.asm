#To be inserted @ 80015f88
.include "../../Globals.s"
.include "../Header.s"

bl  HeapSetup
mflr    r0
b   Exit


HeapSetup:
blrl
# unk
.long 2     # heap ID
.long 1     # heap location
.long 6     # heap priority
.long 0x800     # heap size

# ifall
.long 3     # heap ID
.long 1     # heap location
.long 2     # heap priority
.long 0x4fa690     # heap size

# fighter cache
.long 4     # heap ID
.long 2     # heap location
.long 6     # heap priority
.long 0x5d12e0    # heap size

# animation cache
.long 5     # heap ID
.long 4     # heap location
.long 6     # heap priority
.long 0x96c800     # heap size

# ifall clone
.long 6     # heap ID
.long 1     # heap location
.long 3     # heap to start after
.long 0x280     # heap size

# terminator
.long PersistHeapNum     # heap ID

Exit:
