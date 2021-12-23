#To be inserted at 801a500c
.include "../Globals.s"
.include "Header.s"

.set REG_HeapID, 31

backup

  lwz	r0, -0x6C98 (r13)
  cmpwi	r0, 3
  blt Exit

# get heap size
  branchl r12,0x80375404
  mr REG_HeapID,r3
  branchl r12,0x80344168

# cast to float
  xoris r3,r3,0x8000
  lfd	f1, -0x35F8 (rtoc)
  stw r3,0x84(sp)
  lis r3,0x4330
  stw r3,0x80(sp)
  lfd f2,0x80(sp)
  fsubs f1,f2,f1
  
# divide by 1024
  bl Float
  mflr r3
  lfs f2,0x0(f3)
  fdivs f1,f1,f2

# report
  bl String
  mflr r3
  mr r4, REG_HeapID
  crset 6
  branchl r12,0x803456a8

  b Exit

String:
blrl
.string "Heap %d Free : %.2fkb"
.align 2

Float:
blrl
.float 1024
.align 2

Exit:
  restore
  lwz	r0, 0x000C (r25)
