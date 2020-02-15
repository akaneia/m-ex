#To be inserted @ 800233dc
.include "../../../../Globals.s"
.include "../../Header.s"

#180 / 0xB4 = DisposableOrig
#404 / 0x194 = Disposable Copy
#628 / 0x274 = Persist Orig
#852 / 0x354 = Persist Copy


.set  StackSize,0x0100 + 0x4 + (NumOfAddedChars*4)

lwz	r31, StackSize-4 (sp)
lwz	r30, StackSize-8 (sp)
lwz r29, StackSize-12 (sp)
addi	sp, sp, StackSize
blr
