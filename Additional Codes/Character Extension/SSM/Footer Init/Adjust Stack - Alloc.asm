#To be inserted @ 80023254
.include "../../../../Globals.s"
.include "../../Header.s"

#180 / 0xB4 = DisposableOrig
#404 / 0x194 = Disposable Copy
#628 / 0x274 = Persist Orig
#852 / 0x354 = Persist Copy

.set  StackSize,0x0100 + 0x4 + (NumOfAddedSSMs*4)

stwu	sp, -StackSize (sp)
stw	r31, StackSize-4 (sp)
stw	r30, StackSize-8 (sp)
stw r29, StackSize-12 (sp)
