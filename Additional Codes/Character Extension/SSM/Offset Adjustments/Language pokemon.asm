#To be inserted @ 80027cfc
.include "../../../../Globals.s"
.include "../../Header.s"

#180 / 0xB4 = DisposableOrig
#404 / 0x194 = Disposable Copy
#628 / 0x274 = Persist Orig
#852 / 0x354 = Persist Copy

addi	r29, r30, SSM_PersistentOrig_OFST + 1*4
