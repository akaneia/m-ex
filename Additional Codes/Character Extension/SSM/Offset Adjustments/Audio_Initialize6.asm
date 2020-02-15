#To be inserted @ 80028498
.include "../../../../Globals.s"
.include "../../Header.s"

#180 / 0xB4 = DisposableOrig
#404 / 0x194 = Disposable Copy
#628 / 0x274 = Persist Orig
#852 / 0x354 = Persist Copy
#    / 0x424 = Footer

lwz	r0, SSM_Footer_OFST (r30)
