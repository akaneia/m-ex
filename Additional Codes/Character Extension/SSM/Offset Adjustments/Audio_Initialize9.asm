#To be inserted @ 800285c0
.include "../../../../Globals.s"
.include "../../Header.s"

#180 / 0xB4 = DisposableOrig
#404 / 0x194 = Disposable Copy
#628 / 0x274 = Persist Orig
#852 / 0x354 = Persist Copy
#    / 0x424 = Footer

addi	r6, r30, SSM_PersistentOrig_OFST
