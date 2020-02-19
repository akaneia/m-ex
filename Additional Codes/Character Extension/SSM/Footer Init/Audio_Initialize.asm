#To be inserted @ 8002328c
.include "../../../../Globals.s"
.include "../../Header.s"

#180 / 0xB4 = DisposableOrig
#404 / 0x194 = Disposable Copy
#628 / 0x274 = Persist Orig
#852 / 0x354 = Persist Copy

#Initialize
  li  r29,0
Loop:
  stw r0,0x0(r5)
  stw	r31, 0 (r7)
  addi  r29,r29,1
  addi  r5,r5,4
  addi  r7,r7,4
  cmpwi r29,56 + NumOfAddedSSMs
  blt Loop

  subi  r5,r5,4
  branch  r7,0x800232d8
