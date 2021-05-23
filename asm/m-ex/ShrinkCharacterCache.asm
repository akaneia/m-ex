#To be inserted at 803ba3ac
.include "../Common.s"
.include "Header.s"

# moved to "asm\m-ex\Persistent Heap Expansion\Relocate Heap Def.asm"

.set  FreeKilobytes,0 #500

.long 6599680 - FreeKilobytes*1000
