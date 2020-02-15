#To be inserted @ 80168b34
.include "../../../Globals.s"
.include "../Header.s"

#.set  NumOfAddedChars,0

backup

#Check if a special character
  cmpwi r3,0x1A + NumOfAddedChars
  blt NormalCharacter
  cmpwi r3,0x1F + NumOfAddedChars
  bgt NormalCharacter

SpecialCharacter:
  subi  r3,r3,0x1A + NumOfAddedChars
  bl  SpecialCharacterFrames
  mflr  r4
  lbzx  r3,r3,r4
  b StockIcon_CastToFloat

NormalCharacter:
#Check for Sopo
  cmpwi r3,0x20 + NumOfAddedChars
  beq IsPopo
#Check for Zelda/Sheik
  cmpwi r3,0x12
  beq IsZeldaSheik
  cmpwi r3,0x13
  beq IsZeldaSheik
#If ID is above sheik, subtract 1
  ble StockIcon_GetFrame
  subi  r3,r3,1
  b StockIcon_GetFrame

IsZeldaSheik:
  cmpwi r4,7
  beq isSheik
isZelda:
  li  r3,18
  b StockIcon_GetFrame
isSheik:
  li  r3,25 + NumOfAddedChars
  b StockIcon_GetFrame
IsPopo:
  li  r3,0xE
  b StockIcon_GetFrame

StockIcon_GetFrame:
  mulli	r0, r5, 30 + NumOfAddedChars
  add	r3, r3, r0

StockIcon_CastToFloat:
  lfd	f1, -0x57A0 (rtoc)
  xoris	r3, r3, 0x8000
  stw r3,0x84(sp)
  lis r0,0x4330
  stw r0,0x80(sp)
  lfd	f0,0x80(sp)
  fsubs	f1,f0,f1
StockIcon_Exit:
  restore
  blr

SpecialCharacterFrames:
blrl
.byte 28 + NumOfAddedChars  #master hand
.byte 58 + NumOfAddedChars  #wire male
.byte 58 + NumOfAddedChars  #wire female
.byte 58 + NumOfAddedChars  #giga bowser
.byte 27 + NumOfAddedChars  #crazy hand
.byte 59 + NumOfAddedChars  #sandbag
.align 2
