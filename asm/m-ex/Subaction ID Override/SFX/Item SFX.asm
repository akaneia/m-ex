#To be inserted @ 8026afc0
.include "../../../Globals.s"
.include "../../Header.s"

#r5,r6 are free
.set  REG_ItemData,3
.set  REG_SFXID,29
.set  REG_FighterData,8
.set  REG_MagicNum,7

.set  REG_Temp,5
.set  REG_Temp2,6

addi	REG_SFXID, r4, 0

#Check if ssm ID is 0
  load  REG_MagicNum,0x68db8bad
  mulhw  REG_Temp,REG_SFXID,REG_MagicNum
  srawi	REG_Temp,REG_Temp,12
  cmpwi REG_Temp,0
  bne Original
#Check if 5000 or higher
  cmpwi REG_SFXID,5000
  blt Original
#Check if item has an owner
  lwz REG_FighterData,0x518(REG_ItemData)
  cmpwi REG_FighterData, 0
  beq Original
  lwz REG_FighterData,0x2C(REG_FighterData)
#Isolate rightmost 3 digits
  lis REG_MagicNum,0x68db
  ori REG_MagicNum,REG_MagicNum,35757
  mulhw REG_MagicNum,REG_SFXID,REG_MagicNum
  srawi REG_Temp,REG_MagicNum,11
  srawi REG_MagicNum,REG_SFXID,31
  subf REG_MagicNum,REG_MagicNum,REG_Temp
  mulli REG_MagicNum,REG_MagicNum,5000
  subf REG_SFXID,REG_MagicNum,REG_SFXID
#Get external ID
  lbz REG_Temp,0xC(REG_FighterData)
  load  REG_Temp2,0x80453080
  mulli REG_Temp,REG_Temp,0xe90
  add REG_Temp,REG_Temp,REG_Temp2
  lwz REG_Temp,0x4(REG_Temp)
#Get this characters SSM ID
  lwz REG_Temp2,OFST_MnSlChrSSMFileIDs(rtoc)
  mulli REG_Temp,REG_Temp,0x10
  lbzx  REG_Temp,REG_Temp,REG_Temp2
#multiply by 10000
  mulli REG_Temp,REG_Temp,10000
#Add to ID
  add REG_SFXID,REG_Temp,REG_SFXID
  b Exit

Original:
Exit: