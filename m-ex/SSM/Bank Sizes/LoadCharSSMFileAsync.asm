#To be inserted @ 80026c68
.include "../../../Globals.s"
.include "../../Header.s"

#180 / 0xB4 = ToLoadOrig
#404 / 0x194 = Disposable Copy
#628 / 0x274 = Persist Orig
#852 / 0x354 = Persist Copy

lwz r5,OFST_SSMBankSizes(rtoc)
lwzx r5,r5,r0
