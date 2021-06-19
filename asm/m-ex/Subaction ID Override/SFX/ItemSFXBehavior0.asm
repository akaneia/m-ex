#To be inserted @ 8026aebc
.include "../../../Globals.s"
.include "../../Header.s"

#r5,r6 are free
.set  REG_ItemData,29
.set  REG_SFXID,4
.set  REG_FighterData,8
.set  REG_MagicNum,7

.set  REG_Temp,9
.set  REG_Temp2,10
.set  REG_Temp3,11
.set  REG_Temp4,12

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

#Check for kirby
  lwz REG_Temp,0x4(REG_FighterData)
  cmpwi REG_Temp,4
  beq IsKirby
  b GetExtID
IsKirby:
#Get external ID by searching external to internal table
  lwz REG_Temp,0x2238(REG_FighterData)
  lwz REG_Temp2,OFST_MnSlChrDefineIDs(rtoc)
  li  REG_Temp3,0
  b IsKirbySearch_Check
IsKirbySearch_Loop:
#Check first internal ID
  lbz REG_Temp4,0x0(REG_Temp2)
  extsb REG_Temp4,REG_Temp4
  cmpwi REG_Temp4, -1
  beq IsKirbySearch_Secondary
  cmpw REG_Temp4,REG_Temp
  beq IsKirbySearch_Found
IsKirbySearch_Secondary:
#Check second internal ID
  lbz REG_Temp4,0x1(REG_Temp2)
  extsb REG_Temp4,REG_Temp4
  cmpwi REG_Temp4, -1
  beq IsKirbySearch_Inc
  cmpw REG_Temp4,REG_Temp
  beq IsKirbySearch_Found
  b IsKirbySearch_Inc
IsKirbySearch_Found:
  mr REG_Temp,REG_Temp3
  b GetSSMID
IsKirbySearch_Inc:
  addi REG_Temp2,REG_Temp2,3
  addi REG_Temp3,REG_Temp3,1
IsKirbySearch_Check:
  lwz REG_Temp4,OFST_Metadata_FtExtNum(rtoc)
  cmpw REG_Temp3,REG_Temp4
  blt IsKirbySearch_Loop
#If i get here i didn't find the fighter, just hang i guess
  b 0x0

GetExtID:
# Get this fighters external ID
  lbz REG_Temp,0xC(REG_FighterData)
  load  REG_Temp2,0x80453080
  mulli REG_Temp,REG_Temp,0xe90
  add REG_Temp,REG_Temp,REG_Temp2
  lwz REG_Temp,0x4(REG_Temp)

GetSSMID:
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
mr	r3, r4