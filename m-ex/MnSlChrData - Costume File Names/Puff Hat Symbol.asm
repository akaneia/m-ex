#To be inserted @ 8013c388
.include "../../Globals.s"
.include "../Header.s"

backup

.set REG_VisSymbol,24
.set REG_CostumeArchive,25
.set REG_HatSymbol,26
.set REG_Index,27
.set REG_FighterGObj,28
.set REG_FighterData,30

  lwz REG_FighterData,0x2C(REG_FighterGObj)

# Get this costumes visibility index from MEX_GetData
  lbz	r0, 0x04 (REG_FighterData)
  lwz  r3,OFST_MnSlChrCostumeFileSymbols(rtoc)
  mulli r0,r0,4
  lwzx r3,r3,r0
  lbz	r0, 0x0619 (REG_FighterData)
  mulli r0,r0,CostumeFileSymbols_Stride
  add r3,r3,r0
  lwz REG_Index,CostumeFileSymbols_VisibilityIndex(r3)

# Get costume dat archive
  lwz r3,0x4(REG_FighterData)
  lwz r4,OFST_Char_CostumeRuntimePointers(rtoc)
  mulli r3,r3,RuntimeCostumePointers_Stride
  lwzx r3,r3,r4
  lbz	r0, 0x0619 (REG_FighterData)
  mulli r0,r0,RuntimeCostumePointersSub_Stride
  add r3,r3,r0
  lwz REG_CostumeArchive,0x14(r3)

##############
## HAT JOBJ ##
##############

# If 0, first check for custom before using the 0th table
  cmpwi REG_Index,0
  bne Hat_UseDOL

Hat_UseCustom:
# Get custom string name
  mr r3,REG_CostumeArchive
  bl Custom_HatSymbol
  mflr r4
  branch r12,0x8013c3a8
  mr. REG_HatSymbol, r3
  beq Hat_UseDOL
  b CheckHat

Hat_UseDOL:
  load r3,0x803d05b4
  lbz	r0, 0x0619 (REG_FighterData)
  mulli r0,r0,4
  lwzx REG_HatSymbol,r3,r0
  
CheckHat:
# ensure hat model exists
  cmpwi REG_HatSymbol,0
  beq Hat_NoExist

GetHatJObj:
  mr r3,REG_CostumeArchive
  mr r4,REG_HatSymbol
  branchl r12,0x80380358
  mr. REG_HatSymbol, r3

#############
## HAT VIS ##
#############

# if index 0, check for custom vis
  cmpwi REG_Index,0
  bne Vis_UsePlXX

Vis_UseCustom:
# Get custom string name
  mr r3,REG_CostumeArchive
  bl Custom_VisSymbol 
  mflr r4
  branchl r12,0x80380358
  mr. REG_VisSymbol, r3
  beq Vis_UsePlXX
  b CreateHat

Vis_UsePlXX:
  lwz	r3, 0x010C (REG_FighterData)
  lwz	r3, 0x0048 (r3)
  lwz	r3, 0x0004 (r3)
  addi REG_VisSymbol,r3,4

CreateHat:

# Create Obj
  load r3,0x80459080
  branchl r12,0x8037abc8
  stw r3,0x2244(REG_FighterData)

# Instantiate JObj
  mr r3,REG_HatSymbol
  branchl r12,0x80370e44
  stw r3,0x223C(REG_FighterData)

# Init PObj
  branchl r12,0x80074148

# Set model addition flag
  li r3,1
  lbz r0,0x2225(REG_FighterData)
  rlwimi r0,r3,5,26,26
  stb r0,0x2225(REG_FighterData)

# Unk PObj
  branchl r12,0x80074170

# Index FtParts
  mr r3,REG_FighterGObj
  lwz r4,0x223C(REG_FighterData)
  addi	r5, REG_FighterData, 8768
  branchl r12,0x80075650

# Init FtParts
  addi	r6, REG_FighterData, 8768
  addi	r7, r6, 0
  mr r5,REG_Index
  addi	r4, REG_FighterData, 8776
  mr r3,REG_VisSymbol
  branchl r12,0x8007487c

# Init headband if exists
  mr r3,REG_FighterData
  branchl r12,0x8009dc54

b Exit

####################################

Custom_HatSymbol:
blrl
.string "PlyPurinHat_TopN_Joint"
.align 2

Custom_VisSymbol:
blrl
.string "PlyPurinHat_VisLookup"
.align 2

/*
#############################################
DoesNotExist:
#OSReport
  bl  ErrorString
  mflr  r3
  lwz  r4,OFST_MnSlChrCostumeFileSymbols(rtoc)
  lbz	r0, 0x04 (r31)
  mulli r4,r4,4
  lwzx r4,r4,0
  lbz	r0, 0x0619 (r31)
  mulli r0,r0,CostumeFileSymbols_Stride
  add r4,r4,r0
  lwz r4,CostumeFileSymbols_FileName(r4)
  branchl r12,0x803456a8
#Assert
  bl  Assert_Name
  mflr  r3
  li  r4,0
  load  r5,0x804d3940
  branchl r12,0x80388220
Assert_Name:
blrl
.string "m-ex"
.align 2
ErrorString:
blrl
.string "error: %s does not have XXX symbol\n"
.align 2
###############################################
*/

Hat_NoExist:
  li r3,0
  stw r3,0x223C(REG_FighterData)

Exit:
  restore
  branch r12,0x8013c474