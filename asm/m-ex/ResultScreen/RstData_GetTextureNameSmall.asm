#To be inserted @ 80178fd8
.include "../../Globals.s"
.include "../Header.s"

cmpwi r3, 25
bgt CastToFloat

cmpwi r3, 18
blt CastToFloat

cmpwi r4, 7
beq IsSheik

cmpwi r3, 18
beq CastToFloat

subi r3,r3,1
b CastToFloat

IsSheik:
li r3, 25

# cast to float
CastToFloat:
  xoris r3,r3,0x8000
  lfd	f1, -0x35F8 (rtoc)
  stw r3,0x84(sp)
  lis r3,0x4330
  stw r3,0x80(sp)
  lfd f2,0x80(sp)
  fsubs f1,f2,f1
  