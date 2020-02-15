#To be inserted @ 800285b8
.include "../../../../Globals.s"
.include "../../Header.s"

#180 / 0xB4 = DisposableOrig
#404 / 0x194 = Disposable Copy
#628 / 0x274 = Persist Orig
#852 / 0x354 = Persist Copy
#    / 0x424 = Footer

addi	r4, r30, SSM_DisposableOrig_OFST
