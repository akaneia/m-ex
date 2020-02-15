#To be inserted @ 80027d00
.include "../../../../Globals.s"
.include "../../Header.s"

#180 / 0xB4 = DisposableOrig
#404 / 0x194 = Disposable Copy
#628 / 0x274 = Persist Orig
#852 / 0x354 = Persist Copy

lwz	r0, SSM_PersistentOrig_OFST + 1*4 (r30)
