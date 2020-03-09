#To be inserted @ 80168b34
.include "../../Globals.s"
.include "../Header.s"

.set  REG_ExternalIDCount,12
.set  REG_ExternalID,3
.set  REG_CostumeID,5

.set  masterHand,7
.set  wireMale,6
.set  wireFemale,5
.set  gigaBowser,4
.set  crazyHand,3
.set  sandbag,2
.set  popo,1

backup

  lwz REG_ExternalIDCount,OFST_Metadata_ExternalIDCount(rtoc)

#Check if a special character
  subi  r11,REG_ExternalIDCount,masterHand
  cmpw REG_ExternalID,r11
  blt NormalCharacter
  subi  r11,REG_ExternalIDCount,popo
  cmpw REG_ExternalID,r11
  bge NormalCharacter

SpecialCharacter:
#Get the starting frame
  subi  r11,REG_ExternalIDCount,masterHand
  sub REG_ExternalID,REG_ExternalID,r11
  bl  SpecialCharacterFrames
  mflr  r4
  lbzx  REG_ExternalID,REG_ExternalID,r4
#is equal to starting frame + additional characters
  subi  r4,REG_ExternalIDCount,33
  add REG_ExternalID,REG_ExternalID,r4
  b StockIcon_CastToFloat

NormalCharacter:
#Check for Sopo
  subi  r11,REG_ExternalIDCount,popo
  cmpw REG_ExternalID,r11
  beq IsPopo
#Check for Zelda/Sheik
  cmpwi REG_ExternalID,0x12
  beq IsZeldaSheik
  cmpwi REG_ExternalID,0x13
  beq IsZeldaSheik
#If ID is above sheik, subtract 1
  ble StockIcon_GetFrame
  subi  REG_ExternalID,REG_ExternalID,1
  b StockIcon_GetFrame

IsZeldaSheik:
  cmpwi r4,7
  beq isSheik
isZelda:
  li  REG_ExternalID,18
  b StockIcon_GetFrame
isSheik:
#is = totalnum-8
  subi  REG_ExternalID,REG_ExternalIDCount,8
  b StockIcon_GetFrame
IsPopo:
  li  REG_ExternalID,0xE
  b StockIcon_GetFrame

StockIcon_GetFrame:
  subi  r11,REG_ExternalIDCount,3
  mullw	r0, REG_CostumeID, r11
  add	REG_ExternalID, REG_ExternalID, r0

StockIcon_CastToFloat:
  lfd	f1, -0x57A0 (rtoc)
  xoris	REG_ExternalID, REG_ExternalID, 0x8000
  stw REG_ExternalID,0x84(sp)
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
