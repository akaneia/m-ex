#To be inserted @ 800283b4
.include "../../../Globals.s"
.include "../../Header.s"

#180 / 0xB4 = ToLoadOrig
#404 / 0x194 = Disposable Copy
#628 / 0x274 = Persist Orig
#852 / 0x354 = Persist Copy

lwz r31,OFST_SSMBankSizes(rtoc)
subi  r31,r31,0x11E4
