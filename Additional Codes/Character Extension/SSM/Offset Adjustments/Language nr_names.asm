#To be inserted @ 80027ce8
.include "../../../../Globals.s"
.include "../../Header.s"

#180 = DisposableOrig
#404 = Disposable Copy
#628 = Persist Orig
#852 = Persist Copy

stw	r3, SSM_PersistentOrig_OFST + 51*4 (r30)
