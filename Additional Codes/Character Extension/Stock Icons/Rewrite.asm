#To be inserted @ 80168b34
.include "../../../Globals.s"
.include "../Header.s"

.set  REG_ExternalIDCount,12

backup

  lwz REG_ExternalIDCount,OFST_Metadata_ExternalIDCount(rtoc)
  subi  r11,REG_ExternalIDCount,7

#Check if a special character
  cmpw r3,r11
  blt NormalCharacter
  subi  r11,REG_ExternalIDCount,2
  cmpw r3,r11
  bgt NormalCharacter

SpecialCharacter:
#Get the starting frame
  subi  r11,REG_ExternalIDCount,7
  sub r3,r3,r11
  bl  SpecialCharacterFrames
  mflr  r4
  lbzx  r3,r3,r4
#is equal to starting frame + additional characters
  subi  r4,REG_ExternalIDCount,33
  add r3,r3,r4
  b StockIcon_CastToFloat

NormalCharacter:
#Check for Sopo
  subi  r11,REG_ExternalIDCount,1
  cmpw r3,r11
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
#is = totalnum-8
  subi  r3,REG_ExternalIDCount,8
  b StockIcon_GetFrame
IsPopo:
  li  r3,0xE
  b StockIcon_GetFrame

StockIcon_GetFrame:
  subi  r11,REG_ExternalIDCount,3
  mullw	r0, r5, r11
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
#do this number + (totalchars-33)
.byte 28  #master hand
.byte 58  #wire male
.byte 58  #wire female
.byte 58  #giga bowser
.byte 27  #crazy hand
.byte 59  #sandbag
.align 2
