#To be inserted @ 80023338
.include "../../../../Globals.s"
.include "../../Header.s"

#180 / 0xB4 = DisposableOrig
#404 / 0x194 = Disposable Copy
#628 / 0x274 = Persist Orig
#852 / 0x354 = Persist Copy

#r5 = footer
#r6 = unk dol struct
#r8 = unk dol struct offset (audio group? gets compared to r3 into the function)
#r9 = stack struct
#r10 = unk dol struct offset (file sizes??)
#r11 = footer
#r12 = stack struct



/*

800232f0: loads some ID, compares with arg fed into function, if they dont match it loops
80023300: checks if the value on the stack is 0, loops if not
8002330c: gets value on footer, multiplies by something to get an offset
80023310: gets ssm size from dol structure
8002331c: gets some unk size from dol structure, (derived from value in footer struct)
80023320: if value derived from footer value is larger than the other, inc loop

*/

li  r29,0
subfic	r4, r31, 55 + NumOfAddedChars
Loop:
  lwz r0,-0x4(r7)
  stw r0,0x0(r7)
  subi  r7,r7,4
  addi  r29,r29,1
  cmpw r29,r4
  blt Loop

  branch r29,0x800233a8
