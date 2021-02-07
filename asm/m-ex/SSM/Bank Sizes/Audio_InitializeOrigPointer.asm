#To be inserted @ 80028508
.include "../../../Globals.s"
.include "../../Header.s"

#180 / 0xB4 = ToLoadOrig
#404 / 0x194 = Disposable Copy
#628 / 0x274 = Persist Orig
#852 / 0x354 = Persist Copy

#Use original pointer so the assertion displays correctly
  load r31,0x803bb300

#Original Codeline
  lis	r4, 0x0001
