#To be inserted at 8015ff90
.include "../Globals.s"
.include "Header.s"

#Icon Data
  bl  MnSlChr_IconData
  mflr  r3
  stw r3,OFST_MnSlChrIconData(rtoc)


#Name Text
  bl  MnSlChr_NameText
  mflr  r3
  bl  ConvertPointers
  stw r3,OFST_MnSlChrNames(rtoc)


#External to Internal Table
  bl  MnSlChr_DefineIDs
  mflr  r3
  stw r3,OFST_MnSlChrDefineIDs(rtoc)


#Costume File Names
  bl  MnSlChr_CharFiles
  mflr  r3
  bl  ConvertPointers
  stw r3,OFST_MnSlChrCharFileNames(rtoc)
#Costume File Names
  bl  MnSlChr_CostumeFiles
  mflr  r3
  bl  ConvertPointers
  bl  MnSlChrCostumes_Start
  mflr  r3
  bl  ConvertPointers
  bl  MnSlChr_CostumeFiles
  mflr  r3
  stw r3,OFST_MnSlChrCostumeFileSymbols(rtoc)
#Anim File Names
  bl  MnSlChr_AnimFiles
  mflr  r3
  bl  ConvertPointers
  stw r3,OFST_MnSlChrAnimFileNames(rtoc)
#Anim Count
  bl  MnSlChr_AnimCount
  mflr  r3
  stw r3,OFST_MnSlChrAnimCount(rtoc)

#Effect File IDs
  bl  MnSlChr_EffectFileIDs
  mflr  r3
  stw r3,OFST_MnSlChrEffectFileIDs(rtoc)
#Effect File Names
  bl  MnSlChr_EffectFiles
  mflr  r3
  bl  ConvertPointers
  stw r3,OFST_MnSlChrEffectFilesSymbols(rtoc)
#Effect File Names
  bl  Effect_AdditionalEffectStruct
  mflr  r3
  stw r3,OFST_EffectCreate(rtoc)


#Result Anim File Names
  bl  GmRst_AnimFiles
  mflr  r3
  bl  ConvertPointers
  stw r3,OFST_GmRstAnimFileNames(rtoc)
#Result Insignias
  bl  GmRst_InsigniaIDs
  mflr  r3
  stw r3,OFST_GmRstInsigniaIDs(rtoc)
#Result Scale
  bl  GmRst_Scale
  mflr  r3
  stw r3,OFST_GmRstScale(rtoc)
#Fighter Demo Symbols
  bl  DemoFileSymbols_Start
  mflr  r3
  bl  ConvertPointers
  bl  FtDemo_SymbolNames
  mflr  r3
  bl  ConvertPointers
  stw r3,OFST_FtDemoSymbols(rtoc)
#Result Theme
  bl  GmRst_VictoryTheme
  mflr  r3
  stw r3,OFST_GmRstVictoryTheme(rtoc)


#Char SSM File Names
  bl  SFX_NameDef
  mflr  r3
  stw r3,OFST_SFXNameDef(rtoc)
#Char SSM File Names
  bl  MnSlChr_CharSSMFileIDs
  mflr  r3
  stw r3,OFST_MnSlChrSSMFileIDs(rtoc)
#SSM File Names
  bl  MnSlChr_SSMFiles
  mflr  r3
  bl  ConvertPointers
  stw r3,OFST_MnSlChrSSMFileNames(rtoc)
#SSM Struct
  bl  MnSlChr_SSMStruct
  mflr  r3
  stw r3,OFST_SSMStruct(rtoc)
#SSM IDs
  bl  SSM_IDDefinitions
  mflr  r3
  stw r3,OFST_SSMIDDef(rtoc)
#SSM Bank Sizes
  bl  SSM_BankSizes
  mflr  r3
  stw r3,OFST_SSMBankSizes(rtoc)


#OnLoad
  bl  Fighter_OnLoad
  mflr  r3
  bl  ConvertPointers
  stw r3,OFST_FighterOnLoad(rtoc)
#OnDeath
  bl  Fighter_OnDeath
  mflr  r3
  bl  ConvertPointers
  stw r3,OFST_FighterOnSpawn(rtoc)
#Move Logic
  bl  Fighter_MoveLogic
  mflr  r3
  bl  ConvertPointers
  stw r3,OFST_FighterMoveLogic(rtoc)


#Down Special
  bl  Fighter_DownSpecialLw
  mflr  r3
  bl  ConvertPointers
  stw r3,OFST_FighterSpecialLw(rtoc)
#Side Special
  bl  Fighter_SideSpecialLw
  mflr  r3
  bl  ConvertPointers
  stw r3,OFST_FighterSpecialS(rtoc)
#Neutral Special
  bl  Fighter_NeutralSpecialLw
  mflr  r3
  bl  ConvertPointers
  stw r3,OFST_FighterSpecialN(rtoc)
#Up Special
  bl  Fighter_UpSpecialLw
  mflr  r3
  bl  ConvertPointers
  stw r3,OFST_FighterSpecialHi(rtoc)

#Down Special
  bl  Fighter_DownSpecialHi
  mflr  r3
  bl  ConvertPointers
  stw r3,OFST_FighterSpecialLwAir(rtoc)
#Side Special
  bl  Fighter_SideSpecialHi
  mflr  r3
  bl  ConvertPointers
  stw r3,OFST_FighterSpecialSAir(rtoc)
#Neutral Special
  bl  Fighter_NeutralSpecialHi
  mflr  r3
  bl  ConvertPointers
  stw r3,OFST_FighterSpecialNAir(rtoc)
#Up Special
  bl  Fighter_UpSpecialHi
  mflr  r3
  bl  ConvertPointers
  stw r3,OFST_FighterSpecialHiAir(rtoc)

#MnSlChr Costume IDs
  bl  MnSlChr_CostumeIDs
  mflr  r3
  stw r3,OFST_MnSlChrCostumeIDs(rtoc)
#Fighter Costume IDs
  bl  Fighter_CostumeSymbolTable
  mflr  r3
  bl  ConvertPointers
  stw r3,OFST_Char_CostumeRuntimePointers(rtoc)

#Items
  bl  Items_Data
  mflr  r3
  bl  ConvertPointers
  stw r3,OFST_ItemFunctions(rtoc)
#Items
  bl  Items_Index
  mflr  r3
  stw r3,OFST_ItemIndex(rtoc)

  b Injection_Exit

####################
MnSlChr_IconData:
  blrl
  #GaW Name
  .long 0x826c8292
  .long 0x81448266
  .long 0x8281828d
  .long 0x82858195
  .long 0x82768281
  .long 0x82948283
  .long 0x82880000

  .hword 0 #Melee Joint ID
  .hword 1 #Teams Joint ID
  .long 0x00007535 #UnkStuff
  .long 0x0002000d #UnkStuff
  .long 0x0000753a #UnkStuff
  .long 0x0003000e #UnkStuff
  .long 0x0000753b #UnkStuff
  .long 0x0004000f #UnkStuff
  .long 0x0000753c #UnkStuff
  .long 0x00070011 #UnkStuff
  .long 0x0000753d #UnkStuff
  .long 0x00080012 #UnkStuff
  .long 0x0000753e #UnkStuff
  .long 0x00090013 #UnkStuff
  .long 0x0000753f #UnkStuff
  .long 0x00060010 #UnkStuff
  .long 0x00007540 #UnkStuff
  .long 0x000a0014 #UnkStuff
  .long 0x00007541 #UnkStuff
  .long 0x000b0015 #UnkStuff
  .long 0x00007535 #UnkStuff
  .long 0x000c0016 #UnkStuff
  .long 0x00007535 #UnkStuff
  .long 0x00000000 #UnkStuff
  .long 0x00007534 #UnkStuff
  .long 0x00010000 #UnkStuff
  .long 0x00007534 #UnkStuff
  .long 0x00020000 #UnkStuff
  .long 0x00007533 #UnkStuff
  .long 0x00030000 #UnkStuff
  .long 0x00007534 #UnkStuff
  .long 0x00040000 #UnkStuff
  .long 0x0007c864 #UnkStuff
  .long 0x00050000 #UnkStuff
  .long 0x00007531 #UnkStuff
  .long 0x00080000 #UnkStuff
  .long 0x00007534 #UnkStuff
  .long 0x00090000 #UnkStuff
  .long 0x00007534 #UnkStuff
  .long 0x000a0000 #UnkStuff
  .long 0x00007534 #UnkStuff
  .long 0x000b0000 #UnkStuff
  .long 0x00007534 #UnkStuff
  .long 0x000c0000 #UnkStuff
  .long 0x00007534 #UnkStuff
  .long 0x000d0000 #UnkStuff
  .long 0x00007534 #UnkStuff
  .long 0x00070000 #UnkStuff
  .long 0x00007532 #UnkStuff

  #Doc
  .byte 0x15 #Char Unk ID
  .byte 0x16 #Char Ext ID
  .byte 0x2 #Status ID
  .byte 0x0 #Anim State
  .byte 0x4 #Joint ID 1
  .byte 0x4 #Joint ID 2
  .align 2
  .long 0xc5 #SFX ID
  .float -30 #LeftBound
  .float -24.4 #RightBound
  .float 20 #TopBound
  .float 13 #BottomBound

  #Mario
  .byte 0x8 #Char Unk ID
  .byte 0x8 #Char Ext ID
  .byte 0x1 #Status ID
  .byte 0x0 #Anim State
  .byte 0x10 #Joint ID 1
  .byte 0x10 #Joint ID 2
  .align 2
  .long 0xcd #SFX ID
  .float -24.4 #LeftBound
  .float -17.4 #RightBound
  .float 20 #TopBound
  .float 13 #BottomBound

  #Luigi
  .byte 0x7 #Char Unk ID
  .byte 0x7 #Char Ext ID
  .byte 0x1 #Status ID
  .byte 0x0 #Anim State
  .byte 0x11 #Joint ID 1
  .byte 0x11 #Joint ID 2
  .align 2
  .long 0xcc #SFX ID
  .float -17.4 #LeftBound
  .float -10.4 #RightBound
  .float 20 #TopBound
  .float 13 #BottomBound

  #Bowser
  .byte 0x5 #Char Unk ID
  .byte 0x5 #Char Ext ID
  .byte 0x1 #Status ID
  .byte 0x0 #Anim State
  .byte 0x12 #Joint ID 1
  .byte 0x12 #Joint ID 2
  .align 2
  .long 0xca #SFX ID
  .float -10.4 #LeftBound
  .float -3.4 #RightBound
  .float 20 #TopBound
  .float 13 #BottomBound

  #Peach
  .byte 0xc #Char Unk ID
  .byte 0xc #Char Ext ID
  .byte 0x1 #Status ID
  .byte 0x0 #Anim State
  .byte 0x13 #Joint ID 1
  .byte 0x13 #Joint ID 2
  .align 2
  .long 0xd1 #SFX ID
  .float -3.4 #LeftBound
  .float 3.6 #RightBound
  .float 20 #TopBound
  .float 13 #BottomBound

  #Yoshi
  .byte 0x11 #Char Unk ID
  .byte 0x11 #Char Ext ID
  .byte 0x1 #Status ID
  .byte 0x0 #Anim State
  .byte 0x14 #Joint ID 1
  .byte 0x14 #Joint ID 2
  .align 2
  .long 0xd7 #SFX ID
  .float 3.6 #LeftBound
  .float 10.6 #RightBound
  .float 20 #TopBound
  .float 13 #BottomBound

  #DK
  .byte 0x1 #Char Unk ID
  .byte 0x1 #Char Ext ID
  .byte 0x1 #Status ID
  .byte 0x0 #Anim State
  .byte 0x15 #Joint ID 1
  .byte 0x15 #Joint ID 2
  .align 2
  .long 0xc4 #SFX ID
  .float 10.6 #LeftBound
  .float 17.6 #RightBound
  .float 20 #TopBound
  .float 13 #BottomBound

  #Falcon
  .byte 0x0 #Char Unk ID
  .byte 0x0 #Char Ext ID
  .byte 0x1 #Status ID
  .byte 0x0 #Anim State
  .byte 0x16 #Joint ID 1
  .byte 0x16 #Joint ID 2
  .align 2
  .long 0xc2 #SFX ID
  .float 17.6 #LeftBound
  .float 24.4 #RightBound
  .float 20 #TopBound
  .float 13 #BottomBound

  #Ganon
  .byte 0x18 #Char Unk ID
  .byte 0x19 #Char Ext ID
  .byte 0x2 #Status ID
  .byte 0x0 #Anim State
  .byte 0x6 #Joint ID 1
  .byte 0x6 #Joint ID 2
  .align 2
  .long 0xd9 #SFX ID
  .float 24.4 #LeftBound
  .float 30.2 #RightBound
  .float 20 #TopBound
  .float 13 #BottomBound

  #Falco
  .byte 0x13 #Char Unk ID
  .byte 0x14 #Char Ext ID
  .byte 0x2 #Status ID
  .byte 0x0 #Anim State
  .byte 0x8 #Joint ID 1
  .byte 0x8 #Joint ID 2
  .align 2
  .long 0xc6 #SFX ID
  .float -30 #LeftBound
  .float -24.4 #RightBound
  .float 13 #TopBound
  .float 6 #BottomBound

  #Fox
  .byte 0x2 #Char Unk ID
  .byte 0x2 #Char Ext ID
  .byte 0x1 #Status ID
  .byte 0x0 #Anim State
  .byte 0x17 #Joint ID 1
  .byte 0x17 #Joint ID 2
  .align 2
  .long 0xc7 #SFX ID
  .float -24.4 #LeftBound
  .float -17.4 #RightBound
  .float 13 #TopBound
  .float 6 #BottomBound

  #Ness
  .byte 0xb #Char Unk ID
  .byte 0xb #Char Ext ID
  .byte 0x1 #Status ID
  .byte 0x0 #Anim State
  .byte 0x18 #Joint ID 1
  .byte 0x18 #Joint ID 2
  .align 2
  .long 0xd0 #SFX ID
  .float -17.4 #LeftBound
  .float -10.4 #RightBound
  .float 13 #TopBound
  .float 6 #BottomBound

  #IceClimbers
  .byte 0xe #Char Unk ID
  .byte 0xe #Char Ext ID
  .byte 0x1 #Status ID
  .byte 0x0 #Anim State
  .byte 0x19 #Joint ID 1
  .byte 0x19 #Joint ID 2
  .align 2
  .long 0xc8 #SFX ID
  .float -10.4 #LeftBound
  .float -3.4 #RightBound
  .float 13 #TopBound
  .float 6 #BottomBound

  #Kirby
  .byte 0x4 #Char Unk ID
  .byte 0x4 #Char Ext ID
  .byte 0x1 #Status ID
  .byte 0x0 #Anim State
  .byte 0x1a #Joint ID 1
  .byte 0x1a #Joint ID 2
  .align 2
  .long 0xc9 #SFX ID
  .float -3.4 #LeftBound
  .float 3.6 #RightBound
  .float 13 #TopBound
  .float 6 #BottomBound

  #Samus
  .byte 0x10 #Char Unk ID
  .byte 0x10 #Char Ext ID
  .byte 0x1 #Status ID
  .byte 0x0 #Anim State
  .byte 0x1b #Joint ID 1
  .byte 0x1b #Joint ID 2
  .align 2
  .long 0xd5 #SFX ID
  .float 3.6 #LeftBound
  .float 10.6 #RightBound
  .float 13 #TopBound
  .float 6 #BottomBound

  #Zelda
  .byte 0x12 #Char Unk ID
  .byte 0x12 #Char Ext ID
  .byte 0x1 #Status ID
  .byte 0x0 #Anim State
  .byte 0x1c #Joint ID 1
  .byte 0x1c #Joint ID 2
  .align 2
  .long 0xd6 #SFX ID
  .float 10.6 #LeftBound
  .float 17.6 #RightBound
  .float 13 #TopBound
  .float 6 #BottomBound

  #Link
  .byte 0x6 #Char Unk ID
  .byte 0x6 #Char Ext ID
  .byte 0x1 #Status ID
  .byte 0x0 #Anim State
  .byte 0x1d #Joint ID 1
  .byte 0x1d #Joint ID 2
  .align 2
  .long 0xcb #SFX ID
  .float 17.6 #LeftBound
  .float 24.4 #RightBound
  .float 13 #TopBound
  .float 6 #BottomBound

  #Young Link
  .byte 0x14 #Char Unk ID
  .byte 0x15 #Char Ext ID
  .byte 0x2 #Status ID
  .byte 0x0 #Anim State
  .byte 0xa #Joint ID 1
  .byte 0xa #Joint ID 2
  .align 2
  .long 0xc3 #SFX ID
  .float 24.4 #LeftBound
  .float 30.2 #RightBound
  .float 13 #TopBound
  .float 6 #BottomBound

  #Pichu
  .byte 0x17 #Char Unk ID
  .byte 0x18 #Char Ext ID
  .byte 0x2 #Status ID
  .byte 0x0 #Anim State
  .byte 0xc #Joint ID 1
  .byte 0xc #Joint ID 2
  .align 2
  .long 0xd2 #SFX ID
  .float -23.4 #LeftBound
  .float -17.4 #RightBound
  .float 6 #TopBound
  .float -1 #BottomBound

  #Pikachu
  .byte 0xd #Char Unk ID
  .byte 0xd #Char Ext ID
  .byte 0x1 #Status ID
  .byte 0x0 #Anim State
  .byte 0x1e #Joint ID 1
  .byte 0x1e #Joint ID 2
  .align 2
  .long 0xd3 #SFX ID
  .float -17.4 #LeftBound
  .float -10.4 #RightBound
  .float 6 #TopBound
  .float -1 #BottomBound

  #Jigglypuff
  .byte 0xf #Char Unk ID
  .byte 0xf #Char Ext ID
  .byte 0x1 #Status ID
  .byte 0x0 #Anim State
  .byte 0x1f #Joint ID 1
  .byte 0x1f #Joint ID 2
  .align 2
  .long 0xd4 #SFX ID
  .float -10.4 #LeftBound
  .float -3.4 #RightBound
  .float 6 #TopBound
  .float -1 #BottomBound

  #Mewtwo
  .byte 0xa #Char Unk ID
  .byte 0xa #Char Ext ID
  .byte 0x1 #Status ID
  .byte 0x0 #Anim State
  .byte 0x20 #Joint ID 1
  .byte 0x20 #Joint ID 2
  .align 2
  .long 0xcf #SFX ID
  .float -3.4 #LeftBound
  .float 3.6 #RightBound
  .float 6 #TopBound
  .float -1 #BottomBound

  #Game&Watch
  .byte 0x3 #Char Unk ID
  .byte 0x3 #Char Ext ID
  .byte 0x1 #Status ID
  .byte 0x0 #Anim State
  .byte 0x21 #Joint ID 1
  .byte 0x21 #Joint ID 2
  .align 2
  .long 0xd8 #SFX ID
  .float 3.6 #LeftBound
  .float 10.6 #RightBound
  .float 6 #TopBound
  .float -1 #BottomBound

  #Marth
  .byte 0x9 #Char Unk ID
  .byte 0x9 #Char Ext ID
  .byte 0x1 #Status ID
  .byte 0x0 #Anim State
  .byte 0x22 #Joint ID 1
  .byte 0x22 #Joint ID 2
  .align 2
  .long 0xce #SFX ID
  .float 10.6 #LeftBound
  .float 17.6 #RightBound
  .float 6 #TopBound
  .float -1 #BottomBound

  #Roy
  .byte 0x16 #Char CSP ID
  .byte 0x17 #Char Ext ID
  .byte 0x2 #Status ID
  .byte 0x0 #Anim State
  .byte 0xe #Joint ID 1
  .byte 0xe #Joint ID 2
  .align 2
  .long 0xda #SFX ID
  .float 17.6 #LeftBound
  .float 23.6 #RightBound
  .float 6 #TopBound
  .float -1 #BottomBound

  #NewChar1
  .byte 0x19 #Char CSP ID
  .byte 0x1A #Char Ext ID
  .byte 0x1 #Status ID
  .byte 0x0 #Anim State
  .byte 174 #Joint ID 1
  .byte 174 #Joint ID 2
  .align 2
  .long 0xd1 #SFX ID
  .float 23.6 #LeftBound
  .float 30.2 #RightBound
  .float 6 #TopBound
  .float -1 #BottomBound

  #Null
  .byte 0 #Char Unk ID
  .byte 0 #Char Ext ID
  .byte 0 #Status ID
  .byte 0 #Anim State
  .byte 0 #Joint ID 1
  .byte 0 #Joint ID 2
  .align 2
  .long 0 #SFX ID
  .float 0 #LeftBound
  .float 0 #RightBound
  .float 0 #TopBound
  .float 0 #BottomBound

MnSlChr_NameText:
  blrl
  bl  MnSlChrName_Falcon
  bl  MnSlChrName_DK
  bl  MnSlChrName_Fox
  bl  MnSlChrName_GaW
  bl  MnSlChrName_Kirby
  bl  MnSlChrName_Bowser
  bl  MnSlChrName_Link
  bl  MnSlChrName_Luigi
  bl  MnSlChrName_Mario
  bl  MnSlChrName_Marth
  bl  MnSlChrName_Mewtwo
  bl  MnSlChrName_Ness
  bl  MnSlChrName_Peach
  bl  MnSlChrName_Pikachu
  bl  MnSlChrName_IceClimbers
  bl  MnSlChrName_Jigglypuff
  bl  MnSlChrName_Samus
  bl  MnSlChrName_Yoshi
  bl  MnSlChrName_Zelda
  bl  MnSlChrName_Sheik
  bl  MnSlChrName_Falco
  bl  MnSlChrName_YoungLink
  bl  MnSlChrName_DrMario
  bl  MnSlChrName_Roy
  bl  MnSlChrName_Pichu
  bl  MnSlChrName_Ganondorf
  bl  MnSlChrName_NewChar1
  bl  MnSlChrName_MasterHand
  bl  MnSlChrName_WireframeBoy
  bl  MnSlChrName_WireframeGirl
  bl  MnSlChrName_GigaBowser
  bl  MnSlChrName_CrazyHand
  bl  MnSlChrName_Sandbag
  bl  MnSlChrName_Popo
  .long -1

  MnSlChrName_Falcon:
  .string "C. Falcon"
  .align 2
  MnSlChrName_DK:
  .string "DK"
  .align 2
  MnSlChrName_Fox:
  .string "Fox"
  .align 2
  MnSlChrName_GaW:
  .string "GaW"
  .align 2
  MnSlChrName_Kirby:
  .string "Kirby"
  .align 2
  MnSlChrName_Bowser:
  .string "Bowser"
  .align 2
  MnSlChrName_Link:
  .string "Link"
  .align 2
  MnSlChrName_Luigi:
  .string "Luigi"
  .align 2
  MnSlChrName_Mario:
  .string "Mario"
  .align 2
  MnSlChrName_Marth:
  .string "Marth"
  .align 2
  MnSlChrName_Mewtwo:
  .string "Mewtwo"
  .align 2
  MnSlChrName_Ness:
  .string "Ness"
  .align 2
  MnSlChrName_Peach:
  .string "Peach"
  .align 2
  MnSlChrName_Pikachu:
  .string "Pikachu"
  .align 2
  MnSlChrName_IceClimbers:
  .string "Ice Climbers"
  .align 2
  MnSlChrName_Jigglypuff:
  .string "Jigglypuff"
  .align 2
  MnSlChrName_Samus:
  .string "Samus"
  .align 2
  MnSlChrName_Yoshi:
  .string "Yoshi"
  .align 2
  MnSlChrName_Zelda:
  .string "Zelda"
  .align 2
  MnSlChrName_Sheik:
  .string "Sheik"
  .align 2
  MnSlChrName_Falco:
  .string "Falco"
  .align 2
  MnSlChrName_YoungLink:
  .string "Young Link"
  .align 2
  MnSlChrName_DrMario:
  .string "Dr. Mario"
  .align 2
  MnSlChrName_Roy:
  .string "Roy"
  .align 2
  MnSlChrName_Pichu:
  .string "Pichu"
  .align 2
  MnSlChrName_Ganondorf:
  .string "Ganondorf"
  .align 2
  MnSlChrName_MasterHand:
  .string "Master Hand"
  .align 2
  MnSlChrName_WireframeBoy:
  .string "Wireframe Male"
  .align 2
  MnSlChrName_WireframeGirl:
  .string "Wireframe Female"
  .align 2
  MnSlChrName_GigaBowser:
  .string "Giga Bowser"
  .align 2
  MnSlChrName_CrazyHand:
  .string "Crazy Hand"
  .align 2
  MnSlChrName_Sandbag:
  .string "Sandbag"
  .align 2
  MnSlChrName_Popo:
  .string "Popo"
  .align 2
  MnSlChrName_NewChar1:
  NewChar1_FullName
  .align 2

MnSlChr_CharFiles:
  blrl
  bl MnSlChrCharFile_Mario
  bl MnSlChrFtData_Mario
  bl MnSlChrCharFile_Fox
  bl MnSlChrFtData_Fox
  bl MnSlChrCharFile_Falcon
  bl MnSlChrFtData_Falcon
  bl MnSlChrCharFile_DK
  bl MnSlChrFtData_DK
  bl MnSlChrCharFile_Kirby
  bl MnSlChrFtData_Kirby
  bl MnSlChrCharFile_Bowser
  bl MnSlChrFtData_Bowser
  bl MnSlChrCharFile_Link
  bl MnSlChrFtData_Link
  bl MnSlChrCharFile_Sheik
  bl MnSlChrFtData_Sheik
  bl MnSlChrCharFile_Ness
  bl MnSlChrFtData_Ness
  bl MnSlChrCharFile_Peach
  bl MnSlChrFtData_Peach
  bl MnSlChrCharFile_Popo
  bl MnSlChrFtData_Popo
  bl MnSlChrCharFile_Nana
  bl MnSlChrFtData_Nana
  bl MnSlChrCharFile_Pikachu
  bl MnSlChrFtData_Pikachu
  bl MnSlChrCharFile_Samus
  bl MnSlChrFtData_Samus
  bl MnSlChrCharFile_Yoshi
  bl MnSlChrFtData_Yoshi
  bl MnSlChrCharFile_Jigglypuff
  bl MnSlChrFtData_Jigglypuff
  bl MnSlChrCharFile_Mewtwo
  bl MnSlChrFtData_Mewtwo
  bl MnSlChrCharFile_Luigi
  bl MnSlChrFtData_Luigi
  bl MnSlChrCharFile_Marth
  bl MnSlChrFtData_Marth
  bl MnSlChrCharFile_Zelda
  bl MnSlChrFtData_Zelda
  bl MnSlChrCharFile_YoungLink
  bl MnSlChrFtData_YoungLink
  bl MnSlChrCharFile_DrMario
  bl MnSlChrFtData_DrMario
  bl MnSlChrCharFile_Falco
  bl MnSlChrFtData_Falco
  bl MnSlChrCharFile_Pichu
  bl MnSlChrFtData_Pichu
  bl MnSlChrCharFile_GaW
  bl MnSlChrFtData_GaW
  bl MnSlChrCharFile_Ganondorf
  bl MnSlChrFtData_Ganondorf
  bl MnSlChrCharFile_Roy
  bl MnSlChrFtData_Roy
  bl MnSlChrCharFile_NewChar1
  bl MnSlChrFtData_NewChar1
  bl MnSlChrCharFile_MasterHand
  bl MnSlChrFtData_MasterHand
  bl MnSlChrCharFile_CrazyHand
  bl MnSlChrFtData_CrazyHand
  bl MnSlChrCharFile_WireframeBoy
  bl MnSlChrFtData_WireframeBoy
  bl MnSlChrCharFile_WireframeGirl
  bl MnSlChrFtData_WireframeGirl
  bl MnSlChrCharFile_GigaBowser
  bl MnSlChrFtData_GigaBowser
  bl MnSlChrCharFile_Sandbag
  bl MnSlChrFtData_Sandbag
  .long -1
  MnSlChrCharFile_Mario:
  .string "PlMr.dat"
  .align 2
  MnSlChrFtData_Mario:
  .string "ftDataMario"
  .align 2
  MnSlChrCharFile_Fox:
  .string "PlFx.dat"
  .align 2
  MnSlChrFtData_Fox:
  .string "ftDataFox"
  .align 2
  MnSlChrCharFile_Falcon:
  .string "PlCa.dat"
  .align 2
  MnSlChrFtData_Falcon:
  .string "ftDataCaptain"
  .align 2
  MnSlChrCharFile_DK:
  .string "PlDk.dat"
  .align 2
  MnSlChrFtData_DK:
  .string "ftDataDonkey"
  .align 2
  MnSlChrCharFile_Kirby:
  .string "PlKb.dat"
  .align 2
  MnSlChrFtData_Kirby:
  .string "ftDataKirby"
  .align 2
  MnSlChrCharFile_Bowser:
  .string "PlKp.dat"
  .align 2
  MnSlChrFtData_Bowser:
  .string "ftDataKoopa"
  .align 2
  MnSlChrCharFile_Link:
  .string "PlLk.dat"
  .align 2
  MnSlChrFtData_Link:
  .string "ftDataLink"
  .align 2
  MnSlChrCharFile_Sheik:
  .string "PlSk.dat"
  .align 2
  MnSlChrFtData_Sheik:
  .string "ftDataSeak"
  .align 2
  MnSlChrCharFile_Ness:
  .string "PlNs.dat"
  .align 2
  MnSlChrFtData_Ness:
  .string "ftDataNess"
  .align 2
  MnSlChrCharFile_Peach:
  .string "PlPe.dat"
  .align 2
  MnSlChrFtData_Peach:
  .string "ftDataPeach"
  .align 2
  MnSlChrCharFile_Popo:
  .string "PlPp.dat"
  .align 2
  MnSlChrFtData_Popo:
  .string "ftDataPopo"
  .align 2
  MnSlChrCharFile_Nana:
  .string "PlNn.dat"
  .align 2
  MnSlChrFtData_Nana:
  .string "ftDataNana"
  .align 2
  MnSlChrCharFile_Pikachu:
  .string "PlPk.dat"
  .align 2
  MnSlChrFtData_Pikachu:
  .string "ftDataPikachu"
  .align 2
  MnSlChrCharFile_Samus:
  .string "PlSs.dat"
  .align 2
  MnSlChrFtData_Samus:
  .string "ftDataSamus"
  .align 2
  MnSlChrCharFile_Yoshi:
  .string "PlYs.dat"
  .align 2
  MnSlChrFtData_Yoshi:
  .string "ftDataYoshi"
  .align 2
  MnSlChrCharFile_Jigglypuff:
  .string "PlPr.dat"
  .align 2
  MnSlChrFtData_Jigglypuff:
  .string "ftDataPurin"
  .align 2
  MnSlChrCharFile_Mewtwo:
  .string "PlMt.dat"
  .align 2
  MnSlChrFtData_Mewtwo:
  .string "ftDataMewtwo"
  .align 2
  MnSlChrCharFile_Luigi:
  .string "PlLg.dat"
  .align 2
  MnSlChrFtData_Luigi:
  .string "ftDataLuigi"
  .align 2
  MnSlChrCharFile_Marth:
  .string "PlMs.dat"
  .align 2
  MnSlChrFtData_Marth:
  .string "ftDataMars"
  .align 2
  MnSlChrCharFile_Zelda:
  .string "PlZd.dat"
  .align 2
  MnSlChrFtData_Zelda:
  .string "ftDataZelda"
  .align 2
  MnSlChrCharFile_YoungLink:
  .string "PlCl.dat"
  .align 2
  MnSlChrFtData_YoungLink:
  .string "ftDataClink"
  .align 2
  MnSlChrCharFile_DrMario:
  .string "PlDr.dat"
  .align 2
  MnSlChrFtData_DrMario:
  .string "ftDataDrmario"
  .align 2
  MnSlChrCharFile_Falco:
  .string "PlFc.dat"
  .align 2
  MnSlChrFtData_Falco:
  .string "ftDataFalco"
  .align 2
  MnSlChrCharFile_Pichu:
  .string "PlPc.dat"
  .align 2
  MnSlChrFtData_Pichu:
  .string "ftDataPichu"
  .align 2
  MnSlChrCharFile_GaW:
  .string "PlGw.dat"
  .align 2
  MnSlChrFtData_GaW:
  .string "ftDataGamewatch"
  .align 2
  MnSlChrCharFile_Ganondorf:
  .string "PlGn.dat"
  .align 2
  MnSlChrFtData_Ganondorf:
  .string "ftDataGanon"
  .align 2
  MnSlChrCharFile_Roy:
  .string "PlFe.dat"
  .align 2
  MnSlChrFtData_Roy:
  .string "ftDataEmblem"
  .align 2
  MnSlChrCharFile_NewChar1:
    .ascii "Pl"
    NewChar1_ShortName
    .ascii ".dat"
    .byte 0
    .align 2
  MnSlChrFtData_NewChar1:
    .ascii "ftData"
    NewChar1_LongName
    .byte 0
    .align 2
  MnSlChrCharFile_MasterHand:
  .string "PlMh.dat"
  .align 2
  MnSlChrFtData_MasterHand:
  .string "ftDataMasterhand"
  .align 2
  MnSlChrCharFile_CrazyHand:
  .string "PlCh.dat"
  .align 2
  MnSlChrFtData_CrazyHand:
  .string "ftDataCrazyhand"
  .align 2
  MnSlChrCharFile_WireframeBoy:
  .string "PlBo.dat"
  .align 2
  MnSlChrFtData_WireframeBoy:
  .string "ftDataBoy"
  .align 2
  MnSlChrCharFile_WireframeGirl:
  .string "PlGl.dat"
  .align 2
  MnSlChrFtData_WireframeGirl:
  .string "ftDataGirl"
  .align 2
  MnSlChrCharFile_GigaBowser:
  .string "PlGk.dat"
  .align 2
  MnSlChrFtData_GigaBowser:
  .string "ftDataGkoopa"
  .align 2
  MnSlChrCharFile_Sandbag:
  .string "PlSb.dat"
  .align 2
  MnSlChrFtData_Sandbag:
  .string "ftDataSandbag"
  .align 2

MnSlChr_CostumeIDs:
  blrl
  #Falcon
  .byte 6  #Amount of Costumes
  .byte 2  #Red Team Costume
  .byte 5  #Green Team Costume
  .byte 4  #Blue Team Costume
  #DK
  .byte 5  #Amount of Costumes
  .byte 2  #Red Team Costume
  .byte 3  #Green Team Costume
  .byte 4  #Blue Team Costume
  #Fox
  .byte 4  #Amount of Costumes
  .byte 1  #Red Team Costume
  .byte 2  #Green Team Costume
  .byte 3  #Blue Team Costume
  #GaW
  .byte 4  #Amount of Costumes
  .byte 1  #Red Team Costume
  .byte 2  #Green Team Costume
  .byte 3  #Blue Team Costume
  #Kirby
  .byte 6  #Amount of Costumes
  .byte 3  #Red Team Costume
  .byte 2  #Green Team Costume
  .byte 4  #Blue Team Costume
  #Bowser
  .byte 4  #Amount of Costumes
  .byte 1  #Red Team Costume
  .byte 2  #Green Team Costume
  .byte 0  #Blue Team Costume
  #Link
  .byte 5  #Amount of Costumes
  .byte 1  #Red Team Costume
  .byte 2  #Green Team Costume
  .byte 0  #Blue Team Costume
  #Luigi
  .byte 4  #Amount of Costumes
  .byte 3  #Red Team Costume
  .byte 2  #Green Team Costume
  .byte 0  #Blue Team Costume
  #Mario
  .byte 5  #Amount of Costumes
  .byte 0  #Red Team Costume
  .byte 3  #Green Team Costume
  .byte 4  #Blue Team Costume
  #Marth
  .byte 5  #Amount of Costumes
  .byte 1  #Red Team Costume
  .byte 0  #Green Team Costume
  .byte 2  #Blue Team Costume
  #Mewtwo
  .byte 4  #Amount of Costumes
  .byte 1  #Red Team Costume
  .byte 2  #Green Team Costume
  .byte 3  #Blue Team Costume
  #Ness
  .byte 4  #Amount of Costumes
  .byte 0  #Red Team Costume
  .byte 2  #Green Team Costume
  .byte 3  #Blue Team Costume
  #Peach
  .byte 5  #Amount of Costumes
  .byte 0  #Red Team Costume
  .byte 3  #Green Team Costume
  .byte 4  #Blue Team Costume
  #Pikachu
  .byte 4  #Amount of Costumes
  .byte 1  #Red Team Costume
  .byte 2  #Green Team Costume
  .byte 3  #Blue Team Costume
  #IceClimbers
  .byte 4  #Amount of Costumes
  .byte 3  #Red Team Costume
  .byte 0  #Green Team Costume
  .byte 1  #Blue Team Costume
  #Jigglypuff
  .byte 5  #Amount of Costumes
  .byte 1  #Red Team Costume
  .byte 2  #Green Team Costume
  .byte 3  #Blue Team Costume
  #Samus
  .byte 5  #Amount of Costumes
  .byte 0  #Red Team Costume
  .byte 4  #Green Team Costume
  .byte 3  #Blue Team Costume
  #Yoshi
  .byte 6  #Amount of Costumes
  .byte 1  #Red Team Costume
  .byte 2  #Green Team Costume
  .byte 0  #Blue Team Costume
  #Zelda
  .byte 5  #Amount of Costumes
  .byte 1  #Red Team Costume
  .byte 2  #Green Team Costume
  .byte 3  #Blue Team Costume
  #Sheik
  .byte 5  #Amount of Costumes
  .byte 1  #Red Team Costume
  .byte 2  #Green Team Costume
  .byte 3  #Blue Team Costume
  #Falco
  .byte 4  #Amount of Costumes
  .byte 1  #Red Team Costume
  .byte 2  #Green Team Costume
  .byte 3  #Blue Team Costume
  #YoungLink
  .byte 5  #Amount of Costumes
  .byte 1  #Red Team Costume
  .byte 2  #Green Team Costume
  .byte 0  #Blue Team Costume
  #DrMario
  .byte 5  #Amount of Costumes
  .byte 1  #Red Team Costume
  .byte 2  #Green Team Costume
  .byte 3  #Blue Team Costume
  #Roy
  .byte 5  #Amount of Costumes
  .byte 1  #Red Team Costume
  .byte 2  #Green Team Costume
  .byte 3  #Blue Team Costume
  #Pichu
  .byte 4  #Amount of Costumes
  .byte 1  #Red Team Costume
  .byte 2  #Green Team Costume
  .byte 3  #Blue Team Costume
  #Ganondorf
  .byte 5  #Amount of Costumes
  .byte 1  #Red Team Costume
  .byte 2  #Green Team Costume
  .byte 3  #Blue Team Costume
  #NewChar1
  .byte NewChar1_CostumeCount  #Amount of Costumes
  .byte NewChar1_RedCostumeID  #Red Team Costume
  .byte NewChar1_GreemCostumeID  #Green Team Costume
  .byte NewChar1_BlueCostumeID  #Blue Team Costume
  .align 2

MnSlChr_CostumeFiles:
  blrl
  bl MnSlChrCostumes_Mario
  bl MnSlChrCostumes_Fox
  bl MnSlChrCostumes_Falcon
  bl MnSlChrCostumes_DK
  bl MnSlChrCostumes_Kirby
  bl MnSlChrCostumes_Bowser
  bl MnSlChrCostumes_Link
  bl MnSlChrCostumes_Sheik
  bl MnSlChrCostumes_Ness
  bl MnSlChrCostumes_Peach
  bl MnSlChrCostumes_Popo
  bl MnSlChrCostumes_Nana
  bl MnSlChrCostumes_Pikachu
  bl MnSlChrCostumes_Samus
  bl MnSlChrCostumes_Yoshi
  bl MnSlChrCostumes_Jigglypuff
  bl MnSlChrCostumes_Mewtwo
  bl MnSlChrCostumes_Luigi
  bl MnSlChrCostumes_Marth
  bl MnSlChrCostumes_Zelda
  bl MnSlChrCostumes_YoungLink
  bl MnSlChrCostumes_DrMario
  bl MnSlChrCostumes_Falco
  bl MnSlChrCostumes_Pichu
  bl MnSlChrCostumes_GaW
  bl MnSlChrCostumes_Ganondorf
  bl MnSlChrCostumes_Roy
  bl MnSlChrCostumes_NewChar1
  bl MnSlChrCostumes_MasterHand
  bl MnSlChrCostumes_CrazyHand
  bl MnSlChrCostumes_WireframeBoy
  bl MnSlChrCostumes_WireframeGirl
  bl MnSlChrCostumes_GigaBowser
  bl MnSlChrCostumes_Sandbag
  .long -1
  MnSlChrCostumes_Start:
  blrl
  MnSlChrCostumes_NewChar1:
  bl MnSlChrCostumes_NewChar10_FileName
  bl MnSlChrCostumes_NewChar10_JointName
  bl MnSlChrCostumes_NewChar10_MatAnimName
  bl MnSlChrCostumes_NewChar11_FileName
  bl MnSlChrCostumes_NewChar11_JointName
  bl MnSlChrCostumes_NewChar11_MatAnimName
  bl MnSlChrCostumes_NewChar12_FileName
  bl MnSlChrCostumes_NewChar12_JointName
  bl MnSlChrCostumes_NewChar12_MatAnimName
  bl MnSlChrCostumes_NewChar13_FileName
  bl MnSlChrCostumes_NewChar13_JointName
  bl MnSlChrCostumes_NewChar13_MatAnimName
  bl MnSlChrCostumes_NewChar14_FileName
  bl MnSlChrCostumes_NewChar14_JointName
  bl MnSlChrCostumes_NewChar14_MatAnimName
  MnSlChrCostumes_Falcon:
  bl MnSlChrCostumes_Falcon0_FileName
  bl MnSlChrCostumes_Falcon0_JointName
  bl MnSlChrCostumes_Falcon0_MatAnimName
  bl MnSlChrCostumes_Falcon1_FileName
  bl MnSlChrCostumes_Falcon1_JointName
  bl MnSlChrCostumes_Falcon1_MatAnimName
  bl MnSlChrCostumes_Falcon2_FileName
  bl MnSlChrCostumes_Falcon2_JointName
  bl MnSlChrCostumes_Falcon2_MatAnimName
  bl MnSlChrCostumes_Falcon3_FileName
  bl MnSlChrCostumes_Falcon3_JointName
  bl MnSlChrCostumes_Falcon3_MatAnimName
  bl MnSlChrCostumes_Falcon4_FileName
  bl MnSlChrCostumes_Falcon4_JointName
  bl MnSlChrCostumes_Falcon4_MatAnimName
  bl MnSlChrCostumes_Falcon5_FileName
  bl MnSlChrCostumes_Falcon5_JointName
  bl MnSlChrCostumes_Falcon5_MatAnimName
  MnSlChrCostumes_DK:
  bl MnSlChrCostumes_DK0_FileName
  bl MnSlChrCostumes_DK0_JointName
  bl MnSlChrCostumes_DK0_MatAnimName
  bl MnSlChrCostumes_DK1_FileName
  bl MnSlChrCostumes_DK1_JointName
  bl MnSlChrCostumes_DK1_MatAnimName
  bl MnSlChrCostumes_DK2_FileName
  bl MnSlChrCostumes_DK2_JointName
  bl MnSlChrCostumes_DK2_MatAnimName
  bl MnSlChrCostumes_DK3_FileName
  bl MnSlChrCostumes_DK3_JointName
  bl MnSlChrCostumes_DK3_MatAnimName
  bl MnSlChrCostumes_DK4_FileName
  bl MnSlChrCostumes_DK4_JointName
  bl MnSlChrCostumes_DK4_MatAnimName
  MnSlChrCostumes_Fox:
  bl MnSlChrCostumes_Fox0_FileName
  bl MnSlChrCostumes_Fox0_JointName
  bl MnSlChrCostumes_Fox0_MatAnimName
  bl MnSlChrCostumes_Fox1_FileName
  bl MnSlChrCostumes_Fox1_JointName
  bl MnSlChrCostumes_Fox1_MatAnimName
  bl MnSlChrCostumes_Fox2_FileName
  bl MnSlChrCostumes_Fox2_JointName
  bl MnSlChrCostumes_Fox2_MatAnimName
  bl MnSlChrCostumes_Fox3_FileName
  bl MnSlChrCostumes_Fox3_JointName
  bl MnSlChrCostumes_Fox3_MatAnimName
  MnSlChrCostumes_GaW:
  bl MnSlChrCostumes_GaW0_FileName
  bl MnSlChrCostumes_GaW0_JointName
  bl MnSlChrCostumes_GaW0_MatAnimName
  bl MnSlChrCostumes_GaW1_FileName
  bl MnSlChrCostumes_GaW1_JointName
  bl MnSlChrCostumes_GaW1_MatAnimName
  bl MnSlChrCostumes_GaW2_FileName
  bl MnSlChrCostumes_GaW2_JointName
  bl MnSlChrCostumes_GaW2_MatAnimName
  bl MnSlChrCostumes_GaW3_FileName
  bl MnSlChrCostumes_GaW3_JointName
  bl MnSlChrCostumes_GaW3_MatAnimName
  MnSlChrCostumes_Kirby:
  bl MnSlChrCostumes_Kirby0_FileName
  bl MnSlChrCostumes_Kirby0_JointName
  bl MnSlChrCostumes_Kirby0_MatAnimName
  bl MnSlChrCostumes_Kirby1_FileName
  bl MnSlChrCostumes_Kirby1_JointName
  bl MnSlChrCostumes_Kirby1_MatAnimName
  bl MnSlChrCostumes_Kirby2_FileName
  bl MnSlChrCostumes_Kirby2_JointName
  bl MnSlChrCostumes_Kirby2_MatAnimName
  bl MnSlChrCostumes_Kirby3_FileName
  bl MnSlChrCostumes_Kirby3_JointName
  bl MnSlChrCostumes_Kirby3_MatAnimName
  bl MnSlChrCostumes_Kirby4_FileName
  bl MnSlChrCostumes_Kirby4_JointName
  bl MnSlChrCostumes_Kirby4_MatAnimName
  bl MnSlChrCostumes_Kirby5_FileName
  bl MnSlChrCostumes_Kirby5_JointName
  bl MnSlChrCostumes_Kirby5_MatAnimName
  MnSlChrCostumes_Bowser:
  bl MnSlChrCostumes_Bowser0_FileName
  bl MnSlChrCostumes_Bowser0_JointName
  bl MnSlChrCostumes_Bowser0_MatAnimName
  bl MnSlChrCostumes_Bowser1_FileName
  bl MnSlChrCostumes_Bowser1_JointName
  bl MnSlChrCostumes_Bowser1_MatAnimName
  bl MnSlChrCostumes_Bowser2_FileName
  bl MnSlChrCostumes_Bowser2_JointName
  bl MnSlChrCostumes_Bowser2_MatAnimName
  bl MnSlChrCostumes_Bowser3_FileName
  bl MnSlChrCostumes_Bowser3_JointName
  bl MnSlChrCostumes_Bowser3_MatAnimName
  MnSlChrCostumes_Link:
  bl MnSlChrCostumes_Link0_FileName
  bl MnSlChrCostumes_Link0_JointName
  bl MnSlChrCostumes_Link0_MatAnimName
  bl MnSlChrCostumes_Link1_FileName
  bl MnSlChrCostumes_Link1_JointName
  bl MnSlChrCostumes_Link1_MatAnimName
  bl MnSlChrCostumes_Link2_FileName
  bl MnSlChrCostumes_Link2_JointName
  bl MnSlChrCostumes_Link2_MatAnimName
  bl MnSlChrCostumes_Link3_FileName
  bl MnSlChrCostumes_Link3_JointName
  bl MnSlChrCostumes_Link3_MatAnimName
  bl MnSlChrCostumes_Link4_FileName
  bl MnSlChrCostumes_Link4_JointName
  bl MnSlChrCostumes_Link4_MatAnimName
  MnSlChrCostumes_Luigi:
  bl MnSlChrCostumes_Luigi0_FileName
  bl MnSlChrCostumes_Luigi0_JointName
  bl MnSlChrCostumes_Luigi0_MatAnimName
  bl MnSlChrCostumes_Luigi1_FileName
  bl MnSlChrCostumes_Luigi1_JointName
  bl MnSlChrCostumes_Luigi1_MatAnimName
  bl MnSlChrCostumes_Luigi2_FileName
  bl MnSlChrCostumes_Luigi2_JointName
  bl MnSlChrCostumes_Luigi2_MatAnimName
  bl MnSlChrCostumes_Luigi3_FileName
  bl MnSlChrCostumes_Luigi3_JointName
  bl MnSlChrCostumes_Luigi3_MatAnimName
  MnSlChrCostumes_Mario:
  bl MnSlChrCostumes_Mario0_FileName
  bl MnSlChrCostumes_Mario0_JointName
  bl MnSlChrCostumes_Mario0_MatAnimName
  bl MnSlChrCostumes_Mario1_FileName
  bl MnSlChrCostumes_Mario1_JointName
  bl MnSlChrCostumes_Mario1_MatAnimName
  bl MnSlChrCostumes_Mario2_FileName
  bl MnSlChrCostumes_Mario2_JointName
  bl MnSlChrCostumes_Mario2_MatAnimName
  bl MnSlChrCostumes_Mario3_FileName
  bl MnSlChrCostumes_Mario3_JointName
  bl MnSlChrCostumes_Mario3_MatAnimName
  bl MnSlChrCostumes_Mario4_FileName
  bl MnSlChrCostumes_Mario4_JointName
  bl MnSlChrCostumes_Mario4_MatAnimName
  MnSlChrCostumes_Marth:
  bl MnSlChrCostumes_Marth0_FileName
  bl MnSlChrCostumes_Marth0_JointName
  bl MnSlChrCostumes_Marth0_MatAnimName
  bl MnSlChrCostumes_Marth1_FileName
  bl MnSlChrCostumes_Marth1_JointName
  bl MnSlChrCostumes_Marth1_MatAnimName
  bl MnSlChrCostumes_Marth2_FileName
  bl MnSlChrCostumes_Marth2_JointName
  bl MnSlChrCostumes_Marth2_MatAnimName
  bl MnSlChrCostumes_Marth3_FileName
  bl MnSlChrCostumes_Marth3_JointName
  bl MnSlChrCostumes_Marth3_MatAnimName
  bl MnSlChrCostumes_Marth4_FileName
  bl MnSlChrCostumes_Marth4_JointName
  bl MnSlChrCostumes_Marth4_MatAnimName
  MnSlChrCostumes_Mewtwo:
  bl MnSlChrCostumes_Mewtwo0_FileName
  bl MnSlChrCostumes_Mewtwo0_JointName
  bl MnSlChrCostumes_Mewtwo0_MatAnimName
  bl MnSlChrCostumes_Mewtwo1_FileName
  bl MnSlChrCostumes_Mewtwo1_JointName
  bl MnSlChrCostumes_Mewtwo1_MatAnimName
  bl MnSlChrCostumes_Mewtwo2_FileName
  bl MnSlChrCostumes_Mewtwo2_JointName
  bl MnSlChrCostumes_Mewtwo2_MatAnimName
  bl MnSlChrCostumes_Mewtwo3_FileName
  bl MnSlChrCostumes_Mewtwo3_JointName
  bl MnSlChrCostumes_Mewtwo3_MatAnimName
  MnSlChrCostumes_Ness:
  bl MnSlChrCostumes_Ness0_FileName
  bl MnSlChrCostumes_Ness0_JointName
  bl MnSlChrCostumes_Ness0_MatAnimName
  bl MnSlChrCostumes_Ness1_FileName
  bl MnSlChrCostumes_Ness1_JointName
  bl MnSlChrCostumes_Ness1_MatAnimName
  bl MnSlChrCostumes_Ness2_FileName
  bl MnSlChrCostumes_Ness2_JointName
  bl MnSlChrCostumes_Ness2_MatAnimName
  bl MnSlChrCostumes_Ness3_FileName
  bl MnSlChrCostumes_Ness3_JointName
  bl MnSlChrCostumes_Ness3_MatAnimName
  MnSlChrCostumes_Peach:
  bl MnSlChrCostumes_Peach0_FileName
  bl MnSlChrCostumes_Peach0_JointName
  bl MnSlChrCostumes_Peach0_MatAnimName
  bl MnSlChrCostumes_Peach1_FileName
  bl MnSlChrCostumes_Peach1_JointName
  bl MnSlChrCostumes_Peach1_MatAnimName
  bl MnSlChrCostumes_Peach2_FileName
  bl MnSlChrCostumes_Peach2_JointName
  bl MnSlChrCostumes_Peach2_MatAnimName
  bl MnSlChrCostumes_Peach3_FileName
  bl MnSlChrCostumes_Peach3_JointName
  bl MnSlChrCostumes_Peach3_MatAnimName
  bl MnSlChrCostumes_Peach4_FileName
  bl MnSlChrCostumes_Peach4_JointName
  bl MnSlChrCostumes_Peach4_MatAnimName
  MnSlChrCostumes_Popo:
  bl MnSlChrCostumes_Popo0_FileName
  bl MnSlChrCostumes_Popo0_JointName
  bl MnSlChrCostumes_Popo0_MatAnimName
  bl MnSlChrCostumes_Popo1_FileName
  bl MnSlChrCostumes_Popo1_JointName
  bl MnSlChrCostumes_Popo1_MatAnimName
  bl MnSlChrCostumes_Popo2_FileName
  bl MnSlChrCostumes_Popo2_JointName
  bl MnSlChrCostumes_Popo2_MatAnimName
  bl MnSlChrCostumes_Popo3_FileName
  bl MnSlChrCostumes_Popo3_JointName
  bl MnSlChrCostumes_Popo3_MatAnimName
  MnSlChrCostumes_Nana:
  bl MnSlChrCostumes_Nana0_FileName
  bl MnSlChrCostumes_Nana0_JointName
  bl MnSlChrCostumes_Nana0_MatAnimName
  bl MnSlChrCostumes_Nana1_FileName
  bl MnSlChrCostumes_Nana1_JointName
  bl MnSlChrCostumes_Nana1_MatAnimName
  bl MnSlChrCostumes_Nana2_FileName
  bl MnSlChrCostumes_Nana2_JointName
  bl MnSlChrCostumes_Nana2_MatAnimName
  bl MnSlChrCostumes_Nana3_FileName
  bl MnSlChrCostumes_Nana3_JointName
  bl MnSlChrCostumes_Nana3_MatAnimName
  MnSlChrCostumes_Pikachu:
  bl MnSlChrCostumes_Pikachu0_FileName
  bl MnSlChrCostumes_Pikachu0_JointName
  bl MnSlChrCostumes_Pikachu0_MatAnimName
  bl MnSlChrCostumes_Pikachu1_FileName
  bl MnSlChrCostumes_Pikachu1_JointName
  bl MnSlChrCostumes_Pikachu1_MatAnimName
  bl MnSlChrCostumes_Pikachu2_FileName
  bl MnSlChrCostumes_Pikachu2_JointName
  bl MnSlChrCostumes_Pikachu2_MatAnimName
  bl MnSlChrCostumes_Pikachu3_FileName
  bl MnSlChrCostumes_Pikachu3_JointName
  bl MnSlChrCostumes_Pikachu3_MatAnimName
  MnSlChrCostumes_IceClimbers:
  bl MnSlChrCostumes_IceClimbers0_FileName
  bl MnSlChrCostumes_IceClimbers0_JointName
  bl MnSlChrCostumes_IceClimbers0_MatAnimName
  bl MnSlChrCostumes_IceClimbers1_FileName
  bl MnSlChrCostumes_IceClimbers1_JointName
  bl MnSlChrCostumes_IceClimbers1_MatAnimName
  bl MnSlChrCostumes_IceClimbers2_FileName
  bl MnSlChrCostumes_IceClimbers2_JointName
  bl MnSlChrCostumes_IceClimbers2_MatAnimName
  bl MnSlChrCostumes_IceClimbers3_FileName
  bl MnSlChrCostumes_IceClimbers3_JointName
  bl MnSlChrCostumes_IceClimbers3_MatAnimName
  MnSlChrCostumes_Jigglypuff:
  bl MnSlChrCostumes_Jigglypuff0_FileName
  bl MnSlChrCostumes_Jigglypuff0_JointName
  bl MnSlChrCostumes_Jigglypuff0_MatAnimName
  bl MnSlChrCostumes_Jigglypuff1_FileName
  bl MnSlChrCostumes_Jigglypuff1_JointName
  bl MnSlChrCostumes_Jigglypuff1_MatAnimName
  bl MnSlChrCostumes_Jigglypuff2_FileName
  bl MnSlChrCostumes_Jigglypuff2_JointName
  bl MnSlChrCostumes_Jigglypuff2_MatAnimName
  bl MnSlChrCostumes_Jigglypuff3_FileName
  bl MnSlChrCostumes_Jigglypuff3_JointName
  bl MnSlChrCostumes_Jigglypuff3_MatAnimName
  bl MnSlChrCostumes_Jigglypuff4_FileName
  bl MnSlChrCostumes_Jigglypuff4_JointName
  bl MnSlChrCostumes_Jigglypuff4_MatAnimName
  MnSlChrCostumes_Samus:
  bl MnSlChrCostumes_Samus0_FileName
  bl MnSlChrCostumes_Samus0_JointName
  bl MnSlChrCostumes_Samus0_MatAnimName
  bl MnSlChrCostumes_Samus1_FileName
  bl MnSlChrCostumes_Samus1_JointName
  bl MnSlChrCostumes_Samus1_MatAnimName
  bl MnSlChrCostumes_Samus2_FileName
  bl MnSlChrCostumes_Samus2_JointName
  bl MnSlChrCostumes_Samus2_MatAnimName
  bl MnSlChrCostumes_Samus3_FileName
  bl MnSlChrCostumes_Samus3_JointName
  bl MnSlChrCostumes_Samus3_MatAnimName
  bl MnSlChrCostumes_Samus4_FileName
  bl MnSlChrCostumes_Samus4_JointName
  bl MnSlChrCostumes_Samus4_MatAnimName
  MnSlChrCostumes_Yoshi:
  bl MnSlChrCostumes_Yoshi0_FileName
  bl MnSlChrCostumes_Yoshi0_JointName
  bl MnSlChrCostumes_Yoshi0_MatAnimName
  bl MnSlChrCostumes_Yoshi1_FileName
  bl MnSlChrCostumes_Yoshi1_JointName
  bl MnSlChrCostumes_Yoshi1_MatAnimName
  bl MnSlChrCostumes_Yoshi2_FileName
  bl MnSlChrCostumes_Yoshi2_JointName
  bl MnSlChrCostumes_Yoshi2_MatAnimName
  bl MnSlChrCostumes_Yoshi3_FileName
  bl MnSlChrCostumes_Yoshi3_JointName
  bl MnSlChrCostumes_Yoshi3_MatAnimName
  bl MnSlChrCostumes_Yoshi4_FileName
  bl MnSlChrCostumes_Yoshi4_JointName
  bl MnSlChrCostumes_Yoshi4_MatAnimName
  bl MnSlChrCostumes_Yoshi5_FileName
  bl MnSlChrCostumes_Yoshi5_JointName
  bl MnSlChrCostumes_Yoshi5_MatAnimName
  MnSlChrCostumes_Zelda:
  bl MnSlChrCostumes_Zelda0_FileName
  bl MnSlChrCostumes_Zelda0_JointName
  bl MnSlChrCostumes_Zelda0_MatAnimName
  bl MnSlChrCostumes_Zelda1_FileName
  bl MnSlChrCostumes_Zelda1_JointName
  bl MnSlChrCostumes_Zelda1_MatAnimName
  bl MnSlChrCostumes_Zelda2_FileName
  bl MnSlChrCostumes_Zelda2_JointName
  bl MnSlChrCostumes_Zelda2_MatAnimName
  bl MnSlChrCostumes_Zelda3_FileName
  bl MnSlChrCostumes_Zelda3_JointName
  bl MnSlChrCostumes_Zelda3_MatAnimName
  bl MnSlChrCostumes_Zelda4_FileName
  bl MnSlChrCostumes_Zelda4_JointName
  bl MnSlChrCostumes_Zelda4_MatAnimName
  MnSlChrCostumes_Sheik:
  bl MnSlChrCostumes_Sheik0_FileName
  bl MnSlChrCostumes_Sheik0_JointName
  bl MnSlChrCostumes_Sheik0_MatAnimName
  bl MnSlChrCostumes_Sheik1_FileName
  bl MnSlChrCostumes_Sheik1_JointName
  bl MnSlChrCostumes_Sheik1_MatAnimName
  bl MnSlChrCostumes_Sheik2_FileName
  bl MnSlChrCostumes_Sheik2_JointName
  bl MnSlChrCostumes_Sheik2_MatAnimName
  bl MnSlChrCostumes_Sheik3_FileName
  bl MnSlChrCostumes_Sheik3_JointName
  bl MnSlChrCostumes_Sheik3_MatAnimName
  bl MnSlChrCostumes_Sheik4_FileName
  bl MnSlChrCostumes_Sheik4_JointName
  bl MnSlChrCostumes_Sheik4_MatAnimName
  MnSlChrCostumes_Falco:
  bl MnSlChrCostumes_Falco0_FileName
  bl MnSlChrCostumes_Falco0_JointName
  bl MnSlChrCostumes_Falco0_MatAnimName
  bl MnSlChrCostumes_Falco1_FileName
  bl MnSlChrCostumes_Falco1_JointName
  bl MnSlChrCostumes_Falco1_MatAnimName
  bl MnSlChrCostumes_Falco2_FileName
  bl MnSlChrCostumes_Falco2_JointName
  bl MnSlChrCostumes_Falco2_MatAnimName
  bl MnSlChrCostumes_Falco3_FileName
  bl MnSlChrCostumes_Falco3_JointName
  bl MnSlChrCostumes_Falco3_MatAnimName
  MnSlChrCostumes_YoungLink:
  bl MnSlChrCostumes_YoungLink0_FileName
  bl MnSlChrCostumes_YoungLink0_JointName
  bl MnSlChrCostumes_YoungLink0_MatAnimName
  bl MnSlChrCostumes_YoungLink1_FileName
  bl MnSlChrCostumes_YoungLink1_JointName
  bl MnSlChrCostumes_YoungLink1_MatAnimName
  bl MnSlChrCostumes_YoungLink2_FileName
  bl MnSlChrCostumes_YoungLink2_JointName
  bl MnSlChrCostumes_YoungLink2_MatAnimName
  bl MnSlChrCostumes_YoungLink3_FileName
  bl MnSlChrCostumes_YoungLink3_JointName
  bl MnSlChrCostumes_YoungLink3_MatAnimName
  bl MnSlChrCostumes_YoungLink4_FileName
  bl MnSlChrCostumes_YoungLink4_JointName
  bl MnSlChrCostumes_YoungLink4_MatAnimName
  MnSlChrCostumes_DrMario:
  bl MnSlChrCostumes_DrMario0_FileName
  bl MnSlChrCostumes_DrMario0_JointName
  bl MnSlChrCostumes_DrMario0_MatAnimName
  bl MnSlChrCostumes_DrMario1_FileName
  bl MnSlChrCostumes_DrMario1_JointName
  bl MnSlChrCostumes_DrMario1_MatAnimName
  bl MnSlChrCostumes_DrMario2_FileName
  bl MnSlChrCostumes_DrMario2_JointName
  bl MnSlChrCostumes_DrMario2_MatAnimName
  bl MnSlChrCostumes_DrMario3_FileName
  bl MnSlChrCostumes_DrMario3_JointName
  bl MnSlChrCostumes_DrMario3_MatAnimName
  bl MnSlChrCostumes_DrMario4_FileName
  bl MnSlChrCostumes_DrMario4_JointName
  bl MnSlChrCostumes_DrMario4_MatAnimName
  MnSlChrCostumes_Roy:
  bl MnSlChrCostumes_Roy0_FileName
  bl MnSlChrCostumes_Roy0_JointName
  bl MnSlChrCostumes_Roy0_MatAnimName
  bl MnSlChrCostumes_Roy1_FileName
  bl MnSlChrCostumes_Roy1_JointName
  bl MnSlChrCostumes_Roy1_MatAnimName
  bl MnSlChrCostumes_Roy2_FileName
  bl MnSlChrCostumes_Roy2_JointName
  bl MnSlChrCostumes_Roy2_MatAnimName
  bl MnSlChrCostumes_Roy3_FileName
  bl MnSlChrCostumes_Roy3_JointName
  bl MnSlChrCostumes_Roy3_MatAnimName
  bl MnSlChrCostumes_Roy4_FileName
  bl MnSlChrCostumes_Roy4_JointName
  bl MnSlChrCostumes_Roy4_MatAnimName
  MnSlChrCostumes_Pichu:
  bl MnSlChrCostumes_Pichu0_FileName
  bl MnSlChrCostumes_Pichu0_JointName
  bl MnSlChrCostumes_Pichu0_MatAnimName
  bl MnSlChrCostumes_Pichu1_FileName
  bl MnSlChrCostumes_Pichu1_JointName
  bl MnSlChrCostumes_Pichu1_MatAnimName
  bl MnSlChrCostumes_Pichu2_FileName
  bl MnSlChrCostumes_Pichu2_JointName
  bl MnSlChrCostumes_Pichu2_MatAnimName
  bl MnSlChrCostumes_Pichu3_FileName
  bl MnSlChrCostumes_Pichu3_JointName
  bl MnSlChrCostumes_Pichu3_MatAnimName
  MnSlChrCostumes_Ganondorf:
  bl MnSlChrCostumes_Ganondorf0_FileName
  bl MnSlChrCostumes_Ganondorf0_JointName
  bl MnSlChrCostumes_Ganondorf0_MatAnimName
  bl MnSlChrCostumes_Ganondorf1_FileName
  bl MnSlChrCostumes_Ganondorf1_JointName
  bl MnSlChrCostumes_Ganondorf1_MatAnimName
  bl MnSlChrCostumes_Ganondorf2_FileName
  bl MnSlChrCostumes_Ganondorf2_JointName
  bl MnSlChrCostumes_Ganondorf2_MatAnimName
  bl MnSlChrCostumes_Ganondorf3_FileName
  bl MnSlChrCostumes_Ganondorf3_JointName
  bl MnSlChrCostumes_Ganondorf3_MatAnimName
  bl MnSlChrCostumes_Ganondorf4_FileName
  bl MnSlChrCostumes_Ganondorf4_JointName
  bl MnSlChrCostumes_Ganondorf4_MatAnimName
  MnSlChrCostumes_MasterHand:
  bl MnSlChrCostumes_MasterHand0_FileName
  bl MnSlChrCostumes_MasterHand0_JointName
  bl MnSlChrCostumes_MasterHand0_MatAnimName
  MnSlChrCostumes_WireframeBoy:
  bl MnSlChrCostumes_WireframeBoy0_FileName
  bl MnSlChrCostumes_WireframeBoy0_JointName
  bl MnSlChrCostumes_WireframeBoy0_MatAnimName
  MnSlChrCostumes_WireframeGirl:
  bl MnSlChrCostumes_WireframeGirl0_FileName
  bl MnSlChrCostumes_WireframeGirl0_JointName
  bl MnSlChrCostumes_WireframeGirl0_MatAnimName
  MnSlChrCostumes_GigaBowser:
  bl MnSlChrCostumes_GigaBowser0_FileName
  bl MnSlChrCostumes_GigaBowser0_JointName
  bl MnSlChrCostumes_GigaBowser0_MatAnimName
  MnSlChrCostumes_CrazyHand:
  bl MnSlChrCostumes_CrazyHand0_FileName
  bl MnSlChrCostumes_CrazyHand0_JointName
  bl MnSlChrCostumes_CrazyHand0_MatAnimName
  MnSlChrCostumes_Sandbag:
  bl MnSlChrCostumes_Sandbag0_FileName
  bl MnSlChrCostumes_Sandbag0_JointName
  bl MnSlChrCostumes_Sandbag0_MatAnimName
  .long -1
  MnSlChrCostumes_NewChar10_FileName:
    .ascii "Pl"
    NewChar1_ShortName
    NewChar1_Costume0
    .ascii ".dat"
    .byte 0
    .align 2
  MnSlChrCostumes_NewChar10_JointName:
    .ascii "Ply"
    NewChar1_LongName
    .ascii "5K_Share_joint"
    .byte 0
    .align 2
  MnSlChrCostumes_NewChar10_MatAnimName:
    .ascii "Ply"
    NewChar1_LongName
    .ascii "5K_Share_matanim_joint"
    .byte 0
    .align 2
  MnSlChrCostumes_NewChar11_FileName:
    .ascii "Pl"
    NewChar1_ShortName
    NewChar1_Costume1
    .ascii ".dat"
    .byte 0
    .align 2
  MnSlChrCostumes_NewChar11_JointName:
    .ascii "Ply"
    NewChar1_LongName
    .ascii "5K"
    NewChar1_Costume1
    .ascii "_Share_joint"
    .byte 0
    .align 2
  MnSlChrCostumes_NewChar11_MatAnimName:
    .ascii "Ply"
    NewChar1_LongName
    .ascii "5K"
    NewChar1_Costume1
    .ascii "_Share_matanim_joint"
    .byte 0
    .align 2
  MnSlChrCostumes_NewChar12_FileName:
    .ascii "Pl"
    NewChar1_ShortName
    NewChar1_Costume2
    .ascii ".dat"
    .byte 0
    .align 2
  MnSlChrCostumes_NewChar12_JointName:
    .ascii "Ply"
    NewChar1_LongName
    .ascii "5K"
    NewChar1_Costume2
    .ascii "_Share_joint"
    .byte 0
    .align 2
  MnSlChrCostumes_NewChar12_MatAnimName:
    .ascii "Ply"
    NewChar1_LongName
    .ascii "5K"
    NewChar1_Costume2
    .ascii "_Share_matanim_joint"
    .byte 0
    .align 2
  MnSlChrCostumes_NewChar13_FileName:
    .ascii "Pl"
    NewChar1_ShortName
    NewChar1_Costume3
    .ascii ".dat"
    .byte 0
    .align 2
  MnSlChrCostumes_NewChar13_JointName:
    .ascii "Ply"
    NewChar1_LongName
    .ascii "5K"
    NewChar1_Costume3
    .ascii "_Share_joint"
    .byte 0
    .align 2
  MnSlChrCostumes_NewChar13_MatAnimName:
    .ascii "Ply"
    NewChar1_LongName
    .ascii "5K"
    NewChar1_Costume3
    .ascii "_Share_matanim_joint"
    .byte 0
    .align 2
  MnSlChrCostumes_NewChar14_FileName:
    .ascii "Pl"
    NewChar1_ShortName
    NewChar1_Costume4
    .ascii ".dat"
    .byte 0
    .align 2
  MnSlChrCostumes_NewChar14_JointName:
    .ascii "Ply"
    NewChar1_LongName
    .ascii "5K"
    NewChar1_Costume4
    .ascii "_Share_joint"
    .byte 0
    .align 2
  MnSlChrCostumes_NewChar14_MatAnimName:
    .ascii "Ply"
    NewChar1_LongName
    .ascii "5K"
    NewChar1_Costume4
    .ascii "_Share_matanim_joint"
    .byte 0
    .align 2
  MnSlChrCostumes_Falcon0_FileName:
  .string "PlCaNr.dat"
  .align 2
  MnSlChrCostumes_Falcon0_JointName:
  .string "PlyCaptain5K_Share_joint"
  .align 2
  MnSlChrCostumes_Falcon1_FileName:
  .string "PlCaGy.dat"
  .align 2
  MnSlChrCostumes_Falcon1_JointName:
  .string "PlyCaptain5KGy_Share_joint"
  .align 2
  MnSlChrCostumes_Falcon2_FileName:
  .string "PlCaRe."
  .align 2
  MnSlChrCostumes_Falcon2_JointName:
  .string "PlyCaptain5KRe_Share_joint"
  .align 2
  MnSlChrCostumes_Falcon3_FileName:
  .string "PlCaWh.dat"
  .align 2
  MnSlChrCostumes_Falcon3_JointName:
  .string "PlyCaptain5KWh_Share_joint"
  .align 2
  MnSlChrCostumes_Falcon4_FileName:
  .string "PlCaGr.dat"
  .align 2
  MnSlChrCostumes_Falcon4_JointName:
  .string "PlyCaptain5KGr_Share_joint"
  .align 2
  MnSlChrCostumes_Falcon5_FileName:
  .string "PlCaBu.dat"
  .align 2
  MnSlChrCostumes_Falcon5_JointName:
  .string "PlyCaptain5KBu_Share_joint"
  .align 2
  MnSlChrCostumes_DK0_FileName:
  .string "PlDkNr.dat"
  .align 2
  MnSlChrCostumes_DK0_JointName:
  .string "PlyDonkey5K_Share_joint"
  .align 2
  MnSlChrCostumes_DK0_MatAnimName:
  .string "PlyDonkey5K_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_DK1_FileName:
  .string "PlDkBk.dat"
  .align 2
  MnSlChrCostumes_DK1_JointName:
  .string "PlyDonkey5KBk_Share_joint"
  .align 2
  MnSlChrCostumes_DK1_MatAnimName:
  .string "PlyDonkey5KBk_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_DK2_FileName:
  .string "PlDkRe.dat"
  .align 2
  MnSlChrCostumes_DK2_JointName:
  .string "PlyDonkey5KRe_Share_joint"
  .align 2
  MnSlChrCostumes_DK2_MatAnimName:
  .string "PlyDonkey5KRe_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_DK3_FileName:
  .string "PlDkBu.dat"
  .align 2
  MnSlChrCostumes_DK3_JointName:
  .string "PlyDonkey5KBu_Share_joint"
  .align 2
  MnSlChrCostumes_DK3_MatAnimName:
  .string "PlyDonkey5KBu_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_DK4_FileName:
  .string "PlDkGr.dat"
  .align 2
  MnSlChrCostumes_DK4_JointName:
  .string "PlyDonkey5KGr_Share_joint"
  .align 2
  MnSlChrCostumes_DK4_MatAnimName:
  .string "PlyDonkey5KGr_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Fox0_FileName:
  .string "PlFxNr.dat"
  .align 2
  MnSlChrCostumes_Fox0_JointName:
  .string "PlyFox5K_Share_joint"
  .align 2
  MnSlChrCostumes_Fox0_MatAnimName:
  .string "PlyFox5K_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Fox1_FileName:
  .string "PlFxOr.dat"
  .align 2
  MnSlChrCostumes_Fox1_JointName:
  .string "PlyFox5KOr_Share_joint"
  .align 2
  MnSlChrCostumes_Fox1_MatAnimName:
  .string "PlyFox5KOr_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Fox2_FileName:
  .string "PlFxLa.dat"
  .align 2
  MnSlChrCostumes_Fox2_JointName:
  .string "PlyFox5KLa_Share_joint"
  .align 2
  MnSlChrCostumes_Fox2_MatAnimName:
  .string "PlyFox5KLa_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Fox3_FileName:
  .string "PlFxGr.dat"
  .align 2
  MnSlChrCostumes_Fox3_JointName:
  .string "PlyFox5KGr_Share_joint"
  .align 2
  MnSlChrCostumes_Fox3_MatAnimName:
  .string "PlyFox5KGr_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_GaW0_FileName:
  .string "PlGwNr.dat"
  .align 2
  MnSlChrCostumes_GaW0_JointName:
  .string "PlyGamewatch5K_Share_joint"
  .align 2
  MnSlChrCostumes_GaW1_FileName:
  .string "PlGwNr.dat"
  .align 2
  MnSlChrCostumes_GaW1_JointName:
  .string "PlyGamewatch5K_Share_joint"
  .align 2
  MnSlChrCostumes_GaW2_FileName:
  .string "PlGwNr.dat"
  .align 2
  MnSlChrCostumes_GaW2_JointName:
  .string "PlyGamewatch5K_Share_joint"
  .align 2
  MnSlChrCostumes_GaW3_FileName:
  .string "PlGwNr.dat"
  .align 2
  MnSlChrCostumes_GaW3_JointName:
  .string "PlyGamewatch5K_Share_joint"
  .align 2
  MnSlChrCostumes_Kirby0_FileName:
  .string "PlKbNr.dat"
  .align 2
  MnSlChrCostumes_Kirby0_JointName:
  .string "PlyKirby5K_Share_joint"
  .align 2
  MnSlChrCostumes_Kirby0_MatAnimName:
  .string "PlyKirby5K_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Kirby1_FileName:
  .string "PlKbYe.dat"
  .align 2
  MnSlChrCostumes_Kirby1_JointName:
  .string "PlyKirby5KYe_Share_joint"
  .align 2
  MnSlChrCostumes_Kirby1_MatAnimName:
  .string "PlyKirby5KYe_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Kirby2_FileName:
  .string "PlKbBu.dat"
  .align 2
  MnSlChrCostumes_Kirby2_JointName:
  .string "PlyKirby5KBu_Share_joint"
  .align 2
  MnSlChrCostumes_Kirby2_MatAnimName:
  .string "PlyKirby5KBu_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Kirby3_FileName:
  .string "PlKbRe.dat"
  .align 2
  MnSlChrCostumes_Kirby3_JointName:
  .string "PlyKirby5KRe_Share_joint"
  .align 2
  MnSlChrCostumes_Kirby3_MatAnimName:
  .string "PlyKirby5KRe_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Kirby4_FileName:
  .string "PlKbGr.dat"
  .align 2
  MnSlChrCostumes_Kirby4_JointName:
  .string "PlyKirby5KGr_Share_joint"
  .align 2
  MnSlChrCostumes_Kirby4_MatAnimName:
  .string "PlyKirby5KGr_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Kirby5_FileName:
  .string "PlKbWh.dat"
  .align 2
  MnSlChrCostumes_Kirby5_JointName:
  .string "PlyKirby5KWh_Share_joint"
  .align 2
  MnSlChrCostumes_Kirby5_MatAnimName:
  .string "PlyKirby5KWh_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Bowser0_FileName:
  .string "PlKpNr.dat"
  .align 2
  MnSlChrCostumes_Bowser0_JointName:
  .string "PlyKoopa5K_Share_joint"
  .align 2
  MnSlChrCostumes_Bowser0_MatAnimName:
  .string "PlyKoopa5K_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Bowser1_FileName:
  .string "PlKpRe.dat"
  .align 2
  MnSlChrCostumes_Bowser1_JointName:
  .string "PlyKoopa5KRe_Share_joint"
  .align 2
  MnSlChrCostumes_Bowser1_MatAnimName:
  .string "PlyKoopa5KRe_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Bowser2_FileName:
  .string "PlKpBu.dat"
  .align 2
  MnSlChrCostumes_Bowser2_JointName:
  .string "PlyKoopa5KBu_Share_joint"
  .align 2
  MnSlChrCostumes_Bowser2_MatAnimName:
  .string "PlyKoopa5KBu_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Bowser3_FileName:
  .string "PlKpBk.dat"
  .align 2
  MnSlChrCostumes_Bowser3_JointName:
  .string "PlyKoopa5KBk_Share_joint"
  .align 2
  MnSlChrCostumes_Bowser3_MatAnimName:
  .string "PlyKoopa5KBk_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Link0_FileName:
  .string "PlLkNr.dat"
  .align 2
  MnSlChrCostumes_Link0_JointName:
  .string "PlyLink5K_Share_joint"
  .align 2
  MnSlChrCostumes_Link0_MatAnimName:
  .string "PlyLink5K_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Link1_FileName:
  .string "PlLkRe.dat"
  .align 2
  MnSlChrCostumes_Link1_JointName:
  .string "PlyLink5KRe_Share_joint"
  .align 2
  MnSlChrCostumes_Link1_MatAnimName:
  .string "PlyLink5KRe_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Link2_FileName:
  .string "PlLkBu.dat"
  .align 2
  MnSlChrCostumes_Link2_JointName:
  .string "PlyLink5KBu_Share_joint"
  .align 2
  MnSlChrCostumes_Link2_MatAnimName:
  .string "PlyLink5KBu_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Link3_FileName:
  .string "PlLkBk.dat"
  .align 2
  MnSlChrCostumes_Link3_JointName:
  .string "PlyLink5KBk_Share_joint"
  .align 2
  MnSlChrCostumes_Link3_MatAnimName:
  .string "PlyLink5KBk_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Link4_FileName:
  .string "PlLkWh.dat"
  .align 2
  MnSlChrCostumes_Link4_JointName:
  .string "PlyLink5KWh_Share_joint"
  .align 2
  MnSlChrCostumes_Link4_MatAnimName:
  .string "PlyLink5KWh_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Luigi0_FileName:
  .string "PlLgNr.dat"
  .align 2
  MnSlChrCostumes_Luigi0_JointName:
  .string "PlyLuigi5K_Share_joint"
  .align 2
  MnSlChrCostumes_Luigi0_MatAnimName:
  .string "PlyLuigi5K_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Luigi1_FileName:
  .string "PlLgWh.dat"
  .align 2
  MnSlChrCostumes_Luigi1_JointName:
  .string "PlyLuigi5KWh_Share_joint"
  .align 2
  MnSlChrCostumes_Luigi1_MatAnimName:
  .string "PlyLuigi5KWh_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Luigi2_FileName:
  .string "PlLgAq.dat"
  .align 2
  MnSlChrCostumes_Luigi2_JointName:
  .string "PlyLuigi5KAq_Share_joint"
  .align 2
  MnSlChrCostumes_Luigi2_MatAnimName:
  .string "PlyLuigi5KAq_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Luigi3_FileName:
  .string "PlLgPi.dat"
  .align 2
  MnSlChrCostumes_Luigi3_JointName:
  .string "PlyLuigi5KPi_Share_joint"
  .align 2
  MnSlChrCostumes_Luigi3_MatAnimName:
  .string "PlyLuigi5KPi_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Mario0_FileName:
  .string "PlMrNr.dat"
  .align 2
  MnSlChrCostumes_Mario0_JointName:
  .string "PlyMario5K_Share_joint"
  .align 2
  MnSlChrCostumes_Mario0_MatAnimName:
  .string "PlyMario5K_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Mario1_FileName:
  .string "PlMrYe.dat"
  .align 2
  MnSlChrCostumes_Mario1_JointName:
  .string "PlyMario5KYe_Share_joint"
  .align 2
  MnSlChrCostumes_Mario1_MatAnimName:
  .string "PlyMario5KYe_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Mario2_FileName:
  .string "PlMrBk.dat"
  .align 2
  MnSlChrCostumes_Mario2_JointName:
  .string "PlyMario5KBk_Share_joint"
  .align 2
  MnSlChrCostumes_Mario2_MatAnimName:
  .string "PlyMario5KBk_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Mario3_FileName:
  .string "PlMrBu.dat"
  .align 2
  MnSlChrCostumes_Mario3_JointName:
  .string "PlyMario5KBu_Share_joint"
  .align 2
  MnSlChrCostumes_Mario3_MatAnimName:
  .string "PlyMario5KBu_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Mario4_FileName:
  .string "PlMrGr.dat"
  .align 2
  MnSlChrCostumes_Mario4_JointName:
  .string "PlyMario5KGr_Share_joint"
  .align 2
  MnSlChrCostumes_Mario4_MatAnimName:
  .string "PlyMario5KGr_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Marth0_FileName:
  .string "PlMsNr.dat"
  .align 2
  MnSlChrCostumes_Marth0_JointName:
  .string "PlyMars5K_Share_joint"
  .align 2
  MnSlChrCostumes_Marth0_MatAnimName:
  .string "PlyMars5K_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Marth1_FileName:
  .string "PlMsRe.dat"
  .align 2
  MnSlChrCostumes_Marth1_JointName:
  .string "PlyMars5KRe_Share_joint"
  .align 2
  MnSlChrCostumes_Marth1_MatAnimName:
  .string "PlyMars5KRe_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Marth2_FileName:
  .string "PlMsGr.dat"
  .align 2
  MnSlChrCostumes_Marth2_JointName:
  .string "PlyMars5KGr_Share_joint"
  .align 2
  MnSlChrCostumes_Marth2_MatAnimName:
  .string "PlyMars5KGr_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Marth3_FileName:
  .string "PlMsBk.dat"
  .align 2
  MnSlChrCostumes_Marth3_JointName:
  .string "PlyMars5KBk_Share_joint"
  .align 2
  MnSlChrCostumes_Marth3_MatAnimName:
  .string "PlyMars5KBk_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Marth4_FileName:
  .string "PlMsWh.dat"
  .align 2
  MnSlChrCostumes_Marth4_JointName:
  .string "PlyMars5KWh_Share_joint"
  .align 2
  MnSlChrCostumes_Marth4_MatAnimName:
  .string "PlyMars5KWh_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Mewtwo0_FileName:
  .string "PlMtNr.dat"
  .align 2
  MnSlChrCostumes_Mewtwo0_JointName:
  .string "PlyMewtwo5K_Share_joint"
  .align 2
  MnSlChrCostumes_Mewtwo0_MatAnimName:
  .string "PlyMewtwo5K_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Mewtwo1_FileName:
  .string "PlMtRe.dat"
  .align 2
  MnSlChrCostumes_Mewtwo1_JointName:
  .string "PlyMewtwo5KRe_Share_joint"
  .align 2
  MnSlChrCostumes_Mewtwo1_MatAnimName:
  .string "PlyMewtwo5KRe_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Mewtwo2_FileName:
  .string "PlMtBu.dat"
  .align 2
  MnSlChrCostumes_Mewtwo2_JointName:
  .string "PlyMewtwo5KBu_Share_joint"
  .align 2
  MnSlChrCostumes_Mewtwo2_MatAnimName:
  .string "PlyMewtwo5KBu_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Mewtwo3_FileName:
  .string "PlMtGr.dat"
  .align 2
  MnSlChrCostumes_Mewtwo3_JointName:
  .string "PlyMewtwo5KGr_Share_joint"
  .align 2
  MnSlChrCostumes_Mewtwo3_MatAnimName:
  .string "PlyMewtwo5KGr_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Ness0_FileName:
  .string "PlNsNr.dat"
  .align 2
  MnSlChrCostumes_Ness0_JointName:
  .string "PlyNess5K_Share_joint"
  .align 2
  MnSlChrCostumes_Ness0_MatAnimName:
  .string "PlyNess5K_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Ness1_FileName:
  .string "PlNsYe.dat"
  .align 2
  MnSlChrCostumes_Ness1_JointName:
  .string "PlyNess5KYe_Share_joint"
  .align 2
  MnSlChrCostumes_Ness1_MatAnimName:
  .string "PlyNess5KYe_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Ness2_FileName:
  .string "PlNsBu.dat"
  .align 2
  MnSlChrCostumes_Ness2_JointName:
  .string "PlyNess5KBu_Share_joint"
  .align 2
  MnSlChrCostumes_Ness2_MatAnimName:
  .string "PlyNess5KBu_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Ness3_FileName:
  .string "PlNsGr.dat"
  .align 2
  MnSlChrCostumes_Ness3_JointName:
  .string "PlyNess5KGr_Share_joint"
  .align 2
  MnSlChrCostumes_Ness3_MatAnimName:
  .string "PlyNess5KGr_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Peach0_FileName:
  .string "PlPeNr.dat"
  .align 2
  MnSlChrCostumes_Peach0_JointName:
  .string "PlyPeach5K_Share_joint"
  .align 2
  MnSlChrCostumes_Peach0_MatAnimName:
  .string "PlyPeach5K_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Peach1_FileName:
  .string "PlPeYe.dat"
  .align 2
  MnSlChrCostumes_Peach1_JointName:
  .string "PlyPeach5KYe_Share_joint"
  .align 2
  MnSlChrCostumes_Peach1_MatAnimName:
  .string "PlyPeach5KYe_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Peach2_FileName:
  .string "PlPeWh.dat"
  .align 2
  MnSlChrCostumes_Peach2_JointName:
  .string "PlyPeach5KWh_Share_joint"
  .align 2
  MnSlChrCostumes_Peach2_MatAnimName:
  .string "PlyPeach5KWh_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Peach3_FileName:
  .string "PlPeBu.dat"
  .align 2
  MnSlChrCostumes_Peach3_JointName:
  .string "PlyPeach5KBu_Share_joint"
  .align 2
  MnSlChrCostumes_Peach3_MatAnimName:
  .string "PlyPeach5KBu_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Peach4_FileName:
  .string "PlPeGr.dat"
  .align 2
  MnSlChrCostumes_Peach4_JointName:
  .string "PlyPeach5KGr_Share_joint"
  .align 2
  MnSlChrCostumes_Peach4_MatAnimName:
  .string "PlyPeach5KGr_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Pikachu0_FileName:
  .string "PlPkNr.dat"
  .align 2
  MnSlChrCostumes_Pikachu0_JointName:
  .string "PlyPikachu5K_Share_joint"
  .align 2
  MnSlChrCostumes_Pikachu0_MatAnimName:
  .string "PlyPikachu5K_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Pikachu1_FileName:
  .string "PlPkRe.dat"
  .align 2
  MnSlChrCostumes_Pikachu1_JointName:
  .string "PlyPikachu5KRe_Share_joint"
  .align 2
  MnSlChrCostumes_Pikachu1_MatAnimName:
  .string "PlyPikachu5KRe_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Pikachu2_FileName:
  .string "PlPkBu.dat"
  .align 2
  MnSlChrCostumes_Pikachu2_JointName:
  .string "PlyPikachu5KBu_Share_joint"
  .align 2
  MnSlChrCostumes_Pikachu2_MatAnimName:
  .string "PlyPikachu5KBu_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Pikachu3_FileName:
  .string "PlPkGr.dat"
  .align 2
  MnSlChrCostumes_Pikachu3_JointName:
  .string "PlyPikachu5KGr_Share_joint"
  .align 2
  MnSlChrCostumes_Pikachu3_MatAnimName:
  .string "PlyPikachu5KGr_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Popo0_FileName:
  .string "PlPpNr.dat"
  .align 2
  MnSlChrCostumes_Popo0_JointName:
  .string "PlyPopo5K_Share_joint"
  .align 2
  MnSlChrCostumes_Popo0_MatAnimName:
  .string "PlyPopo5K_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Popo1_FileName:
  .string "PlPpGr.dat"
  .align 2
  MnSlChrCostumes_Popo1_JointName:
  .string "PlyPopo5KGr_Share_joint"
  .align 2
  MnSlChrCostumes_Popo1_MatAnimName:
  .string "PlyPopo5KGr_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Popo2_FileName:
  .string "PlPpOr.dat"
  .align 2
  MnSlChrCostumes_Popo2_JointName:
  .string "PlyPopo5KOr_Share_joint"
  .align 2
  MnSlChrCostumes_Popo2_MatAnimName:
  .string "PlyPopo5KOr_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Popo3_FileName:
  .string "PlPpRe.dat"
  .align 2
  MnSlChrCostumes_Popo3_JointName:
  .string "PlyPopo5KRe_Share_joint"
  .align 2
  MnSlChrCostumes_Popo3_MatAnimName:
  .string "PlyPopo5KRe_Share_matanim_joint"
  .align 2

  MnSlChrCostumes_Nana0_FileName:
  .string "PlNnNr.dat"
  .align 2
  MnSlChrCostumes_Nana0_JointName:
  .string "PlyNana5K_Share_joint"
  .align 2
  MnSlChrCostumes_Nana0_MatAnimName:
  .string "PlyNana5K_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Nana1_FileName:
  .string "PlNnYe.dat"
  .align 2
  MnSlChrCostumes_Nana1_JointName:
  .string "PlyNana5KYe_Share_joint"
  .align 2
  MnSlChrCostumes_Nana1_MatAnimName:
  .string "PlyNana5KYe_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Nana2_FileName:
  .string "PlNnAq.dat"
  .align 2
  MnSlChrCostumes_Nana2_JointName:
  .string "PlyNana5KAq_Share_joint"
  .align 2
  MnSlChrCostumes_Nana2_MatAnimName:
  .string "PlyNana5KAq_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Nana3_FileName:
  .string "PlNnWh.dat"
  .align 2
  MnSlChrCostumes_Nana3_JointName:
  .string "PlyNana5KWh_Share_joint"
  .align 2
  MnSlChrCostumes_Nana3_MatAnimName:
  .string "PlyNana5KWh_Share_matanim_joint"
  .align 2



  MnSlChrCostumes_Jigglypuff0_FileName:
  .string "PlPrNr.dat"
  .align 2
  MnSlChrCostumes_Jigglypuff0_JointName:
  .string "PlyPurin5K_Share_joint"
  .align 2
  MnSlChrCostumes_Jigglypuff0_MatAnimName:
  .string "PlyPurin5K_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Jigglypuff1_FileName:
  .string "PlPrRe.dat"
  .align 2
  MnSlChrCostumes_Jigglypuff1_JointName:
  .string "PlyPurin5KRe_Share_joint"
  .align 2
  MnSlChrCostumes_Jigglypuff1_MatAnimName:
  .string "PlyPurin5KRe_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Jigglypuff2_FileName:
  .string "PlPrBu.dat"
  .align 2
  MnSlChrCostumes_Jigglypuff2_JointName:
  .string "PlyPurin5KBu_Share_joint"
  .align 2
  MnSlChrCostumes_Jigglypuff2_MatAnimName:
  .string "PlyPurin5KBu_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Jigglypuff3_FileName:
  .string "PlPrGr.dat"
  .align 2
  MnSlChrCostumes_Jigglypuff3_JointName:
  .string "PlyPurin5KGr_Share_joint"
  .align 2
  MnSlChrCostumes_Jigglypuff3_MatAnimName:
  .string "PlyPurin5KGr_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Jigglypuff4_FileName:
  .string "PlPrYe.dat"
  .align 2
  MnSlChrCostumes_Jigglypuff4_JointName:
  .string "PlyPurin5KYe_Share_joint"
  .align 2
  MnSlChrCostumes_Jigglypuff4_MatAnimName:
  .string "PlyPurin5KYe_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Samus0_FileName:
  .string "PlSsNr.dat"
  .align 2
  MnSlChrCostumes_Samus0_JointName:
  .string "PlySamus5K_Share_joint"
  .align 2
  MnSlChrCostumes_Samus1_FileName:
  .string "PlSsPi.dat"
  .align 2
  MnSlChrCostumes_Samus1_JointName:
  .string "PlySamus5KPi_Share_joint"
  .align 2
  MnSlChrCostumes_Samus2_FileName:
  .string "PlSsBk.dat"
  .align 2
  MnSlChrCostumes_Samus2_JointName:
  .string "PlySamus5KBk_Share_joint"
  .align 2
  MnSlChrCostumes_Samus3_FileName:
  .string "PlSsGr.dat"
  .align 2
  MnSlChrCostumes_Samus3_JointName:
  .string "PlySamus5KGr_Share_joint"
  .align 2
  MnSlChrCostumes_Samus4_FileName:
  .string "PlSsLa.dat"
  .align 2
  MnSlChrCostumes_Samus4_JointName:
  .string "PlySamus5KLa_Share_joint"
  .align 2
  MnSlChrCostumes_Yoshi0_FileName:
  .string "PlYsNr.dat"
  .align 2
  MnSlChrCostumes_Yoshi0_JointName:
  .string "PlyYoshi5K_Share_joint"
  .align 2
  MnSlChrCostumes_Yoshi0_MatAnimName:
  .string "PlyYoshi5K_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Yoshi1_FileName:
  .string "PlYsRe.dat"
  .align 2
  MnSlChrCostumes_Yoshi1_JointName:
  .string "PlyYoshi5KRe_Share_joint"
  .align 2
  MnSlChrCostumes_Yoshi1_MatAnimName:
  .string "PlyYoshi5KRe_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Yoshi2_FileName:
  .string "PlYsBu.dat"
  .align 2
  MnSlChrCostumes_Yoshi2_JointName:
  .string "PlyYoshi5KBu_Share_joint"
  .align 2
  MnSlChrCostumes_Yoshi2_MatAnimName:
  .string "PlyYoshi5KBu_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Yoshi3_FileName:
  .string "PlYsYe.dat"
  .align 2
  MnSlChrCostumes_Yoshi3_JointName:
  .string "PlyYoshi5KYe_Share_joint"
  .align 2
  MnSlChrCostumes_Yoshi3_MatAnimName:
  .string "PlyYoshi5KYe_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Yoshi4_FileName:
  .string "PlYsPi.dat"
  .align 2
  MnSlChrCostumes_Yoshi4_JointName:
  .string "PlyYoshi5KPi_Share_joint"
  .align 2
  MnSlChrCostumes_Yoshi4_MatAnimName:
  .string "PlyYoshi5KPi_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Yoshi5_FileName:
  .string "PlYsAq.dat"
  .align 2
  MnSlChrCostumes_Yoshi5_JointName:
  .string "PlyYoshi5KAq_Share_joint"
  .align 2
  MnSlChrCostumes_Yoshi5_MatAnimName:
  .string "PlyYoshi5KAq_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Zelda0_FileName:
  .string "PlZdNr.dat"
  .align 2
  MnSlChrCostumes_Zelda0_JointName:
  .string "PlyZelda5K_Share_joint"
  .align 2
  MnSlChrCostumes_Zelda0_MatAnimName:
  .string "PlyZelda5K_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Zelda1_FileName:
  .string "PlZdRe.dat"
  .align 2
  MnSlChrCostumes_Zelda1_JointName:
  .string "PlyZelda5KRe_Share_joint"
  .align 2
  MnSlChrCostumes_Zelda1_MatAnimName:
  .string "PlyZelda5KRe_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Zelda2_FileName:
  .string "PlZdBu.dat"
  .align 2
  MnSlChrCostumes_Zelda2_JointName:
  .string "PlyZelda5KBu_Share_joint"
  .align 2
  MnSlChrCostumes_Zelda2_MatAnimName:
  .string "PlyZelda5KBu_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Zelda3_FileName:
  .string "PlZdGr.dat"
  .align 2
  MnSlChrCostumes_Zelda3_JointName:
  .string "PlyZelda5KGr_Share_joint"
  .align 2
  MnSlChrCostumes_Zelda3_MatAnimName:
  .string "PlyZelda5KGr_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Zelda4_FileName:
  .string "PlZdWh.dat"
  .align 2
  MnSlChrCostumes_Zelda4_JointName:
  .string "PlyZelda5KWh_Share_joint"
  .align 2
  MnSlChrCostumes_Zelda4_MatAnimName:
  .string "PlyZelda5KWh_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Sheik0_FileName:
  .string "PlSkNr.dat"
  .align 2
  MnSlChrCostumes_Sheik0_JointName:
  .string "PlySeak5K_Share_joint"
  .align 2
  MnSlChrCostumes_Sheik0_MatAnimName:
  .string "PlySeak5K_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Sheik1_FileName:
  .string "PlSkRe.dat"
  .align 2
  MnSlChrCostumes_Sheik1_JointName:
  .string "PlySeak5KRe_Share_joint"
  .align 2
  MnSlChrCostumes_Sheik1_MatAnimName:
  .string "PlySeak5KRe_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Sheik2_FileName:
  .string "PlSkBu.dat"
  .align 2
  MnSlChrCostumes_Sheik2_JointName:
  .string "PlySeak5KBu_Share_joint"
  .align 2
  MnSlChrCostumes_Sheik2_MatAnimName:
  .string "PlySeak5KBu_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Sheik3_FileName:
  .string "PlSkGr.dat"
  .align 2
  MnSlChrCostumes_Sheik3_JointName:
  .string "PlySeak5KGr_Share_joint"
  .align 2
  MnSlChrCostumes_Sheik3_MatAnimName:
  .string "PlySeak5KGr_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Sheik4_FileName:
  .string "PlSkWh.dat"
  .align 2
  MnSlChrCostumes_Sheik4_JointName:
  .string "PlySeak5KWh_Share_joint"
  .align 2
  MnSlChrCostumes_Sheik4_MatAnimName:
  .string "PlySeak5KWh_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Falco0_FileName:
  .string "PlFcNr.dat"
  .align 2
  MnSlChrCostumes_Falco0_JointName:
  .string "PlyFalco5K_Share_joint"
  .align 2
  MnSlChrCostumes_Falco0_MatAnimName:
  .string "PlyFalco5K_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Falco1_FileName:
  .string "PlFcRe.dat"
  .align 2
  MnSlChrCostumes_Falco1_JointName:
  .string "PlyFalco5KRe_Share_joint"
  .align 2
  MnSlChrCostumes_Falco1_MatAnimName:
  .string "PlyFalco5KRe_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Falco2_FileName:
  .string "PlFcBu.dat"
  .align 2
  MnSlChrCostumes_Falco2_JointName:
  .string "PlyFalco5KBu_Share_joint"
  .align 2
  MnSlChrCostumes_Falco2_MatAnimName:
  .string "PlyFalco5KBu_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Falco3_FileName:
  .string "PlFcGr.dat"
  .align 2
  MnSlChrCostumes_Falco3_JointName:
  .string "PlyFalco5KGr_Share_joint"
  .align 2
  MnSlChrCostumes_Falco3_MatAnimName:
  .string "PlyFalco5KGr_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_YoungLink0_FileName:
  .string "PlClNr.dat"
  .align 2
  MnSlChrCostumes_YoungLink0_JointName:
  .string "PlyClink5K_Share_joint"
  .align 2
  MnSlChrCostumes_YoungLink0_MatAnimName:
  .string "PlyClink5K_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_YoungLink1_FileName:
  .string "PlClRe.dat"
  .align 2
  MnSlChrCostumes_YoungLink1_JointName:
  .string "PlyClink5KRe_Share_joint"
  .align 2
  MnSlChrCostumes_YoungLink1_MatAnimName:
  .string "PlyClink5KRe_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_YoungLink2_FileName:
  .string "PlClBu.dat"
  .align 2
  MnSlChrCostumes_YoungLink2_JointName:
  .string "PlyClink5KBu_Share_joint"
  .align 2
  MnSlChrCostumes_YoungLink2_MatAnimName:
  .string "PlyClink5KBu_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_YoungLink3_FileName:
  .string "PlClWh.dat"
  .align 2
  MnSlChrCostumes_YoungLink3_JointName:
  .string "PlyClink5KWh_Share_joint"
  .align 2
  MnSlChrCostumes_YoungLink3_MatAnimName:
  .string "PlyClink5KWh_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_YoungLink4_FileName:
  .string "PlClBk.dat"
  .align 2
  MnSlChrCostumes_YoungLink4_JointName:
  .string "PlyClink5KBk_Share_joint"
  .align 2
  MnSlChrCostumes_YoungLink4_MatAnimName:
  .string "PlyClink5KBk_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_DrMario0_FileName:
  .string "PlDrNr.dat"
  .align 2
  MnSlChrCostumes_DrMario0_JointName:
  .string "PlyDrmario5K_Share_joint"
  .align 2
  MnSlChrCostumes_DrMario0_MatAnimName:
  .string "PlyDrmario5K_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_DrMario1_FileName:
  .string "PlDrRe.dat"
  .align 2
  MnSlChrCostumes_DrMario1_JointName:
  .string "PlyDrmario5KRe_Share_joint"
  .align 2
  MnSlChrCostumes_DrMario1_MatAnimName:
  .string "PlyDrmario5KRe_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_DrMario2_FileName:
  .string "PlDrBu.dat"
  .align 2
  MnSlChrCostumes_DrMario2_JointName:
  .string "PlyDrmario5KBu_Share_joint"
  .align 2
  MnSlChrCostumes_DrMario2_MatAnimName:
  .string "PlyDrmario5KBu_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_DrMario3_FileName:
  .string "PlDrGr.dat"
  .align 2
  MnSlChrCostumes_DrMario3_JointName:
  .string "PlyDrmario5KGr_Share_joint"
  .align 2
  MnSlChrCostumes_DrMario3_MatAnimName:
  .string "PlyDrmario5KGr_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_DrMario4_FileName:
  .string "PlDrBk.dat"
  .align 2
  MnSlChrCostumes_DrMario4_JointName:
  .string "PlyDrmario5KBk_Share_joint"
  .align 2
  MnSlChrCostumes_DrMario4_MatAnimName:
  .string "PlyDrmario5KBk_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Roy0_FileName:
  .string "PlFeNr.dat"
  .align 2
  MnSlChrCostumes_Roy0_JointName:
  .string "PlyEmblem5K_Share_joint"
  .align 2
  MnSlChrCostumes_Roy0_MatAnimName:
  .string "PlyEmblem5K_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Roy1_FileName:
  .string "PlFeRe.dat"
  .align 2
  MnSlChrCostumes_Roy1_JointName:
  .string "PlyEmblem5KRe_Share_joint"
  .align 2
  MnSlChrCostumes_Roy1_MatAnimName:
  .string "PlyEmblem5KRe_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Roy2_FileName:
  .string "PlFeBu.dat"
  .align 2
  MnSlChrCostumes_Roy2_JointName:
  .string "PlyEmblem5KBu_Share_joint"
  .align 2
  MnSlChrCostumes_Roy2_MatAnimName:
  .string "PlyEmblem5KBu_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Roy3_FileName:
  .string "PlFeGr.dat"
  .align 2
  MnSlChrCostumes_Roy3_JointName:
  .string "PlyEmblem5KGr_Share_joint"
  .align 2
  MnSlChrCostumes_Roy3_MatAnimName:
  .string "PlyEmblem5KGr_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Roy4_FileName:
  .string "PlFeYe.dat"
  .align 2
  MnSlChrCostumes_Roy4_JointName:
  .string "PlyEmblem5KYe_Share_joint"
  .align 2
  MnSlChrCostumes_Roy4_MatAnimName:
  .string "PlyEmblem5KYe_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Pichu0_FileName:
  .string "PlPcNr.dat"
  .align 2
  MnSlChrCostumes_Pichu0_JointName:
  .string "PlyPichu5K_Share_joint"
  .align 2
  MnSlChrCostumes_Pichu0_MatAnimName:
  .string "PlyPichu5K_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Pichu1_FileName:
  .string "PlPcRe.dat"
  .align 2
  MnSlChrCostumes_Pichu1_JointName:
  .string "PlyPichu5KRe_Share_joint"
  .align 2
  MnSlChrCostumes_Pichu1_MatAnimName:
  .string "PlyPichu5KRe_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Pichu2_FileName:
  .string "PlPcBu.dat"
  .align 2
  MnSlChrCostumes_Pichu2_JointName:
  .string "PlyPichu5KBu_Share_joint"
  .align 2
  MnSlChrCostumes_Pichu2_MatAnimName:
  .string "PlyPichu5KBu_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Pichu3_FileName:
  .string "PlPcGr.dat"
  .align 2
  MnSlChrCostumes_Pichu3_JointName:
  .string "PlyPichu5KGr_Share_joint"
  .align 2
  MnSlChrCostumes_Pichu3_MatAnimName:
  .string "PlyPichu5KGr_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_Ganondorf0_FileName:
  .string "PlGnNr.dat"
  .align 2
  MnSlChrCostumes_Ganondorf0_JointName:
  .string "PlyGanon5K_Share_joint"
  .align 2
  MnSlChrCostumes_Ganondorf1_FileName:
  .string "PlGnRe.dat"
  .align 2
  MnSlChrCostumes_Ganondorf1_JointName:
  .string "PlyGanon5KRe_Share_joint"
  .align 2
  MnSlChrCostumes_Ganondorf2_FileName:
  .string "PlGnBu.dat"
  .align 2
  MnSlChrCostumes_Ganondorf2_JointName:
  .string "PlyGanon5KBu_Share_joint"
  .align 2
  MnSlChrCostumes_Ganondorf3_FileName:
  .string "PlGnGr.dat"
  .align 2
  MnSlChrCostumes_Ganondorf3_JointName:
  .string "PlyGanon5KGr_Share_joint"
  .align 2
  MnSlChrCostumes_Ganondorf4_FileName:
  .string "PlGnLa.dat"
  .align 2
  MnSlChrCostumes_Ganondorf4_JointName:
  .string "PlyGanon5KLa_Share_joint"
  .align 2
  MnSlChrCostumes_MasterHand0_FileName:
  .string "PlMhNr.dat"
  .align 2
  MnSlChrCostumes_MasterHand0_JointName:
  .string "PlyMasterhand_Share_joint"
  .align 2
  MnSlChrCostumes_WireframeBoy0_FileName:
  .string "PlBoNr.dat"
  .align 2
  MnSlChrCostumes_WireframeBoy0_JointName:
  .string "PlyBoy_Share_joint"
  .align 2
  MnSlChrCostumes_WireframeGirl0_FileName:
  .string "PlGlNr.dat"
  .align 2
  MnSlChrCostumes_WireframeGirl0_JointName:
  .string "PlyGirl_Share_joint"
  .align 2
  MnSlChrCostumes_GigaBowser0_FileName:
  .string "PlGkNr.dat"
  .align 2
  MnSlChrCostumes_GigaBowser0_JointName:
  .string "PlyGkoopa5K_Share_joint"
  .align 2
  MnSlChrCostumes_GigaBowser0_MatAnimName:
  .string "PlyGkoopa5K_Share_matanim_joint"
  .align 2
  MnSlChrCostumes_CrazyHand0_FileName:
  .string "PlChNr.dat"
  .align 2
  MnSlChrCostumes_CrazyHand0_JointName:
  .string "PlyCrazyhand_Share_joint"
  .align 2
  MnSlChrCostumes_Sandbag0_FileName:
  .string "PlSbNr.dat"
  .align 2
  MnSlChrCostumes_Sandbag0_JointName:
  .string "PlySandbag_Share_joint"
  .align 2
  MnSlChrCostumes_Sandbag0_MatAnimName:
  .string "PlySandbag_Share_matanim_joint"
  .align 2

MnSlChr_AnimFiles:
  blrl
  bl MnSlChrAnimFiles_Mario
  bl MnSlChrAnimFiles_Fox
  bl MnSlChrAnimFiles_Falcon
  bl MnSlChrAnimFiles_DK
  bl MnSlChrAnimFiles_Kirby
  bl MnSlChrAnimFiles_Bowser
  bl MnSlChrAnimFiles_Link
  bl MnSlChrAnimFiles_Sheik
  bl MnSlChrAnimFiles_Ness
  bl MnSlChrAnimFiles_Peach
  bl MnSlChrAnimFiles_Popo
  bl MnSlChrAnimFiles_Nana
  bl MnSlChrAnimFiles_Pikachu
  bl MnSlChrAnimFiles_Samus
  bl MnSlChrAnimFiles_Yoshi
  bl MnSlChrAnimFiles_Jigglypuff
  bl MnSlChrAnimFiles_Mewtwo
  bl MnSlChrAnimFiles_Luigi
  bl MnSlChrAnimFiles_Marth
  bl MnSlChrAnimFiles_Zelda
  bl MnSlChrAnimFiles_YoungLink
  bl MnSlChrAnimFiles_DrMario
  bl MnSlChrAnimFiles_Falco
  bl MnSlChrAnimFiles_Pichu
  bl MnSlChrAnimFiles_GaW
  bl MnSlChrAnimFiles_Ganondorf
  bl MnSlChrAnimFiles_Roy
  bl MnSlChrAnimFiles_NewChar1
  bl MnSlChrAnimFiles_MasterHand
  bl MnSlChrAnimFiles_CrazyHand
  bl MnSlChrAnimFiles_WireframeBoy
  bl MnSlChrAnimFiles_WireframeGirl
  bl MnSlChrAnimFiles_GigaBowser
  bl MnSlChrAnimFiles_Sandbag
  .long -1
  MnSlChrAnimFiles_NewChar1:
    .ascii "Pl"
    NewChar1_ShortName
    .ascii "AJ.dat"
    .byte 0
    .align 2
  MnSlChrAnimFiles_Mario:
  .string "PlMrAJ.dat"
  .align 2
  MnSlChrAnimFiles_Fox:
  .string "PlFxAJ.dat"
  .align 2
  MnSlChrAnimFiles_Falcon:
  .string "PlCaAJ.dat"
  .align 2
  MnSlChrAnimFiles_DK:
  .string "PlDkAJ.dat"
  .align 2
  MnSlChrAnimFiles_Kirby:
  .string "PlKbAJ.dat"
  .align 2
  MnSlChrAnimFiles_Bowser:
  .string "PlKpAJ.dat"
  .align 2
  MnSlChrAnimFiles_Link:
  .string "PlLkAJ.dat"
  .align 2
  MnSlChrAnimFiles_Sheik:
  .string "PlSkAJ.dat"
  .align 2
  MnSlChrAnimFiles_Ness:
  .string "PlNsAJ.dat"
  .align 2
  MnSlChrAnimFiles_Peach:
  .string "PlPeAJ.dat"
  .align 2
  MnSlChrAnimFiles_Popo:
  .string "PlPpAJ.dat"
  .align 2
  MnSlChrAnimFiles_Nana:
  .string "PlNnAJ.dat"
  .align 2
  MnSlChrAnimFiles_Pikachu:
  .string "PlPkAJ.dat"
  .align 2
  MnSlChrAnimFiles_Samus:
  .string "PlSsAJ.dat"
  .align 2
  MnSlChrAnimFiles_Yoshi:
  .string "PlYsAJ.dat"
  .align 2
  MnSlChrAnimFiles_Jigglypuff:
  .string "PlPrAJ.dat"
  .align 2
  MnSlChrAnimFiles_Mewtwo:
  .string "PlMtAJ.dat"
  .align 2
  MnSlChrAnimFiles_Luigi:
  .string "PlLgAJ.dat"
  .align 2
  MnSlChrAnimFiles_Marth:
  .string "PlMsAJ.dat"
  .align 2
  MnSlChrAnimFiles_Zelda:
  .string "PlZdAJ.dat"
  .align 2
  MnSlChrAnimFiles_YoungLink:
  .string "PlClAJ.dat"
  .align 2
  MnSlChrAnimFiles_DrMario:
  .string "PlDrAJ.dat"
  .align 2
  MnSlChrAnimFiles_Falco:
  .string "PlFcAJ.dat"
  .align 2
  MnSlChrAnimFiles_Pichu:
  .string "PlPcAJ.dat"
  .align 2
  MnSlChrAnimFiles_GaW:
  .string "PlGwAJ.dat"
  .align 2
  MnSlChrAnimFiles_Ganondorf:
  .string "PlGnAJ.dat"
  .align 2
  MnSlChrAnimFiles_Roy:
  .string "PlFeAJ.dat"
  .align 2
  MnSlChrAnimFiles_MasterHand:
  .string "PlMhAJ.dat"
  .align 2
  MnSlChrAnimFiles_CrazyHand:
  .string "PlChAJ.dat"
  .align 2
  MnSlChrAnimFiles_WireframeBoy:
  .string "PlBoAJ.dat"
  .align 2
  MnSlChrAnimFiles_WireframeGirl:
  .string "PlGlAJ.dat"
  .align 2
  MnSlChrAnimFiles_GigaBowser:
  .string "PlGkAJ.dat"
  .align 2
  MnSlChrAnimFiles_Sandbag:
  .string "PlSbAJ.dat"
  .align 2

MnSlChr_AnimCount:
  blrl
  #Mario Anim Count
  .long 0x00000000
  .long 303       #Anim Count
  #Fox Anim Count
  .long 0x00000000
  .long 327       #Anim Count
  #Falcon Anim Count
  .long 0x00000000
  .long 318       #Anim Count
  #DK Anim Count
  .long 0x00000000
  .long 337       #Anim Count
  #Kirby Anim Count
  .long 0x00000000
  .long 479       #Anim Count
  #Bowser Anim Count
  .long 0x00000000
  .long 316       #Anim Count
  #Link Anim Count
  .long 0x00000000
  .long 314       #Anim Count
  #Sheik Anim Count
  .long 0x00000000
  .long 317       #Anim Count
  #Ness Anim Count
  .long 0x00000000
  .long 326       #Anim Count
  #Peach Anim Count
  .long 0x00000000
  .long 318       #Anim Count
  #Popo Anim Count
  .long 0x00000000
  .long 321       #Anim Count
  #Nana Anim Count
  .long 0x00000000
  .long 321       #Anim Count
  #Pikachu Anim Count
  .long 0x00000000
  .long 320       #Anim Count
  #Samus Anim Count
  .long 0x00000000
  .long 313       #Anim Count
  #Yoshi Anim Count
  .long 0x00000000
  .long 314       #Anim Count
  #Jigglypuff Anim Count
  .long 0x00000000
  .long 327       #Anim Count
  #Mewtwo Anim Count
  .long 0x00000000
  .long 314       #Anim Count
  #Luigi Anim Count
  .long 0x00000000
  .long 312       #Anim Count
  #Marth Anim Count
  .long 0x00000000
  .long 327       #Anim Count
  #Zelda Anim Count
  .long 0x00000000
  .long 311       #Anim Count
  #YoungLink Anim Count
  .long 0x00000000
  .long 314       #Anim Count
  #DrMario Anim Count
  .long 0x00000000
  .long 303       #Anim Count
  #Falco Anim Count
  .long 0x00000000
  .long 327       #Anim Count
  #Pichu Anim Count
  .long 0x00000000
  .long 320       #Anim Count
  #GaW Anim Count
  .long 0x00000000
  .long 323       #Anim Count
  #Ganondorf Anim Count
  .long 0x00000000
  .long 318       #Anim Count
  #Roy Anim Count
  .long 0x00000000
  .long 327       #Anim Count
  #NewChar1 Anim Count
  .long 0x00000000
  .long NewChar1_AnimationCount       #Anim Count
  #MasterHand Anim Count
  .long 0x00000000
  .long 345       #Anim Count
  #CrazyHand Anim Count
  .long 0x00000000
  .long 344       #Anim Count
  #WireframeBoy Anim Count
  .long 0x00000000
  .long 295       #Anim Count
  #WireframeGirl Anim Count
  .long 0x00000000
  .long 295       #Anim Count
  #GigaBowser Anim Count
  .long 0x00000000
  .long 316       #Anim Count

MnSlChr_EffectFileIDs:
  blrl
  .byte 0x1 #Mario
  .byte 0x3 #Fox
  .byte 0x4 #Falcon
  .byte 0x8 #DK
  .byte 0x5 #Kirby
  .byte 0xc #Bowser
  .byte 0x6 #Link
  .byte 0x11 #Sheik
  .byte 0xa #Ness
  .byte 0xf #Peach
  .byte 0xe #Popo
  .byte 0xe #Nana
  .byte 0x7 #Pikachu
  .byte 0x2 #Samus
  .byte 0x9 #Yoshi
  .byte 0xb #Jigglypuff
  .byte 0xd #Mewtwo
  .byte 0x12 #Luigi
  .byte 0x10 #Marth
  .byte 0x11 #Zelda
  .byte 0x6 #YoungLink
  .byte 0x1 #DrMario
  .byte 0x3 #Falco
  .byte 0x7 #Pichu
  .byte 0xff #GaW
  .byte 0x13 #Ganondorf
  .byte 0x31 #Roy
  .byte NewChar1_EffectFileID #NewChar1
  .byte 0xff #MasterHand
  .byte 0xff #CrazyHand
  .byte 0xff #WireframeBoy
  .byte 0xff #WireframeGirl
  .byte 0xc #GigaBowser
  .byte 0xff #Sandbag
  .align 2

MnSlChr_EffectFiles:
  blrl
  bl MnSlChrEffectFile_Common
  bl MnSlChrEffectDataTable_Common
  bl Null
  bl MnSlChrEffectFile_Mario
  bl MnSlChrEffectDataTable_Mario
  bl Null
  bl MnSlChrEffectFile_Samus
  bl MnSlChrEffectDataTable_Samus
  bl Null
  bl MnSlChrEffectFile_Fox
  bl MnSlChrEffectDataTable_Fox
  bl Null
  bl MnSlChrEffectFile_Falcon
  bl MnSlChrEffectDataTable_Falcon
  bl Null
  bl MnSlChrEffectFile_Kirby
  bl MnSlChrEffectDataTable_Kirby
  bl Null
  bl MnSlChrEffectFile_Link
  bl MnSlChrEffectDataTable_Link
  bl Null
  bl MnSlChrEffectFile_Pikachu
  bl MnSlChrEffectDataTable_Pikachu
  bl Null
  bl MnSlChrEffectFile_DK
  bl MnSlChrEffectDataTable_DK
  bl Null
  bl MnSlChrEffectFile_Yoshi
  bl MnSlChrEffectDataTable_Yoshi
  bl Null
  bl MnSlChrEffectFile_Ness
  bl MnSlChrEffectDataTable_Ness
  bl Null
  bl MnSlChrEffectFile_Jigglypuff
  bl MnSlChrEffectDataTable_Jigglypuff
  bl Null
  bl MnSlChrEffectFile_Bowser
  bl MnSlChrEffectDataTable_Bowser
  bl Null
  bl MnSlChrEffectFile_Mewtwo
  bl MnSlChrEffectDataTable_Mewtwo
  bl Null
  bl MnSlChrEffectFile_IceClimber
  bl MnSlChrEffectDataTable_IceClimber
  bl Null
  bl MnSlChrEffectFile_Peach
  bl MnSlChrEffectDataTable_Peach
  bl Null
  bl MnSlChrEffectFile_Marth
  bl MnSlChrEffectDataTable_Marth
  bl Null
  bl MnSlChrEffectFile_Zelda
  bl MnSlChrEffectDataTable_Zelda
  bl Null
  bl MnSlChrEffectFile_Luigi
  bl MnSlChrEffectDataTable_Luigi
  bl Null
  bl MnSlChrEffectFile_Ganondorf
  bl MnSlChrEffectDataTable_Ganondorf
  bl Null
  bl MnSlChrEffectFile_Kb_Marth
  bl MnSlChrEffectDataTable_Kb_Marth
  bl Null
  bl MnSlChrEffectFile_Kb_Zelda
  bl MnSlChrEffectDataTable_Kb_Zelda
  bl Null
  bl MnSlChrEffectFile_Empty1
  bl MnSlChrEffectDataTable_Empty1
  bl Null
  bl MnSlChrEffectFile_Empty2
  bl MnSlChrEffectDataTable_Empty2
  bl Null
  bl MnSlChrEffectFile_Empty3
  bl MnSlChrEffectDataTable_Empty3
  bl Null
  bl MnSlChrEffectFile_Empty4
  bl MnSlChrEffectDataTable_Empty4
  bl Null
  bl MnSlChrEffectFile_Empty5
  bl MnSlChrEffectDataTable_Empty5
  bl Null
  bl MnSlChrEffectFile_Empty6
  bl MnSlChrEffectDataTable_Empty6
  bl Null
  bl MnSlChrEffectFile_Empty7
  bl MnSlChrEffectDataTable_Empty7
  bl Null
  bl MnSlChrEffectFile_Empty8
  bl MnSlChrEffectDataTable_Empty8
  bl Null
  bl MnSlChrEffectFile_Empty9
  bl MnSlChrEffectDataTable_Empty9
  bl Null
  bl MnSlChrEffectFile_Menu
  bl MnSlChrEffectDataTable_Menu
  bl Null
  bl MnSlChrEffectFile_Kb_Mario
  bl MnSlChrEffectDataTable_Kb_Mario
  bl Null
  bl MnSlChrEffectFile_Kb_Fox
  bl MnSlChrEffectDataTable_Kb_Fox
  bl Null
  bl MnSlChrEffectFile_Kb_Samus
  bl MnSlChrEffectDataTable_Kb_Samus
  bl Null
  bl MnSlChrEffectFile_Empty10
  bl MnSlChrEffectDataTable_Empty10
  bl Null
  bl MnSlChrEffectFile_Kb_Pikachu
  bl MnSlChrEffectDataTable_Kb_Pikachu
  bl Null
  bl MnSlChrEffectFile_Kb_Luigi
  bl MnSlChrEffectDataTable_Kb_Luigi
  bl Null
  bl MnSlChrEffectFile_Kb_Falcon
  bl MnSlChrEffectDataTable_Kb_Falcon
  bl Null
  bl MnSlChrEffectFile_Kb_DK
  bl MnSlChrEffectDataTable_Kb_DK
  bl Null
  bl MnSlChrEffectFile_Empty11
  bl MnSlChrEffectDataTable_Empty11
  bl Null
  bl MnSlChrEffectFile_Kb_Bowser
  bl MnSlChrEffectDataTable_Kb_Bowser
  bl Null
  bl MnSlChrEffectFile_Empty12
  bl MnSlChrEffectDataTable_Empty12
  bl Null
  bl MnSlChrEffectFile_Empty13
  bl MnSlChrEffectDataTable_Empty13
  bl Null
  bl MnSlChrEffectFile_Empty14
  bl MnSlChrEffectDataTable_Empty14
  bl Null
  bl MnSlChrEffectFile_Empty15
  bl MnSlChrEffectDataTable_Empty15
  bl Null
  bl MnSlChrEffectFile_Kb_IceClimber
  bl MnSlChrEffectDataTable_Kb_IceClimber
  bl Null
  bl MnSlChrEffectFile_Kb_Ganondorf
  bl MnSlChrEffectDataTable_Kb_Ganondorf
  bl Null
  bl MnSlChrEffectFile_Kb_Roy
  bl MnSlChrEffectDataTable_Kb_Roy
  bl Null
  bl MnSlChrEffectFile_Roy
  bl MnSlChrEffectDataTable_Roy
  bl Null
  bl MnSlChrEffectFile_Empty16
  bl MnSlChrEffectDataTable_Empty16
  bl Null
  bl MnSlChrEffectFile_NewChar1
  bl MnSlChrEffectDataTable_NewChar1
  bl Null
  .long -1
  MnSlChrEffectFile_NewChar1:
  .ascii "Ef"
  NewChar1_ShortName
  .ascii "Data.dat"
  .byte 0
  .align 2
  MnSlChrEffectDataTable_NewChar1:
  .ascii "eff"
  NewChar1_LongName
  .ascii "DataTable"
  .byte 0
  .align 2
  MnSlChrEffectFile_Common:
  .string "EfCoData.dat"
  .align 2
  MnSlChrEffectDataTable_Common:
  .string "effCommonDataTable"
  .align 2
  MnSlChrEffectFile_Mario:
  .string "EfMrData.dat"
  .align 2
  MnSlChrEffectDataTable_Mario:
  .string "effMarioDataTable"
  .align 2
  MnSlChrEffectFile_Samus:
  .string "EfSsData.dat"
  .align 2
  MnSlChrEffectDataTable_Samus:
  .string "effSamusDataTable"
  .align 2
  MnSlChrEffectFile_Fox:
  .string "EfFxData.dat"
  .align 2
  MnSlChrEffectDataTable_Fox:
  .string "effFoxDataTable"
  .align 2
  MnSlChrEffectFile_Falcon:
  .string "EfCaData.dat"
  .align 2
  MnSlChrEffectDataTable_Falcon:
  .string "effCaptainDataTable"
  .align 2
  MnSlChrEffectFile_Kirby:
  .string "EfKbData.dat"
  .align 2
  MnSlChrEffectDataTable_Kirby:
  .string "effKirbyDataTable"
  .align 2
  MnSlChrEffectFile_Link:
  .string "EfLkData.dat"
  .align 2
  MnSlChrEffectDataTable_Link:
  .string "effLinkDataTable"
  .align 2
  MnSlChrEffectFile_Pikachu:
  .string "EfPkData.dat"
  .align 2
  MnSlChrEffectDataTable_Pikachu:
  .string "effPikachuDataTable"
  .align 2
  MnSlChrEffectFile_DK:
  .string "EfDkData.dat"
  .align 2
  MnSlChrEffectDataTable_DK:
  .string "effDonkeyDataTable"
  .align 2
  MnSlChrEffectFile_Yoshi:
  .string "EfYsData.dat"
  .align 2
  MnSlChrEffectDataTable_Yoshi:
  .string "effYoshiDataTable"
  .align 2
  MnSlChrEffectFile_Ness:
  .string "EfNsData.dat"
  .align 2
  MnSlChrEffectDataTable_Ness:
  .string "effNessDataTable"
  .align 2
  MnSlChrEffectFile_Jigglypuff:
  .string "EfPrData.dat"
  .align 2
  MnSlChrEffectDataTable_Jigglypuff:
  .string "effPurinDataTable"
  .align 2
  MnSlChrEffectFile_Bowser:
  .string "EfKpData.dat"
  .align 2
  MnSlChrEffectDataTable_Bowser:
  .string "effKoopaDataTable"
  .align 2
  MnSlChrEffectFile_Mewtwo:
  .string "EfMtData.dat"
  .align 2
  MnSlChrEffectDataTable_Mewtwo:
  .string "effMewtwoDataTable"
  .align 2
  MnSlChrEffectFile_IceClimber:
  .string "EfIcData.dat"
  .align 2
  MnSlChrEffectDataTable_IceClimber:
  .string "effIceclimberDataTable"
  .align 2
  MnSlChrEffectFile_Peach:
  .string "EfPeData.dat"
  .align 2
  MnSlChrEffectDataTable_Peach:
  .string "effPeachDataTable"
  .align 2
  MnSlChrEffectFile_Marth:
  .string "EfMsData.dat"
  .align 2
  MnSlChrEffectDataTable_Marth:
  .string "effMarsDataTable"
  .align 2
  MnSlChrEffectFile_Zelda:
  .string "EfZdData.dat"
  .align 2
  MnSlChrEffectDataTable_Zelda:
  .string "effZeldaDataTable"
  .align 2
  MnSlChrEffectFile_Luigi:
  .string "EfLgData.dat"
  .align 2
  MnSlChrEffectDataTable_Luigi:
  .string "effLuigiDataTable"
  .align 2
  MnSlChrEffectFile_Ganondorf:
  .string "EfGnData.dat"
  .align 2
  MnSlChrEffectDataTable_Ganondorf:
  .string "effGanonDataTable"
  .align 2
  MnSlChrEffectFile_Kb_Marth:
  .string "EfKbMs.dat"
  .align 2
  MnSlChrEffectDataTable_Kb_Marth:
  .string "effKirbyMarsDataTable"
  .align 2
  MnSlChrEffectFile_Kb_Zelda:
  .string "EfKbZd.dat"
  .align 2
  MnSlChrEffectDataTable_Kb_Zelda:
  .string "effKirbyZeldaDataTable"
  .align 2
  MnSlChrEffectFile_Menu:
  .string "EfMnData.dat"
  .align 2
  MnSlChrEffectDataTable_Menu:
  .string "effMenuDataTable"
  .align 2
  MnSlChrEffectFile_Kb_Mario:
  .string "EfKbMr.dat"
  .align 2
  MnSlChrEffectDataTable_Kb_Mario:
  .string "effKirbyMarioDataTable"
  .align 2
  MnSlChrEffectFile_Kb_Fox:
  .string "EfKbFx.dat"
  .align 2
  MnSlChrEffectDataTable_Kb_Fox:
  .string "effKirbyFoxDataTable"
  .align 2
  MnSlChrEffectFile_Kb_Samus:
  .string "EfKbSs.dat"
  .align 2
  MnSlChrEffectDataTable_Kb_Samus:
  .string "effKirbySamusDataTable"
  .align 2
  MnSlChrEffectFile_Kb_Pikachu:
  .string "EfKbPk.dat"
  .align 2
  MnSlChrEffectDataTable_Kb_Pikachu:
  .string "effKirbyPikachuDataTable"
  .align 2
  MnSlChrEffectFile_Kb_Luigi:
  .string "EfKbLg.dat"
  .align 2
  MnSlChrEffectDataTable_Kb_Luigi:
  .string "effKirbyLuigiDataTable"
  .align 2
  MnSlChrEffectFile_Kb_Falcon:
  .string "EfKbCa.dat"
  .align 2
  MnSlChrEffectDataTable_Kb_Falcon:
  .string "effKirbyCaptainDataTable"
  .align 2
  MnSlChrEffectFile_Kb_DK:
  .string "EfKbDk.dat"
  .align 2
  MnSlChrEffectDataTable_Kb_DK:
  .string "effKirbyDonkeyDataTable"
  .align 2
  MnSlChrEffectFile_Kb_Bowser:
  .string "EfKbKp.dat"
  .align 2
  MnSlChrEffectDataTable_Kb_Bowser:
  .string "effKirbyKoopaDataTable"
  .align 2
  MnSlChrEffectFile_Kb_IceClimber:
  .string "EfKbIc.dat"
  .align 2
  MnSlChrEffectDataTable_Kb_IceClimber:
  .string "effKirbyIceDataTable"
  .align 2
  MnSlChrEffectFile_Kb_Ganondorf:
  .string "EfKbGn.dat"
  .align 2
  MnSlChrEffectDataTable_Kb_Ganondorf:
  .string "effKirbyGanonDataTable"
  .align 2
  MnSlChrEffectFile_Kb_Roy:
  .string "EfKbFe.dat"
  .align 2
  MnSlChrEffectDataTable_Kb_Roy:
  .string "effKirbyEmblemDataTable"
  .align 2
  MnSlChrEffectFile_Roy:
  .string "EfFeData.dat"
  .align 2
  MnSlChrEffectDataTable_Roy:
  .string "effEmblemDataTable"
  .align 2

Effect_AdditionalEffectStruct:
  #First effect that doesnt exist is 1299
  blrl
  #Effect 1299 - tornado
  .long 51001       #ext effect ID
  .long 0           #effect type (particle/model)
  .long 0x8005c3dc  #creation function
  #Effect 1300 - cape sparkle
  .long 51009       #ext effect ID
  .long 1           #effect type (particle/model)
  .long 0x8039efac  #creation function
  #Effect 1301 - falcon punch
  .long 51002
  .long 0
  .long 0x8005c6f4

GmRst_AnimFiles:
  blrl
  bl GmRstAnimFile_Falcon
  bl GmRstAnimFile_DK
  bl GmRstAnimFile_Fox
  bl GmRstAnimFile_GaW
  bl GmRstAnimFile_Kirby
  bl GmRstAnimFile_Bowser
  bl GmRstAnimFile_Link
  bl GmRstAnimFile_Luigi
  bl GmRstAnimFile_Mario
  bl GmRstAnimFile_Marth
  bl GmRstAnimFile_Mewtwo
  bl GmRstAnimFile_Ness
  bl GmRstAnimFile_Peach
  bl GmRstAnimFile_Pikachu
  bl GmRstAnimFile_IceClimbers
  bl GmRstAnimFile_Jigglypuff
  bl GmRstAnimFile_Samus
  bl GmRstAnimFile_Yoshi
  bl GmRstAnimFile_Zelda
  bl GmRstAnimFile_Sheik
  bl GmRstAnimFile_Falco
  bl GmRstAnimFile_YoungLink
  bl GmRstAnimFile_DrMario
  bl GmRstAnimFile_Roy
  bl GmRstAnimFile_Pichu
  bl GmRstAnimFile_Ganondorf
  bl GmRstAnimFile_NewChar1
  bl GmRstAnimFile_MasterHand
  bl GmRstAnimFile_WireframeBoy
  bl GmRstAnimFile_WireframeGirl
  bl GmRstAnimFile_GigaBowser
  bl GmRstAnimFile_CrazyHand
  bl GmRstAnimFile_Sandbag
  bl GmRstAnimFile_IceClimbers
  .long -1
  GmRstAnimFile_Falcon:
  .string "GmRstMCa.dat"
  .align 2
  GmRstAnimFile_DK:
  .string "GmRstMDk.dat"
  .align 2
  GmRstAnimFile_Fox:
  .string "GmRstMFx.dat"
  .align 2
  GmRstAnimFile_GaW:
  .string "GmRstMGw.dat"
  .align 2
  GmRstAnimFile_Kirby:
  .string "GmRstMKb.dat"
  .align 2
  GmRstAnimFile_Bowser:
  .string "GmRstMKp.dat"
  .align 2
  GmRstAnimFile_Link:
  .string "GmRstMLk.dat"
  .align 2
  GmRstAnimFile_Luigi:
  .string "GmRstMLg.dat"
  .align 2
  GmRstAnimFile_Mario:
  .string "GmRstMMr.dat"
  .align 2
  GmRstAnimFile_Marth:
  .string "GmRstMMs.dat"
  .align 2
  GmRstAnimFile_Mewtwo:
  .string "GmRstMMt.dat"
  .align 2
  GmRstAnimFile_Ness:
  .string "GmRstMNs.dat"
  .align 2
  GmRstAnimFile_Peach:
  .string "GmRstMPe.dat"
  .align 2
  GmRstAnimFile_Pikachu:
  .string "GmRstMPk.dat"
  .align 2
  GmRstAnimFile_IceClimbers:
  .string "GmRstMPn.dat"
  .align 2
  GmRstAnimFile_Jigglypuff:
  .string "GmRstMPr.dat"
  .align 2
  GmRstAnimFile_Samus:
  .string "GmRstMSs.dat"
  .align 2
  GmRstAnimFile_Yoshi:
  .string "GmRstMYs.dat"
  .align 2
  GmRstAnimFile_Zelda:
  .string "GmRstMZd.dat"
  .align 2
  GmRstAnimFile_Sheik:
  .string "GmRstMSk.dat"
  .align 2
  GmRstAnimFile_Falco:
  .string "GmRstMFc.dat"
  .align 2
  GmRstAnimFile_YoungLink:
  .string "GmRstMCl.dat"
  .align 2
  GmRstAnimFile_DrMario:
  .string "GmRstMDr.dat"
  .align 2
  GmRstAnimFile_Roy:
  .string "GmRstMFe.dat"
  .align 2
  GmRstAnimFile_Pichu:
  .string "GmRstMPc.dat"
  .align 2
  GmRstAnimFile_Ganondorf:
  .string "GmRstMGn.dat"
  .align 2
  GmRstAnimFile_NewChar1:
    .ascii "GmRstM"
    NewChar1_ShortName
    .ascii ".dat"
    .byte 0
    .align 2
  GmRstAnimFile_MasterHand:
  .string "GmRstMMh.dat"
  .align 2
  GmRstAnimFile_WireframeBoy:
  .string "GmRstMBo.dat"
  .align 2
  GmRstAnimFile_WireframeGirl:
  .string "GmRstMGl.dat"
  .align 2
  GmRstAnimFile_GigaBowser:
  .string "GmRstMGk.dat"
  .align 2
  GmRstAnimFile_CrazyHand:
  .string "GmRstMCh.dat"
  .align 2
  GmRstAnimFile_Sandbag:
  .string "GmRstMSb.dat"
  .align 2

GmRst_InsigniaIDs:
  blrl
  .byte 0 #Falcon
  .byte 1 #DK
  .byte 2 #Fox
  .byte 3 #GaW
  .byte 5 #Kirby
  .byte 6 #Bowser
  .byte 13 #Link
  .byte 6 #Luigi
  .byte 6 #Mario
  .byte 7 #Marth
  .byte 9 #Mewtwo
  .byte 8 #Ness
  .byte 6 #Peach
  .byte 9 #Pikachu
  .byte 4 #IceClimbers
  .byte 9 #Jigglypuff
  .byte 10 #Samus
  .byte 12 #Yoshi
  .byte 13 #Zelda
  .byte 13 #Sheik
  .byte 2 #Falco
  .byte 13 #YoungLink
  .byte 6 #DrMario
  .byte 7 #Roy
  .byte 9 #Pichu
  .byte 13 #Ganondorf
  .byte NewChar1_InsigniaID #NewChar1
  .byte 0 #MasterHand
  .byte 0 #WireframeBoy
  .byte 0 #WireframeGirl
  .byte 0 #GigaBowser
  .byte 0 #CrazyHand
  .byte 0 #Sandbag
  .byte 4 #Popo
  .align 2

GmRst_Scale:
  blrl
  #Originally existed @ 8017a890
  .float 0.85             #Falcon
  .float 0.8              #DK
  .float 1                #Fox
  .float 1                #GaW
  .float 1                #Kirby
  .float 0.7              #Bowser
  .float 0.9              #Link
  .float 1                #Luigi
  .float 1                #Mario
  .float 0.88             #Marth
  .float 0.8              #Mewtwo
  .float 1                #Ness
  .float 0.9              #Peach
  .float 1                #Pikachu
  .float 0.9              #IceClimbers
  .float 1                #Jigglypuff
  .float 0.9              #Samus
  .float 0.9              #Yoshi
  .float 0.9              #Zelda
  .float 0.9              #Sheik
  .float 1                #Falco
  .float 1                #YoungLink
  .float 1                #DrMario
  .float 1                #Roy
  .float 1                #Pichu
  .float 0.79             #Ganondorf
  .float 1.0
  .float 0                #MasterHand
  .float 0                #WireframeBoy
  .float 0                #WireframeGirl
  .float 0                #GigaBowser
  .float 0                #CrazyHand
  .float 0                #Sandbag
  .float 0                #Popo

GmRst_VictoryTheme:
  blrl
  .long 0x11          #Falcon
  .long 0x0D          #DK
  .long 0x10          #Fox
  .long 0x0F          #GaW
  .long 0x14          #Kirby
  .long 0x16          #Bowser
  .long 0x15          #Link
  .long 0x16          #Luigi
  .long 0x16          #Mario
  .long 0x0E          #Marth
  .long 0x18          #Mewtwo
  .long 0x17          #Ness
  .long 0x16          #Peach
  .long 0x18          #Pikachu
  .long 0x13          #IceClimbers
  .long 0x18          #Jigglypuff
  .long 0x19          #Samus
  .long 0x1D          #Yoshi
  .long 0x15          #Zelda
  .long 0x15          #Sheik
  .long 0x10          #Falco
  .long 0x15          #YoungLink
  .long 0x16          #DrMario
  .long 0x0E          #Roy
  .long 0x18          #Pichu
  .long 0x15          #Ganondorf
  .long NewChar1_VictorySong          #Placeholder
  .long 0x00           #MasterHand
  .long 0x00          #WireframeBoy
  .long 0x00          #WireframeGirl
  .long 0x16          #GigaBowser
  .long 0x00          #CrazyHand
  .long 0x00          #Sandbag
  .long 0x13          #Popo

FtDemo_SymbolNames:
  blrl
  bl DemoFileSymbols_Mario
  bl DemoFileSymbols_Fox
  bl DemoFileSymbols_Falcon
  bl DemoFileSymbols_DK
  bl DemoFileSymbols_Kirby
  bl DemoFileSymbols_Bowser
  bl DemoFileSymbols_Link
  bl DemoFileSymbols_Sheik
  bl DemoFileSymbols_Ness
  bl DemoFileSymbols_Peach
  bl DemoFileSymbols_Popo
  bl DemoFileSymbols_Nana
  bl DemoFileSymbols_Pikachu
  bl DemoFileSymbols_Samus
  bl DemoFileSymbols_Yoshi
  bl DemoFileSymbols_Jigglypuff
  bl DemoFileSymbols_Mewtwo
  bl DemoFileSymbols_Luigi
  bl DemoFileSymbols_Marth
  bl DemoFileSymbols_Zelda
  bl DemoFileSymbols_YoungLink
  bl DemoFileSymbols_DrMario
  bl DemoFileSymbols_Falco
  bl DemoFileSymbols_Pichu
  bl DemoFileSymbols_GaW
  bl DemoFileSymbols_Ganondorf
  bl DemoFileSymbols_Roy
  bl DemoFileSymbols_NewChar1
  .long -1
  DemoFileSymbols_Start:
  blrl
  DemoFileSymbols_Mario:
  bl DemoFileSymbols_Mario_Result
  bl DemoFileSymbols_Mario_Intro
  bl DemoFileSymbols_Mario_Ending
  bl DemoFileSymbols_Mario_Wait
  DemoFileSymbols_Fox:
  bl DemoFileSymbols_Fox_Result
  bl DemoFileSymbols_Fox_Intro
  bl DemoFileSymbols_Fox_Ending
  bl DemoFileSymbols_Fox_Wait
  DemoFileSymbols_Falcon:
  bl DemoFileSymbols_Falcon_Result
  bl DemoFileSymbols_Falcon_Intro
  bl DemoFileSymbols_Falcon_Ending
  bl DemoFileSymbols_Falcon_Wait
  DemoFileSymbols_DK:
  bl DemoFileSymbols_DK_Result
  bl DemoFileSymbols_DK_Intro
  bl DemoFileSymbols_DK_Ending
  bl DemoFileSymbols_DK_Wait
  DemoFileSymbols_Kirby:
  bl DemoFileSymbols_Kirby_Result
  bl DemoFileSymbols_Kirby_Intro
  bl DemoFileSymbols_Kirby_Ending
  bl DemoFileSymbols_Kirby_Wait
  DemoFileSymbols_Bowser:
  bl DemoFileSymbols_Bowser_Result
  bl DemoFileSymbols_Bowser_Intro
  bl DemoFileSymbols_Bowser_Ending
  bl DemoFileSymbols_Bowser_Wait
  DemoFileSymbols_Link:
  bl DemoFileSymbols_Link_Result
  bl DemoFileSymbols_Link_Intro
  bl DemoFileSymbols_Link_Ending
  bl DemoFileSymbols_Link_Wait
  DemoFileSymbols_Sheik:
  bl DemoFileSymbols_Sheik_Result
  bl DemoFileSymbols_Sheik_Intro
  bl DemoFileSymbols_Sheik_Ending
  bl DemoFileSymbols_Sheik_Wait
  DemoFileSymbols_Ness:
  bl DemoFileSymbols_Ness_Result
  bl DemoFileSymbols_Ness_Intro
  bl DemoFileSymbols_Ness_Ending
  bl DemoFileSymbols_Ness_Wait
  DemoFileSymbols_Peach:
  bl DemoFileSymbols_Peach_Result
  bl DemoFileSymbols_Peach_Intro
  bl DemoFileSymbols_Peach_Ending
  bl DemoFileSymbols_Peach_Wait
  DemoFileSymbols_Popo:
  bl DemoFileSymbols_Popo_Result
  bl DemoFileSymbols_Popo_Intro
  bl DemoFileSymbols_Popo_Ending
  bl DemoFileSymbols_Popo_Wait
  DemoFileSymbols_Nana:
  bl DemoFileSymbols_Nana_Result
  bl DemoFileSymbols_Nana_Intro
  bl DemoFileSymbols_Nana_Ending
  bl DemoFileSymbols_Nana_Wait
  DemoFileSymbols_Pikachu:
  bl DemoFileSymbols_Pikachu_Result
  bl DemoFileSymbols_Pikachu_Intro
  bl DemoFileSymbols_Pikachu_Ending
  bl DemoFileSymbols_Pikachu_Wait
  DemoFileSymbols_Samus:
  bl DemoFileSymbols_Samus_Result
  bl DemoFileSymbols_Samus_Intro
  bl DemoFileSymbols_Samus_Ending
  bl DemoFileSymbols_Samus_Wait
  DemoFileSymbols_Yoshi:
  bl DemoFileSymbols_Yoshi_Result
  bl DemoFileSymbols_Yoshi_Intro
  bl DemoFileSymbols_Yoshi_Ending
  bl DemoFileSymbols_Yoshi_Wait
  DemoFileSymbols_Jigglypuff:
  bl DemoFileSymbols_Jigglypuff_Result
  bl DemoFileSymbols_Jigglypuff_Intro
  bl DemoFileSymbols_Jigglypuff_Ending
  bl DemoFileSymbols_Jigglypuff_Wait
  DemoFileSymbols_Mewtwo:
  bl DemoFileSymbols_Mewtwo_Result
  bl DemoFileSymbols_Mewtwo_Intro
  bl DemoFileSymbols_Mewtwo_Ending
  bl DemoFileSymbols_Mewtwo_Wait
  DemoFileSymbols_Luigi:
  bl DemoFileSymbols_Luigi_Result
  bl DemoFileSymbols_Luigi_Intro
  bl DemoFileSymbols_Luigi_Ending
  bl DemoFileSymbols_Luigi_Wait
  DemoFileSymbols_Marth:
  bl DemoFileSymbols_Marth_Result
  bl DemoFileSymbols_Marth_Intro
  bl DemoFileSymbols_Marth_Ending
  bl DemoFileSymbols_Marth_Wait
  DemoFileSymbols_Zelda:
  bl DemoFileSymbols_Zelda_Result
  bl DemoFileSymbols_Zelda_Intro
  bl DemoFileSymbols_Zelda_Ending
  bl DemoFileSymbols_Zelda_Wait
  DemoFileSymbols_YoungLink:
  bl DemoFileSymbols_YoungLink_Result
  bl DemoFileSymbols_YoungLink_Intro
  bl DemoFileSymbols_YoungLink_Ending
  bl DemoFileSymbols_YoungLink_Wait
  DemoFileSymbols_DrMario:
  bl DemoFileSymbols_DrMario_Result
  bl DemoFileSymbols_DrMario_Intro
  bl DemoFileSymbols_DrMario_Ending
  bl DemoFileSymbols_DrMario_Wait
  DemoFileSymbols_Falco:
  bl DemoFileSymbols_Falco_Result
  bl DemoFileSymbols_Falco_Intro
  bl DemoFileSymbols_Falco_Ending
  bl DemoFileSymbols_Falco_Wait
  DemoFileSymbols_Pichu:
  bl DemoFileSymbols_Pichu_Result
  bl DemoFileSymbols_Pichu_Intro
  bl DemoFileSymbols_Pichu_Ending
  bl DemoFileSymbols_Pichu_Wait
  DemoFileSymbols_GaW:
  bl DemoFileSymbols_GaW_Result
  bl DemoFileSymbols_GaW_Intro
  bl DemoFileSymbols_GaW_Ending
  bl DemoFileSymbols_GaW_Wait
  DemoFileSymbols_Ganondorf:
  bl DemoFileSymbols_Ganondorf_Result
  bl DemoFileSymbols_Ganondorf_Intro
  bl DemoFileSymbols_Ganondorf_Ending
  bl DemoFileSymbols_Ganondorf_Wait
  DemoFileSymbols_Roy:
  bl DemoFileSymbols_Roy_Result
  bl DemoFileSymbols_Roy_Intro
  bl DemoFileSymbols_Roy_Ending
  bl DemoFileSymbols_Roy_Wait
  DemoFileSymbols_NewChar1:
  bl DemoFileSymbols_NewChar1_Result
  bl DemoFileSymbols_NewChar1_Intro
  bl DemoFileSymbols_NewChar1_Ending
  bl DemoFileSymbols_NewChar1_Wait
  .long -1
  #Mario
  DemoFileSymbols_Mario_Result:
  .string "ftDemoResultMotionFileMario"
  .align 2
  DemoFileSymbols_Mario_Intro:
  .string "ftDemoIntroMotionFileMario"
  .align 2
  DemoFileSymbols_Mario_Ending:
  .string "ftDemoEndingMotionFileMario"
  .align 2
  DemoFileSymbols_Mario_Wait:
  .string "ftDemoViWaitMotionFileMario"
  .align 2

  #Fox
  DemoFileSymbols_Fox_Result:
  .string "ftDemoResultMotionFileFox"
  .align 2
  DemoFileSymbols_Fox_Intro:
  .string "ftDemoIntroMotionFileFox"
  .align 2
  DemoFileSymbols_Fox_Ending:
  .string "ftDemoEndingMotionFileFox"
  .align 2
  DemoFileSymbols_Fox_Wait:
  .string "ftDemoViWaitMotionFileFox"
  .align 2

  #Falcon
  DemoFileSymbols_Falcon_Result:
  .string "ftDemoResultMotionFileCaptain"
  .align 2
  DemoFileSymbols_Falcon_Intro:
  .string "ftDemoIntroMotionFileCaptain"
  .align 2
  DemoFileSymbols_Falcon_Ending:
  .string "ftDemoEndingMotionFileCaptain"
  .align 2
  DemoFileSymbols_Falcon_Wait:
  .string "ftDemoViWaitMotionFileCaptain"
  .align 2

  #DK
  DemoFileSymbols_DK_Result:
  .string "ftDemoResultMotionFileDonkey"
  .align 2
  DemoFileSymbols_DK_Intro:
  .string "ftDemoIntroMotionFileDonkey"
  .align 2
  DemoFileSymbols_DK_Ending:
  .string "ftDemoEndingMotionFileDonkey"
  .align 2
  DemoFileSymbols_DK_Wait:
  .string "ftDemoViWaitMotionFileDonkey"
  .align 2

  #Kirby
  DemoFileSymbols_Kirby_Result:
  .string "ftDemoResultMotionFileKirby"
  .align 2
  DemoFileSymbols_Kirby_Intro:
  .string "ftDemoIntroMotionFileKirby"
  .align 2
  DemoFileSymbols_Kirby_Ending:
  .string "ftDemoEndingMotionFileKirby"
  .align 2
  DemoFileSymbols_Kirby_Wait:
  .string "ftDemoViWaitMotionFileKirby"
  .align 2

  #Bowser
  DemoFileSymbols_Bowser_Result:
  .string "ftDemoResultMotionFileKoopa"
  .align 2
  DemoFileSymbols_Bowser_Intro:
  .string "ftDemoIntroMotionFileKoopa"
  .align 2
  DemoFileSymbols_Bowser_Ending:
  .string "ftDemoEndingMotionFileKoopa"
  .align 2
  DemoFileSymbols_Bowser_Wait:
  .string "ftDemoViWaitMotionFileKoopa"
  .align 2

  #Link
  DemoFileSymbols_Link_Result:
  .string "ftDemoResultMotionFileLink"
  .align 2
  DemoFileSymbols_Link_Intro:
  .string "ftDemoIntroMotionFileLink"
  .align 2
  DemoFileSymbols_Link_Ending:
  .string "ftDemoEndingMotionFileLink"
  .align 2
  DemoFileSymbols_Link_Wait:
  .string "ftDemoViWaitMotionFileLink"
  .align 2

  #Sheik
  DemoFileSymbols_Sheik_Result:
  .string "ftDemoResultMotionFileSeak"
  .align 2
  DemoFileSymbols_Sheik_Intro:
  .string "ftDemoIntroMotionFileSeak"
  .align 2
  DemoFileSymbols_Sheik_Ending:
  .string "ftDemoEndingMotionFileSeak"
  .align 2
  DemoFileSymbols_Sheik_Wait:
  .string "ftDemoViWaitMotionFileSeak"
  .align 2

  #Ness
  DemoFileSymbols_Ness_Result:
  .string "ftDemoResultMotionFileNess"
  .align 2
  DemoFileSymbols_Ness_Intro:
  .string "ftDemoIntroMotionFileNess"
  .align 2
  DemoFileSymbols_Ness_Ending:
  .string "ftDemoEndingMotionFileNess"
  .align 2
  DemoFileSymbols_Ness_Wait:
  .string "ftDemoViWaitMotionFileNess"
  .align 2

  #Peach
  DemoFileSymbols_Peach_Result:
  .string "ftDemoResultMotionFilePeach"
  .align 2
  DemoFileSymbols_Peach_Intro:
  .string "ftDemoIntroMotionFilePeach"
  .align 2
  DemoFileSymbols_Peach_Ending:
  .string "ftDemoEndingMotionFilePeach"
  .align 2
  DemoFileSymbols_Peach_Wait:
  .string "ftDemoViWaitMotionFilePeach"
  .align 2

  #Popo
  DemoFileSymbols_Popo_Result:
  .string "ftDemoResultMotionFilePopo"
  .align 2
  DemoFileSymbols_Popo_Intro:
  .string "ftDemoIntroMotionFilePopo"
  .align 2
  DemoFileSymbols_Popo_Ending:
  .string "ftDemoEndingMotionFilePopo"
  .align 2
  DemoFileSymbols_Popo_Wait:
  .string "ftDemoViWaitMotionFilePopo"
  .align 2

  #Nana
  DemoFileSymbols_Nana_Result:
  .string "ftDemoResultMotionFileNana"
  .align 2
  DemoFileSymbols_Nana_Intro:
  .string "ftDemoIntroMotionFileNana"
  .align 2
  DemoFileSymbols_Nana_Ending:
  .string "ftDemoEndingMotionFileNana"
  .align 2
  DemoFileSymbols_Nana_Wait:
  .string "ftDemoViWaitMotionFilePopo"
  .align 2

  #Pikachu
  DemoFileSymbols_Pikachu_Result:
  .string "ftDemoResultMotionFilePikachu"
  .align 2
  DemoFileSymbols_Pikachu_Intro:
  .string "ftDemoIntroMotionFilePikachu"
  .align 2
  DemoFileSymbols_Pikachu_Ending:
  .string "ftDemoEndingMotionFilePikachu"
  .align 2
  DemoFileSymbols_Pikachu_Wait:
  .string "ftDemoViWaitMotionFilePikachu"
  .align 2

  #Samus
  DemoFileSymbols_Samus_Result:
  .string "ftDemoResultMotionFileSamus"
  .align 2
  DemoFileSymbols_Samus_Intro:
  .string "ftDemoIntroMotionFileSamus"
  .align 2
  DemoFileSymbols_Samus_Ending:
  .string "ftDemoEndingMotionFileSamus"
  .align 2
  DemoFileSymbols_Samus_Wait:
  .string "ftDemoViWaitMotionFileSamus"
  .align 2

  #Yoshi
  DemoFileSymbols_Yoshi_Result:
  .string "ftDemoResultMotionFileYoshi"
  .align 2
  DemoFileSymbols_Yoshi_Intro:
  .string "ftDemoIntroMotionFileYoshi"
  .align 2
  DemoFileSymbols_Yoshi_Ending:
  .string "ftDemoEndingMotionFileYoshi"
  .align 2
  DemoFileSymbols_Yoshi_Wait:
  .string "ftDemoViWaitMotionFileYoshi"
  .align 2

  #Jigglypuff
  DemoFileSymbols_Jigglypuff_Result:
  .string "ftDemoResultMotionFilePurin"
  .align 2
  DemoFileSymbols_Jigglypuff_Intro:
  .string "ftDemoIntroMotionFilePurin"
  .align 2
  DemoFileSymbols_Jigglypuff_Ending:
  .string "ftDemoEndingMotionFilePurin"
  .align 2
  DemoFileSymbols_Jigglypuff_Wait:
  .string "ftDemoViWaitMotionFilePurin"
  .align 2

  #Mewtwo
  DemoFileSymbols_Mewtwo_Result:
  .string "ftDemoResultMotionFileMewtwo"
  .align 2
  DemoFileSymbols_Mewtwo_Intro:
  .string "ftDemoIntroMotionFileMewtwo"
  .align 2
  DemoFileSymbols_Mewtwo_Ending:
  .string "ftDemoEndingMotionFileMewtwo"
  .align 2
  DemoFileSymbols_Mewtwo_Wait:
  .string "ftDemoViWaitMotionFileMewtwo"
  .align 2

  #Luigi
  DemoFileSymbols_Luigi_Result:
  .string "ftDemoResultMotionFileLuigi"
  .align 2
  DemoFileSymbols_Luigi_Intro:
  .string "ftDemoIntroMotionFileLuigi"
  .align 2
  DemoFileSymbols_Luigi_Ending:
  .string "ftDemoEndingMotionFileLuigi"
  .align 2
  DemoFileSymbols_Luigi_Wait:
  .string "ftDemoViWaitMotionFileLuigi"
  .align 2

  #Marth
  DemoFileSymbols_Marth_Result:
  .string "ftDemoResultMotionFileMars"
  .align 2
  DemoFileSymbols_Marth_Intro:
  .string "ftDemoIntroMotionFileMars"
  .align 2
  DemoFileSymbols_Marth_Ending:
  .string "ftDemoEndingMotionFileMars"
  .align 2
  DemoFileSymbols_Marth_Wait:
  .string "ftDemoViWaitMotionFileMars"
  .align 2

  #Zelda
  DemoFileSymbols_Zelda_Result:
  .string "ftDemoResultMotionFileZelda"
  .align 2
  DemoFileSymbols_Zelda_Intro:
  .string "ftDemoIntroMotionFileZelda"
  .align 2
  DemoFileSymbols_Zelda_Ending:
  .string "ftDemoEndingMotionFileZelda"
  .align 2
  DemoFileSymbols_Zelda_Wait:
  .string "ftDemoViWaitMotionFileZelda"
  .align 2

  #YoungLink
  DemoFileSymbols_YoungLink_Result:
  .string "ftDemoResultMotionFileClink"
  .align 2
  DemoFileSymbols_YoungLink_Intro:
  .string "ftDemoIntroMotionFileClink"
  .align 2
  DemoFileSymbols_YoungLink_Ending:
  .string "ftDemoEndingMotionFileClink"
  .align 2
  DemoFileSymbols_YoungLink_Wait:
  .string "ftDemoViWaitMotionFileClink"
  .align 2

  #DrMario
  DemoFileSymbols_DrMario_Result:
  .string "ftDemoResultMotionFileDrmario"
  .align 2
  DemoFileSymbols_DrMario_Intro:
  .string "ftDemoIntroMotionFileDrmario"
  .align 2
  DemoFileSymbols_DrMario_Ending:
  .string "ftDemoEndingMotionFileDrmario"
  .align 2
  DemoFileSymbols_DrMario_Wait:
  .string "ftDemoViWaitMotionFileDrmario"
  .align 2

  #Falco
  DemoFileSymbols_Falco_Result:
  .string "ftDemoResultMotionFileFalco"
  .align 2
  DemoFileSymbols_Falco_Intro:
  .string "ftDemoIntroMotionFileFalco"
  .align 2
  DemoFileSymbols_Falco_Ending:
  .string "ftDemoEndingMotionFileFalco"
  .align 2
  DemoFileSymbols_Falco_Wait:
  .string "ftDemoViWaitMotionFileFalco"
  .align 2

  #Pichu
  DemoFileSymbols_Pichu_Result:
  .string "ftDemoResultMotionFilePichu"
  .align 2
  DemoFileSymbols_Pichu_Intro:
  .string "ftDemoIntroMotionFilePichu"
  .align 2
  DemoFileSymbols_Pichu_Ending:
  .string "ftDemoEndingMotionFilePichu"
  .align 2
  DemoFileSymbols_Pichu_Wait:
  .string "ftDemoViWaitMotionFilePichu"
  .align 2

  #GaW
  DemoFileSymbols_GaW_Result:
  .string "ftDemoResultMotionFileGamewatch"
  .align 2
  DemoFileSymbols_GaW_Intro:
  .string "ftDemoIntroMotionFileGamewatch"
  .align 2
  DemoFileSymbols_GaW_Ending:
  .string "ftDemoEndingMotionFileGamewatch"
  .align 2
  DemoFileSymbols_GaW_Wait:
  .string "ftDemoViWaitMotionFileGamewatch"
  .align 2

  #Ganondorf
  DemoFileSymbols_Ganondorf_Result:
  .string "ftDemoResultMotionFileGanon"
  .align 2
  DemoFileSymbols_Ganondorf_Intro:
  .string "ftDemoIntroMotionFileGanon"
  .align 2
  DemoFileSymbols_Ganondorf_Ending:
  .string "ftDemoEndingMotionFileGanon"
  .align 2
  DemoFileSymbols_Ganondorf_Wait:
  .string "ftDemoViWaitMotionFileGanon"
  .align 2

  #NewChar1
  DemoFileSymbols_NewChar1_Result:
    .ascii "ftDemoResultMotionFile"
    NewChar1_LongName
    .byte 0
    .align 2
    DemoFileSymbols_NewChar1_Intro:
    .string "ftDemoIntroMotionFile"
    NewChar1_LongName
    .byte 0
    .align 2
    DemoFileSymbols_NewChar1_Ending:
    .string "ftDemoEndingMotionFile"
    NewChar1_LongName
    .byte 0
    .align 2
    DemoFileSymbols_NewChar1_Wait:
    .string "ftDemoViWaitMotionFile"
    NewChar1_LongName
    .byte 0
    .align 2

MnSlChr_DefineIDs:
  blrl
  #Falcon
  .byte 0x2 #Internal ID
  .byte 0xff #Subchar Internal ID
  .byte 0x0 #SubcharType
  #DK
  .byte 0x3 #Internal ID
  .byte 0xff #Subchar Internal ID
  .byte 0x0 #SubcharType
  #Fox
  .byte 0x1 #Internal ID
  .byte 0xff #Subchar Internal ID
  .byte 0x0 #SubcharType
  #GaW
  .byte 0x18 #Internal ID
  .byte 0xff #Subchar Internal ID
  .byte 0x0 #SubcharType
  #Kirby
  .byte 0x4 #Internal ID
  .byte 0xff #Subchar Internal ID
  .byte 0x0 #SubcharType
  #Bowser
  .byte 0x5 #Internal ID
  .byte 0xff #Subchar Internal ID
  .byte 0x0 #SubcharType
  #Link
  .byte 0x6 #Internal ID
  .byte 0xff #Subchar Internal ID
  .byte 0x0 #SubcharType
  #Luigi
  .byte 0x11 #Internal ID
  .byte 0xff #Subchar Internal ID
  .byte 0x0 #SubcharType
  #Mario
  .byte 0x0 #Internal ID
  .byte 0xff #Subchar Internal ID
  .byte 0x0 #SubcharType
  #Marth
  .byte 0x12 #Internal ID
  .byte 0xff #Subchar Internal ID
  .byte 0x0 #SubcharType
  #Mewtwo
  .byte 0x10 #Internal ID
  .byte 0xff #Subchar Internal ID
  .byte 0x0 #SubcharType
  #Ness
  .byte 0x8 #Internal ID
  .byte 0xff #Subchar Internal ID
  .byte 0x0 #SubcharType
  #Peach
  .byte 0x9 #Internal ID
  .byte 0xff #Subchar Internal ID
  .byte 0x0 #SubcharType
  #Pikachu
  .byte 0xc #Internal ID
  .byte 0xff #Subchar Internal ID
  .byte 0x0 #SubcharType
  #IceClimbers
  .byte 0xa #Internal ID
  .byte 0xb #Subchar Internal ID
  .byte 0x0 #SubcharType
  #Jigglypuff
  .byte 0xf #Internal ID
  .byte 0xff #Subchar Internal ID
  .byte 0x0 #SubcharType
  #Samus
  .byte 0xd #Internal ID
  .byte 0xff #Subchar Internal ID
  .byte 0x0 #SubcharType
  #Yoshi
  .byte 0xe #Internal ID
  .byte 0xff #Subchar Internal ID
  .byte 0x0 #SubcharType
  #Zelda
  .byte 0x13 #Internal ID
  .byte 0x7 #Subchar Internal ID
  .byte 0x1 #SubcharType
  #Sheik
  .byte 0x7 #Internal ID
  .byte 0x13 #Subchar Internal ID
  .byte 0x1 #SubcharType
  #Falco
  .byte 0x16 #Internal ID
  .byte 0xff #Subchar Internal ID
  .byte 0x0 #SubcharType
  #YoungLink
  .byte 0x14 #Internal ID
  .byte 0xff #Subchar Internal ID
  .byte 0x0 #SubcharType
  #DrMario
  .byte 0x15 #Internal ID
  .byte 0xff #Subchar Internal ID
  .byte 0x0 #SubcharType
  #Roy
  .byte 0x1a #Internal ID
  .byte 0xff #Subchar Internal ID
  .byte 0x0 #SubcharType
  #Pichu
  .byte 0x17 #Internal ID
  .byte 0xff #Subchar Internal ID
  .byte 0x0 #SubcharType
  #Ganondorf
  .byte 0x19 #Internal ID
  .byte 0xff #Subchar Internal ID
  .byte 0x0 #SubcharType
  #NewChar1
  .byte NewChar1_InternalID         #Internal ID
  .byte NewChar1_SubcharInternalID  #Subchar Internal ID
  .byte NewChar1_SubcharType        #SubcharType
  #MasterHand
  .byte 0x1c #Internal ID
  .byte 0xff #Subchar Internal ID
  .byte 0x0 #SubcharType
  #WireframeBoy
  .byte 0x1e #Internal ID
  .byte 0xff #Subchar Internal ID
  .byte 0x0 #SubcharType
  #WireframeGirl
  .byte 0x1f #Internal ID
  .byte 0xff #Subchar Internal ID
  .byte 0x0 #SubcharType
  #GigaBowser
  .byte 0x20 #Internal ID
  .byte 0xff #Subchar Internal ID
  .byte 0x0 #SubcharType
  #CrazyHand
  .byte 0x1d #Internal ID
  .byte 0xff #Subchar Internal ID
  .byte 0x0 #SubcharType
  #Sandbag
  .byte 0x21 #Internal ID
  .byte 0xff #Subchar Internal ID
  .byte 0x0 #SubcharType
  #Popo
  .byte 0xa #Internal ID
  .byte 0xff #Subchar Internal ID
  .byte 0x0 #SubcharType
  .align 2

SFX_NameDef:
  blrl
  .long 510000          #Falcon
  .long 510001          #DK
  .long 510005          #Fox
  .long 510010          #GaW
  .long 510015          #Kirby
  .long 510016          #Bowser
  .long 510018          #Link
  .long 510020          #Luigi
  .long 510021          #Mario
  .long 510022          #Marth
  .long 510024          #Mewtwo
  .long 510026          #Ness
  .long 510027          #Peach
  .long 510029          #Pikachu
  .long 510011          #IceClimbers
  .long 510013          #Jigglypuff
  .long 510030          #Samus
  .long 510031          #Yoshi
  .long 510033          #Zelda
  .long 510032          #Sheik
  .long 510004          #Falco
  .long 510019          #YoungLink
  .long 510002          #DrMario
  .long 510012          #Roy
  .long 510028          #Pichu
  .long 510006          #Ganondorf
  .long NewChar1_NrNameSFXID          #Placeholder
  .long 510025          #MasterHand
  .long 510003          #WireframeBoy
  .long 510003          #WireframeGirl
  .long 510008          #GigaBowser
  .long 510025          #CrazyHand
  .long 510024          #Sandbag
  .long 510011          #Popo

MnSlChr_CharSSMFileIDs:
  blrl
  #Falcon SSM Data
  .long 0x06000000
  .long 0x00000000
  .long 0x00000000
  .long 0x00000040

  #DK SSM Data
  .long 0x08000000
  .long 0x00000000
  .long 0x00000000
  .long 0x00000100

  #Fox SSM Data
  .long 0x0b000000
  .long 0x00000000
  .long 0x00000000
  .long 0x00000800

  #GaW SSM Data
  .long 0x1d000000
  .long 0x00000000
  .long 0x00000000
  .long 0x20000000

  #Kirby SSM Data
  .long 0x0e000000
  .long 0x00000000
  .long 0x00000000
  .long 0x00004000

  #Bowser SSM Data
  .long 0x0f000000
  .long 0x00000000
  .long 0x00000000
  .long 0x00008000

  #Link SSM Data
  .long 0x10000000
  .long 0x00000000
  .long 0x00000000
  .long 0x00010000

  #Luigi SSM Data
  .long 0x11000000
  .long 0x00000000
  .long 0x00000000
  .long 0x00020000

  #Mario SSM Data
  .long 0x12000000
  .long 0x00000000
  .long 0x00000000
  .long 0x00040000

  #Marth SSM Data
  .long 0x13000000
  .long 0x00000000
  .long 0x00000000
  .long 0x00080000

  #Mewtwo SSM Data
  .long 0x14000000
  .long 0x00000000
  .long 0x00000000
  .long 0x00100000

  #Ness SSM Data
  .long 0x15000000
  .long 0x00000000
  .long 0x00000000
  .long 0x00200000

  #Peach SSM Data
  .long 0x16000000
  .long 0x00000000
  .long 0x00000000
  .long 0x00400000

  #Pikachu SSM Data
  .long 0x18000000
  .long 0x00000000
  .long 0x00000000
  .long 0x01000000

  #IceClimbers SSM Data
  .long 0x0d000000
  .long 0x00000000
  .long 0x00000000
  .long 0x00002000

  #Jigglypuff SSM Data
  .long 0x19000000
  .long 0x00000000
  .long 0x00000000
  .long 0x02000000

  #Samus SSM Data
  .long 0x1a000000
  .long 0x00000000
  .long 0x00000000
  .long 0x04000000

  #Yoshi SSM Data
  .long 0x1c000000
  .long 0x00000000
  .long 0x00000000
  .long 0x10000000

  #Zelda SSM Data
  .long 0x1b000000
  .long 0x00000000
  .long 0x00000000
  .long 0x08000000

  #Sheik SSM Data
  .long 0x1b000000
  .long 0x00000000
  .long 0x00000000
  .long 0x08000000

  #Falco SSM Data
  .long 0x0a000000
  .long 0x00000000
  .long 0x00000000
  .long 0x00000400

  #YoungLink SSM Data
  .long 0x07000000
  .long 0x00000000
  .long 0x00000000
  .long 0x00000080

  #DrMario SSM Data
  .long 0x09000000
  .long 0x00000000
  .long 0x00000000
  .long 0x00000200

  #Roy SSM Data
  .long 0x1f000000
  .long 0x00000000
  .long 0x00000000
  .long 0x80000000

  #Pichu SSM Data
  .long 0x17000000
  .long 0x00000000
  .long 0x00000000
  .long 0x00800000

  #Ganondorf SSM Data
  .long 0x1e000000
  .long 0x00000000
  .long 0x00000000
  .long 0x40000000

  #NewChar1 SSM Data
  .long 0x16000000 #first byte here is ssm ID
  .long 0x00000000
  .long 0x00800000
  .long 0x00000000

  #MasterHand SSM Data
  .long 0x20000000
  .long 0x00000000
  .long 0x00000001
  .long 0x00000000

  #WireframeBoy SSM Data
  .long 0x37000000
  .long 0x00000000
  .long 0x00000000
  .long 0x00000000

  #WireframeGirl SSM Data
  .long 0x37000000
  .long 0x00000000
  .long 0x00000000
  .long 0x00000000

  #GigaBowser SSM Data
  .long 0x0c000000
  .long 0x00000000
  .long 0x00000000
  .long 0x00001000

  #CrazyHand SSM Data
  .long 0x20000000
  .long 0x00000000
  .long 0x00000001
  .long 0x00000000

  #Sandbag SSM Data
  .long 0x37000000
  .long 0x00000000
  .long 0x00000000
  .long 0x00000000

  #Popo SSM Data
  .long 0x0d000000
  .long 0x00000000
  .long 0x00000000
  .long 0x00002000

MnSlChr_SSMFiles:
  blrl
  bl MnSlChrSSMFile_Main
  bl MnSlChrSSMFile_Pokemon
  bl MnSlChrSSMFile_Nr_Title
  bl MnSlChrSSMFile_Nr_Select
  bl MnSlChrSSMFile_Nr_1P
  bl MnSlChrSSMFile_Nr_VS
  bl MnSlChrSSMFile_Falcon
  bl MnSlChrSSMFile_YoungLink
  bl MnSlChrSSMFile_DK
  bl MnSlChrSSMFile_DrMario
  bl MnSlChrSSMFile_Falco #10
  bl MnSlChrSSMFile_Fox
  bl MnSlChrSSMFile_GigaBowser
  bl MnSlChrSSMFile_IceClimber
  bl MnSlChrSSMFile_Kirby
  bl MnSlChrSSMFile_Bowser
  bl MnSlChrSSMFile_Link
  bl MnSlChrSSMFile_Luigi
  bl MnSlChrSSMFile_Mario
  bl MnSlChrSSMFile_Marth
  bl MnSlChrSSMFile_Mewtwo    #20
  bl MnSlChrSSMFile_Ness
  bl MnSlChrSSMFile_Peach
  bl MnSlChrSSMFile_Pichu
  bl MnSlChrSSMFile_Pikachu
  bl MnSlChrSSMFile_Jigglypuff
  bl MnSlChrSSMFile_Samus
  bl MnSlChrSSMFile_ZeldaSheik
  bl MnSlChrSSMFile_Yoshi
  bl MnSlChrSSMFile_GaW
  bl MnSlChrSSMFile_Ganondorf #30
  bl MnSlChrSSMFile_Roy
  bl MnSlChrSSMFile_Hands
  bl MnSlChrSSMFile_KirbyTM
  bl MnSlChrSSMFile_Castle
  bl MnSlChrSSMFile_Corneria
  bl MnSlChrSSMFile_GreatBay
  bl MnSlChrSSMFile_Kongo
  bl MnSlChrSSMFile_MuteCity
  bl MnSlChrSSMFile_Onett
  bl MnSlChrSSMFile_PlanetZebes   #40
  bl MnSlChrSSMFile_Garden
  bl MnSlChrSSMFile_Kraid
  bl MnSlChrSSMFile_GreenGreens
  bl MnSlChrSSMFile_Venom
  bl MnSlChrSSMFile_BigBlue
  bl MnSlChrSSMFile_Fourside
  bl MnSlChrSSMFile_Dreamland
  bl MnSlChrSSMFile_PokemonStadium
  bl MnSlChrSSMFile_1P_Adventure
  bl MnSlChrSSMFile_Ending    #ID 50
  bl MnSlChrSSMFile_Nr_Names
  bl MnSlChrSSMFile_1P_End
  bl MnSlChrSSMFile_FinalDestination
  bl MnSlChrSSMFile_End #ID 54
  bl MnSlChrSSMFile_NewChar1
  .long -1
  MnSlChrSSMFile_NewChar1:
    NewChar1_SoundName
    .ascii ".ssm"
    .align 2
  MnSlChrSSMFile_Main:
  .string "main.ssm"
  .align 2
  MnSlChrSSMFile_Pokemon:
  .string "pokemon.ssm"
  .align 2
  MnSlChrSSMFile_Nr_Title:
  .string "nr_title.ssm"
  .align 2
  MnSlChrSSMFile_Nr_Select:
  .string "nr_select.ssm"
  .align 2
  MnSlChrSSMFile_Nr_1P:
  .string "nr_1p.ssm"
  .align 2
  MnSlChrSSMFile_Nr_VS:
  .string "nr_vs.ssm"
  .align 2
  MnSlChrSSMFile_Falcon:
  .string "captain.ssm"
  .align 2
  MnSlChrSSMFile_YoungLink:
  .string "clink.ssm"
  .align 2
  MnSlChrSSMFile_DK:
  .string "dk.ssm"
  .align 2
  MnSlChrSSMFile_DrMario:
  .string "drmario.ssm"
  .align 2
  MnSlChrSSMFile_Falco:
  .string "falco.ssm"
  .align 2
  MnSlChrSSMFile_Fox:
  .string "fox.ssm"
  .align 2
  MnSlChrSSMFile_GigaBowser:
  .string "gkoopa.ssm"
  .align 2
  MnSlChrSSMFile_IceClimber:
  .string "ice.ssm"
  .align 2
  MnSlChrSSMFile_Kirby:
  .string "kirby.ssm"
  .align 2
  MnSlChrSSMFile_Bowser:
  .string "koopa.ssm"
  .align 2
  MnSlChrSSMFile_Link:
  .string "link.ssm"
  .align 2
  MnSlChrSSMFile_Luigi:
  .string "luigi.ssm"
  .align 2
  MnSlChrSSMFile_Mario:
  .string "mario.ssm"
  .align 2
  MnSlChrSSMFile_Marth:
  .string "mars.ssm"
  .align 2
  MnSlChrSSMFile_Mewtwo:
  .string "mewtwo.ssm"
  .align 2
  MnSlChrSSMFile_Ness:
  .string "ness.ssm"
  .align 2
  MnSlChrSSMFile_Peach:
  .string "peach.ssm"
  .align 2
  MnSlChrSSMFile_Pichu:
  .string "pichu.ssm"
  .align 2
  MnSlChrSSMFile_Pikachu:
  .string "pikachu.ssm"
  .align 2
  MnSlChrSSMFile_Jigglypuff:
  .string "purin.ssm"
  .align 2
  MnSlChrSSMFile_Samus:
  .string "samus.ssm"
  .align 2
  MnSlChrSSMFile_ZeldaSheik:
  .string "zs.ssm"
  .align 2
  MnSlChrSSMFile_Yoshi:
  .string "yoshi.ssm"
  .align 2
  MnSlChrSSMFile_GaW:
  .string "gw.ssm"
  .align 2
  MnSlChrSSMFile_Ganondorf:
  .string "ganon.ssm"
  .align 2
  MnSlChrSSMFile_Roy:
  .string "emblem.ssm"
  .align 2
  MnSlChrSSMFile_Hands:
  .string "mhands.ssm"
  .align 2
  MnSlChrSSMFile_KirbyTM:
  .string "kirbytm.ssm"
  .align 2
  MnSlChrSSMFile_Castle:
  .string "castle.ssm"
  .align 2
  MnSlChrSSMFile_Corneria:
  .string "corneria.ssm"
  .align 2
  MnSlChrSSMFile_GreatBay:
  .string "greatbay.ssm"
  .align 2
  MnSlChrSSMFile_Kongo:
  .string "kongo.ssm"
  .align 2
  MnSlChrSSMFile_MuteCity:
  .string "mutecity.ssm"
  .align 2
  MnSlChrSSMFile_Onett:
  .string "onett.ssm"
  .align 2
  MnSlChrSSMFile_PlanetZebes:
  .string "zebes.ssm"
  .align 2
  MnSlChrSSMFile_Garden:
  .string "garden.ssm"
  .align 2
  MnSlChrSSMFile_Kraid:
  .string "klaid.ssm"
  .align 2
  MnSlChrSSMFile_GreenGreens:
  .string "greens.ssm"
  .align 2
  MnSlChrSSMFile_Venom:
  .string "venom.ssm"
  .align 2
  MnSlChrSSMFile_BigBlue:
  .string "bigblue.ssm"
  .align 2
  MnSlChrSSMFile_Fourside:
  .string "fourside.ssm"
  .align 2
  MnSlChrSSMFile_Dreamland:
  .string "pupupu.ssm"
  .align 2
  MnSlChrSSMFile_PokemonStadium:
  .string "pstadium.ssm"
  .align 2
  MnSlChrSSMFile_1P_Adventure:
  .string "1padv.ssm"
  .align 2
  MnSlChrSSMFile_Ending:
  .string "ending.ssm"
  .align 2
  MnSlChrSSMFile_Nr_Names:
  .string "nr_name.ssm"
  .align 2
  MnSlChrSSMFile_1P_End:
  .string "1pend.ssm"
  .align 2
  MnSlChrSSMFile_FinalDestination:
  .string "last.ssm"
  .align 2
  MnSlChrSSMFile_End:
  .string "end.ssm"
  .align 2

MnSlChr_SSMStruct:
  #Originally started at 80433710
  blrl
  #Header
    .rept   45
    .long   0
    .endr
  #Disposable SSM's
  #Sruct
    .rept   55 + NumOfAddedChars
    .long   0
    .endr
  #Copy
    .rept   55 + NumOfAddedChars
    .long   0
    .endr
  #Persistent SSM's
  #Struct
    .rept   55 + NumOfAddedChars
    .long   0
    .endr
  #Copy
    .rept   55 + NumOfAddedChars
    .long   0
    .endr
  #Footer Struct
    .rept   56 + NumOfAddedChars
    .long   0
    .endr

SSM_IDDefinitions:
  #Originally @ 803bb8d4
  blrl
  #Main
  .long 0x0        #First SFX ID
  .long 0x20f      #Last SFX ID
  #Pokemon
  .long 0x2710     #First SFX ID
  .long 0x2750     #Last SFX ID
  #Nr_Title
  .long 0x4e20     #First SFX ID
  .long 0x4e25     #Last SFX ID
  #Nr_Select
  .long 0x7530     #First SFX ID
  .long 0x7546     #Last SFX ID
  #Nr_1P
  .long 0x9c40     #First SFX ID
  .long 0x9c4a     #Last SFX ID
  #Nr_VS
  .long 0xc350     #First SFX ID
  .long 0xc356     #Last SFX ID
  #Falcon
  .long 0xea60     #First SFX ID
  .long 0xeab4     #Last SFX ID
  #YoungLink
  .long 0x11170    #First SFX ID
  .long 0x111df    #Last SFX ID
  #DK
  .long 0x13880    #First SFX ID
  .long 0x138c2    #Last SFX ID
  #DrMario
  .long 0x15f90    #First SFX ID
  .long 0x15ff5    #Last SFX ID
  #Falco
  .long 0x186a0    #First SFX ID
  .long 0x1871c    #Last SFX ID
  #Fox
  .long 0x1adb0    #First SFX ID
  .long 0x1ae30    #Last SFX ID
  #GigaBowser
  .long 0x1d4c0    #First SFX ID
  .long 0x1d504    #Last SFX ID
  #IceClimber
  .long 0x1fbd0    #First SFX ID
  .long 0x1fcc8    #Last SFX ID
  #Kirby
  .long 0x222e0    #First SFX ID
  .long 0x22379    #Last SFX ID
  #Bowser
  .long 0x249f0    #First SFX ID
  .long 0x24a3f    #Last SFX ID
  #Link
  .long 0x27100    #First SFX ID
  .long 0x2716c    #Last SFX ID
  #Luigi
  .long 0x29810    #First SFX ID
  .long 0x29877    #Last SFX ID
  #Mario
  .long 0x2bf20    #First SFX ID
  .long 0x2bf7d    #Last SFX ID
  #Marth
  .long 0x2e630    #First SFX ID
  .long 0x2e6b4    #Last SFX ID
  #Mewtwo
  .long 0x30d40    #First SFX ID
  .long 0x30dd3    #Last SFX ID
  #Ness
  .long 0x33450    #First SFX ID
  .long 0x334b5    #Last SFX ID
  #Peach
  .long 0x35b60    #First SFX ID
  .long 0x35bba    #Last SFX ID
  #Pichu
  .long 0x38270    #First SFX ID
  .long 0x382d0    #Last SFX ID
  #Pikachu
  .long 0x3a980    #First SFX ID
  .long 0x3a9e6    #Last SFX ID
  #Jigglypuff
  .long 0x3d090    #First SFX ID
  .long 0x3d0de    #Last SFX ID
  #Samus
  .long 0x3f7a0    #First SFX ID
  .long 0x3f7ea    #Last SFX ID
  #ZeldaSheik
  .long 0x41eb0    #First SFX ID
  .long 0x41f77    #Last SFX ID
  #Yoshi
  .long 0x445c0    #First SFX ID
  .long 0x44623    #Last SFX ID
  #GaW
  .long 0x46cd0    #First SFX ID
  .long 0x46d17    #Last SFX ID
  #Ganondorf
  .long 0x493e0    #First SFX ID
  .long 0x4943a    #Last SFX ID
  #Roy
  .long 0x4baf0    #First SFX ID
  .long 0x4bb73    #Last SFX ID
  #Hands
  .long 0x4e200    #First SFX ID
  .long 0x4e21d    #Last SFX ID
  #KirbyTM
  .long 0x50910    #First SFX ID
  .long 0x509ed    #Last SFX ID
  #Castle
  .long 0x53020    #First SFX ID
  .long 0x53027    #Last SFX ID
  #Corneria
  .long 0x55730    #First SFX ID
  .long 0x55749    #Last SFX ID
  #GreatBay
  .long 0x57e40    #First SFX ID
  .long 0x57e4a    #Last SFX ID
  #Kongo
  .long 0x5a550    #First SFX ID
  .long 0x5a551    #Last SFX ID
  #MuteCity
  .long 0x5cc60    #First SFX ID
  .long 0x5cc6a    #Last SFX ID
  #Onett
  .long 0x5f370    #First SFX ID
  .long 0x5f37d    #Last SFX ID
  #PlanetZebes
  .long 0x61a80    #First SFX ID
  .long 0x61a8b    #Last SFX ID
  #Garden
  .long 0x64190    #First SFX ID
  .long 0x64194    #Last SFX ID
  #Kraid
  .long 0x668a0    #First SFX ID
  .long 0x668a8    #Last SFX ID
  #GreenGreens
  .long 0x68fb0    #First SFX ID
  .long 0x68fb9    #Last SFX ID
  #Venom
  .long 0x6b6c0    #First SFX ID
  .long 0x6b6d8    #Last SFX ID
  #BigBlue
  .long 0x6ddd0    #First SFX ID
  .long 0x6ddd6    #Last SFX ID
  #Fourside
  .long 0x704e0    #First SFX ID
  .long 0x704e4    #Last SFX ID
  #Dreamland
  .long 0x72bf0    #First SFX ID
  .long 0x72bf8    #Last SFX ID
  #PokemonStadium
  .long 0x75300    #First SFX ID
  .long 0x75301    #Last SFX ID
  #1P_Adventure
  .long 0x77a10    #First SFX ID
  .long 0x77a16    #Last SFX ID
  #Ending
  .long 0x7a120    #First SFX ID
  .long 0x7a12f    #Last SFX ID
  #Nr_Names
  .long 0x7c830    #First SFX ID
  .long 0x7c865    #Last SFX ID
  #1P_End
  .long 0x7ef40    #First SFX ID
  .long 0x7ef41    #Last SFX ID
  #FinalDestination
  .long 0x81650    #First SFX ID
  .long 0x81654    #Last SFX ID
  #Battlefield
  .long 0x83d60    #First SFX ID
  .long 0x83d60    #Last SFX ID
  #NewChar1
  .long 550000    #First SFX ID
  .long 550000 + 0x5D    #Last SFX ID

SSM_BankSizes:
  blrl
  #Originally located at 0x803bc4e4
  #Main
  .long 0x1f3780   #Bank Size
  .long 0x0        #Unk
  #Pokemon
  .long 0x89260    #Bank Size
  .long 0x1        #Unk
  #Nr_Title
  .long 0x255c0    #Bank Size
  .long 0x0        #Unk
  #Nr_Select
  .long 0x3a6a0    #Bank Size
  .long 0x1        #Unk
  #Nr_1P
  .long 0x1dc20    #Bank Size
  .long 0x0        #Unk
  #Nr_VS
  .long 0xd3a0     #Bank Size
  .long 0x0        #Unk
  #Falcon
  .long 0x6c3c0    #Bank Size
  .long 0x1        #Unk
  #YoungLink
  .long 0x48da0    #Bank Size
  .long 0x0        #Unk
  #DK
  .long 0x32620    #Bank Size
  .long 0x0        #Unk
  #DrMario
  .long 0x691e0    #Bank Size
  .long 0x1        #Unk
  #Falco
  .long 0x926a0    #Bank Size
  .long 0x1        #Unk
  #Fox
  .long 0x8bf20    #Bank Size
  .long 0x1        #Unk
  #GigaBowser
  .long 0x77200    #Bank Size
  .long 0x0        #Unk
  #IceClimber
  .long 0x749a0    #Bank Size
  .long 0x1        #Unk
  #Kirby
  .long 0x8f1e0    #Bank Size
  .long 0x1        #Unk
  #Bowser
  .long 0x809a0    #Bank Size
  .long 0x1        #Unk
  #Link
  .long 0x503e0    #Bank Size
  .long 0x1        #Unk
  #Luigi
  .long 0x5b100    #Bank Size
  .long 0x1        #Unk
  #Mario
  .long 0x5b000    #Bank Size
  .long 0x0        #Unk
  #Marth
  .long 0x7d440    #Bank Size
  .long 0x1        #Unk
  #Mewtwo
  .long 0x896e0    #Bank Size
  .long 0x1        #Unk
  #Ness
  .long 0x7c460    #Bank Size
  .long 0x0        #Unk
  #Peach
  .long 0x65be0    #Bank Size
  .long 0x1        #Unk
  #Pichu
  .long 0x8da20    #Bank Size
  .long 0x1        #Unk
  #Pikachu
  .long 0x95ae0    #Bank Size
  .long 0x1        #Unk
  #Jigglypuff
  .long 0x51ac0    #Bank Size
  .long 0x1        #Unk
  #Samus
  .long 0x4de40    #Bank Size
  .long 0x1        #Unk
  #ZeldaSheik
  .long 0x90160    #Bank Size
  .long 0x1        #Unk
  #Yoshi
  .long 0x4e7c0    #Bank Size
  .long 0x1        #Unk
  #GaW
  .long 0x285e0    #Bank Size
  .long 0x1        #Unk
  #Ganondorf
  .long 0x68760    #Bank Size
  .long 0x1        #Unk
  #Roy
  .long 0x78fa0    #Bank Size
  .long 0x1        #Unk
  #Hands
  .long 0x89a00    #Bank Size
  .long 0x0        #Unk
  #KirbyTM
  .long 0x8bda0    #Bank Size
  .long 0x0        #Unk
  #Castle
  .long 0x2b060    #Bank Size
  .long 0x0        #Unk
  #Corneria
  .long 0x6bda0    #Bank Size
  .long 0x1        #Unk
  #GreatBay
  .long 0x77b00    #Bank Size
  .long 0x0        #Unk
  #Kongo
  .long 0x57e80    #Bank Size
  .long 0x0        #Unk
  #MuteCity
  .long 0x24a80    #Bank Size
  .long 0x0        #Unk
  #Onett
  .long 0xd3c0     #Bank Size
  .long 0x0        #Unk
  #PlanetZebes
  .long 0x5eb20    #Bank Size
  .long 0x0        #Unk
  #Garden
  .long 0x68b60    #Bank Size
  .long 0x0        #Unk
  #Kraid
  .long 0x4a3e0    #Bank Size
  .long 0x0        #Unk
  #GreenGreens
  .long 0x23460    #Bank Size
  .long 0x0        #Unk
  #Venom
  .long 0x5d540    #Bank Size
  .long 0x1        #Unk
  #BigBlue
  .long 0x8840     #Bank Size
  .long 0x0        #Unk
  #Fourside
  .long 0x13300    #Bank Size
  .long 0x0        #Unk
  #Dreamland
  .long 0x1e0e0    #Bank Size
  .long 0x0        #Unk
  #PokemonStadium
  .long 0x18c80    #Bank Size
  .long 0x0        #Unk
  #1P_Adventure
  .long 0x27340    #Bank Size
  .long 0x0        #Unk
  #Ending
  .long 0x11d5e0   #Bank Size
  .long 0x0        #Unk
  #Nr_Names
  .long 0x55000    #Bank Size
  .long 0x1        #Unk
  #1P_End
  .long 0x58da0    #Bank Size
  .long 0x0        #Unk
  #FinalDestination
  .long 0xa1e60    #Bank Size
  .long 0x0        #Unk
  #Battlefield
  .long 0x600      #Bank Size
  .long 0x0        #Unk
  #NewChar1
  .long 0x5b000      #Bank Size
  .long 0x0        #Unk

####################
Fighter_OnLoad:
  blrl
  .long 0x800e0960        #Mario
  .long 0x800e57ac        #Fox
  .long 0x800e2aec        #Falcon
  .long 0x8010d9ac        #DK
  .long 0x800ee680        #Kirby
  .long 0x80132abc        #Bowser
  .long 0x800eae44        #Link
  .long 0x801100ec        #Sheik
  .long 0x8011480c        #Ness
  .long 0x8011b628        #Peach
  .long 0x8011ef3c        #Popo
  .long 0x80122edc        #Nana
  .long 0x801243e4        #Pikachu
  .long 0x8012837c        #Samus
  .long 0x8012b99c        #Yoshi
  .long 0x8013c67c        #Jigglypuff
  .long 0x80144e48        #Mewtwo
  .long 0x80142324        #Luigi
  .long 0x801364ac        #Marth
  .long 0x80139334        #Zelda
  .long 0x80148ce4        #YoungLink
  .long 0x801494e4        #DrMario
  .long 0x80149cc4        #Falco
  .long 0x80149e34        #Pichu
  .long 0x8014a37c        #GaW
  .long 0x8014ee1c        #Ganondorf
  .long 0x8014f124        #Roy
  .long 0x8011b628        #NewChar1
  .long 0x8014fc6c        #MasterHand
  .long 0x80155e1c        #CrazyHand
  .long 0x8014f3dc        #WireframeBoy
  .long 0x8014f440        #WireframeGirl
  .long 0x8014f6b8        #GigaBowser
  .long 0x8014f9d0        #Sandbag
  .long -1
Fighter_OnDeath:
  blrl
  .long 0x800e08cc        #Mario
  .long 0x800e5554        #Fox
  .long 0x800e2888        #Falcon
  .long 0x8010d740        #DK
  .long 0x800ee5c0        #Kirby
  .long 0x80132a0c        #Bowser
  .long 0x800ead84        #Link
  .long 0x80110094        #Sheik
  .long 0x801147c0        #Ness
  .long 0x8011b51c        #Peach
  .long 0x8011efe8        #Popo
  .long 0x80122f28        #Nana
  .long 0x80124474        #Pikachu
  .long 0x8012832c        #Samus
  .long 0x8012b960        #Yoshi
  .long 0x8013c318        #Jigglypuff
  .long 0x80144dfc        #Mewtwo
  .long 0x801422e8        #Luigi
  .long 0x80136258        #Marth
  .long 0x801392dc        #Zelda
  .long 0x80148c64        #YoungLink
  .long 0x8014949c        #DrMario
  .long 0x80149acc        #Falco
  .long 0x80149eac        #Pichu
  .long 0x8014a250        #GaW
  .long 0x8014ebfc        #Ganondorf
  .long 0x8014eef8        #Roy
  .long 0x8011b51c        #NewChar1
  .long 0x8014fc68        #MasterHand
  .long 0x80155e18        #CrazyHand
  .long 0x8014f1f0        #WireframeBoy
  .long 0x8014f418        #WireframeGirl
  .long 0x8014f640        #GigaBowser
  .long 0x8014f9cc        #Sandbag
  .long -1
Fighter_OnUnk1:
  blrl
  .long 0x00000000        #Mario
  .long 0x00000000        #Fox
  .long 0x00000000        #Falcon
  .long 0x00000000        #DK
  .long 0x00000000        #Kirby
  .long 0x00000000        #Bowser
  .long 0x00000000        #Link
  .long 0x00000000        #Sheik
  .long 0x00000000        #Ness
  .long 0x00000000        #Peach
  .long 0x00000000        #Popo
  .long 0x00000000        #Nana
  .long 0x00000000        #Pikachu
  .long 0x00000000        #Samus
  .long 0x00000000        #Yoshi
  .long 0x8013c340        #Jigglypuff
  .long 0x00000000        #Mewtwo
  .long 0x00000000        #Luigi
  .long 0x00000000        #Marth
  .long 0x00000000        #Zelda
  .long 0x00000000        #YoungLink
  .long 0x00000000        #DrMario
  .long 0x00000000        #Falco
  .long 0x00000000        #Pichu
  .long 0x00000000        #GaW
  .long 0x00000000        #Ganondorf
  .long 0x00000000        #Roy
  .long 0x00000000        #NewChar1
  .long 0x00000000        #MasterHand
  .long 0x00000000        #CrazyHand
  .long 0x00000000        #WireframeBoy
  .long 0x00000000        #WireframeGirl
  .long 0x00000000        #GigaBowser
  .long 0x00000000        #Sandbag
  .long -1
Fighter_MoveLogic:
  blrl
  bl FighterMoveLogic_Mario
  bl FighterMoveLogic_Fox
  bl FighterMoveLogic_Falcon
  bl FighterMoveLogic_DK
  bl FighterMoveLogic_Kirby
  bl FighterMoveLogic_Bowser
  bl FighterMoveLogic_Link
  bl FighterMoveLogic_Sheik
  bl FighterMoveLogic_Ness
  bl FighterMoveLogic_Peach
  bl FighterMoveLogic_Popo
  bl FighterMoveLogic_Nana
  bl FighterMoveLogic_Pikachu
  bl FighterMoveLogic_Samus
  bl FighterMoveLogic_Yoshi
  bl FighterMoveLogic_Jigglypuff
  bl FighterMoveLogic_Mewtwo
  bl FighterMoveLogic_Luigi
  bl FighterMoveLogic_Marth
  bl FighterMoveLogic_Zelda
  bl FighterMoveLogic_YoungLink
  bl FighterMoveLogic_DrMario
  bl FighterMoveLogic_Falco
  bl FighterMoveLogic_Pichu
  bl FighterMoveLogic_GaW
  bl FighterMoveLogic_Ganondorf
  bl FighterMoveLogic_Roy
  bl FighterMoveLogic_NewChar1
  bl FighterMoveLogic_MasterHand
  bl FighterMoveLogic_CrazyHand
  bl FighterMoveLogic_WireframeBoy
  bl FighterMoveLogic_WireframeGirl
  bl FighterMoveLogic_GigaBowser
  bl FighterMoveLogic_Sandbag
  .long -1
  FighterMoveLogic_NewChar1:
  .long 0x00000127	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8011bc38	#Animation Callback
  .long 0x8011bc8c	#IASA Callback
  .long 0x8011bd18	#Physics Callback
  .long 0x8011bd3c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000128	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8011bdf0	#Animation Callback
  .long 0x8011be2c	#IASA Callback
  .long 0x8011be30	#Physics Callback
  .long 0x8011be50	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000129	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8011bdf0	#Animation Callback
  .long 0x8011be2c	#IASA Callback
  .long 0x8011be30	#Physics Callback
  .long 0x8011be50	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000044	#Move ID
  .long 0x0024040c	#Bitflags
  .long 0x0d000000	#Attack ID
  .long 0x8011bf88	#Animation Callback
  .long 0x8011c044	#IASA Callback
  .long 0x8011c160	#Physics Callback
  .long 0x8011c198	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000045	#Move ID
  .long 0x0024040d	#Bitflags
  .long 0x0e000000	#Attack ID
  .long 0x8011bf88	#Animation Callback
  .long 0x8011c044	#IASA Callback
  .long 0x8011c160	#Physics Callback
  .long 0x8011c198	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000046	#Move ID
  .long 0x0024040e	#Bitflags
  .long 0x0f000000	#Attack ID
  .long 0x8011bf88	#Animation Callback
  .long 0x8011c044	#IASA Callback
  .long 0x8011c160	#Physics Callback
  .long 0x8011c198	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000047	#Move ID
  .long 0x0024040f	#Bitflags
  .long 0x10000000	#Attack ID
  .long 0x8011bf88	#Animation Callback
  .long 0x8011c044	#IASA Callback
  .long 0x8011c160	#Physics Callback
  .long 0x8011c198	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000048	#Move ID
  .long 0x00240410	#Bitflags
  .long 0x11000000	#Attack ID
  .long 0x8011bf88	#Animation Callback
  .long 0x8011c044	#IASA Callback
  .long 0x8011c160	#Physics Callback
  .long 0x8011c198	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012a	#Move ID
  .long 0x00240a09	#Bitflags
  .long 0x0a000000	#Attack ID
  .long 0x8011c248	#Animation Callback
  .long 0x8011c284	#IASA Callback
  .long 0x8011c2b4	#Physics Callback
  .long 0x8011c2d4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012b	#Move ID
  .long 0x00240a09	#Bitflags
  .long 0x0a000000	#Attack ID
  .long 0x8011c248	#Animation Callback
  .long 0x8011c284	#IASA Callback
  .long 0x8011c2b4	#Physics Callback
  .long 0x8011c2d4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012c	#Move ID
  .long 0x00240a09	#Bitflags
  .long 0x0a000000	#Attack ID
  .long 0x8011c248	#Animation Callback
  .long 0x8011c284	#IASA Callback
  .long 0x8011c2b4	#Physics Callback
  .long 0x8011c2d4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x00340014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8011d2ec	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x8011d394	#Physics Callback
  .long 0x8011d3d4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x00340014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8011d340	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x8011d3b4	#Physics Callback
  .long 0x8011d3fc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012e	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8011c4f0	#Animation Callback
  .long 0x8011c5e8	#IASA Callback
  .long 0x8011c5f0	#Physics Callback
  .long 0x8011c664	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012f	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8011ca84	#Animation Callback
  .long 0x8011cafc	#IASA Callback
  .long 0x8011cb04	#Physics Callback
  .long 0x8011cb44	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000130	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x00000000	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x00000000	#Physics Callback
  .long 0x00000000	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000131	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8011c588	#Animation Callback
  .long 0x8011c5ec	#IASA Callback
  .long 0x8011c644	#Physics Callback
  .long 0x8011c6fc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000132	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8011cac0	#Animation Callback
  .long 0x8011cb00	#IASA Callback
  .long 0x8011cb24	#Physics Callback
  .long 0x8011cb80	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000133	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8011cac0	#Animation Callback
  .long 0x8011cb00	#IASA Callback
  .long 0x8011cb24	#Physics Callback
  .long 0x8011cb80	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000130	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8011c878	#Animation Callback
  .long 0x8011c8c8	#IASA Callback
  .long 0x8011c8cc	#Physics Callback
  .long 0x8011c93c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000134	#Move ID
  .long 0x00340013	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x8011d8d0	#Animation Callback
  .long 0x8011da30	#IASA Callback
  .long 0x8011dcc0	#Physics Callback
  .long 0x8011ddbc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00340013	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x8011de9c	#Animation Callback
  .long 0x8011df5c	#IASA Callback
  .long 0x8011df64	#Physics Callback
  .long 0x8011e094	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000136	#Move ID
  .long 0x00340413	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x8011d980	#Animation Callback
  .long 0x8011db78	#IASA Callback
  .long 0x8011dcf8	#Physics Callback
  .long 0x8011de2c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000137	#Move ID
  .long 0x00340413	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x8011defc	#Animation Callback
  .long 0x8011df60	#IASA Callback
  .long 0x8011dfd0	#Physics Callback
  .long 0x8011e104	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000138	#Move ID
  .long 0x00340011	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8011e4f8	#Animation Callback
  .long 0x8011e670	#IASA Callback
  .long 0x8011e678	#Physics Callback
  .long 0x8011e75c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000139	#Move ID
  .long 0x00340011	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8011e9a0	#Animation Callback
  .long 0x8011ea68	#IASA Callback
  .long 0x8011ea70	#Physics Callback
  .long 0x8011eae0	#Collision Callback
  .long 0x800761c8	#Camera Callback

  FighterMoveLogic_Mario:
  .long 0xffffffff	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x00000000	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x00000000	#Physics Callback
  .long 0x00000000	#Collision Callback
  .long 0x00000000	#Camera Callback
  .long 0xffffffff	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x00000000	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x00000000	#Physics Callback
  .long 0x00000000	#Collision Callback
  .long 0x00000000	#Camera Callback
  .long 0x00000127	#Move ID
  .long 0x00340111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800e0e18	#Animation Callback
  .long 0x800e0e54	#IASA Callback
  .long 0x800e0e84	#Physics Callback
  .long 0x800e0ea4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000128	#Move ID
  .long 0x00340511	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800e10b0	#Animation Callback
  .long 0x800e10ec	#IASA Callback
  .long 0x800e111c	#Physics Callback
  .long 0x800e113c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000129	#Move ID
  .long 0x00341012	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800e1550	#Animation Callback
  .long 0x800e15c8	#IASA Callback
  .long 0x800e15d0	#Physics Callback
  .long 0x800e1840	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012a	#Move ID
  .long 0x00341012	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800e158c	#Animation Callback
  .long 0x800e15cc	#IASA Callback
  .long 0x800e16e0	#Physics Callback
  .long 0x800e187c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012b	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800e1b24	#Animation Callback
  .long 0x800e1be4	#IASA Callback
  .long 0x800e1e74	#Physics Callback
  .long 0x800e1f70	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012c	#Move ID
  .long 0x00340613	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800e1b84	#Animation Callback
  .long 0x800e1d2c	#IASA Callback
  .long 0x800e1eac	#Physics Callback
  .long 0x800e1fe0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x00340214	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e22bc	#Animation Callback
  .long 0x800e23dc	#IASA Callback
  .long 0x800e23e4	#Physics Callback
  .long 0x800e25c4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012e	#Move ID
  .long 0x00340614	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e2308	#Animation Callback
  .long 0x800e23e0	#IASA Callback
  .long 0x800e2508	#Physics Callback
  .long 0x800e2778	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000000e	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x00000000	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800c7158	#Physics Callback
  .long 0x00000000	#Collision Callback
  .long 0x00000000	#Camera Callback
  .long 0x0000000f	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x00000000	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800c7200	#Physics Callback
  .long 0x00000000	#Collision Callback
  .long 0x00000000	#Camera Callback

  FighterMoveLogic_Fox:
  .long 0x00000127	#Move ID
  .long 0x00340111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800e62a4	#Animation Callback
  .long 0x800e6ab4	#IASA Callback
  .long 0x800e6b5c	#Physics Callback
  .long 0x800e6c1c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000128	#Move ID
  .long 0x003c0111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800e6368	#Animation Callback
  .long 0x800e6adc	#IASA Callback
  .long 0x800e6b7c	#Physics Callback
  .long 0x800e6c3c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000129	#Move ID
  .long 0x00340111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800e65bc	#Animation Callback
  .long 0x800e6b04	#IASA Callback
  .long 0x800e6b9c	#Physics Callback
  .long 0x800e6c5c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012a	#Move ID
  .long 0x00340511	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800e667c	#Animation Callback
  .long 0x800e6b08	#IASA Callback
  .long 0x800e6bbc	#Physics Callback
  .long 0x800e6c7c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012b	#Move ID
  .long 0x003c0511	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800e6740	#Animation Callback
  .long 0x800e6b30	#IASA Callback
  .long 0x800e6bdc	#Physics Callback
  .long 0x800e6c9c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012c	#Move ID
  .long 0x00340511	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800e69bc	#Animation Callback
  .long 0x800e6b58	#IASA Callback
  .long 0x800e6bfc	#Physics Callback
  .long 0x800e6cbc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800ea004	#Animation Callback
  .long 0x800ea07c	#IASA Callback
  .long 0x800ea084	#Physics Callback
  .long 0x800ea128	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012e	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800ea294	#Animation Callback
  .long 0x800ea3f4	#IASA Callback
  .long 0x800ea47c	#Physics Callback
  .long 0x800ea5ec	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012f	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800ea908	#Animation Callback
  .long 0x800ea9a4	#IASA Callback
  .long 0x800ea9ac	#Physics Callback
  .long 0x800eab90	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000130	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800ea040	#Animation Callback
  .long 0x800ea080	#IASA Callback
  .long 0x800ea0bc	#Physics Callback
  .long 0x800ea164	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000131	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800ea344	#Animation Callback
  .long 0x800ea438	#IASA Callback
  .long 0x800ea534	#Physics Callback
  .long 0x800ea628	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000132	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800ea944	#Animation Callback
  .long 0x800ea9a8	#IASA Callback
  .long 0x800eaa8c	#Physics Callback
  .long 0x800eabcc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000133	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800e7354	#Animation Callback
  .long 0x800e7414	#IASA Callback
  .long 0x800e741c	#Physics Callback
  .long 0x800e74a8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000134	#Move ID
  .long 0x00340613	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800e73b4	#Animation Callback
  .long 0x800e7418	#IASA Callback
  .long 0x800e743c	#Physics Callback
  .long 0x800e74e4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800e7634	#Animation Callback
  .long 0x800e76d4	#IASA Callback
  .long 0x800e76dc	#Physics Callback
  .long 0x800e7800	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00340613	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800e7684	#Animation Callback
  .long 0x800e76d8	#IASA Callback
  .long 0x800e7758	#Physics Callback
  .long 0x800e78b4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000136	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800e7e3c	#Animation Callback
  .long 0x800e7ed8	#IASA Callback
  .long 0x800e7ee0	#Physics Callback
  .long 0x800e7f40	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000137	#Move ID
  .long 0x00340613	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800e7e78	#Animation Callback
  .long 0x800e7edc	#IASA Callback
  .long 0x800e7f20	#Physics Callback
  .long 0x800e7fa0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000138	#Move ID
  .long 0x00340613	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800e8124	#Animation Callback
  .long 0x800e81fc	#IASA Callback
  .long 0x800e8200	#Physics Callback
  .long 0x800e824c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000139	#Move ID
  .long 0x00341014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e8694	#Animation Callback
  .long 0x800e87ac	#IASA Callback
  .long 0x800e8864	#Physics Callback
  .long 0x800e88e4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013a	#Move ID
  .long 0x003c1014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e8a24	#Animation Callback
  .long 0x800e8b14	#IASA Callback
  .long 0x800e8c34	#Physics Callback
  .long 0x800e8cdc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013b	#Move ID
  .long 0x00341014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e965c	#Animation Callback
  .long 0x800e9844	#IASA Callback
  .long 0x800e984c	#Physics Callback
  .long 0x800e98f4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013c	#Move ID
  .long 0x00341014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e9b40	#Animation Callback
  .long 0x800e9bc8	#IASA Callback
  .long 0x800e9bd0	#Physics Callback
  .long 0x800e9c50	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013a	#Move ID
  .long 0x00341014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e8fdc	#Animation Callback
  .long 0x800e91fc	#IASA Callback
  .long 0x800e9204	#Physics Callback
  .long 0x800e92ac	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013d	#Move ID
  .long 0x00341414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e8720	#Animation Callback
  .long 0x800e87d0	#IASA Callback
  .long 0x800e8884	#Physics Callback
  .long 0x800e8920	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013e	#Move ID
  .long 0x003c1414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e8a9c	#Animation Callback
  .long 0x800e8b64	#IASA Callback
  .long 0x800e8c68	#Physics Callback
  .long 0x800e8d18	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013f	#Move ID
  .long 0x00341414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e97b4	#Animation Callback
  .long 0x800e9848	#IASA Callback
  .long 0x800e9880	#Physics Callback
  .long 0x800e9930	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000140	#Move ID
  .long 0x00341414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e9b84	#Animation Callback
  .long 0x800e9bcc	#IASA Callback
  .long 0x800e9bf0	#Physics Callback
  .long 0x800e9c8c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013e	#Move ID
  .long 0x00341414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e90ec	#Animation Callback
  .long 0x800e9200	#IASA Callback
  .long 0x800e9238	#Physics Callback
  .long 0x800e92e8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000141	#Move ID
  .long 0x00000072	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x800e5b18	#Animation Callback
  .long 0x800e5c38	#IASA Callback
  .long 0x800e5c3c	#Physics Callback
  .long 0x800e5c5c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000142	#Move ID
  .long 0x00000072	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x800e5b18	#Animation Callback
  .long 0x800e5c38	#IASA Callback
  .long 0x800e5c3c	#Physics Callback
  .long 0x800e5c5c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000143	#Move ID
  .long 0x00000072	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x800e5b18	#Animation Callback
  .long 0x800e5c38	#IASA Callback
  .long 0x800e5c3c	#Physics Callback
  .long 0x800e5c5c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000144	#Move ID
  .long 0x00000072	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x800e5b18	#Animation Callback
  .long 0x800e5c38	#IASA Callback
  .long 0x800e5c3c	#Physics Callback
  .long 0x800e5c5c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000145	#Move ID
  .long 0x00000072	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x800e5b18	#Animation Callback
  .long 0x800e5c38	#IASA Callback
  .long 0x800e5c3c	#Physics Callback
  .long 0x800e5c5c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000146	#Move ID
  .long 0x00000072	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x800e5b18	#Animation Callback
  .long 0x800e5c38	#IASA Callback
  .long 0x800e5c3c	#Physics Callback
  .long 0x800e5c5c	#Collision Callback
  .long 0x800761c8	#Camera Callback

  FighterMoveLogic_Falcon:
  .long 0x00000127	#Move ID
  .long 0x00440842	#Bitflags
  .long 0x41000000	#Attack ID
  .long 0x800cd390	#Animation Callback
  .long 0x800cd3b0	#IASA Callback
  .long 0x800cd3d0	#Physics Callback
  .long 0x800cd3f0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000128	#Move ID
  .long 0x00440846	#Bitflags
  .long 0x45000000	#Attack ID
  .long 0x800cd458	#Animation Callback
  .long 0x800cd478	#IASA Callback
  .long 0x800cd498	#Physics Callback
  .long 0x800cd4b8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000129	#Move ID
  .long 0x0044084a	#Bitflags
  .long 0x49000000	#Attack ID
  .long 0x800cd520	#Animation Callback
  .long 0x800cd540	#IASA Callback
  .long 0x800cd560	#Physics Callback
  .long 0x800cd580	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012a	#Move ID
  .long 0x0044084e	#Bitflags
  .long 0x4d000000	#Attack ID
  .long 0x800cd6a0	#Animation Callback
  .long 0x800cd7c4	#IASA Callback
  .long 0x800cd7e4	#Physics Callback
  .long 0x800cd804	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012b	#Move ID
  .long 0x00440852	#Bitflags
  .long 0x51000000	#Attack ID
  .long 0x800cd88c	#Animation Callback
  .long 0x800cd8ac	#IASA Callback
  .long 0x800cd8cc	#Physics Callback
  .long 0x800cd8ec	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012c	#Move ID
  .long 0x00440856	#Bitflags
  .long 0x55000000	#Attack ID
  .long 0x800cdb14	#Animation Callback
  .long 0x800cdb34	#IASA Callback
  .long 0x800cdb54	#Physics Callback
  .long 0x800cdb74	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x00340211	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800e2c80	#Animation Callback
  .long 0x800e2e38	#IASA Callback
  .long 0x800e2f2c	#Physics Callback
  .long 0x800e3168	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012e	#Move ID
  .long 0x00340611	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800e2d5c	#Animation Callback
  .long 0x800e2e3c	#IASA Callback
  .long 0x800e3018	#Physics Callback
  .long 0x800e31f4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012f	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800e384c	#Animation Callback
  .long 0x800e3b0c	#IASA Callback
  .long 0x800e3b1c	#Physics Callback
  .long 0x800e3c38	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000130	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800e3888	#Animation Callback
  .long 0x800e3b10	#IASA Callback
  .long 0x800e3b3c	#Physics Callback
  .long 0x800e3d44	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000131	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800e3964	#Animation Callback
  .long 0x800e3b14	#IASA Callback
  .long 0x800e3b5c	#Physics Callback
  .long 0x800e3de4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000132	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800e39f0	#Animation Callback
  .long 0x800e3b18	#IASA Callback
  .long 0x800e3bd0	#Physics Callback
  .long 0x800e3e40	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000133	#Move ID
  .long 0x00340013	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800e4b00	#Animation Callback
  .long 0x800e4b60	#IASA Callback
  .long 0x800e4bf8	#Physics Callback
  .long 0x800e4e1c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000134	#Move ID
  .long 0x00340413	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800e4ee8	#Animation Callback
  .long 0x800e4f48	#IASA Callback
  .long 0x800e4fdc	#Physics Callback
  .long 0x800e50d8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00340013	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800e51f8	#Animation Callback
  .long 0x800e5234	#IASA Callback
  .long 0x800e5238	#Physics Callback
  .long 0x800e523c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000136	#Move ID
  .long 0x00340013	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800e5310	#Animation Callback
  .long 0x800e5384	#IASA Callback
  .long 0x800e5388	#Physics Callback
  .long 0x800e54b8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000137	#Move ID
  .long 0x00340214	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e415c	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800e4408	#Physics Callback
  .long 0x800e46b8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000138	#Move ID
  .long 0x00340214	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e4268	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800e449c	#Physics Callback
  .long 0x800e47b0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000139	#Move ID
  .long 0x00340614	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e42e0	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800e45e4	#Physics Callback
  .long 0x800e48bc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013a	#Move ID
  .long 0x00340614	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e4354	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800e4618	#Physics Callback
  .long 0x800e493c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013c	#Move ID
  .long 0x00340614	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e4390	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800e4678	#Physics Callback
  .long 0x800e495c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013b	#Move ID
  .long 0x00340214	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e42a4	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800e455c	#Physics Callback
  .long 0x800e4838	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013d	#Move ID
  .long 0x00340614	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e43cc	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800e4698	#Physics Callback
  .long 0x800e49dc	#Collision Callback
  .long 0x800761c8	#Camera Callback

  FighterMoveLogic_DK:
  .long 0x00000127	#Move ID
  .long 0x00480000	#Bitflags
  .long 0x35400000	#Attack ID
  .long 0x00000000	#Animation Callback
  .long 0x800df9f0	#IASA Callback
  .long 0x800dfa50	#Physics Callback
  .long 0x800dfa70	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000128	#Move ID
  .long 0x00484066	#Bitflags
  .long 0x35000000	#Attack ID
  .long 0x800dfb34	#Animation Callback
  .long 0x800dfb54	#IASA Callback
  .long 0x800dfbb8	#Physics Callback
  .long 0x800dfbd8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000129	#Move ID
  .long 0x00484066	#Bitflags
  .long 0x35000000	#Attack ID
  .long 0x800dfb34	#Animation Callback
  .long 0x800dfb54	#IASA Callback
  .long 0x800dfbb8	#Physics Callback
  .long 0x800dfbd8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012a	#Move ID
  .long 0x00484066	#Bitflags
  .long 0x35000000	#Attack ID
  .long 0x800dfb34	#Animation Callback
  .long 0x800dfb54	#IASA Callback
  .long 0x800dfbb8	#Physics Callback
  .long 0x800dfbd8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012b	#Move ID
  .long 0x00482064	#Bitflags
  .long 0x35000000	#Attack ID
  .long 0x800e01bc	#Animation Callback
  .long 0x800e0200	#IASA Callback
  .long 0x800e0254	#Physics Callback
  .long 0x800e0274	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012c	#Move ID
  .long 0x00480000	#Bitflags
  .long 0x35000000	#Attack ID
  .long 0x800e0518	#Animation Callback
  .long 0x800e0568	#IASA Callback
  .long 0x800e05a4	#Physics Callback
  .long 0x800e05c4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x00480000	#Bitflags
  .long 0x35000000	#Attack ID
  .long 0x00000000	#Animation Callback
  .long 0x800e030c	#IASA Callback
  .long 0x800e0330	#Physics Callback
  .long 0x800e0350	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012e	#Move ID
  .long 0x00488069	#Bitflags
  .long 0x35000000	#Attack ID
  .long 0x00000000	#Animation Callback
  .long 0x800e0440	#IASA Callback
  .long 0x800e0464	#Physics Callback
  .long 0x800e0484	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012f	#Move ID
  .long 0x00480000	#Bitflags
  .long 0x35400000	#Attack ID
  .long 0x800e0648	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800e0698	#Physics Callback
  .long 0x800e06b8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000130	#Move ID
  .long 0x004a0000	#Bitflags
  .long 0x35000000	#Attack ID
  .long 0x800e07e4	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800e0848	#Physics Callback
  .long 0x800e0868	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000131	#Move ID
  .long 0x00a80035	#Bitflags
  .long 0x35400000	#Attack ID
  .long 0x8009b5c0	#Animation Callback
  .long 0x8009b5c4	#IASA Callback
  .long 0x8009b634	#Physics Callback
  .long 0x8009b654	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000132	#Move ID
  .long 0x00a84035	#Bitflags
  .long 0x35000000	#Attack ID
  .long 0x8009b744	#Animation Callback
  .long 0x8009b764	#IASA Callback
  .long 0x8009b7d8	#Physics Callback
  .long 0x8009b7f8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000133	#Move ID
  .long 0x00a84035	#Bitflags
  .long 0x35000000	#Attack ID
  .long 0x8009b744	#Animation Callback
  .long 0x8009b764	#IASA Callback
  .long 0x8009b7d8	#Physics Callback
  .long 0x8009b7f8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000134	#Move ID
  .long 0x00a84035	#Bitflags
  .long 0x35000000	#Attack ID
  .long 0x8009b744	#Animation Callback
  .long 0x8009b764	#IASA Callback
  .long 0x8009b7d8	#Physics Callback
  .long 0x8009b7f8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00a82035	#Bitflags
  .long 0x35000000	#Attack ID
  .long 0x8009b8b4	#Animation Callback
  .long 0x8009b948	#IASA Callback
  .long 0x8009b988	#Physics Callback
  .long 0x8009b9a8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000136	#Move ID
  .long 0x00a80035	#Bitflags
  .long 0x35000000	#Attack ID
  .long 0x8009ba50	#Animation Callback
  .long 0x8009baa0	#IASA Callback
  .long 0x8009badc	#Physics Callback
  .long 0x8009bafc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000137	#Move ID
  .long 0x00a80035	#Bitflags
  .long 0x35000000	#Attack ID
  .long 0x8009bcdc	#Animation Callback
  .long 0x8009bce0	#IASA Callback
  .long 0x8009bd04	#Physics Callback
  .long 0x8009bd24	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000138	#Move ID
  .long 0x00a88035	#Bitflags
  .long 0x35000000	#Attack ID
  .long 0x8009bbf0	#Animation Callback
  .long 0x8009bbf4	#IASA Callback
  .long 0x8009bc18	#Physics Callback
  .long 0x8009bc38	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000139	#Move ID
  .long 0x00a80035	#Bitflags
  .long 0x35400000	#Attack ID
  .long 0x8009bdc4	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x8009be14	#Physics Callback
  .long 0x8009be34	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013a	#Move ID
  .long 0x00aa0035	#Bitflags
  .long 0x35000000	#Attack ID
  .long 0x8009be54	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x8009beb8	#Physics Callback
  .long 0x8009bed8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013b	#Move ID
  .long 0x00a40039	#Bitflags
  .long 0x39000000	#Attack ID
  .long 0x8009c0ec	#Animation Callback
  .long 0x8009c130	#IASA Callback
  .long 0x8009c150	#Physics Callback
  .long 0x8009c20c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013c	#Move ID
  .long 0x00a4003a	#Bitflags
  .long 0x3a000000	#Attack ID
  .long 0x8009c234	#Animation Callback
  .long 0x8009c254	#IASA Callback
  .long 0x8009c274	#Physics Callback
  .long 0x8009c294	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013d	#Move ID
  .long 0x00a4003b	#Bitflags
  .long 0x3b000000	#Attack ID
  .long 0x8009c2bc	#Animation Callback
  .long 0x8009c2dc	#IASA Callback
  .long 0x8009c2fc	#Physics Callback
  .long 0x8009c31c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013e	#Move ID
  .long 0x00a4003c	#Bitflags
  .long 0x3c000000	#Attack ID
  .long 0x8009c344	#Animation Callback
  .long 0x8009c364	#IASA Callback
  .long 0x8009c384	#Physics Callback
  .long 0x8009c3a4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013b	#Move ID
  .long 0x00a40039	#Bitflags
  .long 0x39000000	#Attack ID
  .long 0x8009c3cc	#Animation Callback
  .long 0x8009c410	#IASA Callback
  .long 0x8009c414	#Physics Callback
  .long 0x8009c434	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013c	#Move ID
  .long 0x00a4003a	#Bitflags
  .long 0x3a000000	#Attack ID
  .long 0x8009c3cc	#Animation Callback
  .long 0x8009c410	#IASA Callback
  .long 0x8009c414	#Physics Callback
  .long 0x8009c434	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013d	#Move ID
  .long 0x00a4003b	#Bitflags
  .long 0x3b000000	#Attack ID
  .long 0x8009c3cc	#Animation Callback
  .long 0x8009c410	#IASA Callback
  .long 0x8009c414	#Physics Callback
  .long 0x8009c434	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013e	#Move ID
  .long 0x00a4003c	#Bitflags
  .long 0x3c000000	#Attack ID
  .long 0x8009c3cc	#Animation Callback
  .long 0x8009c410	#IASA Callback
  .long 0x8009c414	#Physics Callback
  .long 0x8009c434	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013f	#Move ID
  .long 0x00340211	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8010e7b4	#Animation Callback
  .long 0x8010f094	#IASA Callback
  .long 0x8010f328	#Physics Callback
  .long 0x8010f468	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000140	#Move ID
  .long 0x00340211	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8010e840	#Animation Callback
  .long 0x8010f098	#IASA Callback
  .long 0x8010f348	#Physics Callback
  .long 0x8010f50c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000141	#Move ID
  .long 0x00340211	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8010e8e0	#Animation Callback
  .long 0x8010f1d8	#IASA Callback
  .long 0x8010f368	#Physics Callback
  .long 0x8010f5b0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000142	#Move ID
  .long 0x00340211	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8010e930	#Animation Callback
  .long 0x8010f1dc	#IASA Callback
  .long 0x8010f388	#Physics Callback
  .long 0x8010f654	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000143	#Move ID
  .long 0x00340211	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8010eb0c	#Animation Callback
  .long 0x8010f1e0	#IASA Callback
  .long 0x8010f3a8	#Physics Callback
  .long 0x8010f6f8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000144	#Move ID
  .long 0x00340611	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8010ec5c	#Animation Callback
  .long 0x8010f1e4	#IASA Callback
  .long 0x8010f3c8	#Physics Callback
  .long 0x8010f79c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000145	#Move ID
  .long 0x00340611	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8010ece8	#Animation Callback
  .long 0x8010f1e8	#IASA Callback
  .long 0x8010f3e8	#Physics Callback
  .long 0x8010f840	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000146	#Move ID
  .long 0x00340611	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8010ed88	#Animation Callback
  .long 0x8010f31c	#IASA Callback
  .long 0x8010f408	#Physics Callback
  .long 0x8010f8e4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000147	#Move ID
  .long 0x00340611	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8010edd8	#Animation Callback
  .long 0x8010f320	#IASA Callback
  .long 0x8010f428	#Physics Callback
  .long 0x8010f988	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000148	#Move ID
  .long 0x00340611	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8010ef7c	#Animation Callback
  .long 0x8010f324	#IASA Callback
  .long 0x8010f448	#Physics Callback
  .long 0x8010fa2c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000149	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8010e2bc	#Animation Callback
  .long 0x8010e334	#IASA Callback
  .long 0x8010e33c	#Physics Callback
  .long 0x8010e3bc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000014a	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8010e2f8	#Animation Callback
  .long 0x8010e338	#IASA Callback
  .long 0x8010e35c	#Physics Callback
  .long 0x8010e428	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000014b	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x8010fcd4	#Animation Callback
  .long 0x8010fd9c	#IASA Callback
  .long 0x8010fda4	#Physics Callback
  .long 0x8010fe60	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000014c	#Move ID
  .long 0x00340613	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x8010fd10	#Animation Callback
  .long 0x8010fda0	#IASA Callback
  .long 0x8010fdec	#Physics Callback
  .long 0x8010ff14	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000014d	#Move ID
  .long 0x00340214	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8010dcd8	#Animation Callback
  .long 0x8010dd14	#IASA Callback
  .long 0x8010dd18	#Physics Callback
  .long 0x8010dd38	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000014e	#Move ID
  .long 0x003c0214	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8010dd74	#Animation Callback
  .long 0x8010dddc	#IASA Callback
  .long 0x8010ddf8	#Physics Callback
  .long 0x8010de18	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000014f	#Move ID
  .long 0x00340214	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8010df5c	#Animation Callback
  .long 0x8010df98	#IASA Callback
  .long 0x8010df9c	#Physics Callback
  .long 0x8010dfbc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000150	#Move ID
  .long 0x00340614	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8010e030	#Animation Callback
  .long 0x8010e06c	#IASA Callback
  .long 0x8010e070	#Physics Callback
  .long 0x8010e090	#Collision Callback
  .long 0x800761c8	#Camera Callback

  FighterMoveLogic_Kirby:
  .long 0x00000127	#Move ID
  .long 0x0000006a	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x800d7590	#Animation Callback
  .long 0x800d7614	#IASA Callback
  .long 0x800d7634	#Physics Callback
  .long 0x800d767c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000128	#Move ID
  .long 0x0000006a	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x800d7590	#Animation Callback
  .long 0x800d7614	#IASA Callback
  .long 0x800d7634	#Physics Callback
  .long 0x800d767c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000129	#Move ID
  .long 0x0000006a	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x800d7590	#Animation Callback
  .long 0x800d7614	#IASA Callback
  .long 0x800d7634	#Physics Callback
  .long 0x800d767c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012a	#Move ID
  .long 0x0000006a	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x800d7590	#Animation Callback
  .long 0x800d7614	#IASA Callback
  .long 0x800d7634	#Physics Callback
  .long 0x800d767c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012b	#Move ID
  .long 0x0000006a	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x800d7590	#Animation Callback
  .long 0x800d7614	#IASA Callback
  .long 0x800d7634	#Physics Callback
  .long 0x800d767c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012c	#Move ID
  .long 0x0000006a	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x800d7590	#Animation Callback
  .long 0x800d7614	#IASA Callback
  .long 0x800d7634	#Physics Callback
  .long 0x800d767c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x0000006a	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x800d7590	#Animation Callback
  .long 0x800d7614	#IASA Callback
  .long 0x800d7634	#Physics Callback
  .long 0x800d767c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012e	#Move ID
  .long 0x0000006a	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x800d7590	#Animation Callback
  .long 0x800d7614	#IASA Callback
  .long 0x800d7634	#Physics Callback
  .long 0x800d767c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012f	#Move ID
  .long 0x0000006a	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x800d7590	#Animation Callback
  .long 0x800d7614	#IASA Callback
  .long 0x800d7634	#Physics Callback
  .long 0x800d767c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000130	#Move ID
  .long 0x0000006a	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x800d7590	#Animation Callback
  .long 0x800d7614	#IASA Callback
  .long 0x800d7634	#Physics Callback
  .long 0x800d767c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000034	#Move ID
  .long 0x00240005	#Bitflags
  .long 0x06000000	#Attack ID
  .long 0x800f203c	#Animation Callback
  .long 0x800f205c	#IASA Callback
  .long 0x800f207c	#Physics Callback
  .long 0x800f209c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000034	#Move ID
  .long 0x00240405	#Bitflags
  .long 0x06000000	#Attack ID
  .long 0x800f2124	#Animation Callback
  .long 0x800f2160	#IASA Callback
  .long 0x800f2164	#Physics Callback
  .long 0x800f2198	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000131	#Move ID
  .long 0x00340011	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800f70a0	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800f8890	#Physics Callback
  .long 0x800f8c10	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000132	#Move ID
  .long 0x003c0011	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800f72f8	#Animation Callback
  .long 0x800f7fa0	#IASA Callback
  .long 0x800f88d0	#Physics Callback
  .long 0x800f8c60	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000133	#Move ID
  .long 0x00340011	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800f7300	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800f8910	#Physics Callback
  .long 0x800f8cb0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000134	#Move ID
  .long 0x00340011	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800f7498	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800f8970	#Physics Callback
  .long 0x800f8d28	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000134	#Move ID
  .long 0x00340011	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800f7378	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800f8950	#Physics Callback
  .long 0x800f8d00	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00340011	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800f75f8	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800f89d0	#Physics Callback
  .long 0x800f8da0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000136	#Move ID
  .long 0x00340011	#Bitflags
  .long 0x12400000	#Attack ID
  .long 0x800f76f8	#Animation Callback
  .long 0x800f8060	#IASA Callback
  .long 0x800f8a10	#Physics Callback
  .long 0x800f8df0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000137	#Move ID
  .long 0x00344011	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800f7e78	#Animation Callback
  .long 0x800f8770	#IASA Callback
  .long 0x800f8b90	#Physics Callback
  .long 0x800f8fd0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000138	#Move ID
  .long 0x00344011	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800f7e78	#Animation Callback
  .long 0x800f8770	#IASA Callback
  .long 0x800f8b90	#Physics Callback
  .long 0x800f8fd0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000139	#Move ID
  .long 0x00344011	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800f7e78	#Animation Callback
  .long 0x800f8770	#IASA Callback
  .long 0x800f8b90	#Physics Callback
  .long 0x800f8fd0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013d	#Move ID
  .long 0x00342011	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800f7d58	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800f8b50	#Physics Callback
  .long 0x800f8f80	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013a	#Move ID
  .long 0x00348011	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800f7e98	#Animation Callback
  .long 0x800f8870	#IASA Callback
  .long 0x800f8bb0	#Physics Callback
  .long 0x800f8ff8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013b	#Move ID
  .long 0x00340011	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800f7f20	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800f8bd0	#Physics Callback
  .long 0x800f9020	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013c	#Move ID
  .long 0x00340011	#Bitflags
  .long 0x12400000	#Attack ID
  .long 0x800f7f24	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800f8bf0	#Physics Callback
  .long 0x800f9048	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013e	#Move ID
  .long 0x00340011	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800f7b20	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800f8af0	#Physics Callback
  .long 0x800f8f08	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013e	#Move ID
  .long 0x00340011	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800f7a70	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800f8ad0	#Physics Callback
  .long 0x800f8ee0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013f	#Move ID
  .long 0x00340011	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800f7808	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800f8a70	#Physics Callback
  .long 0x800f8e68	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013f	#Move ID
  .long 0x00340011	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800f7700	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800f8a50	#Physics Callback
  .long 0x800f8e40	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000140	#Move ID
  .long 0x00340411	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800f71cc	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800f88b0	#Physics Callback
  .long 0x800f8c38	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000141	#Move ID
  .long 0x003c0411	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800f72fc	#Animation Callback
  .long 0x800f8000	#IASA Callback
  .long 0x800f88f0	#Physics Callback
  .long 0x800f8c88	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000133	#Move ID
  .long 0x00340411	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800f733c	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800f8930	#Physics Callback
  .long 0x800f8cd8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000134	#Move ID
  .long 0x00340411	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800f75d8	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800f89b0	#Physics Callback
  .long 0x800f8d78	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000134	#Move ID
  .long 0x00340411	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800f75b8	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800f8990	#Physics Callback
  .long 0x800f8d50	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00340411	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800f7674	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800f89f0	#Physics Callback
  .long 0x800f8dc8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000136	#Move ID
  .long 0x00340411	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800f76fc	#Animation Callback
  .long 0x800f844c	#IASA Callback
  .long 0x800f8a30	#Physics Callback
  .long 0x800f8e18	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013e	#Move ID
  .long 0x00340411	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800f7c94	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800f8b30	#Physics Callback
  .long 0x800f8f58	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013e	#Move ID
  .long 0x00340411	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800f7be4	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800f8b10	#Physics Callback
  .long 0x800f8f30	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013f	#Move ID
  .long 0x00340411	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800f79c0	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800f8ab0	#Physics Callback
  .long 0x800f8eb8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013f	#Move ID
  .long 0x00340411	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800f78b8	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800f8a90	#Physics Callback
  .long 0x800f8e90	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013d	#Move ID
  .long 0x00342411	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800f7de4	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800f8b70	#Physics Callback
  .long 0x800f8fa8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000142	#Move ID
  .long 0x00340012	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800f5660	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800f56d8	#Physics Callback
  .long 0x800f5718	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000143	#Move ID
  .long 0x00340412	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800f569c	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800f56f8	#Physics Callback
  .long 0x800f5778	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000144	#Move ID
  .long 0x00340013	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800f2470	#Animation Callback
  .long 0x800f2758	#IASA Callback
  .long 0x800f2910	#Physics Callback
  .long 0x800f2bbc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000145	#Move ID
  .long 0x00340013	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800f24f8	#Animation Callback
  .long 0x800f2828	#IASA Callback
  .long 0x800f2984	#Physics Callback
  .long 0x800f2c5c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000146	#Move ID
  .long 0x00340013	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800f2578	#Animation Callback
  .long 0x800f282c	#IASA Callback
  .long 0x800f29f8	#Physics Callback
  .long 0x800f2d98	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000147	#Move ID
  .long 0x00340013	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800f257c	#Animation Callback
  .long 0x800f2830	#IASA Callback
  .long 0x800f2a48	#Physics Callback
  .long 0x800f2ea0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000148	#Move ID
  .long 0x00340413	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800f25ec	#Animation Callback
  .long 0x800f2834	#IASA Callback
  .long 0x800f2a68	#Physics Callback
  .long 0x800f2f70	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000149	#Move ID
  .long 0x00340413	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800f266c	#Animation Callback
  .long 0x800f2904	#IASA Callback
  .long 0x800f2ae4	#Physics Callback
  .long 0x800f3004	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000014a	#Move ID
  .long 0x00340413	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800f26e4	#Animation Callback
  .long 0x800f2908	#IASA Callback
  .long 0x800f2b60	#Physics Callback
  .long 0x800f3140	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000014b	#Move ID
  .long 0x00340413	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800f26e8	#Animation Callback
  .long 0x800f290c	#IASA Callback
  .long 0x800f2b9c	#Physics Callback
  .long 0x800f3248	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000014c	#Move ID
  .long 0x00340214	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800f3f80	#Animation Callback
  .long 0x800f42d8	#IASA Callback
  .long 0x800f451c	#Physics Callback
  .long 0x800f4628	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000014d	#Move ID
  .long 0x00340214	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800f402c	#Animation Callback
  .long 0x800f42dc	#IASA Callback
  .long 0x800f453c	#Physics Callback
  .long 0x800f4800	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000014e	#Move ID
  .long 0x00340214	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800f4074	#Animation Callback
  .long 0x800f43fc	#IASA Callback
  .long 0x800f4584	#Physics Callback
  .long 0x800f49e4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000014f	#Move ID
  .long 0x00340614	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800f412c	#Animation Callback
  .long 0x800f4400	#IASA Callback
  .long 0x800f45a4	#Physics Callback
  .long 0x800f4b3c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000150	#Move ID
  .long 0x00340614	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800f41d8	#Animation Callback
  .long 0x800f4404	#IASA Callback
  .long 0x800f45c4	#Physics Callback
  .long 0x800f4e78	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000151	#Move ID
  .long 0x00340614	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800f4220	#Animation Callback
  .long 0x800f4518	#IASA Callback
  .long 0x800f4608	#Physics Callback
  .long 0x800f51c0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000152	#Move ID
  .long 0x00340015	#Bitflags
  .long 0x16000000	#Attack ID
  .long 0x800f9198	#Animation Callback
  .long 0x800f91d4	#IASA Callback
  .long 0x800f9204	#Physics Callback
  .long 0x800f9224	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000153	#Move ID
  .long 0x00340415	#Bitflags
  .long 0x16000000	#Attack ID
  .long 0x800f9454	#Animation Callback
  .long 0x800f9490	#IASA Callback
  .long 0x800f94c0	#Physics Callback
  .long 0x800f94e0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000154	#Move ID
  .long 0x0034011a	#Bitflags
  .long 0x1b000000	#Attack ID
  .long 0x800fbbc4	#Animation Callback
  .long 0x800fc374	#IASA Callback
  .long 0x800fc70c	#Physics Callback
  .long 0x800fc7cc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000155	#Move ID
  .long 0x003c011a	#Bitflags
  .long 0x1b000000	#Attack ID
  .long 0x800fbdfc	#Animation Callback
  .long 0x800fc46c	#IASA Callback
  .long 0x800fc72c	#Physics Callback
  .long 0x800fc880	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000156	#Move ID
  .long 0x0034011a	#Bitflags
  .long 0x1b000000	#Attack ID
  .long 0x800fbed0	#Animation Callback
  .long 0x800fc53c	#IASA Callback
  .long 0x800fc74c	#Physics Callback
  .long 0x800fc934	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000157	#Move ID
  .long 0x0034051a	#Bitflags
  .long 0x1b000000	#Attack ID
  .long 0x800fbf34	#Animation Callback
  .long 0x800fc540	#IASA Callback
  .long 0x800fc76c	#Physics Callback
  .long 0x800fc9f0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000158	#Move ID
  .long 0x003c051a	#Bitflags
  .long 0x1b000000	#Attack ID
  .long 0x800fc1a0	#Animation Callback
  .long 0x800fc638	#IASA Callback
  .long 0x800fc78c	#Physics Callback
  .long 0x800fcaa4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000159	#Move ID
  .long 0x0034051a	#Bitflags
  .long 0x1b000000	#Attack ID
  .long 0x800fc274	#Animation Callback
  .long 0x800fc708	#IASA Callback
  .long 0x800fc7ac	#Physics Callback
  .long 0x800fcb58	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000015a	#Move ID
  .long 0x00340120	#Bitflags
  .long 0x21000000	#Attack ID
  .long 0x800fd0bc	#Animation Callback
  .long 0x800fd688	#IASA Callback
  .long 0x800fd7f0	#Physics Callback
  .long 0x800fd8b0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000015b	#Move ID
  .long 0x00340120	#Bitflags
  .long 0x21000000	#Attack ID
  .long 0x800fd250	#Animation Callback
  .long 0x800fd68c	#IASA Callback
  .long 0x800fd810	#Physics Callback
  .long 0x800fd938	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000015c	#Move ID
  .long 0x00340120	#Bitflags
  .long 0x21000000	#Attack ID
  .long 0x800fd418	#Animation Callback
  .long 0x800fd7e0	#IASA Callback
  .long 0x800fd830	#Physics Callback
  .long 0x800fd9e0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000015d	#Move ID
  .long 0x00340120	#Bitflags
  .long 0x21000000	#Attack ID
  .long 0x800fd49c	#Animation Callback
  .long 0x800fd7e4	#IASA Callback
  .long 0x800fd850	#Physics Callback
  .long 0x800fda68	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000015e	#Move ID
  .long 0x00340520	#Bitflags
  .long 0x21000000	#Attack ID
  .long 0x800fd4e0	#Animation Callback
  .long 0x800fd7e8	#IASA Callback
  .long 0x800fd870	#Physics Callback
  .long 0x800fdaf0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000015f	#Move ID
  .long 0x00340520	#Bitflags
  .long 0x21000000	#Attack ID
  .long 0x800fd608	#Animation Callback
  .long 0x800fd7ec	#IASA Callback
  .long 0x800fd890	#Physics Callback
  .long 0x800fdb78	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000160	#Move ID
  .long 0x00340021	#Bitflags
  .long 0x22000000	#Attack ID
  .long 0x80109d6c	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x8010a5ec	#Physics Callback
  .long 0x8010a72c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000161	#Move ID
  .long 0x00340021	#Bitflags
  .long 0x22000000	#Attack ID
  .long 0x80109ee8	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x8010a64c	#Physics Callback
  .long 0x8010a7a4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000161	#Move ID
  .long 0x00340021	#Bitflags
  .long 0x22000000	#Attack ID
  .long 0x80109e04	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x8010a62c	#Physics Callback
  .long 0x8010a77c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000162	#Move ID
  .long 0x00340021	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8010a304	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x8010a6cc	#Physics Callback
  .long 0x8010a844	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000162	#Move ID
  .long 0x00340021	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8010a1a4	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x8010a6ac	#Physics Callback
  .long 0x8010a81c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000163	#Move ID
  .long 0x00340421	#Bitflags
  .long 0x22000000	#Attack ID
  .long 0x80109db8	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x8010a60c	#Physics Callback
  .long 0x8010a754	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000164	#Move ID
  .long 0x00340421	#Bitflags
  .long 0x22000000	#Attack ID
  .long 0x8010a0b8	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x8010a66c	#Physics Callback
  .long 0x8010a7f4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000164	#Move ID
  .long 0x00340421	#Bitflags
  .long 0x22000000	#Attack ID
  .long 0x80109fd4	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x8010a68c	#Physics Callback
  .long 0x8010a7cc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000165	#Move ID
  .long 0x00340421	#Bitflags
  .long 0x22000000	#Attack ID
  .long 0x8010a528	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x8010a70c	#Physics Callback
  .long 0x8010a894	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000165	#Move ID
  .long 0x00340421	#Bitflags
  .long 0x22000000	#Attack ID
  .long 0x8010a3c8	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x8010a6ec	#Physics Callback
  .long 0x8010a86c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000166	#Move ID
  .long 0x00340116	#Bitflags
  .long 0x17000000	#Attack ID
  .long 0x800fe360	#Animation Callback
  .long 0x800fea50	#IASA Callback
  .long 0x800feaf8	#Physics Callback
  .long 0x800febb8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000167	#Move ID
  .long 0x003c0116	#Bitflags
  .long 0x17000000	#Attack ID
  .long 0x800fe450	#Animation Callback
  .long 0x800fea78	#IASA Callback
  .long 0x800feb18	#Physics Callback
  .long 0x800febd8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000168	#Move ID
  .long 0x00340116	#Bitflags
  .long 0x17000000	#Attack ID
  .long 0x800fe5c8	#Animation Callback
  .long 0x800feaa0	#IASA Callback
  .long 0x800feb38	#Physics Callback
  .long 0x800febf8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000169	#Move ID
  .long 0x00340516	#Bitflags
  .long 0x17000000	#Attack ID
  .long 0x800fe688	#Animation Callback
  .long 0x800feaa4	#IASA Callback
  .long 0x800feb58	#Physics Callback
  .long 0x800fec18	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000016a	#Move ID
  .long 0x003c0516	#Bitflags
  .long 0x17000000	#Attack ID
  .long 0x800fe778	#Animation Callback
  .long 0x800feacc	#IASA Callback
  .long 0x800feb78	#Physics Callback
  .long 0x800fec38	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000016b	#Move ID
  .long 0x00340516	#Bitflags
  .long 0x17000000	#Attack ID
  .long 0x800fe928	#Animation Callback
  .long 0x800feaf4	#IASA Callback
  .long 0x800feb98	#Physics Callback
  .long 0x800fec58	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000016c	#Move ID
  .long 0x0034011f	#Bitflags
  .long 0x20000000	#Attack ID
  .long 0x800fa0f4	#Animation Callback
  .long 0x800fa418	#IASA Callback
  .long 0x800fa420	#Physics Callback
  .long 0x800fa460	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000016d	#Move ID
  .long 0x0034051f	#Bitflags
  .long 0x20000000	#Attack ID
  .long 0x800fa254	#Animation Callback
  .long 0x800fa41c	#IASA Callback
  .long 0x800fa440	#Physics Callback
  .long 0x800fa4f0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000016e	#Move ID
  .long 0x00340024	#Bitflags
  .long 0x25000000	#Attack ID
  .long 0x800f96f4	#Animation Callback
  .long 0x800f976c	#IASA Callback
  .long 0x800f97cc	#Physics Callback
  .long 0x800f980c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000016f	#Move ID
  .long 0x00340424	#Bitflags
  .long 0x25000000	#Attack ID
  .long 0x800f9730	#Animation Callback
  .long 0x800f979c	#IASA Callback
  .long 0x800f97ec	#Physics Callback
  .long 0x800f9880	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000170	#Move ID
  .long 0x00340217	#Bitflags
  .long 0x18000000	#Attack ID
  .long 0x800f9aec	#Animation Callback
  .long 0x800f9b64	#IASA Callback
  .long 0x800f9c58	#Physics Callback
  .long 0x800f9e8c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000171	#Move ID
  .long 0x00340617	#Bitflags
  .long 0x18000000	#Attack ID
  .long 0x800f9b28	#Animation Callback
  .long 0x800f9b68	#IASA Callback
  .long 0x800f9d40	#Physics Callback
  .long 0x800f9f34	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000172	#Move ID
  .long 0x0034011c	#Bitflags
  .long 0x1d000000	#Attack ID
  .long 0x800fee70	#Animation Callback
  .long 0x800ff3dc	#IASA Callback
  .long 0x800ff4cc	#Physics Callback
  .long 0x800ff664	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000173	#Move ID
  .long 0x0034011c	#Bitflags
  .long 0x1d000000	#Attack ID
  .long 0x800fef58	#Animation Callback
  .long 0x800ff3e0	#IASA Callback
  .long 0x800ff504	#Physics Callback
  .long 0x800ff6d0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000174	#Move ID
  .long 0x0034011c	#Bitflags
  .long 0x1d000000	#Attack ID
  .long 0x800fef58	#Animation Callback
  .long 0x800ff3e0	#IASA Callback
  .long 0x800ff504	#Physics Callback
  .long 0x800ff6d0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000175	#Move ID
  .long 0x0034011c	#Bitflags
  .long 0x1d000000	#Attack ID
  .long 0x800ff08c	#Animation Callback
  .long 0x800ff450	#IASA Callback
  .long 0x800ff524	#Physics Callback
  .long 0x800ff73c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000176	#Move ID
  .long 0x0034051c	#Bitflags
  .long 0x1d000000	#Attack ID
  .long 0x800ff10c	#Animation Callback
  .long 0x800ff454	#IASA Callback
  .long 0x800ff544	#Physics Callback
  .long 0x800ff7a8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000177	#Move ID
  .long 0x0034051c	#Bitflags
  .long 0x1d000000	#Attack ID
  .long 0x800ff1f4	#Animation Callback
  .long 0x800ff458	#IASA Callback
  .long 0x800ff5a4	#Physics Callback
  .long 0x800ff814	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000178	#Move ID
  .long 0x0034051c	#Bitflags
  .long 0x1d000000	#Attack ID
  .long 0x800ff1f4	#Animation Callback
  .long 0x800ff458	#IASA Callback
  .long 0x800ff5a4	#Physics Callback
  .long 0x800ff814	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000179	#Move ID
  .long 0x0034051c	#Bitflags
  .long 0x1d000000	#Attack ID
  .long 0x800ff328	#Animation Callback
  .long 0x800ff4c8	#IASA Callback
  .long 0x800ff604	#Physics Callback
  .long 0x800ff880	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000017a	#Move ID
  .long 0x00340019	#Bitflags
  .long 0x1a000000	#Attack ID
  .long 0x800fa9fc	#Animation Callback
  .long 0x800facac	#IASA Callback
  .long 0x800faf74	#Physics Callback
  .long 0x800fb034	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000017b	#Move ID
  .long 0x003c0019	#Bitflags
  .long 0x1a000000	#Attack ID
  .long 0x800faa74	#Animation Callback
  .long 0x800facb0	#IASA Callback
  .long 0x800faf94	#Physics Callback
  .long 0x800fb0c4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000017c	#Move ID
  .long 0x00340019	#Bitflags
  .long 0x1a000000	#Attack ID
  .long 0x800fab18	#Animation Callback
  .long 0x800fae0c	#IASA Callback
  .long 0x800fafb4	#Physics Callback
  .long 0x800fb154	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000017d	#Move ID
  .long 0x00340419	#Bitflags
  .long 0x1a000000	#Attack ID
  .long 0x800fab54	#Animation Callback
  .long 0x800fae10	#IASA Callback
  .long 0x800fafd4	#Physics Callback
  .long 0x800fb1e4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000017e	#Move ID
  .long 0x003c0419	#Bitflags
  .long 0x1a000000	#Attack ID
  .long 0x800fabcc	#Animation Callback
  .long 0x800fae14	#IASA Callback
  .long 0x800faff4	#Physics Callback
  .long 0x800fb274	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000017f	#Move ID
  .long 0x00340419	#Bitflags
  .long 0x1a000000	#Attack ID
  .long 0x800fac70	#Animation Callback
  .long 0x800faf70	#IASA Callback
  .long 0x800fb014	#Physics Callback
  .long 0x800fb304	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000180	#Move ID
  .long 0x0034001d	#Bitflags
  .long 0x1e000000	#Attack ID
  .long 0x8010c5fc	#Animation Callback
  .long 0x8010c774	#IASA Callback
  .long 0x8010c77c	#Physics Callback
  .long 0x8010c860	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000181	#Move ID
  .long 0x0034001d	#Bitflags
  .long 0x1e000000	#Attack ID
  .long 0x8010cab4	#Animation Callback
  .long 0x8010cb7c	#IASA Callback
  .long 0x8010cb84	#Physics Callback
  .long 0x8010cbf4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000182	#Move ID
  .long 0x0034041d	#Bitflags
  .long 0x1e000000	#Attack ID
  .long 0x8010c6b8	#Animation Callback
  .long 0x8010c778	#IASA Callback
  .long 0x8010c7b0	#Physics Callback
  .long 0x8010c89c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000183	#Move ID
  .long 0x0034041d	#Bitflags
  .long 0x1e000000	#Attack ID
  .long 0x8010cb18	#Animation Callback
  .long 0x8010cb80	#IASA Callback
  .long 0x8010cba4	#Physics Callback
  .long 0x8010cc30	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000184	#Move ID
  .long 0x0034011e	#Bitflags
  .long 0x1f000000	#Attack ID
  .long 0x80108efc	#Animation Callback
  .long 0x80108f74	#IASA Callback
  .long 0x80108f7c	#Physics Callback
  .long 0x80108fbc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000185	#Move ID
  .long 0x0034051e	#Bitflags
  .long 0x1f000000	#Attack ID
  .long 0x80108f38	#Animation Callback
  .long 0x80108f78	#IASA Callback
  .long 0x80108f9c	#Physics Callback
  .long 0x80109030	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000186	#Move ID
  .long 0x00340218	#Bitflags
  .long 0x19000000	#Attack ID
  .long 0x800ffb24	#Animation Callback
  .long 0x801003dc	#IASA Callback
  .long 0x80100660	#Physics Callback
  .long 0x801007a0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000187	#Move ID
  .long 0x00340218	#Bitflags
  .long 0x19000000	#Attack ID
  .long 0x800ffbac	#Animation Callback
  .long 0x801003e0	#IASA Callback
  .long 0x80100680	#Physics Callback
  .long 0x80100840	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000188	#Move ID
  .long 0x00340218	#Bitflags
  .long 0x19000000	#Attack ID
  .long 0x800ffc48	#Animation Callback
  .long 0x80100518	#IASA Callback
  .long 0x801006a0	#Physics Callback
  .long 0x801008e0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000189	#Move ID
  .long 0x00340218	#Bitflags
  .long 0x19000000	#Attack ID
  .long 0x800ffc94	#Animation Callback
  .long 0x8010051c	#IASA Callback
  .long 0x801006c0	#Physics Callback
  .long 0x80100980	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000018a	#Move ID
  .long 0x00340218	#Bitflags
  .long 0x19000000	#Attack ID
  .long 0x800ffe6c	#Animation Callback
  .long 0x80100520	#IASA Callback
  .long 0x801006e0	#Physics Callback
  .long 0x80100a20	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000018b	#Move ID
  .long 0x00340618	#Bitflags
  .long 0x19000000	#Attack ID
  .long 0x800fffb8	#Animation Callback
  .long 0x80100524	#IASA Callback
  .long 0x80100700	#Physics Callback
  .long 0x80100ac0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000018c	#Move ID
  .long 0x00340618	#Bitflags
  .long 0x19000000	#Attack ID
  .long 0x80100040	#Animation Callback
  .long 0x80100528	#IASA Callback
  .long 0x80100720	#Physics Callback
  .long 0x80100b60	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000018d	#Move ID
  .long 0x00340618	#Bitflags
  .long 0x19000000	#Attack ID
  .long 0x801000dc	#Animation Callback
  .long 0x80100654	#IASA Callback
  .long 0x80100740	#Physics Callback
  .long 0x80100c00	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000018e	#Move ID
  .long 0x00340618	#Bitflags
  .long 0x19000000	#Attack ID
  .long 0x80100128	#Animation Callback
  .long 0x80100658	#IASA Callback
  .long 0x80100760	#Physics Callback
  .long 0x80100ca0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000018f	#Move ID
  .long 0x00340618	#Bitflags
  .long 0x19000000	#Attack ID
  .long 0x801002c8	#Animation Callback
  .long 0x8010065c	#IASA Callback
  .long 0x80100780	#Physics Callback
  .long 0x80100d40	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000190	#Move ID
  .long 0x00340026	#Bitflags
  .long 0x27000000	#Attack ID
  .long 0x80105c3c	#Animation Callback
  .long 0x80105d64	#IASA Callback
  .long 0x80105d6c	#Physics Callback
  .long 0x80105e14	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000191	#Move ID
  .long 0x00340426	#Bitflags
  .long 0x27000000	#Attack ID
  .long 0x80105cd0	#Animation Callback
  .long 0x80105d68	#IASA Callback
  .long 0x80105da0	#Physics Callback
  .long 0x80105e50	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000192	#Move ID
  .long 0x0034011b	#Bitflags
  .long 0x1c000000	#Attack ID
  .long 0x8010629c	#Animation Callback
  .long 0x8010672c	#IASA Callback
  .long 0x801068fc	#Physics Callback
  .long 0x801069fc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000193	#Move ID
  .long 0x003c011b	#Bitflags
  .long 0x1c000000	#Attack ID
  .long 0x80106334	#Animation Callback
  .long 0x80106730	#IASA Callback
  .long 0x8010691c	#Physics Callback
  .long 0x80106a84	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000194	#Move ID
  .long 0x0034011b	#Bitflags
  .long 0x1c000000	#Attack ID
  .long 0x801063e0	#Animation Callback
  .long 0x8010680c	#IASA Callback
  .long 0x8010693c	#Physics Callback
  .long 0x80106b0c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000195	#Move ID
  .long 0x0034011b	#Bitflags
  .long 0x1c000000	#Attack ID
  .long 0x80106428	#Animation Callback
  .long 0x80106810	#IASA Callback
  .long 0x8010695c	#Physics Callback
  .long 0x80106b84	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000196	#Move ID
  .long 0x0034051b	#Bitflags
  .long 0x1c000000	#Attack ID
  .long 0x801064ac	#Animation Callback
  .long 0x80106814	#IASA Callback
  .long 0x8010697c	#Physics Callback
  .long 0x80106c10	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000197	#Move ID
  .long 0x003c051b	#Bitflags
  .long 0x1c000000	#Attack ID
  .long 0x80106544	#Animation Callback
  .long 0x80106818	#IASA Callback
  .long 0x8010699c	#Physics Callback
  .long 0x80106c98	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000198	#Move ID
  .long 0x0034051b	#Bitflags
  .long 0x1c000000	#Attack ID
  .long 0x801065f0	#Animation Callback
  .long 0x801068f4	#IASA Callback
  .long 0x801069bc	#Physics Callback
  .long 0x80106d20	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000199	#Move ID
  .long 0x0034051b	#Bitflags
  .long 0x1c000000	#Attack ID
  .long 0x80106670	#Animation Callback
  .long 0x801068f8	#IASA Callback
  .long 0x801069dc	#Physics Callback
  .long 0x80106d5c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000019a	#Move ID
  .long 0x00340222	#Bitflags
  .long 0x23000000	#Attack ID
  .long 0x801016cc	#Animation Callback
  .long 0x801035c8	#IASA Callback
  .long 0x80103d10	#Physics Callback
  .long 0x801046a4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000019b	#Move ID
  .long 0x00340222	#Bitflags
  .long 0x23000000	#Attack ID
  .long 0x801016cc	#Animation Callback
  .long 0x801035c8	#IASA Callback
  .long 0x80103d10	#Physics Callback
  .long 0x801046a4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000019c	#Move ID
  .long 0x003c0222	#Bitflags
  .long 0x23000000	#Attack ID
  .long 0x801017b0	#Animation Callback
  .long 0x801035cc	#IASA Callback
  .long 0x80103d40	#Physics Callback
  .long 0x8010475c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000019d	#Move ID
  .long 0x003c0222	#Bitflags
  .long 0x23000000	#Attack ID
  .long 0x80101960	#Animation Callback
  .long 0x80103734	#IASA Callback
  .long 0x80103d70	#Physics Callback
  .long 0x80104864	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000019e	#Move ID
  .long 0x00340222	#Bitflags
  .long 0x23000000	#Attack ID
  .long 0x80101ad0	#Animation Callback
  .long 0x8010389c	#IASA Callback
  .long 0x80103da0	#Physics Callback
  .long 0x8010496c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000019f	#Move ID
  .long 0x00340222	#Bitflags
  .long 0x23000000	#Attack ID
  .long 0x80101ea0	#Animation Callback
  .long 0x80103a24	#IASA Callback
  .long 0x80103fa8	#Physics Callback
  .long 0x80104d14	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001a0	#Move ID
  .long 0x00340222	#Bitflags
  .long 0x23000000	#Attack ID
  .long 0x80102198	#Animation Callback
  .long 0x80103a28	#IASA Callback
  .long 0x801042ac	#Physics Callback
  .long 0x80104df8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001a1	#Move ID
  .long 0x00340222	#Bitflags
  .long 0x23000000	#Attack ID
  .long 0x80102198	#Animation Callback
  .long 0x80103a28	#IASA Callback
  .long 0x801042ac	#Physics Callback
  .long 0x80104df8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001a2	#Move ID
  .long 0x00340622	#Bitflags
  .long 0x23000000	#Attack ID
  .long 0x80102470	#Animation Callback
  .long 0x80103a2c	#IASA Callback
  .long 0x801042e8	#Physics Callback
  .long 0x80104e58	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001a3	#Move ID
  .long 0x00340622	#Bitflags
  .long 0x23000000	#Attack ID
  .long 0x80102470	#Animation Callback
  .long 0x80103a2c	#IASA Callback
  .long 0x801042e8	#Physics Callback
  .long 0x80104e58	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001a4	#Move ID
  .long 0x003c0622	#Bitflags
  .long 0x23000000	#Attack ID
  .long 0x8010254c	#Animation Callback
  .long 0x80103a30	#IASA Callback
  .long 0x80104318	#Physics Callback
  .long 0x80104f10	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001a5	#Move ID
  .long 0x003c0622	#Bitflags
  .long 0x23000000	#Attack ID
  .long 0x801026fc	#Animation Callback
  .long 0x80103b98	#IASA Callback
  .long 0x80104348	#Physics Callback
  .long 0x80105018	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001a6	#Move ID
  .long 0x00340622	#Bitflags
  .long 0x23000000	#Attack ID
  .long 0x8010286c	#Animation Callback
  .long 0x80103d00	#IASA Callback
  .long 0x80104378	#Physics Callback
  .long 0x80105120	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001a7	#Move ID
  .long 0x00340222	#Bitflags
  .long 0x23000000	#Attack ID
  .long 0x80102dd0	#Animation Callback
  .long 0x80103d04	#IASA Callback
  .long 0x801044f8	#Physics Callback
  .long 0x801056fc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001a8	#Move ID
  .long 0x00340622	#Bitflags
  .long 0x23000000	#Attack ID
  .long 0x80103088	#Animation Callback
  .long 0x80103d08	#IASA Callback
  .long 0x80104610	#Physics Callback
  .long 0x801057bc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001a9	#Move ID
  .long 0x00340622	#Bitflags
  .long 0x23000000	#Attack ID
  .long 0x80103088	#Animation Callback
  .long 0x80103d08	#IASA Callback
  .long 0x80104610	#Physics Callback
  .long 0x801057bc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001aa	#Move ID
  .long 0x00340622	#Bitflags
  .long 0x23000000	#Attack ID
  .long 0x80103374	#Animation Callback
  .long 0x80103d0c	#IASA Callback
  .long 0x80104640	#Physics Callback
  .long 0x8010581c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001ab	#Move ID
  .long 0x00340225	#Bitflags
  .long 0x26000000	#Attack ID
  .long 0x8010b65c	#Animation Callback
  .long 0x8010b72c	#IASA Callback
  .long 0x8010b734	#Physics Callback
  .long 0x8010b7f0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001ac	#Move ID
  .long 0x00340225	#Bitflags
  .long 0x26000000	#Attack ID
  .long 0x8010b958	#Animation Callback
  .long 0x8010ba28	#IASA Callback
  .long 0x8010ba98	#Physics Callback
  .long 0x8010bad8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001ad	#Move ID
  .long 0x00340225	#Bitflags
  .long 0x26000000	#Attack ID
  .long 0x8010bce0	#Animation Callback
  .long 0x8010bed0	#IASA Callback
  .long 0x8010bed8	#Physics Callback
  .long 0x8010bf18	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001ae	#Move ID
  .long 0x00340225	#Bitflags
  .long 0x26000000	#Attack ID
  .long 0x8010bce0	#Animation Callback
  .long 0x8010bed0	#IASA Callback
  .long 0x8010bed8	#Physics Callback
  .long 0x8010bf18	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001af	#Move ID
  .long 0x00340625	#Bitflags
  .long 0x26000000	#Attack ID
  .long 0x8010b6c4	#Animation Callback
  .long 0x8010b730	#IASA Callback
  .long 0x8010b78c	#Physics Callback
  .long 0x8010b82c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001b0	#Move ID
  .long 0x00340625	#Bitflags
  .long 0x26000000	#Attack ID
  .long 0x8010b9c0	#Animation Callback
  .long 0x8010ba60	#IASA Callback
  .long 0x8010bab8	#Physics Callback
  .long 0x8010bb14	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001b1	#Move ID
  .long 0x00340625	#Bitflags
  .long 0x26000000	#Attack ID
  .long 0x8010bdd8	#Animation Callback
  .long 0x8010bed4	#IASA Callback
  .long 0x8010bef8	#Physics Callback
  .long 0x8010bf54	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001b2	#Move ID
  .long 0x00340625	#Bitflags
  .long 0x26000000	#Attack ID
  .long 0x8010bdd8	#Animation Callback
  .long 0x8010bed4	#IASA Callback
  .long 0x8010bef8	#Physics Callback
  .long 0x8010bf54	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001b3	#Move ID
  .long 0x00340123	#Bitflags
  .long 0x24000000	#Attack ID
  .long 0x80107700	#Animation Callback
  .long 0x80108040	#IASA Callback
  .long 0x80108658	#Physics Callback
  .long 0x80108798	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001b4	#Move ID
  .long 0x003c0123	#Bitflags
  .long 0x24000000	#Attack ID
  .long 0x80107884	#Animation Callback
  .long 0x80108044	#IASA Callback
  .long 0x80108678	#Physics Callback
  .long 0x80108820	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001b5	#Move ID
  .long 0x003c0123	#Bitflags
  .long 0x24000000	#Attack ID
  .long 0x80107a84	#Animation Callback
  .long 0x801081f8	#IASA Callback
  .long 0x80108698	#Physics Callback
  .long 0x801088a8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001b6	#Move ID
  .long 0x00340123	#Bitflags
  .long 0x24000000	#Attack ID
  .long 0x80107ab4	#Animation Callback
  .long 0x80108394	#IASA Callback
  .long 0x801086b8	#Physics Callback
  .long 0x80108930	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001b7	#Move ID
  .long 0x00340123	#Bitflags
  .long 0x24000000	#Attack ID
  .long 0x80107b38	#Animation Callback
  .long 0x80108398	#IASA Callback
  .long 0x801086d8	#Physics Callback
  .long 0x801089b8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001b8	#Move ID
  .long 0x00340523	#Bitflags
  .long 0x24000000	#Attack ID
  .long 0x80107b7c	#Animation Callback
  .long 0x8010839c	#IASA Callback
  .long 0x801086f8	#Physics Callback
  .long 0x80108a40	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001b9	#Move ID
  .long 0x003c0523	#Bitflags
  .long 0x24000000	#Attack ID
  .long 0x80107d0c	#Animation Callback
  .long 0x801083a0	#IASA Callback
  .long 0x80108718	#Physics Callback
  .long 0x80108ac8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001ba	#Move ID
  .long 0x003c0523	#Bitflags
  .long 0x24000000	#Attack ID
  .long 0x80107f0c	#Animation Callback
  .long 0x80108504	#IASA Callback
  .long 0x80108738	#Physics Callback
  .long 0x80108b50	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001bb	#Move ID
  .long 0x00340523	#Bitflags
  .long 0x24000000	#Attack ID
  .long 0x80107f3c	#Animation Callback
  .long 0x80108650	#IASA Callback
  .long 0x80108758	#Physics Callback
  .long 0x80108bd8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001bc	#Move ID
  .long 0x00340523	#Bitflags
  .long 0x24000000	#Attack ID
  .long 0x80107fc0	#Animation Callback
  .long 0x80108654	#IASA Callback
  .long 0x80108778	#Physics Callback
  .long 0x80108c60	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001bd	#Move ID
  .long 0x0034012b	#Bitflags
  .long 0x2c000000	#Attack ID
  .long 0x8010d280	#Animation Callback
  .long 0x8010d3c0	#IASA Callback
  .long 0x8010d4c8	#Physics Callback
  .long 0x8010d508	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001be	#Move ID
  .long 0x0034052b	#Bitflags
  .long 0x2c000000	#Attack ID
  .long 0x8010d320	#Animation Callback
  .long 0x8010d444	#IASA Callback
  .long 0x8010d4e8	#Physics Callback
  .long 0x8010d544	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001bf	#Move ID
  .long 0x00340028	#Bitflags
  .long 0x29000000	#Attack ID
  .long 0x800f9198	#Animation Callback
  .long 0x800f91d4	#IASA Callback
  .long 0x800f9204	#Physics Callback
  .long 0x800f9224	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001c0	#Move ID
  .long 0x00340428	#Bitflags
  .long 0x29000000	#Attack ID
  .long 0x800f9454	#Animation Callback
  .long 0x800f9490	#IASA Callback
  .long 0x800f94c0	#Physics Callback
  .long 0x800f94e0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001c1	#Move ID
  .long 0x00340127	#Bitflags
  .long 0x28000000	#Attack ID
  .long 0x800fbbc4	#Animation Callback
  .long 0x800fc374	#IASA Callback
  .long 0x800fc70c	#Physics Callback
  .long 0x800fc7cc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001c2	#Move ID
  .long 0x003c0127	#Bitflags
  .long 0x28000000	#Attack ID
  .long 0x800fbdfc	#Animation Callback
  .long 0x800fc46c	#IASA Callback
  .long 0x800fc72c	#Physics Callback
  .long 0x800fc880	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001c3	#Move ID
  .long 0x00340127	#Bitflags
  .long 0x28000000	#Attack ID
  .long 0x800fbed0	#Animation Callback
  .long 0x800fc53c	#IASA Callback
  .long 0x800fc74c	#Physics Callback
  .long 0x800fc934	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001c4	#Move ID
  .long 0x00340527	#Bitflags
  .long 0x28000000	#Attack ID
  .long 0x800fbf34	#Animation Callback
  .long 0x800fc540	#IASA Callback
  .long 0x800fc76c	#Physics Callback
  .long 0x800fc9f0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001c5	#Move ID
  .long 0x003c0527	#Bitflags
  .long 0x28000000	#Attack ID
  .long 0x800fc1a0	#Animation Callback
  .long 0x800fc638	#IASA Callback
  .long 0x800fc78c	#Physics Callback
  .long 0x800fcaa4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001c6	#Move ID
  .long 0x00340527	#Bitflags
  .long 0x28000000	#Attack ID
  .long 0x800fc274	#Animation Callback
  .long 0x800fc708	#IASA Callback
  .long 0x800fc7ac	#Physics Callback
  .long 0x800fcb58	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001c7	#Move ID
  .long 0x00340129	#Bitflags
  .long 0x2a000000	#Attack ID
  .long 0x800fe360	#Animation Callback
  .long 0x800fea50	#IASA Callback
  .long 0x800feaf8	#Physics Callback
  .long 0x800febb8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001c8	#Move ID
  .long 0x003c0129	#Bitflags
  .long 0x2a000000	#Attack ID
  .long 0x800fe450	#Animation Callback
  .long 0x800fea78	#IASA Callback
  .long 0x800feb18	#Physics Callback
  .long 0x800febd8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001c9	#Move ID
  .long 0x00340129	#Bitflags
  .long 0x2a000000	#Attack ID
  .long 0x800fe5c8	#Animation Callback
  .long 0x800feaa0	#IASA Callback
  .long 0x800feb38	#Physics Callback
  .long 0x800febf8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001ca	#Move ID
  .long 0x00340529	#Bitflags
  .long 0x2a000000	#Attack ID
  .long 0x800fe688	#Animation Callback
  .long 0x800feaa4	#IASA Callback
  .long 0x800feb58	#Physics Callback
  .long 0x800fec18	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001cb	#Move ID
  .long 0x003c0529	#Bitflags
  .long 0x2a000000	#Attack ID
  .long 0x800fe778	#Animation Callback
  .long 0x800feacc	#IASA Callback
  .long 0x800feb78	#Physics Callback
  .long 0x800fec38	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001cc	#Move ID
  .long 0x00340529	#Bitflags
  .long 0x2a000000	#Attack ID
  .long 0x800fe928	#Animation Callback
  .long 0x800feaf4	#IASA Callback
  .long 0x800feb98	#Physics Callback
  .long 0x800fec58	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001cd	#Move ID
  .long 0x0034012a	#Bitflags
  .long 0x2b000000	#Attack ID
  .long 0x800fa0f4	#Animation Callback
  .long 0x800fa418	#IASA Callback
  .long 0x800fa420	#Physics Callback
  .long 0x800fa460	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001ce	#Move ID
  .long 0x0034052a	#Bitflags
  .long 0x2b000000	#Attack ID
  .long 0x800fa254	#Animation Callback
  .long 0x800fa41c	#IASA Callback
  .long 0x800fa440	#Physics Callback
  .long 0x800fa4f0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001cf	#Move ID
  .long 0x0034022c	#Bitflags
  .long 0x2d000000	#Attack ID
  .long 0x800f9aec	#Animation Callback
  .long 0x800f9b64	#IASA Callback
  .long 0x800f9c58	#Physics Callback
  .long 0x800f9e8c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001d0	#Move ID
  .long 0x0034062c	#Bitflags
  .long 0x2d000000	#Attack ID
  .long 0x800f9b28	#Animation Callback
  .long 0x800f9b68	#IASA Callback
  .long 0x800f9d40	#Physics Callback
  .long 0x800f9f34	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001d1	#Move ID
  .long 0x0034022d	#Bitflags
  .long 0x2e000000	#Attack ID
  .long 0x8010b65c	#Animation Callback
  .long 0x8010b72c	#IASA Callback
  .long 0x8010b734	#Physics Callback
  .long 0x8010b7f0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001d2	#Move ID
  .long 0x0034022d	#Bitflags
  .long 0x2e000000	#Attack ID
  .long 0x8010b958	#Animation Callback
  .long 0x8010ba28	#IASA Callback
  .long 0x8010ba98	#Physics Callback
  .long 0x8010bad8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001d3	#Move ID
  .long 0x0034022d	#Bitflags
  .long 0x2e000000	#Attack ID
  .long 0x8010bce0	#Animation Callback
  .long 0x8010bed0	#IASA Callback
  .long 0x8010bed8	#Physics Callback
  .long 0x8010bf18	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001d4	#Move ID
  .long 0x0034022d	#Bitflags
  .long 0x2e000000	#Attack ID
  .long 0x8010bce0	#Animation Callback
  .long 0x8010bed0	#IASA Callback
  .long 0x8010bed8	#Physics Callback
  .long 0x8010bf18	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001d5	#Move ID
  .long 0x0034062d	#Bitflags
  .long 0x2e000000	#Attack ID
  .long 0x8010b6c4	#Animation Callback
  .long 0x8010b730	#IASA Callback
  .long 0x8010b78c	#Physics Callback
  .long 0x8010b82c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001d6	#Move ID
  .long 0x0034062d	#Bitflags
  .long 0x2e000000	#Attack ID
  .long 0x8010b9c0	#Animation Callback
  .long 0x8010ba60	#IASA Callback
  .long 0x8010bab8	#Physics Callback
  .long 0x8010bb14	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001d7	#Move ID
  .long 0x0034062d	#Bitflags
  .long 0x2e000000	#Attack ID
  .long 0x8010bdd8	#Animation Callback
  .long 0x8010bed4	#IASA Callback
  .long 0x8010bef8	#Physics Callback
  .long 0x8010bf54	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001d8	#Move ID
  .long 0x0034062d	#Bitflags
  .long 0x2e000000	#Attack ID
  .long 0x8010bdd8	#Animation Callback
  .long 0x8010bed4	#IASA Callback
  .long 0x8010bef8	#Physics Callback
  .long 0x8010bf54	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001d9	#Move ID
  .long 0x0034002e	#Bitflags
  .long 0x2f000000	#Attack ID
  .long 0x800fa9fc	#Animation Callback
  .long 0x800facac	#IASA Callback
  .long 0x800faf74	#Physics Callback
  .long 0x800fb034	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001da	#Move ID
  .long 0x003c002e	#Bitflags
  .long 0x2f000000	#Attack ID
  .long 0x800faa74	#Animation Callback
  .long 0x800facb0	#IASA Callback
  .long 0x800faf94	#Physics Callback
  .long 0x800fb0c4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001db	#Move ID
  .long 0x0034002e	#Bitflags
  .long 0x2f000000	#Attack ID
  .long 0x800fab18	#Animation Callback
  .long 0x800fae0c	#IASA Callback
  .long 0x800fafb4	#Physics Callback
  .long 0x800fb154	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001dc	#Move ID
  .long 0x0034042e	#Bitflags
  .long 0x2f000000	#Attack ID
  .long 0x800fab54	#Animation Callback
  .long 0x800fae10	#IASA Callback
  .long 0x800fafd4	#Physics Callback
  .long 0x800fb1e4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001dd	#Move ID
  .long 0x003c042e	#Bitflags
  .long 0x2f000000	#Attack ID
  .long 0x800fabcc	#Animation Callback
  .long 0x800fae14	#IASA Callback
  .long 0x800faff4	#Physics Callback
  .long 0x800fb274	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000001de	#Move ID
  .long 0x0034042e	#Bitflags
  .long 0x2f000000	#Attack ID
  .long 0x800fac70	#Animation Callback
  .long 0x800faf70	#IASA Callback
  .long 0x800fb014	#Physics Callback
  .long 0x800fb304	#Collision Callback
  .long 0x800761c8	#Camera Callback

  FighterMoveLogic_Bowser:
  .long 0x00000127	#Move ID
  .long 0x00340011	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80134f48	#Animation Callback
  .long 0x801351b0	#IASA Callback
  .long 0x80135438	#Physics Callback
  .long 0x801354f8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000128	#Move ID
  .long 0x003c0011	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80134f9c	#Animation Callback
  .long 0x801351b4	#IASA Callback
  .long 0x80135458	#Physics Callback
  .long 0x80135564	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000129	#Move ID
  .long 0x00340011	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80135040	#Animation Callback
  .long 0x801352f0	#IASA Callback
  .long 0x80135478	#Physics Callback
  .long 0x801355d0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012a	#Move ID
  .long 0x00340411	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8013507c	#Animation Callback
  .long 0x801352f4	#IASA Callback
  .long 0x80135498	#Physics Callback
  .long 0x8013563c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012b	#Move ID
  .long 0x003c0411	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x801350d0	#Animation Callback
  .long 0x801352f8	#IASA Callback
  .long 0x801354b8	#Physics Callback
  .long 0x801356a8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012c	#Move ID
  .long 0x00340411	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80135174	#Animation Callback
  .long 0x80135434	#IASA Callback
  .long 0x801354d8	#Physics Callback
  .long 0x80135714	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x00340012	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80133654	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x80134224	#Physics Callback
  .long 0x80134388	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012e	#Move ID
  .long 0x00340012	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x801336cc	#Animation Callback
  .long 0x80133bf4	#IASA Callback
  .long 0x80134288	#Physics Callback
  .long 0x801343d8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012f	#Move ID
  .long 0x00340012	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x801336cc	#Animation Callback
  .long 0x80133bf4	#IASA Callback
  .long 0x80134288	#Physics Callback
  .long 0x801343d8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012e	#Move ID
  .long 0x00340012	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x801339ac	#Animation Callback
  .long 0x80133e4c	#IASA Callback
  .long 0x801342c8	#Physics Callback
  .long 0x80134428	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000130	#Move ID
  .long 0x00340012	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x801339b4	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x80134308	#Physics Callback
  .long 0x80134478	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000131	#Move ID
  .long 0x00340012	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80133a90	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x80134328	#Physics Callback
  .long 0x801344a0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000132	#Move ID
  .long 0x00340412	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80133690	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x80134244	#Physics Callback
  .long 0x801343b0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000133	#Move ID
  .long 0x00340412	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8013383c	#Animation Callback
  .long 0x80133d20	#IASA Callback
  .long 0x801342a8	#Physics Callback
  .long 0x80134400	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000134	#Move ID
  .long 0x00340412	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8013383c	#Animation Callback
  .long 0x80133d20	#IASA Callback
  .long 0x801342a8	#Physics Callback
  .long 0x80134400	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000133	#Move ID
  .long 0x00340012	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x801339b0	#Animation Callback
  .long 0x80134038	#IASA Callback
  .long 0x801342e8	#Physics Callback
  .long 0x80134450	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00340412	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80133ad4	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x80134348	#Physics Callback
  .long 0x801344c8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000136	#Move ID
  .long 0x00340412	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80133bb0	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x80134368	#Physics Callback
  .long 0x801344f0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000137	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80135c08	#Animation Callback
  .long 0x80135d78	#IASA Callback
  .long 0x80135d80	#Physics Callback
  .long 0x80135e4c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000138	#Move ID
  .long 0x00340613	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80135c60	#Animation Callback
  .long 0x80135d7c	#IASA Callback
  .long 0x80135de0	#Physics Callback
  .long 0x80135f6c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000139	#Move ID
  .long 0x00340214	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8013474c	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x801347c4	#Physics Callback
  .long 0x801348a0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013a	#Move ID
  .long 0x00340614	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x80134788	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x80134804	#Physics Callback
  .long 0x801348c0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013b	#Move ID
  .long 0x00340214	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x801349c4	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x80134a00	#Physics Callback
  .long 0x80134a20	#Collision Callback
  .long 0x800761c8	#Camera Callback

  FighterMoveLogic_Link:
  .long 0x00000127	#Move ID
  .long 0x00240009	#Bitflags
  .long 0x0a000000	#Attack ID
  .long 0x800cede0	#Animation Callback
  .long 0x800cee00	#IASA Callback
  .long 0x800cee30	#Physics Callback
  .long 0x800cee50	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0xffffffff	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x00000000	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x00000000	#Physics Callback
  .long 0x00000000	#Collision Callback
  .long 0x00000000	#Camera Callback
  .long 0xffffffff	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x00000000	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x00000000	#Physics Callback
  .long 0x00000000	#Collision Callback
  .long 0x00000000	#Camera Callback
  .long 0x00000128	#Move ID
  .long 0x00340111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800ed15c	#Animation Callback
  .long 0x800edd88	#IASA Callback
  .long 0x800edfd8	#Physics Callback
  .long 0x800ee098	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000129	#Move ID
  .long 0x003c0111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800ed480	#Animation Callback
  .long 0x800ede30	#IASA Callback
  .long 0x800edff8	#Physics Callback
  .long 0x800ee120	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012a	#Move ID
  .long 0x00340111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800ed5b4	#Animation Callback
  .long 0x800edeac	#IASA Callback
  .long 0x800ee018	#Physics Callback
  .long 0x800ee1a8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012b	#Move ID
  .long 0x00340511	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800ed72c	#Animation Callback
  .long 0x800edeb0	#IASA Callback
  .long 0x800ee038	#Physics Callback
  .long 0x800ee2e0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012c	#Move ID
  .long 0x003c0511	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800eda58	#Animation Callback
  .long 0x800edf58	#IASA Callback
  .long 0x800ee058	#Physics Callback
  .long 0x800ee368	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x00340511	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800edb8c	#Animation Callback
  .long 0x800edfd4	#IASA Callback
  .long 0x800ee078	#Physics Callback
  .long 0x800ee3f0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012e	#Move ID
  .long 0x00340112	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800ec54c	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800ec88c	#Physics Callback
  .long 0x800ec94c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012f	#Move ID
  .long 0x00340112	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800ec588	#Animation Callback
  .long 0x800ec71c	#IASA Callback
  .long 0x800ec8ac	#Physics Callback
  .long 0x800ec9c4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000130	#Move ID
  .long 0x00340112	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800ec5f8	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800ec8cc	#Physics Callback
  .long 0x800eca1c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000131	#Move ID
  .long 0x00340512	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800ec634	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800ec8ec	#Physics Callback
  .long 0x800eca88	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000132	#Move ID
  .long 0x00340512	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800ec670	#Animation Callback
  .long 0x800ec810	#IASA Callback
  .long 0x800ec90c	#Physics Callback
  .long 0x800ecb00	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000133	#Move ID
  .long 0x00340512	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800ec6e0	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800ec92c	#Physics Callback
  .long 0x800ecb58	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000134	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800ebc10	#Animation Callback
  .long 0x800ebcac	#IASA Callback
  .long 0x800ebd30	#Physics Callback
  .long 0x800ebdc0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800ebc4c	#Animation Callback
  .long 0x800ebcb0	#IASA Callback
  .long 0x800ebcb4	#Physics Callback
  .long 0x800ebdfc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000136	#Move ID
  .long 0x00340014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800eb8a4	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800eb91c	#Physics Callback
  .long 0x800eb95c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000137	#Move ID
  .long 0x00340414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800eb8e0	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800eb93c	#Physics Callback
  .long 0x800eb9d4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000138	#Move ID
  .long 0x00200000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x800c3d6c	#Animation Callback
  .long 0x800c4384	#IASA Callback
  .long 0x800c438c	#Physics Callback
  .long 0x800c447c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000139	#Move ID
  .long 0x00c00000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x800c4380	#Animation Callback
  .long 0x800c4388	#IASA Callback
  .long 0x800c4438	#Physics Callback
  .long 0x80082b78	#Collision Callback
  .long 0x800761c8	#Camera Callback

  FighterMoveLogic_Sheik:
  .long 0x00000127	#Move ID
  .long 0x00340111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80112248	#Animation Callback
  .long 0x801126c8	#IASA Callback
  .long 0x80112878	#Physics Callback
  .long 0x80112978	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000128	#Move ID
  .long 0x003c0111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x801122d8	#Animation Callback
  .long 0x801126cc	#IASA Callback
  .long 0x80112898	#Physics Callback
  .long 0x801129f8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000129	#Move ID
  .long 0x00340111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80112384	#Animation Callback
  .long 0x80112798	#IASA Callback
  .long 0x801128b8	#Physics Callback
  .long 0x80112a78	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012a	#Move ID
  .long 0x00340111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x801123cc	#Animation Callback
  .long 0x8011279c	#IASA Callback
  .long 0x801128d8	#Physics Callback
  .long 0x80112b00	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012b	#Move ID
  .long 0x00340511	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80112450	#Animation Callback
  .long 0x801127a0	#IASA Callback
  .long 0x801128f8	#Physics Callback
  .long 0x80112b98	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012c	#Move ID
  .long 0x003c0511	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x801124e0	#Animation Callback
  .long 0x801127a4	#IASA Callback
  .long 0x80112918	#Physics Callback
  .long 0x80112c18	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x00340511	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8011258c	#Animation Callback
  .long 0x80112870	#IASA Callback
  .long 0x80112938	#Physics Callback
  .long 0x80112c98	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012e	#Move ID
  .long 0x00340511	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8011260c	#Animation Callback
  .long 0x80112874	#IASA Callback
  .long 0x80112958	#Physics Callback
  .long 0x80112ce4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012f	#Move ID
  .long 0x00340012	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x801112cc	#Animation Callback
  .long 0x80111344	#IASA Callback
  .long 0x8011134c	#Physics Callback
  .long 0x801113c8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000131	#Move ID
  .long 0x003c0012	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80111588	#Animation Callback
  .long 0x80111708	#IASA Callback
  .long 0x80111778	#Physics Callback
  .long 0x801117b8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000130	#Move ID
  .long 0x00340012	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80111a48	#Animation Callback
  .long 0x80111bf0	#IASA Callback
  .long 0x80111bf8	#Physics Callback
  .long 0x80111c38	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000132	#Move ID
  .long 0x00340412	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80111308	#Animation Callback
  .long 0x80111348	#IASA Callback
  .long 0x8011136c	#Physics Callback
  .long 0x80111404	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000134	#Move ID
  .long 0x003c0412	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80111648	#Animation Callback
  .long 0x80111740	#IASA Callback
  .long 0x80111798	#Physics Callback
  .long 0x801117f4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000133	#Move ID
  .long 0x00340412	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80111b1c	#Animation Callback
  .long 0x80111bf4	#IASA Callback
  .long 0x80111c18	#Physics Callback
  .long 0x80111c74	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80113194	#Animation Callback
  .long 0x8011320c	#IASA Callback
  .long 0x80113214	#Physics Callback
  .long 0x80113278	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x801133fc	#Animation Callback
  .long 0x80113474	#IASA Callback
  .long 0x8011347c	#Physics Callback
  .long 0x801134a0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000136	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80113c40	#Animation Callback
  .long 0x80113cdc	#IASA Callback
  .long 0x80113ce4	#Physics Callback
  .long 0x80113d80	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000137	#Move ID
  .long 0x00340613	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x801131d0	#Animation Callback
  .long 0x80113210	#IASA Callback
  .long 0x80113234	#Physics Callback
  .long 0x801132b4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000137	#Move ID
  .long 0x00340613	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80113438	#Animation Callback
  .long 0x80113478	#IASA Callback
  .long 0x8011349c	#Physics Callback
  .long 0x80113540	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000138	#Move ID
  .long 0x00340613	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80113c7c	#Animation Callback
  .long 0x80113ce0	#IASA Callback
  .long 0x80113d04	#Physics Callback
  .long 0x80113dbc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000139	#Move ID
  .long 0x00340014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x801142e8	#Animation Callback
  .long 0x80114368	#IASA Callback
  .long 0x80114370	#Physics Callback
  .long 0x801143d4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013a	#Move ID
  .long 0x00340014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x80114524	#Animation Callback
  .long 0x8011459c	#IASA Callback
  .long 0x801145a4	#Physics Callback
  .long 0x80114608	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013b	#Move ID
  .long 0x00340414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x80114328	#Animation Callback
  .long 0x8011436c	#IASA Callback
  .long 0x80114390	#Physics Callback
  .long 0x80114410	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013c	#Move ID
  .long 0x00340414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x80114560	#Animation Callback
  .long 0x801145a0	#IASA Callback
  .long 0x801145c4	#Physics Callback
  .long 0x80114644	#Collision Callback
  .long 0x800761c8	#Camera Callback

  FighterMoveLogic_Ness:
  .long 0x0000003e	#Move ID
  .long 0x00241a09	#Bitflags
  .long 0x0a000000	#Attack ID
  .long 0x80114d50	#Animation Callback
  .long 0x80114e04	#IASA Callback
  .long 0x80114e64	#Physics Callback
  .long 0x80114e98	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000042	#Move ID
  .long 0x00240a0a	#Bitflags
  .long 0x0b800000	#Attack ID
  .long 0x80115c9c	#Animation Callback
  .long 0x80115e74	#IASA Callback
  .long 0x80115eb8	#Physics Callback
  .long 0x80115f14	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000127	#Move ID
  .long 0x0024080a	#Bitflags
  .long 0x0b000000	#Attack ID
  .long 0x80115f88	#Animation Callback
  .long 0x801160b4	#IASA Callback
  .long 0x801160e4	#Physics Callback
  .long 0x80116104	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000128	#Move ID
  .long 0x0024080a	#Bitflags
  .long 0x0b000000	#Attack ID
  .long 0x8011620c	#Animation Callback
  .long 0x801162b0	#IASA Callback
  .long 0x801162e0	#Physics Callback
  .long 0x80116420	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000043	#Move ID
  .long 0x00240a0b	#Bitflags
  .long 0x0c800000	#Attack ID
  .long 0x80116638	#Animation Callback
  .long 0x801166d4	#IASA Callback
  .long 0x80116718	#Physics Callback
  .long 0x8011674c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000129	#Move ID
  .long 0x0024080b	#Bitflags
  .long 0x0c000000	#Attack ID
  .long 0x80116798	#Animation Callback
  .long 0x80116828	#IASA Callback
  .long 0x80116858	#Physics Callback
  .long 0x80116878	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012a	#Move ID
  .long 0x0024080b	#Bitflags
  .long 0x0c000000	#Attack ID
  .long 0x80116958	#Animation Callback
  .long 0x801169bc	#IASA Callback
  .long 0x801169ec	#Physics Callback
  .long 0x80116a9c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012b	#Move ID
  .long 0x00340111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x801170dc	#Animation Callback
  .long 0x80117648	#IASA Callback
  .long 0x80117750	#Physics Callback
  .long 0x801178e8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012c	#Move ID
  .long 0x00340111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x801171bc	#Animation Callback
  .long 0x8011764c	#IASA Callback
  .long 0x80117788	#Physics Callback
  .long 0x80117954	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x00340111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x801171bc	#Animation Callback
  .long 0x8011764c	#IASA Callback
  .long 0x80117788	#Physics Callback
  .long 0x80117954	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012e	#Move ID
  .long 0x00340111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x801172f0	#Animation Callback
  .long 0x801176c8	#IASA Callback
  .long 0x801177a8	#Physics Callback
  .long 0x801179c0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012f	#Move ID
  .long 0x00340511	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80117378	#Animation Callback
  .long 0x801176cc	#IASA Callback
  .long 0x801177c8	#Physics Callback
  .long 0x80117a2c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000130	#Move ID
  .long 0x00340511	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80117458	#Animation Callback
  .long 0x801176d0	#IASA Callback
  .long 0x80117828	#Physics Callback
  .long 0x80117a98	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000131	#Move ID
  .long 0x00340511	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80117458	#Animation Callback
  .long 0x801176d0	#IASA Callback
  .long 0x80117828	#Physics Callback
  .long 0x80117a98	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000132	#Move ID
  .long 0x00340511	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8011758c	#Animation Callback
  .long 0x8011774c	#IASA Callback
  .long 0x80117888	#Physics Callback
  .long 0x80117b04	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000133	#Move ID
  .long 0x00340112	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80116d74	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x80116dec	#Physics Callback
  .long 0x80116e2c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000134	#Move ID
  .long 0x00340512	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80116db0	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x80116e0c	#Physics Callback
  .long 0x80116e68	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00340113	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x801186b0	#Animation Callback
  .long 0x80118f80	#IASA Callback
  .long 0x80118fa4	#Physics Callback
  .long 0x80119460	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000136	#Move ID
  .long 0x00340113	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x801187a4	#Animation Callback
  .long 0x80118f84	#IASA Callback
  .long 0x80118fdc	#Physics Callback
  .long 0x801194cc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000137	#Move ID
  .long 0x00340113	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80118900	#Animation Callback
  .long 0x80118f88	#IASA Callback
  .long 0x80118ffc	#Physics Callback
  .long 0x80119538	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000138	#Move ID
  .long 0x00340113	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x8011893c	#Animation Callback
  .long 0x80118f8c	#IASA Callback
  .long 0x8011901c	#Physics Callback
  .long 0x801195a4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000139	#Move ID
  .long 0x00340513	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80118a10	#Animation Callback
  .long 0x80118f90	#IASA Callback
  .long 0x80119134	#Physics Callback
  .long 0x80119798	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013a	#Move ID
  .long 0x00340513	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80118b04	#Animation Callback
  .long 0x80118f94	#IASA Callback
  .long 0x80119194	#Physics Callback
  .long 0x80119804	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013b	#Move ID
  .long 0x00340513	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80118d60	#Animation Callback
  .long 0x80118f98	#IASA Callback
  .long 0x801191f4	#Physics Callback
  .long 0x80119870	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013c	#Move ID
  .long 0x00340513	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80118df8	#Animation Callback
  .long 0x80118f9c	#IASA Callback
  .long 0x80119254	#Physics Callback
  .long 0x801198dc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013d	#Move ID
  .long 0x00340113	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80118ef0	#Animation Callback
  .long 0x80118fa0	#IASA Callback
  .long 0x80119410	#Physics Callback
  .long 0x80119d58	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013e	#Move ID
  .long 0x00340014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x80119f20	#Animation Callback
  .long 0x8011a0e0	#IASA Callback
  .long 0x8011a0e8	#Physics Callback
  .long 0x8011a168	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013f	#Move ID
  .long 0x003c0014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8011a2a8	#Animation Callback
  .long 0x8011a438	#IASA Callback
  .long 0x8011a440	#Physics Callback
  .long 0x8011a4e8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000140	#Move ID
  .long 0x00340014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8011abf8	#Animation Callback
  .long 0x8011aee0	#IASA Callback
  .long 0x8011aee8	#Physics Callback
  .long 0x8011af90	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000141	#Move ID
  .long 0x00340014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8011b25c	#Animation Callback
  .long 0x8011b2e4	#IASA Callback
  .long 0x8011b2ec	#Physics Callback
  .long 0x8011b36c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013f	#Move ID
  .long 0x00340014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8011a700	#Animation Callback
  .long 0x8011a920	#IASA Callback
  .long 0x8011a928	#Physics Callback
  .long 0x8011a9d0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000142	#Move ID
  .long 0x00340414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8011a000	#Animation Callback
  .long 0x8011a0e4	#IASA Callback
  .long 0x8011a108	#Physics Callback
  .long 0x8011a1a4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000143	#Move ID
  .long 0x003c0414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8011a370	#Animation Callback
  .long 0x8011a43c	#IASA Callback
  .long 0x8011a474	#Physics Callback
  .long 0x8011a524	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000144	#Move ID
  .long 0x00340414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8011adc8	#Animation Callback
  .long 0x8011aee4	#IASA Callback
  .long 0x8011af1c	#Physics Callback
  .long 0x8011afcc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000145	#Move ID
  .long 0x00340414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8011b2a0	#Animation Callback
  .long 0x8011b2e8	#IASA Callback
  .long 0x8011b30c	#Physics Callback
  .long 0x8011b3a8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000143	#Move ID
  .long 0x00340414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8011a810	#Animation Callback
  .long 0x8011a924	#IASA Callback
  .long 0x8011a95c	#Physics Callback
  .long 0x8011aa0c	#Collision Callback
  .long 0x800761c8	#Camera Callback

  FighterMoveLogic_Peach:
  .long 0x00000127	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8011bc38	#Animation Callback
  .long 0x8011bc8c	#IASA Callback
  .long 0x8011bd18	#Physics Callback
  .long 0x8011bd3c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000128	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8011bdf0	#Animation Callback
  .long 0x8011be2c	#IASA Callback
  .long 0x8011be30	#Physics Callback
  .long 0x8011be50	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000129	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8011bdf0	#Animation Callback
  .long 0x8011be2c	#IASA Callback
  .long 0x8011be30	#Physics Callback
  .long 0x8011be50	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000044	#Move ID
  .long 0x0024040c	#Bitflags
  .long 0x0d000000	#Attack ID
  .long 0x8011bf88	#Animation Callback
  .long 0x8011c044	#IASA Callback
  .long 0x8011c160	#Physics Callback
  .long 0x8011c198	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000045	#Move ID
  .long 0x0024040d	#Bitflags
  .long 0x0e000000	#Attack ID
  .long 0x8011bf88	#Animation Callback
  .long 0x8011c044	#IASA Callback
  .long 0x8011c160	#Physics Callback
  .long 0x8011c198	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000046	#Move ID
  .long 0x0024040e	#Bitflags
  .long 0x0f000000	#Attack ID
  .long 0x8011bf88	#Animation Callback
  .long 0x8011c044	#IASA Callback
  .long 0x8011c160	#Physics Callback
  .long 0x8011c198	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000047	#Move ID
  .long 0x0024040f	#Bitflags
  .long 0x10000000	#Attack ID
  .long 0x8011bf88	#Animation Callback
  .long 0x8011c044	#IASA Callback
  .long 0x8011c160	#Physics Callback
  .long 0x8011c198	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000048	#Move ID
  .long 0x00240410	#Bitflags
  .long 0x11000000	#Attack ID
  .long 0x8011bf88	#Animation Callback
  .long 0x8011c044	#IASA Callback
  .long 0x8011c160	#Physics Callback
  .long 0x8011c198	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012a	#Move ID
  .long 0x00240a09	#Bitflags
  .long 0x0a000000	#Attack ID
  .long 0x8011c248	#Animation Callback
  .long 0x8011c284	#IASA Callback
  .long 0x8011c2b4	#Physics Callback
  .long 0x8011c2d4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012b	#Move ID
  .long 0x00240a09	#Bitflags
  .long 0x0a000000	#Attack ID
  .long 0x8011c248	#Animation Callback
  .long 0x8011c284	#IASA Callback
  .long 0x8011c2b4	#Physics Callback
  .long 0x8011c2d4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012c	#Move ID
  .long 0x00240a09	#Bitflags
  .long 0x0a000000	#Attack ID
  .long 0x8011c248	#Animation Callback
  .long 0x8011c284	#IASA Callback
  .long 0x8011c2b4	#Physics Callback
  .long 0x8011c2d4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x00340014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8011d2ec	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x8011d394	#Physics Callback
  .long 0x8011d3d4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x00340014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8011d340	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x8011d3b4	#Physics Callback
  .long 0x8011d3fc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012e	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8011c4f0	#Animation Callback
  .long 0x8011c5e8	#IASA Callback
  .long 0x8011c5f0	#Physics Callback
  .long 0x8011c664	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012f	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8011ca84	#Animation Callback
  .long 0x8011cafc	#IASA Callback
  .long 0x8011cb04	#Physics Callback
  .long 0x8011cb44	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000130	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x00000000	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x00000000	#Physics Callback
  .long 0x00000000	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000131	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8011c588	#Animation Callback
  .long 0x8011c5ec	#IASA Callback
  .long 0x8011c644	#Physics Callback
  .long 0x8011c6fc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000132	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8011cac0	#Animation Callback
  .long 0x8011cb00	#IASA Callback
  .long 0x8011cb24	#Physics Callback
  .long 0x8011cb80	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000133	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8011cac0	#Animation Callback
  .long 0x8011cb00	#IASA Callback
  .long 0x8011cb24	#Physics Callback
  .long 0x8011cb80	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000130	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8011c878	#Animation Callback
  .long 0x8011c8c8	#IASA Callback
  .long 0x8011c8cc	#Physics Callback
  .long 0x8011c93c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000134	#Move ID
  .long 0x00340013	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x8011d8d0	#Animation Callback
  .long 0x8011da30	#IASA Callback
  .long 0x8011dcc0	#Physics Callback
  .long 0x8011ddbc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00340013	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x8011de9c	#Animation Callback
  .long 0x8011df5c	#IASA Callback
  .long 0x8011df64	#Physics Callback
  .long 0x8011e094	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000136	#Move ID
  .long 0x00340413	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x8011d980	#Animation Callback
  .long 0x8011db78	#IASA Callback
  .long 0x8011dcf8	#Physics Callback
  .long 0x8011de2c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000137	#Move ID
  .long 0x00340413	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x8011defc	#Animation Callback
  .long 0x8011df60	#IASA Callback
  .long 0x8011dfd0	#Physics Callback
  .long 0x8011e104	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000138	#Move ID
  .long 0x00340011	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8011e4f8	#Animation Callback
  .long 0x8011e670	#IASA Callback
  .long 0x8011e678	#Physics Callback
  .long 0x8011e75c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000139	#Move ID
  .long 0x00340011	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8011e9a0	#Animation Callback
  .long 0x8011ea68	#IASA Callback
  .long 0x8011ea70	#Physics Callback
  .long 0x8011eae0	#Collision Callback
  .long 0x800761c8	#Camera Callback

  FighterMoveLogic_Popo:
  .long 0x00000127	#Move ID
  .long 0x00340111	#Bitflags
  .long 0x12800000	#Attack ID
  .long 0x8011f318	#Animation Callback
  .long 0x8011f390	#IASA Callback
  .long 0x8011f398	#Physics Callback
  .long 0x8011f3d8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000128	#Move ID
  .long 0x00340511	#Bitflags
  .long 0x12800000	#Attack ID
  .long 0x8011f354	#Animation Callback
  .long 0x8011f394	#IASA Callback
  .long 0x8011f3b8	#Physics Callback
  .long 0x8011f454	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000129	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13800000	#Attack ID
  .long 0x8011fc78	#Animation Callback
  .long 0x8011ff40	#IASA Callback
  .long 0x80120080	#Physics Callback
  .long 0x80120660	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012a	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13800000	#Attack ID
  .long 0x8011fcd0	#Animation Callback
  .long 0x8011ff90	#IASA Callback
  .long 0x80120230	#Physics Callback
  .long 0x80120854	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012b	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13800000	#Attack ID
  .long 0x8011fd9c	#Animation Callback
  .long 0x8011ffe0	#IASA Callback
  .long 0x801203e0	#Physics Callback
  .long 0x80120a48	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012c	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13800000	#Attack ID
  .long 0x8011fe48	#Animation Callback
  .long 0x80120030	#IASA Callback
  .long 0x80120520	#Physics Callback
  .long 0x80120c58	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x801212c4	#Animation Callback
  .long 0x801214d4	#IASA Callback
  .long 0x801215dc	#Physics Callback
  .long 0x80121740	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012e	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80121944	#Animation Callback
  .long 0x80121ac8	#IASA Callback
  .long 0x80121ad0	#Physics Callback
  .long 0x80121c34	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012f	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x801223b8	#Animation Callback
  .long 0x8012248c	#IASA Callback
  .long 0x80122494	#Physics Callback
  .long 0x80122664	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000130	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80121e10	#Animation Callback
  .long 0x80121eb0	#IASA Callback
  .long 0x80121eb8	#Physics Callback
  .long 0x80121f2c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000131	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80122110	#Animation Callback
  .long 0x801221ac	#IASA Callback
  .long 0x801221b4	#Physics Callback
  .long 0x80122228	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000132	#Move ID
  .long 0x00340613	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x801213cc	#Animation Callback
  .long 0x80121558	#IASA Callback
  .long 0x80121680	#Physics Callback
  .long 0x8012177c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000133	#Move ID
  .long 0x00340613	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x801219f4	#Animation Callback
  .long 0x80121acc	#IASA Callback
  .long 0x80121b74	#Physics Callback
  .long 0x80121c70	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000134	#Move ID
  .long 0x00340613	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80122410	#Animation Callback
  .long 0x80122490	#IASA Callback
  .long 0x80122538	#Physics Callback
  .long 0x801226a0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00340613	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80121e4c	#Animation Callback
  .long 0x80121eb4	#IASA Callback
  .long 0x80121ed8	#Physics Callback
  .long 0x80121f68	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000136	#Move ID
  .long 0x00340613	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x8012214c	#Animation Callback
  .long 0x801221b0	#IASA Callback
  .long 0x801221d4	#Physics Callback
  .long 0x80122264	#Collision Callback
  .long 0x800761c8	#Camera Callback

  FighterMoveLogic_Nana:
  .long 0x00000127	#Move ID
  .long 0x00340111	#Bitflags
  .long 0x12800000	#Attack ID
  .long 0x8011f318	#Animation Callback
  .long 0x8011f390	#IASA Callback
  .long 0x8011f398	#Physics Callback
  .long 0x8011f3d8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000128	#Move ID
  .long 0x00340511	#Bitflags
  .long 0x12800000	#Attack ID
  .long 0x8011f354	#Animation Callback
  .long 0x8011f394	#IASA Callback
  .long 0x8011f3b8	#Physics Callback
  .long 0x8011f454	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000129	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13800000	#Attack ID
  .long 0x8011fc78	#Animation Callback
  .long 0x8011ff40	#IASA Callback
  .long 0x80120080	#Physics Callback
  .long 0x80120660	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012a	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13800000	#Attack ID
  .long 0x8011fcd0	#Animation Callback
  .long 0x8011ff90	#IASA Callback
  .long 0x80120230	#Physics Callback
  .long 0x80120854	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012b	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13800000	#Attack ID
  .long 0x8011fd9c	#Animation Callback
  .long 0x8011ffe0	#IASA Callback
  .long 0x801203e0	#Physics Callback
  .long 0x80120a48	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012c	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13800000	#Attack ID
  .long 0x8011fe48	#Animation Callback
  .long 0x80120030	#IASA Callback
  .long 0x80120520	#Physics Callback
  .long 0x80120c58	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x801212c4	#Animation Callback
  .long 0x801214d4	#IASA Callback
  .long 0x801215dc	#Physics Callback
  .long 0x80121740	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012e	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80121944	#Animation Callback
  .long 0x80121ac8	#IASA Callback
  .long 0x80121ad0	#Physics Callback
  .long 0x80121c34	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012f	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x801223b8	#Animation Callback
  .long 0x8012248c	#IASA Callback
  .long 0x80122494	#Physics Callback
  .long 0x80122664	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000130	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80121e10	#Animation Callback
  .long 0x80121eb0	#IASA Callback
  .long 0x80121eb8	#Physics Callback
  .long 0x80121f2c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000131	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80122110	#Animation Callback
  .long 0x801221ac	#IASA Callback
  .long 0x801221b4	#Physics Callback
  .long 0x80122228	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000132	#Move ID
  .long 0x00340613	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x801213cc	#Animation Callback
  .long 0x80121558	#IASA Callback
  .long 0x80121680	#Physics Callback
  .long 0x8012177c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000133	#Move ID
  .long 0x00340613	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x801219f4	#Animation Callback
  .long 0x80121acc	#IASA Callback
  .long 0x80121b74	#Physics Callback
  .long 0x80121c70	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000134	#Move ID
  .long 0x00340613	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80122410	#Animation Callback
  .long 0x80122490	#IASA Callback
  .long 0x80122538	#Physics Callback
  .long 0x801226a0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00340613	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80121e4c	#Animation Callback
  .long 0x80121eb4	#IASA Callback
  .long 0x80121ed8	#Physics Callback
  .long 0x80121f68	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000136	#Move ID
  .long 0x00340613	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x8012214c	#Animation Callback
  .long 0x801221b0	#IASA Callback
  .long 0x801221d4	#Physics Callback
  .long 0x80122264	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000137	#Move ID
  .long 0x00340014	#Bitflags
  .long 0x15800000	#Attack ID
  .long 0x80122a0c	#Animation Callback
  .long 0x80122b0c	#IASA Callback
  .long 0x80122b14	#Physics Callback
  .long 0x80122c18	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000138	#Move ID
  .long 0x00340414	#Bitflags
  .long 0x15800000	#Attack ID
  .long 0x80122a8c	#Animation Callback
  .long 0x80122b10	#IASA Callback
  .long 0x80122b34	#Physics Callback
  .long 0x80122d04	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000139	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13800000	#Attack ID
  .long 0x80123ca4	#Animation Callback
  .long 0x80123e58	#IASA Callback
  .long 0x80123e60	#Physics Callback
  .long 0x80123f98	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013a	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13800000	#Attack ID
  .long 0x80123d68	#Animation Callback
  .long 0x80123e5c	#IASA Callback
  .long 0x80123efc	#Physics Callback
  .long 0x801241a0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013b	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80123348	#Animation Callback
  .long 0x80123388	#IASA Callback
  .long 0x80123390	#Physics Callback
  .long 0x801233f0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013c	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80123448	#Animation Callback
  .long 0x801234e4	#IASA Callback
  .long 0x801234ec	#Physics Callback
  .long 0x801235bc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013d	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x00000000	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x00000000	#Physics Callback
  .long 0x00000000	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013e	#Move ID
  .long 0x00340613	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80123384	#Animation Callback
  .long 0x8012338c	#IASA Callback
  .long 0x801233ec	#Physics Callback
  .long 0x801233f4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013f	#Move ID
  .long 0x00340613	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80123484	#Animation Callback
  .long 0x801234e8	#IASA Callback
  .long 0x8012350c	#Physics Callback
  .long 0x801235f8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000140	#Move ID
  .long 0x00340613	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x00000000	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x00000000	#Physics Callback
  .long 0x00000000	#Collision Callback
  .long 0x800761c8	#Camera Callback

  FighterMoveLogic_Pikachu:
  .long 0x00000127	#Move ID
  .long 0x00340111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80124908	#Animation Callback
  .long 0x80124b6c	#IASA Callback
  .long 0x80124b74	#Physics Callback
  .long 0x80124bb4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000128	#Move ID
  .long 0x00340511	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80124a20	#Animation Callback
  .long 0x80124b70	#IASA Callback
  .long 0x80124b94	#Physics Callback
  .long 0x80124c20	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000129	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80124f64	#Animation Callback
  .long 0x80124fdc	#IASA Callback
  .long 0x80124fe4	#Physics Callback
  .long 0x80125084	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012a	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x801251bc	#Animation Callback
  .long 0x801252fc	#IASA Callback
  .long 0x8012535c	#Physics Callback
  .long 0x8012539c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012c	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8012590c	#Animation Callback
  .long 0x8012594c	#IASA Callback
  .long 0x80125954	#Physics Callback
  .long 0x801259d4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80125b34	#Animation Callback
  .long 0x80125bac	#IASA Callback
  .long 0x80125bb4	#Physics Callback
  .long 0x80125c44	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012b	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8012557c	#Animation Callback
  .long 0x801256b4	#IASA Callback
  .long 0x801256bc	#Physics Callback
  .long 0x801256fc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012e	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80124fa0	#Animation Callback
  .long 0x80124fe0	#IASA Callback
  .long 0x80125024	#Physics Callback
  .long 0x801250c0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012f	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8012525c	#Animation Callback
  .long 0x8012532c	#IASA Callback
  .long 0x8012537c	#Physics Callback
  .long 0x801253d8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012c	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80125910	#Animation Callback
  .long 0x80125950	#IASA Callback
  .long 0x80125958	#Physics Callback
  .long 0x801259d8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000131	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80125b70	#Animation Callback
  .long 0x80125bb0	#IASA Callback
  .long 0x80125bf4	#Physics Callback
  .long 0x80125c80	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000130	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8012561c	#Animation Callback
  .long 0x801256b8	#IASA Callback
  .long 0x801256dc	#Physics Callback
  .long 0x80125738	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000132	#Move ID
  .long 0x00340113	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80125ed8	#Animation Callback
  .long 0x80125f50	#IASA Callback
  .long 0x80125f58	#Physics Callback
  .long 0x80125fd8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000133	#Move ID
  .long 0x00340113	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80126144	#Animation Callback
  .long 0x80126424	#IASA Callback
  .long 0x801265d4	#Physics Callback
  .long 0x80126614	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000134	#Move ID
  .long 0x00340113	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80127198	#Animation Callback
  .long 0x801272d8	#IASA Callback
  .long 0x801272e0	#Physics Callback
  .long 0x8012738c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00340513	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80125f14	#Animation Callback
  .long 0x80125f54	#IASA Callback
  .long 0x80125f78	#Physics Callback
  .long 0x80126014	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000136	#Move ID
  .long 0x00340513	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x801262b4	#Animation Callback
  .long 0x80126428	#IASA Callback
  .long 0x801265f4	#Physics Callback
  .long 0x801267c8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000137	#Move ID
  .long 0x00340513	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80127228	#Animation Callback
  .long 0x801272dc	#IASA Callback
  .long 0x80127310	#Physics Callback
  .long 0x801273d4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000138	#Move ID
  .long 0x00340014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x80127cdc	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x801280c8	#Physics Callback
  .long 0x801281ec	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000139	#Move ID
  .long 0x00340014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x80127de4	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x80128108	#Physics Callback
  .long 0x8012823c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013a	#Move ID
  .long 0x00340014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x80127fb0	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x80128148	#Physics Callback
  .long 0x8012828c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013b	#Move ID
  .long 0x00340014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x80128050	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x801281ac	#Physics Callback
  .long 0x801282dc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013c	#Move ID
  .long 0x00340414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x80127d60	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x801280e8	#Physics Callback
  .long 0x80128214	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013d	#Move ID
  .long 0x00340414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x80127ec0	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x80128128	#Physics Callback
  .long 0x80128264	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013e	#Move ID
  .long 0x00340414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x80128000	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x80128168	#Physics Callback
  .long 0x801282b4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013f	#Move ID
  .long 0x00340414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8012808c	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x801281cc	#Physics Callback
  .long 0x80128304	#Collision Callback
  .long 0x800761c8	#Camera Callback

  FighterMoveLogic_Samus:
  .long 0x00000127	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80128c04	#Animation Callback
  .long 0x80128d3c	#IASA Callback
  .long 0x80128e88	#Physics Callback
  .long 0x80128f60	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000128	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80128ca0	#Animation Callback
  .long 0x80128e68	#IASA Callback
  .long 0x80128ef8	#Physics Callback
  .long 0x80128fd4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000129	#Move ID
  .long 0x00340111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80129684	#Animation Callback
  .long 0x80129b18	#IASA Callback
  .long 0x80129c88	#Physics Callback
  .long 0x80129d48	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012a	#Move ID
  .long 0x00340111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80129774	#Animation Callback
  .long 0x80129b1c	#IASA Callback
  .long 0x80129ca8	#Physics Callback
  .long 0x80129dc8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012b	#Move ID
  .long 0x00340111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80129940	#Animation Callback
  .long 0x80129c78	#IASA Callback
  .long 0x80129cc8	#Physics Callback
  .long 0x80129e68	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012c	#Move ID
  .long 0x00340111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x801299d0	#Animation Callback
  .long 0x80129c7c	#IASA Callback
  .long 0x80129ce8	#Physics Callback
  .long 0x80129ee8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x00340511	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80129a14	#Animation Callback
  .long 0x80129c80	#IASA Callback
  .long 0x80129d08	#Physics Callback
  .long 0x80129f68	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012e	#Move ID
  .long 0x00340511	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80129a98	#Animation Callback
  .long 0x80129c84	#IASA Callback
  .long 0x80129d28	#Physics Callback
  .long 0x80129fe8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012f	#Move ID
  .long 0x00340112	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8012a380	#Animation Callback
  .long 0x8012a3f8	#IASA Callback
  .long 0x8012a400	#Physics Callback
  .long 0x8012a468	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000130	#Move ID
  .long 0x00340912	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8012a4e0	#Animation Callback
  .long 0x8012a558	#IASA Callback
  .long 0x8012a560	#Physics Callback
  .long 0x8012a5c8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000131	#Move ID
  .long 0x00340512	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8012a3bc	#Animation Callback
  .long 0x8012a3fc	#IASA Callback
  .long 0x8012a420	#Physics Callback
  .long 0x8012a4a4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000132	#Move ID
  .long 0x00340d12	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8012a51c	#Animation Callback
  .long 0x8012a55c	#IASA Callback
  .long 0x8012a580	#Physics Callback
  .long 0x8012a604	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000133	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x8012a81c	#Animation Callback
  .long 0x8012a96c	#IASA Callback
  .long 0x8012ab0c	#Physics Callback
  .long 0x8012ac00	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000134	#Move ID
  .long 0x00340613	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x8012a8c4	#Animation Callback
  .long 0x8012aa3c	#IASA Callback
  .long 0x8012abb4	#Physics Callback
  .long 0x8012acf8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00340114	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8012b150	#Animation Callback
  .long 0x8012b358	#IASA Callback
  .long 0x8012b3a8	#Physics Callback
  .long 0x8012b488	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000136	#Move ID
  .long 0x00340514	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8012b264	#Animation Callback
  .long 0x8012b3a4	#IASA Callback
  .long 0x8012b41c	#Physics Callback
  .long 0x8012b4fc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000137	#Move ID
  .long 0x00200000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x800c3d6c	#Animation Callback
  .long 0x800c4384	#IASA Callback
  .long 0x800c438c	#Physics Callback
  .long 0x800c447c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000138	#Move ID
  .long 0x00c00000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x800c4380	#Animation Callback
  .long 0x800c4388	#IASA Callback
  .long 0x800c4438	#Physics Callback
  .long 0x80082b78	#Collision Callback
  .long 0x800761c8	#Camera Callback

  FighterMoveLogic_Yoshi:
  .long 0x00000025	#Move ID
  .long 0x00100000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8012c030	#Animation Callback
  .long 0x8012c114	#IASA Callback
  .long 0x8012c194	#Physics Callback
  .long 0x8012c1b4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0xffffffff	#Move ID
  .long 0x00180000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8012c2f4	#Animation Callback
  .long 0x8012c3ec	#IASA Callback
  .long 0x8012c45c	#Physics Callback
  .long 0x8012c47c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000027	#Move ID
  .long 0x00100000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8012c54c	#Animation Callback
  .long 0x8012c59c	#IASA Callback
  .long 0x8012c5c0	#Physics Callback
  .long 0x8012c5e0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000028	#Move ID
  .long 0x00100000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8012c7a4	#Animation Callback
  .long 0x8012c80c	#IASA Callback
  .long 0x8012c810	#Physics Callback
  .long 0x8012c830	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000025	#Move ID
  .long 0x00101073	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8012cad0	#Animation Callback
  .long 0x8012cbbc	#IASA Callback
  .long 0x8012cbdc	#Physics Callback
  .long 0x8012cbfc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000127	#Move ID
  .long 0x00340011	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8012d550	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x8012dc30	#Physics Callback
  .long 0x8012dd70	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000128	#Move ID
  .long 0x00340011	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8012d658	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x8012dc90	#Physics Callback
  .long 0x8012dde8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000128	#Move ID
  .long 0x00340011	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8012d5c8	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x8012dc70	#Physics Callback
  .long 0x8012ddc0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000129	#Move ID
  .long 0x00340011	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8012d948	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x8012dd10	#Physics Callback
  .long 0x8012de88	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000129	#Move ID
  .long 0x00340011	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8012d7d8	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x8012dcf0	#Physics Callback
  .long 0x8012de60	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012a	#Move ID
  .long 0x00340411	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8012d58c	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x8012dc50	#Physics Callback
  .long 0x8012dd98	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012b	#Move ID
  .long 0x00340411	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8012d760	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x8012dcd0	#Physics Callback
  .long 0x8012de38	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012b	#Move ID
  .long 0x00340411	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8012d6d0	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x8012dcb0	#Physics Callback
  .long 0x8012de10	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012c	#Move ID
  .long 0x00340411	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8012db74	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x8012dd50	#Physics Callback
  .long 0x8012ded8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012c	#Move ID
  .long 0x00340411	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8012da04	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x8012dd30	#Physics Callback
  .long 0x8012deb0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8012f654	#Animation Callback
  .long 0x80130db8	#IASA Callback
  .long 0x801310c4	#Physics Callback
  .long 0x801317dc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012e	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8012f750	#Animation Callback
  .long 0x80130dbc	#IASA Callback
  .long 0x801310e8	#Physics Callback
  .long 0x8013187c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012f	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8012fac4	#Animation Callback
  .long 0x80130f7c	#IASA Callback
  .long 0x801312ec	#Physics Callback
  .long 0x80131b60	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000130	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8012fff4	#Animation Callback
  .long 0x80130fd8	#IASA Callback
  .long 0x80131618	#Physics Callback
  .long 0x80131e74	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000131	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80130368	#Animation Callback
  .long 0x80130fdc	#IASA Callback
  .long 0x80131654	#Physics Callback
  .long 0x80131ed4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000132	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80130428	#Animation Callback
  .long 0x80130fec	#IASA Callback
  .long 0x8013168c	#Physics Callback
  .long 0x80131f80	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000133	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x801306a8	#Animation Callback
  .long 0x80131050	#IASA Callback
  .long 0x80131718	#Physics Callback
  .long 0x8013245c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000134	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80130a24	#Animation Callback
  .long 0x801310b4	#IASA Callback
  .long 0x801317a4	#Physics Callback
  .long 0x801328f0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00340113	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x8012e4dc	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x8012e594	#Physics Callback
  .long 0x8012e5d4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000136	#Move ID
  .long 0x00340513	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x8012e538	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x8012e5b4	#Physics Callback
  .long 0x8012e5fc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000137	#Move ID
  .long 0x00340214	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8012e814	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x8012e88c	#Physics Callback
  .long 0x8012e924	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000138	#Move ID
  .long 0x00340214	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8012ea40	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x8012ea7c	#Physics Callback
  .long 0x8012ea9c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000139	#Move ID
  .long 0x00340614	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8012e850	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x8012e8cc	#Physics Callback
  .long 0x8012e944	#Collision Callback
  .long 0x800761c8	#Camera Callback

  FighterMoveLogic_Jigglypuff:
  .long 0x00000127	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x800d7590	#Animation Callback
  .long 0x800d7614	#IASA Callback
  .long 0x800d7634	#Physics Callback
  .long 0x800d767c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000128	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x800d7590	#Animation Callback
  .long 0x800d7614	#IASA Callback
  .long 0x800d7634	#Physics Callback
  .long 0x800d767c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000129	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x800d7590	#Animation Callback
  .long 0x800d7614	#IASA Callback
  .long 0x800d7634	#Physics Callback
  .long 0x800d767c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012a	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x800d7590	#Animation Callback
  .long 0x800d7614	#IASA Callback
  .long 0x800d7634	#Physics Callback
  .long 0x800d767c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012b	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x800d7590	#Animation Callback
  .long 0x800d7614	#IASA Callback
  .long 0x800d7634	#Physics Callback
  .long 0x800d767c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012c	#Move ID
  .long 0x00340211	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8013e014	#Animation Callback
  .long 0x8013ff00	#IASA Callback
  .long 0x80140620	#Physics Callback
  .long 0x80140fa4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x00340211	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8013e014	#Animation Callback
  .long 0x8013ff00	#IASA Callback
  .long 0x80140620	#Physics Callback
  .long 0x80140fa4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012e	#Move ID
  .long 0x003c0211	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8013e0f0	#Animation Callback
  .long 0x8013ff04	#IASA Callback
  .long 0x80140650	#Physics Callback
  .long 0x80141054	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012f	#Move ID
  .long 0x003c0211	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8013e2a0	#Animation Callback
  .long 0x80140064	#IASA Callback
  .long 0x80140680	#Physics Callback
  .long 0x80141154	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000130	#Move ID
  .long 0x00340211	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8013e410	#Animation Callback
  .long 0x801401c4	#IASA Callback
  .long 0x801406b0	#Physics Callback
  .long 0x80141254	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000131	#Move ID
  .long 0x00340211	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8013e7e0	#Animation Callback
  .long 0x80140344	#IASA Callback
  .long 0x801408b8	#Physics Callback
  .long 0x801415f4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000132	#Move ID
  .long 0x00340211	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8013ead8	#Animation Callback
  .long 0x80140348	#IASA Callback
  .long 0x80140bac	#Physics Callback
  .long 0x801416d0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000133	#Move ID
  .long 0x00340211	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8013ead8	#Animation Callback
  .long 0x80140348	#IASA Callback
  .long 0x80140bac	#Physics Callback
  .long 0x801416d0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000134	#Move ID
  .long 0x00340611	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8013edb0	#Animation Callback
  .long 0x8014034c	#IASA Callback
  .long 0x80140be8	#Physics Callback
  .long 0x80141730	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00340611	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8013edb0	#Animation Callback
  .long 0x8014034c	#IASA Callback
  .long 0x80140be8	#Physics Callback
  .long 0x80141730	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000136	#Move ID
  .long 0x003c0611	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8013ee84	#Animation Callback
  .long 0x80140350	#IASA Callback
  .long 0x80140c18	#Physics Callback
  .long 0x801417e0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000137	#Move ID
  .long 0x003c0611	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8013f034	#Animation Callback
  .long 0x801404b0	#IASA Callback
  .long 0x80140c48	#Physics Callback
  .long 0x801418e0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000138	#Move ID
  .long 0x00340611	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8013f1a4	#Animation Callback
  .long 0x80140610	#IASA Callback
  .long 0x80140c78	#Physics Callback
  .long 0x801419e0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000139	#Move ID
  .long 0x00340211	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8013f708	#Animation Callback
  .long 0x80140614	#IASA Callback
  .long 0x80140df8	#Physics Callback
  .long 0x80141fb8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013a	#Move ID
  .long 0x00340611	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8013f9c0	#Animation Callback
  .long 0x80140618	#IASA Callback
  .long 0x80140f10	#Physics Callback
  .long 0x80142070	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013b	#Move ID
  .long 0x00340611	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8013f9c0	#Animation Callback
  .long 0x80140618	#IASA Callback
  .long 0x80140f10	#Physics Callback
  .long 0x80142070	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013c	#Move ID
  .long 0x00340611	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8013fcac	#Animation Callback
  .long 0x8014061c	#IASA Callback
  .long 0x80140f40	#Physics Callback
  .long 0x801420d0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013d	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8013d30c	#Animation Callback
  .long 0x8013d384	#IASA Callback
  .long 0x8013d38c	#Physics Callback
  .long 0x8013d518	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013e	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8013d348	#Animation Callback
  .long 0x8013d388	#IASA Callback
  .long 0x8013d3ac	#Physics Callback
  .long 0x8013d554	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013f	#Move ID
  .long 0x00340013	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x8013cb68	#Animation Callback
  .long 0x8013cc60	#IASA Callback
  .long 0x8013cc68	#Physics Callback
  .long 0x8013cca8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000140	#Move ID
  .long 0x00340413	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x8013cbe4	#Animation Callback
  .long 0x8013cc64	#IASA Callback
  .long 0x8013cc88	#Physics Callback
  .long 0x8013cce4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000141	#Move ID
  .long 0x00340013	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x8013cb68	#Animation Callback
  .long 0x8013cc60	#IASA Callback
  .long 0x8013cc68	#Physics Callback
  .long 0x8013cca8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000142	#Move ID
  .long 0x00340413	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x8013cbe4	#Animation Callback
  .long 0x8013cc64	#IASA Callback
  .long 0x8013cc88	#Physics Callback
  .long 0x8013cce4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000143	#Move ID
  .long 0x00340014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8013cfcc	#Animation Callback
  .long 0x8013d044	#IASA Callback
  .long 0x8013d04c	#Physics Callback
  .long 0x8013d08c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000144	#Move ID
  .long 0x00340414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8013d008	#Animation Callback
  .long 0x8013d048	#IASA Callback
  .long 0x8013d06c	#Physics Callback
  .long 0x8013d0c8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000145	#Move ID
  .long 0x00340014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8013cfcc	#Animation Callback
  .long 0x8013d044	#IASA Callback
  .long 0x8013d04c	#Physics Callback
  .long 0x8013d08c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000146	#Move ID
  .long 0x00340414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8013d008	#Animation Callback
  .long 0x8013d048	#IASA Callback
  .long 0x8013d06c	#Physics Callback
  .long 0x8013d0c8	#Collision Callback
  .long 0x800761c8	#Camera Callback

  FighterMoveLogic_Mewtwo:
  .long 0x00000127	#Move ID
  .long 0x00340111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x801474c0	#Animation Callback
  .long 0x80147e30	#IASA Callback
  .long 0x801484c0	#Physics Callback
  .long 0x80148600	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000128	#Move ID
  .long 0x003c0111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8014764c	#Animation Callback
  .long 0x80147e34	#IASA Callback
  .long 0x801484e0	#Physics Callback
  .long 0x8014868c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000129	#Move ID
  .long 0x003c0111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80147850	#Animation Callback
  .long 0x8014800c	#IASA Callback
  .long 0x80148500	#Physics Callback
  .long 0x80148718	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012a	#Move ID
  .long 0x00340111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80147880	#Animation Callback
  .long 0x801481cc	#IASA Callback
  .long 0x80148520	#Physics Callback
  .long 0x801487a4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012b	#Move ID
  .long 0x00340111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80147910	#Animation Callback
  .long 0x801481d0	#IASA Callback
  .long 0x80148540	#Physics Callback
  .long 0x80148830	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012c	#Move ID
  .long 0x00340511	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80147954	#Animation Callback
  .long 0x801481d4	#IASA Callback
  .long 0x80148560	#Physics Callback
  .long 0x801488bc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x003c0511	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80147aec	#Animation Callback
  .long 0x801481d8	#IASA Callback
  .long 0x80148580	#Physics Callback
  .long 0x80148948	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012e	#Move ID
  .long 0x003c0511	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80147cf0	#Animation Callback
  .long 0x80148354	#IASA Callback
  .long 0x801485a0	#Physics Callback
  .long 0x801489d4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012f	#Move ID
  .long 0x00340511	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80147d20	#Animation Callback
  .long 0x801484b8	#IASA Callback
  .long 0x801485c0	#Physics Callback
  .long 0x80148a60	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000130	#Move ID
  .long 0x00340511	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80147db0	#Animation Callback
  .long 0x801484bc	#IASA Callback
  .long 0x801485e0	#Physics Callback
  .long 0x80148aec	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000131	#Move ID
  .long 0x00341012	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80146858	#Animation Callback
  .long 0x80146980	#IASA Callback
  .long 0x80146988	#Physics Callback
  .long 0x80146bb8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000132	#Move ID
  .long 0x00341412	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x801468ec	#Animation Callback
  .long 0x80146984	#IASA Callback
  .long 0x801469bc	#Physics Callback
  .long 0x80146be0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000133	#Move ID
  .long 0x00340013	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x801452ec	#Animation Callback
  .long 0x80145364	#IASA Callback
  .long 0x8014536c	#Physics Callback
  .long 0x801453d0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00340013	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80145554	#Animation Callback
  .long 0x801455cc	#IASA Callback
  .long 0x801455d4	#Physics Callback
  .long 0x801455f8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000134	#Move ID
  .long 0x00340013	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80145db0	#Animation Callback
  .long 0x80145e4c	#IASA Callback
  .long 0x80145e54	#Physics Callback
  .long 0x80145ef0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000136	#Move ID
  .long 0x00340413	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80145328	#Animation Callback
  .long 0x80145368	#IASA Callback
  .long 0x8014538c	#Physics Callback
  .long 0x8014540c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00340413	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80145590	#Animation Callback
  .long 0x801455d0	#IASA Callback
  .long 0x801455f4	#Physics Callback
  .long 0x80145698	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000137	#Move ID
  .long 0x00340413	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80145dec	#Animation Callback
  .long 0x80145e50	#IASA Callback
  .long 0x80145e74	#Physics Callback
  .long 0x80145f2c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000138	#Move ID
  .long 0x00340114	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x801462dc	#Animation Callback
  .long 0x80146394	#IASA Callback
  .long 0x8014639c	#Physics Callback
  .long 0x80146544	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000139	#Move ID
  .long 0x00340514	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x80146338	#Animation Callback
  .long 0x80146398	#IASA Callback
  .long 0x801463bc	#Physics Callback
  .long 0x8014656c	#Collision Callback
  .long 0x800761c8	#Camera Callback

  FighterMoveLogic_Luigi:
  .long 0x00000127	#Move ID
  .long 0x00340111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8014275c	#Animation Callback
  .long 0x801427d4	#IASA Callback
  .long 0x80142834	#Physics Callback
  .long 0x80142874	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000128	#Move ID
  .long 0x00340511	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80142798	#Animation Callback
  .long 0x80142804	#IASA Callback
  .long 0x80142854	#Physics Callback
  .long 0x801428e8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000129	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80142c40	#Animation Callback
  .long 0x80142cb8	#IASA Callback
  .long 0x80142cc0	#Physics Callback
  .long 0x80142d60	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012a	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80142e98	#Animation Callback
  .long 0x80142fd8	#IASA Callback
  .long 0x80143038	#Physics Callback
  .long 0x80143078	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80143b18	#Animation Callback
  .long 0x80143b58	#IASA Callback
  .long 0x80143b60	#Physics Callback
  .long 0x80143be0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012e	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80143d7c	#Animation Callback
  .long 0x80143df4	#IASA Callback
  .long 0x80143dfc	#Physics Callback
  .long 0x80143e8c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012b	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80143258	#Animation Callback
  .long 0x801433a8	#IASA Callback
  .long 0x801433b0	#Physics Callback
  .long 0x801433f0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012c	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x801436d8	#Animation Callback
  .long 0x80143828	#IASA Callback
  .long 0x80143830	#Physics Callback
  .long 0x80143870	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012f	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80142c7c	#Animation Callback
  .long 0x80142cbc	#IASA Callback
  .long 0x80142d00	#Physics Callback
  .long 0x80142d9c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000130	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80142f38	#Animation Callback
  .long 0x80143008	#IASA Callback
  .long 0x80143058	#Physics Callback
  .long 0x801430b4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80143b1c	#Animation Callback
  .long 0x80143b5c	#IASA Callback
  .long 0x80143b64	#Physics Callback
  .long 0x80143be4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000133	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80143db8	#Animation Callback
  .long 0x80143df8	#IASA Callback
  .long 0x80143e3c	#Physics Callback
  .long 0x80143ec8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000131	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80143304	#Animation Callback
  .long 0x801433ac	#IASA Callback
  .long 0x801433d0	#Physics Callback
  .long 0x8014342c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000132	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80143784	#Animation Callback
  .long 0x8014382c	#IASA Callback
  .long 0x80143850	#Physics Callback
  .long 0x801438ac	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000134	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80144098	#Animation Callback
  .long 0x80144158	#IASA Callback
  .long 0x801443e8	#Physics Callback
  .long 0x801444e4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00340613	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x801440f8	#Animation Callback
  .long 0x801442a0	#IASA Callback
  .long 0x80144420	#Physics Callback
  .long 0x80144554	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000136	#Move ID
  .long 0x00340214	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x80144830	#Animation Callback
  .long 0x80144950	#IASA Callback
  .long 0x80144958	#Physics Callback
  .long 0x80144b38	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000137	#Move ID
  .long 0x00340614	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8014487c	#Animation Callback
  .long 0x80144954	#IASA Callback
  .long 0x80144a7c	#Physics Callback
  .long 0x80144cec	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000000e	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x00000000	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800c7158	#Physics Callback
  .long 0x00000000	#Collision Callback
  .long 0x00000000	#Camera Callback
  .long 0x0000000f	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x00000000	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800c7200	#Physics Callback
  .long 0x00000000	#Collision Callback
  .long 0x00000000	#Camera Callback

  FighterMoveLogic_Marth:
  .long 0x00000127	#Move ID
  .long 0x00340211	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80136844	#Animation Callback
  .long 0x80136914	#IASA Callback
  .long 0x8013691c	#Physics Callback
  .long 0x801369a4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000128	#Move ID
  .long 0x00340211	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80136adc	#Animation Callback
  .long 0x80136c8c	#IASA Callback
  .long 0x80136cfc	#Physics Callback
  .long 0x80136d3c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000129	#Move ID
  .long 0x00340211	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80136ee4	#Animation Callback
  .long 0x8013713c	#IASA Callback
  .long 0x80137144	#Physics Callback
  .long 0x80137184	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012a	#Move ID
  .long 0x00340211	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80136ee4	#Animation Callback
  .long 0x8013713c	#IASA Callback
  .long 0x80137144	#Physics Callback
  .long 0x80137184	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012b	#Move ID
  .long 0x00340611	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x801368ac	#Animation Callback
  .long 0x80136918	#IASA Callback
  .long 0x8013695c	#Physics Callback
  .long 0x801369e0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012c	#Move ID
  .long 0x00340611	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80136bb4	#Animation Callback
  .long 0x80136cc4	#IASA Callback
  .long 0x80136d1c	#Physics Callback
  .long 0x80136d78	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x00340611	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80137010	#Animation Callback
  .long 0x80137140	#IASA Callback
  .long 0x80137164	#Physics Callback
  .long 0x801371c0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012e	#Move ID
  .long 0x00340611	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80137010	#Animation Callback
  .long 0x80137140	#IASA Callback
  .long 0x80137164	#Physics Callback
  .long 0x801371c0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012f	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80137558	#Animation Callback
  .long 0x801375b8	#IASA Callback
  .long 0x80137618	#Physics Callback
  .long 0x8013767c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000130	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x801377b0	#Animation Callback
  .long 0x80137810	#IASA Callback
  .long 0x80137870	#Physics Callback
  .long 0x801378d4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000131	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x801377b0	#Animation Callback
  .long 0x80137810	#IASA Callback
  .long 0x80137870	#Physics Callback
  .long 0x801378d4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000132	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80137b34	#Animation Callback
  .long 0x80137b94	#IASA Callback
  .long 0x80137bf4	#Physics Callback
  .long 0x80137c50	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000133	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80137b34	#Animation Callback
  .long 0x80137b94	#IASA Callback
  .long 0x80137bf4	#Physics Callback
  .long 0x80137c50	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000134	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80137b34	#Animation Callback
  .long 0x80137b94	#IASA Callback
  .long 0x80137bf4	#Physics Callback
  .long 0x80137c50	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80137ecc	#Animation Callback
  .long 0x80137f2c	#IASA Callback
  .long 0x80137f30	#Physics Callback
  .long 0x80137f8c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000136	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80137ecc	#Animation Callback
  .long 0x80137f2c	#IASA Callback
  .long 0x80137f30	#Physics Callback
  .long 0x80137f8c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000137	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80137ecc	#Animation Callback
  .long 0x80137f2c	#IASA Callback
  .long 0x80137f30	#Physics Callback
  .long 0x80137f8c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000138	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80137558	#Animation Callback
  .long 0x801375b8	#IASA Callback
  .long 0x80137618	#Physics Callback
  .long 0x8013767c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000139	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x801377b0	#Animation Callback
  .long 0x80137810	#IASA Callback
  .long 0x80137870	#Physics Callback
  .long 0x801378d4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013a	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x801377b0	#Animation Callback
  .long 0x80137810	#IASA Callback
  .long 0x80137870	#Physics Callback
  .long 0x801378d4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013b	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80137b34	#Animation Callback
  .long 0x80137b94	#IASA Callback
  .long 0x80137bf4	#Physics Callback
  .long 0x80137c50	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013c	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80137b34	#Animation Callback
  .long 0x80137b94	#IASA Callback
  .long 0x80137bf4	#Physics Callback
  .long 0x80137c50	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013d	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80137b34	#Animation Callback
  .long 0x80137b94	#IASA Callback
  .long 0x80137bf4	#Physics Callback
  .long 0x80137c50	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013e	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80137ecc	#Animation Callback
  .long 0x80137f2c	#IASA Callback
  .long 0x80137f30	#Physics Callback
  .long 0x80137f8c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013f	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80137ecc	#Animation Callback
  .long 0x80137f2c	#IASA Callback
  .long 0x80137f30	#Physics Callback
  .long 0x80137f8c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000140	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80137ecc	#Animation Callback
  .long 0x80137f2c	#IASA Callback
  .long 0x80137f30	#Physics Callback
  .long 0x80137f8c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000141	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x801382e8	#Animation Callback
  .long 0x801383a8	#IASA Callback
  .long 0x80138638	#Physics Callback
  .long 0x801388b4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000142	#Move ID
  .long 0x00340613	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80138348	#Animation Callback
  .long 0x801384f0	#IASA Callback
  .long 0x8013873c	#Physics Callback
  .long 0x80138940	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000143	#Move ID
  .long 0x00340214	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x80138aa8	#Animation Callback
  .long 0x80138c20	#IASA Callback
  .long 0x80138c28	#Physics Callback
  .long 0x80138cc0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000144	#Move ID
  .long 0x00340214	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x80138e68	#Animation Callback
  .long 0x80138fc0	#IASA Callback
  .long 0x80138fc8	#Physics Callback
  .long 0x80139008	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000145	#Move ID
  .long 0x00340614	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x80138b64	#Animation Callback
  .long 0x80138c24	#IASA Callback
  .long 0x80138c5c	#Physics Callback
  .long 0x80138cfc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000146	#Move ID
  .long 0x00340614	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x80138f14	#Animation Callback
  .long 0x80138fc4	#IASA Callback
  .long 0x80138fe8	#Physics Callback
  .long 0x80139044	#Collision Callback
  .long 0x800761c8	#Camera Callback

  FighterMoveLogic_Zelda:
  .long 0x00000127	#Move ID
  .long 0x00341011	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8013aa38	#Animation Callback
  .long 0x8013ab60	#IASA Callback
  .long 0x8013ab68	#Physics Callback
  .long 0x8013ac10	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000128	#Move ID
  .long 0x00341411	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8013aacc	#Animation Callback
  .long 0x8013ab64	#IASA Callback
  .long 0x8013ab9c	#Physics Callback
  .long 0x8013ac4c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000129	#Move ID
  .long 0x00340112	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8013b780	#Animation Callback
  .long 0x8013bdd0	#IASA Callback
  .long 0x8013bed8	#Physics Callback
  .long 0x8013c070	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012a	#Move ID
  .long 0x00340112	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8013b89c	#Animation Callback
  .long 0x8013bdd4	#IASA Callback
  .long 0x8013bf10	#Physics Callback
  .long 0x8013c0dc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012b	#Move ID
  .long 0x00340112	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8013ba04	#Animation Callback
  .long 0x8013be50	#IASA Callback
  .long 0x8013bf30	#Physics Callback
  .long 0x8013c148	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012c	#Move ID
  .long 0x00340512	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8013ba8c	#Animation Callback
  .long 0x8013be54	#IASA Callback
  .long 0x8013bf50	#Physics Callback
  .long 0x8013c1b4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x00340512	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8013bba8	#Animation Callback
  .long 0x8013be58	#IASA Callback
  .long 0x8013bfb0	#Physics Callback
  .long 0x8013c220	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012e	#Move ID
  .long 0x00340512	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8013bd10	#Animation Callback
  .long 0x8013bed4	#IASA Callback
  .long 0x8013c010	#Physics Callback
  .long 0x8013c28c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012f	#Move ID
  .long 0x00340013	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x801399b4	#Animation Callback
  .long 0x80139a2c	#IASA Callback
  .long 0x80139a34	#Physics Callback
  .long 0x80139a98	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012f	#Move ID
  .long 0x00340013	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80139c1c	#Animation Callback
  .long 0x80139c94	#IASA Callback
  .long 0x80139c9c	#Physics Callback
  .long 0x80139cc0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000130	#Move ID
  .long 0x00340013	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x8013a448	#Animation Callback
  .long 0x8013a4e4	#IASA Callback
  .long 0x8013a4ec	#Physics Callback
  .long 0x8013a588	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000131	#Move ID
  .long 0x00340413	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x801399f0	#Animation Callback
  .long 0x80139a30	#IASA Callback
  .long 0x80139a54	#Physics Callback
  .long 0x80139ad4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000131	#Move ID
  .long 0x00340413	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80139c58	#Animation Callback
  .long 0x80139c98	#IASA Callback
  .long 0x80139cbc	#Physics Callback
  .long 0x80139d60	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000132	#Move ID
  .long 0x00340413	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x8013a484	#Animation Callback
  .long 0x8013a4e8	#IASA Callback
  .long 0x8013a50c	#Physics Callback
  .long 0x8013a5c4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000133	#Move ID
  .long 0x00340014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8013b068	#Animation Callback
  .long 0x8013b0e8	#IASA Callback
  .long 0x8013b0f0	#Physics Callback
  .long 0x8013b154	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000134	#Move ID
  .long 0x00340014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8013b2a4	#Animation Callback
  .long 0x8013b31c	#IASA Callback
  .long 0x8013b324	#Physics Callback
  .long 0x8013b388	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00340414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8013b0a8	#Animation Callback
  .long 0x8013b0ec	#IASA Callback
  .long 0x8013b110	#Physics Callback
  .long 0x8013b190	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000136	#Move ID
  .long 0x00340414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8013b2e0	#Animation Callback
  .long 0x8013b320	#IASA Callback
  .long 0x8013b344	#Physics Callback
  .long 0x8013b3c4	#Collision Callback
  .long 0x800761c8	#Camera Callback

  FighterMoveLogic_YoungLink:
  .long 0x00000127	#Move ID
  .long 0x00240009	#Bitflags
  .long 0x0a000000	#Attack ID
  .long 0x800cede0	#Animation Callback
  .long 0x800cee00	#IASA Callback
  .long 0x800cee30	#Physics Callback
  .long 0x800cee50	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000000ef	#Move ID
  .long 0x00000071	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80149354	#Animation Callback
  .long 0x8014943c	#IASA Callback
  .long 0x8014945c	#Physics Callback
  .long 0x8014947c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000000f0	#Move ID
  .long 0x00000071	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80149354	#Animation Callback
  .long 0x8014943c	#IASA Callback
  .long 0x8014945c	#Physics Callback
  .long 0x8014947c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000128	#Move ID
  .long 0x00340111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800ed15c	#Animation Callback
  .long 0x800edd88	#IASA Callback
  .long 0x800edfd8	#Physics Callback
  .long 0x800ee098	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000129	#Move ID
  .long 0x003c0111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800ed480	#Animation Callback
  .long 0x800ede30	#IASA Callback
  .long 0x800edff8	#Physics Callback
  .long 0x800ee120	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012a	#Move ID
  .long 0x00340111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800ed5b4	#Animation Callback
  .long 0x800edeac	#IASA Callback
  .long 0x800ee018	#Physics Callback
  .long 0x800ee1a8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012b	#Move ID
  .long 0x00340511	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800ed72c	#Animation Callback
  .long 0x800edeb0	#IASA Callback
  .long 0x800ee038	#Physics Callback
  .long 0x800ee2e0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012c	#Move ID
  .long 0x003c0511	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800eda58	#Animation Callback
  .long 0x800edf58	#IASA Callback
  .long 0x800ee058	#Physics Callback
  .long 0x800ee368	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x00340511	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800edb8c	#Animation Callback
  .long 0x800edfd4	#IASA Callback
  .long 0x800ee078	#Physics Callback
  .long 0x800ee3f0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012e	#Move ID
  .long 0x00340112	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800ec54c	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800ec88c	#Physics Callback
  .long 0x800ec94c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012f	#Move ID
  .long 0x00340112	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800ec588	#Animation Callback
  .long 0x800ec71c	#IASA Callback
  .long 0x800ec8ac	#Physics Callback
  .long 0x800ec9c4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000130	#Move ID
  .long 0x00340112	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800ec5f8	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800ec8cc	#Physics Callback
  .long 0x800eca1c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000131	#Move ID
  .long 0x00340512	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800ec634	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800ec8ec	#Physics Callback
  .long 0x800eca88	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000132	#Move ID
  .long 0x00340512	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800ec670	#Animation Callback
  .long 0x800ec810	#IASA Callback
  .long 0x800ec90c	#Physics Callback
  .long 0x800ecb00	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000133	#Move ID
  .long 0x00340512	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800ec6e0	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800ec92c	#Physics Callback
  .long 0x800ecb58	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000134	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800ebc10	#Animation Callback
  .long 0x800ebcac	#IASA Callback
  .long 0x800ebd30	#Physics Callback
  .long 0x800ebdc0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800ebc4c	#Animation Callback
  .long 0x800ebcb0	#IASA Callback
  .long 0x800ebcb4	#Physics Callback
  .long 0x800ebdfc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000136	#Move ID
  .long 0x00340014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800eb8a4	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800eb91c	#Physics Callback
  .long 0x800eb95c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000137	#Move ID
  .long 0x00340414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800eb8e0	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800eb93c	#Physics Callback
  .long 0x800eb9d4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000138	#Move ID
  .long 0x00200000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x800c3d6c	#Animation Callback
  .long 0x800c4384	#IASA Callback
  .long 0x800c438c	#Physics Callback
  .long 0x800c447c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000139	#Move ID
  .long 0x00c00000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x800c4380	#Animation Callback
  .long 0x800c4388	#IASA Callback
  .long 0x800c4438	#Physics Callback
  .long 0x80082b78	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x506c436c	#Move ID
  .long 0x2e646174	#Bitflags
  .long 0x00000000	#Attack ID
  .long 0x66744461	#Animation Callback
  .long 0x7461436c	#IASA Callback
  .long 0x696e6b00	#Physics Callback
  .long 0x506c436c	#Collision Callback
  .long 0x4e722e64	#Camera Callback

  FighterMoveLogic_DrMario:
  .long 0x000000ef	#Move ID
  .long 0x00000071	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80149954	#Animation Callback
  .long 0x80149a6c	#IASA Callback
  .long 0x80149a8c	#Physics Callback
  .long 0x80149aac	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x000000f0	#Move ID
  .long 0x00000071	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80149954	#Animation Callback
  .long 0x80149a6c	#IASA Callback
  .long 0x80149a8c	#Physics Callback
  .long 0x80149aac	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000127	#Move ID
  .long 0x00340111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800e0e18	#Animation Callback
  .long 0x800e0e54	#IASA Callback
  .long 0x800e0e84	#Physics Callback
  .long 0x800e0ea4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000128	#Move ID
  .long 0x00340511	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800e10b0	#Animation Callback
  .long 0x800e10ec	#IASA Callback
  .long 0x800e111c	#Physics Callback
  .long 0x800e113c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000129	#Move ID
  .long 0x00341012	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800e1550	#Animation Callback
  .long 0x800e15c8	#IASA Callback
  .long 0x800e15d0	#Physics Callback
  .long 0x800e1840	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012a	#Move ID
  .long 0x00341012	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800e158c	#Animation Callback
  .long 0x800e15cc	#IASA Callback
  .long 0x800e16e0	#Physics Callback
  .long 0x800e187c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012b	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800e1b24	#Animation Callback
  .long 0x800e1be4	#IASA Callback
  .long 0x800e1e74	#Physics Callback
  .long 0x800e1f70	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012c	#Move ID
  .long 0x00340613	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800e1b84	#Animation Callback
  .long 0x800e1d2c	#IASA Callback
  .long 0x800e1eac	#Physics Callback
  .long 0x800e1fe0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x00340214	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e22bc	#Animation Callback
  .long 0x800e23dc	#IASA Callback
  .long 0x800e23e4	#Physics Callback
  .long 0x800e25c4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012e	#Move ID
  .long 0x00340614	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e2308	#Animation Callback
  .long 0x800e23e0	#IASA Callback
  .long 0x800e2508	#Physics Callback
  .long 0x800e2778	#Collision Callback
  .long 0x800761c8	#Camera Callback

  FighterMoveLogic_Falco:
  .long 0x00000127	#Move ID
  .long 0x00340111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800e62a4	#Animation Callback
  .long 0x800e6ab4	#IASA Callback
  .long 0x800e6b5c	#Physics Callback
  .long 0x800e6c1c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000128	#Move ID
  .long 0x003c0111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800e6368	#Animation Callback
  .long 0x800e6adc	#IASA Callback
  .long 0x800e6b7c	#Physics Callback
  .long 0x800e6c3c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000129	#Move ID
  .long 0x00340111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800e65bc	#Animation Callback
  .long 0x800e6b04	#IASA Callback
  .long 0x800e6b9c	#Physics Callback
  .long 0x800e6c5c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012a	#Move ID
  .long 0x00340511	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800e667c	#Animation Callback
  .long 0x800e6b08	#IASA Callback
  .long 0x800e6bbc	#Physics Callback
  .long 0x800e6c7c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012b	#Move ID
  .long 0x003c0511	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800e6740	#Animation Callback
  .long 0x800e6b30	#IASA Callback
  .long 0x800e6bdc	#Physics Callback
  .long 0x800e6c9c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012c	#Move ID
  .long 0x00340511	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800e69bc	#Animation Callback
  .long 0x800e6b58	#IASA Callback
  .long 0x800e6bfc	#Physics Callback
  .long 0x800e6cbc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800ea004	#Animation Callback
  .long 0x800ea07c	#IASA Callback
  .long 0x800ea084	#Physics Callback
  .long 0x800ea128	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012e	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800ea294	#Animation Callback
  .long 0x800ea3f4	#IASA Callback
  .long 0x800ea47c	#Physics Callback
  .long 0x800ea5ec	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012f	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800ea908	#Animation Callback
  .long 0x800ea9a4	#IASA Callback
  .long 0x800ea9ac	#Physics Callback
  .long 0x800eab90	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000130	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800ea040	#Animation Callback
  .long 0x800ea080	#IASA Callback
  .long 0x800ea0bc	#Physics Callback
  .long 0x800ea164	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000131	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800ea344	#Animation Callback
  .long 0x800ea438	#IASA Callback
  .long 0x800ea534	#Physics Callback
  .long 0x800ea628	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000132	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800ea944	#Animation Callback
  .long 0x800ea9a8	#IASA Callback
  .long 0x800eaa8c	#Physics Callback
  .long 0x800eabcc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000133	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800e7354	#Animation Callback
  .long 0x800e7414	#IASA Callback
  .long 0x800e741c	#Physics Callback
  .long 0x800e74a8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000134	#Move ID
  .long 0x00340613	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800e73b4	#Animation Callback
  .long 0x800e7418	#IASA Callback
  .long 0x800e743c	#Physics Callback
  .long 0x800e74e4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800e7634	#Animation Callback
  .long 0x800e76d4	#IASA Callback
  .long 0x800e76dc	#Physics Callback
  .long 0x800e7800	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00340613	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800e7684	#Animation Callback
  .long 0x800e76d8	#IASA Callback
  .long 0x800e7758	#Physics Callback
  .long 0x800e78b4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000136	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800e7e3c	#Animation Callback
  .long 0x800e7ed8	#IASA Callback
  .long 0x800e7ee0	#Physics Callback
  .long 0x800e7f40	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000137	#Move ID
  .long 0x00340613	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800e7e78	#Animation Callback
  .long 0x800e7edc	#IASA Callback
  .long 0x800e7f20	#Physics Callback
  .long 0x800e7fa0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000138	#Move ID
  .long 0x00340613	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800e8124	#Animation Callback
  .long 0x800e81fc	#IASA Callback
  .long 0x800e8200	#Physics Callback
  .long 0x800e824c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000139	#Move ID
  .long 0x00341014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e8694	#Animation Callback
  .long 0x800e87ac	#IASA Callback
  .long 0x800e8864	#Physics Callback
  .long 0x800e88e4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013a	#Move ID
  .long 0x00341014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e8a24	#Animation Callback
  .long 0x800e8b14	#IASA Callback
  .long 0x800e8c34	#Physics Callback
  .long 0x800e8cdc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013b	#Move ID
  .long 0x00341014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e965c	#Animation Callback
  .long 0x800e9844	#IASA Callback
  .long 0x800e984c	#Physics Callback
  .long 0x800e98f4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013c	#Move ID
  .long 0x00341014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e9b40	#Animation Callback
  .long 0x800e9bc8	#IASA Callback
  .long 0x800e9bd0	#Physics Callback
  .long 0x800e9c50	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013a	#Move ID
  .long 0x00341014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e8fdc	#Animation Callback
  .long 0x800e91fc	#IASA Callback
  .long 0x800e9204	#Physics Callback
  .long 0x800e92ac	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013d	#Move ID
  .long 0x00341414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e8720	#Animation Callback
  .long 0x800e87d0	#IASA Callback
  .long 0x800e8884	#Physics Callback
  .long 0x800e8920	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013e	#Move ID
  .long 0x00341414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e8a9c	#Animation Callback
  .long 0x800e8b64	#IASA Callback
  .long 0x800e8c68	#Physics Callback
  .long 0x800e8d18	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013f	#Move ID
  .long 0x00341414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e97b4	#Animation Callback
  .long 0x800e9848	#IASA Callback
  .long 0x800e9880	#Physics Callback
  .long 0x800e9930	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000140	#Move ID
  .long 0x00341414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e9b84	#Animation Callback
  .long 0x800e9bcc	#IASA Callback
  .long 0x800e9bf0	#Physics Callback
  .long 0x800e9c8c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013e	#Move ID
  .long 0x00341414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e90ec	#Animation Callback
  .long 0x800e9200	#IASA Callback
  .long 0x800e9238	#Physics Callback
  .long 0x800e92e8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000141	#Move ID
  .long 0x00000072	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x800e5b18	#Animation Callback
  .long 0x800e5c38	#IASA Callback
  .long 0x800e5c3c	#Physics Callback
  .long 0x800e5c5c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000142	#Move ID
  .long 0x00000072	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x800e5b18	#Animation Callback
  .long 0x800e5c38	#IASA Callback
  .long 0x800e5c3c	#Physics Callback
  .long 0x800e5c5c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000143	#Move ID
  .long 0x00000072	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x800e5b18	#Animation Callback
  .long 0x800e5c38	#IASA Callback
  .long 0x800e5c3c	#Physics Callback
  .long 0x800e5c5c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000144	#Move ID
  .long 0x00000072	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x800e5b18	#Animation Callback
  .long 0x800e5c38	#IASA Callback
  .long 0x800e5c3c	#Physics Callback
  .long 0x800e5c5c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000145	#Move ID
  .long 0x00000072	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x800e5b18	#Animation Callback
  .long 0x800e5c38	#IASA Callback
  .long 0x800e5c3c	#Physics Callback
  .long 0x800e5c5c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000146	#Move ID
  .long 0x00000072	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x800e5b18	#Animation Callback
  .long 0x800e5c38	#IASA Callback
  .long 0x800e5c3c	#Physics Callback
  .long 0x800e5c5c	#Collision Callback
  .long 0x800761c8	#Camera Callback

  FighterMoveLogic_Pichu:
  .long 0x00000127	#Move ID
  .long 0x00340111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80124908	#Animation Callback
  .long 0x80124b6c	#IASA Callback
  .long 0x80124b74	#Physics Callback
  .long 0x80124bb4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000128	#Move ID
  .long 0x00340511	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80124a20	#Animation Callback
  .long 0x80124b70	#IASA Callback
  .long 0x80124b94	#Physics Callback
  .long 0x80124c20	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000129	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80124f64	#Animation Callback
  .long 0x80124fdc	#IASA Callback
  .long 0x80124fe4	#Physics Callback
  .long 0x80125084	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012a	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x801251bc	#Animation Callback
  .long 0x801252fc	#IASA Callback
  .long 0x8012535c	#Physics Callback
  .long 0x8012539c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012c	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8012590c	#Animation Callback
  .long 0x8012594c	#IASA Callback
  .long 0x80125954	#Physics Callback
  .long 0x801259d4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80125b34	#Animation Callback
  .long 0x80125bac	#IASA Callback
  .long 0x80125bb4	#Physics Callback
  .long 0x80125c44	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012b	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8012557c	#Animation Callback
  .long 0x801256b4	#IASA Callback
  .long 0x801256bc	#Physics Callback
  .long 0x801256fc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012e	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80124fa0	#Animation Callback
  .long 0x80124fe0	#IASA Callback
  .long 0x80125024	#Physics Callback
  .long 0x801250c0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012f	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8012525c	#Animation Callback
  .long 0x8012532c	#IASA Callback
  .long 0x8012537c	#Physics Callback
  .long 0x801253d8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012c	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80125910	#Animation Callback
  .long 0x80125950	#IASA Callback
  .long 0x80125958	#Physics Callback
  .long 0x801259d8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000131	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80125b70	#Animation Callback
  .long 0x80125bb0	#IASA Callback
  .long 0x80125bf4	#Physics Callback
  .long 0x80125c80	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000130	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8012561c	#Animation Callback
  .long 0x801256b8	#IASA Callback
  .long 0x801256dc	#Physics Callback
  .long 0x80125738	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000132	#Move ID
  .long 0x00340113	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80125ed8	#Animation Callback
  .long 0x80125f50	#IASA Callback
  .long 0x80125f58	#Physics Callback
  .long 0x80125fd8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000133	#Move ID
  .long 0x00340113	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80126144	#Animation Callback
  .long 0x80126424	#IASA Callback
  .long 0x801265d4	#Physics Callback
  .long 0x80126614	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000134	#Move ID
  .long 0x00340113	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80127198	#Animation Callback
  .long 0x801272d8	#IASA Callback
  .long 0x801272e0	#Physics Callback
  .long 0x8012738c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00340513	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80125f14	#Animation Callback
  .long 0x80125f54	#IASA Callback
  .long 0x80125f78	#Physics Callback
  .long 0x80126014	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000136	#Move ID
  .long 0x00340513	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x801262b4	#Animation Callback
  .long 0x80126428	#IASA Callback
  .long 0x801265f4	#Physics Callback
  .long 0x801267c8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000137	#Move ID
  .long 0x00340513	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80127228	#Animation Callback
  .long 0x801272dc	#IASA Callback
  .long 0x80127310	#Physics Callback
  .long 0x801273d4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000138	#Move ID
  .long 0x00340014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x80127cdc	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x801280c8	#Physics Callback
  .long 0x801281ec	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000139	#Move ID
  .long 0x00340014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x80127de4	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x80128108	#Physics Callback
  .long 0x8012823c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013a	#Move ID
  .long 0x00340014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x80127fb0	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x80128148	#Physics Callback
  .long 0x8012828c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013b	#Move ID
  .long 0x00340014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x80128050	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x801281ac	#Physics Callback
  .long 0x801282dc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013c	#Move ID
  .long 0x00340414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x80127d60	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x801280e8	#Physics Callback
  .long 0x80128214	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013d	#Move ID
  .long 0x00340414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x80127ec0	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x80128128	#Physics Callback
  .long 0x80128264	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013e	#Move ID
  .long 0x00340414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x80128000	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x80128168	#Physics Callback
  .long 0x801282b4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013f	#Move ID
  .long 0x00340414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8012808c	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x801281cc	#Physics Callback
  .long 0x80128304	#Collision Callback
  .long 0x800761c8	#Camera Callback

  FighterMoveLogic_GaW:
  .long 0x0000002e	#Move ID
  .long 0x002c0201	#Bitflags
  .long 0x02800000	#Attack ID
  .long 0x8014c138	#Animation Callback
  .long 0x8014c174	#IASA Callback
  .long 0x8014c194	#Physics Callback
  .long 0x8014c1b4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000031	#Move ID
  .long 0x002c0204	#Bitflags
  .long 0x05800000	#Attack ID
  .long 0x8014c224	#Animation Callback
  .long 0x8014c260	#IASA Callback
  .long 0x8014c264	#Physics Callback
  .long 0x8014c284	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000032	#Move ID
  .long 0x002c0204	#Bitflags
  .long 0x05800000	#Attack ID
  .long 0x8014c308	#Animation Callback
  .long 0x8014c330	#IASA Callback
  .long 0x8014c350	#Physics Callback
  .long 0x8014c370	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000033	#Move ID
  .long 0x002c0204	#Bitflags
  .long 0x05800000	#Attack ID
  .long 0x8014c3f4	#Animation Callback
  .long 0x8014c414	#IASA Callback
  .long 0x8014c418	#Physics Callback
  .long 0x8014c438	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000003b	#Move ID
  .long 0x00240208	#Bitflags
  .long 0x09800000	#Attack ID
  .long 0x8014ae3c	#Animation Callback
  .long 0x8014ae78	#IASA Callback
  .long 0x8014af6c	#Physics Callback
  .long 0x8014af8c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000003e	#Move ID
  .long 0x00240a09	#Bitflags
  .long 0x0a800000	#Attack ID
  .long 0x8014aa88	#Animation Callback
  .long 0x8014aac4	#IASA Callback
  .long 0x8014aaf4	#Physics Callback
  .long 0x8014ab14	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000044	#Move ID
  .long 0x0024060c	#Bitflags
  .long 0x0d800000	#Attack ID
  .long 0x8014b720	#Animation Callback
  .long 0x8014b740	#IASA Callback
  .long 0x8014b760	#Physics Callback
  .long 0x8014b780	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000046	#Move ID
  .long 0x0024060e	#Bitflags
  .long 0x0f800000	#Attack ID
  .long 0x8014b87c	#Animation Callback
  .long 0x8014b89c	#IASA Callback
  .long 0x8014b8bc	#Physics Callback
  .long 0x8014b8dc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000047	#Move ID
  .long 0x0024060f	#Bitflags
  .long 0x10800000	#Attack ID
  .long 0x8014b9d8	#Animation Callback
  .long 0x8014b9f8	#IASA Callback
  .long 0x8014ba18	#Physics Callback
  .long 0x8014ba38	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000049	#Move ID
  .long 0x0000060c	#Bitflags
  .long 0x0dc00000	#Attack ID
  .long 0x8014bb24	#Animation Callback
  .long 0x8014bb70	#IASA Callback
  .long 0x8014bb74	#Physics Callback
  .long 0x8014bb94	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000004b	#Move ID
  .long 0x0000060e	#Bitflags
  .long 0x0fc00000	#Attack ID
  .long 0x8014bc0c	#Animation Callback
  .long 0x8014bc58	#IASA Callback
  .long 0x8014bc5c	#Physics Callback
  .long 0x8014bc7c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000004c	#Move ID
  .long 0x0000060f	#Bitflags
  .long 0x10c00000	#Attack ID
  .long 0x8014bcf4	#Animation Callback
  .long 0x8014bd40	#IASA Callback
  .long 0x8014bd44	#Physics Callback
  .long 0x8014bd64	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000127	#Move ID
  .long 0x00340111	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8014e73c	#Animation Callback
  .long 0x8014e87c	#IASA Callback
  .long 0x8014e984	#Physics Callback
  .long 0x8014e9c4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000128	#Move ID
  .long 0x00340511	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8014e7dc	#Animation Callback
  .long 0x8014e900	#IASA Callback
  .long 0x8014e9a4	#Physics Callback
  .long 0x8014ea00	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000129	#Move ID
  .long 0x00340012	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8014c8bc	#Animation Callback
  .long 0x8014c934	#IASA Callback
  .long 0x8014c93c	#Physics Callback
  .long 0x8014ca10	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012a	#Move ID
  .long 0x00340012	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8014c8bc	#Animation Callback
  .long 0x8014c934	#IASA Callback
  .long 0x8014c93c	#Physics Callback
  .long 0x8014ca10	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012b	#Move ID
  .long 0x00340012	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8014c8bc	#Animation Callback
  .long 0x8014c934	#IASA Callback
  .long 0x8014c93c	#Physics Callback
  .long 0x8014ca10	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012c	#Move ID
  .long 0x00340012	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8014c8bc	#Animation Callback
  .long 0x8014c934	#IASA Callback
  .long 0x8014c93c	#Physics Callback
  .long 0x8014ca10	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x00340012	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8014c8bc	#Animation Callback
  .long 0x8014c934	#IASA Callback
  .long 0x8014c93c	#Physics Callback
  .long 0x8014ca10	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012e	#Move ID
  .long 0x00340012	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8014c8bc	#Animation Callback
  .long 0x8014c934	#IASA Callback
  .long 0x8014c93c	#Physics Callback
  .long 0x8014ca10	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012f	#Move ID
  .long 0x00340012	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8014c8bc	#Animation Callback
  .long 0x8014c934	#IASA Callback
  .long 0x8014c93c	#Physics Callback
  .long 0x8014ca10	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000130	#Move ID
  .long 0x00340012	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8014c8bc	#Animation Callback
  .long 0x8014c934	#IASA Callback
  .long 0x8014c93c	#Physics Callback
  .long 0x8014ca10	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000131	#Move ID
  .long 0x00340012	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8014c8bc	#Animation Callback
  .long 0x8014c934	#IASA Callback
  .long 0x8014c93c	#Physics Callback
  .long 0x8014ca10	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000132	#Move ID
  .long 0x00340412	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8014c8f8	#Animation Callback
  .long 0x8014c938	#IASA Callback
  .long 0x8014c974	#Physics Callback
  .long 0x8014ca4c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000133	#Move ID
  .long 0x00340412	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8014c8f8	#Animation Callback
  .long 0x8014c938	#IASA Callback
  .long 0x8014c974	#Physics Callback
  .long 0x8014ca4c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000134	#Move ID
  .long 0x00340412	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8014c8f8	#Animation Callback
  .long 0x8014c938	#IASA Callback
  .long 0x8014c974	#Physics Callback
  .long 0x8014ca4c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00340412	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8014c8f8	#Animation Callback
  .long 0x8014c938	#IASA Callback
  .long 0x8014c974	#Physics Callback
  .long 0x8014ca4c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000136	#Move ID
  .long 0x00340412	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8014c8f8	#Animation Callback
  .long 0x8014c938	#IASA Callback
  .long 0x8014c974	#Physics Callback
  .long 0x8014ca4c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000137	#Move ID
  .long 0x00340412	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8014c8f8	#Animation Callback
  .long 0x8014c938	#IASA Callback
  .long 0x8014c974	#Physics Callback
  .long 0x8014ca4c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000138	#Move ID
  .long 0x00340412	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8014c8f8	#Animation Callback
  .long 0x8014c938	#IASA Callback
  .long 0x8014c974	#Physics Callback
  .long 0x8014ca4c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000139	#Move ID
  .long 0x00340412	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8014c8f8	#Animation Callback
  .long 0x8014c938	#IASA Callback
  .long 0x8014c974	#Physics Callback
  .long 0x8014ca4c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013a	#Move ID
  .long 0x00340412	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8014c8f8	#Animation Callback
  .long 0x8014c938	#IASA Callback
  .long 0x8014c974	#Physics Callback
  .long 0x8014ca4c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013b	#Move ID
  .long 0x00340013	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x8014e1f8	#Animation Callback
  .long 0x8014e290	#IASA Callback
  .long 0x8014e374	#Physics Callback
  .long 0x8014e3b4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013c	#Move ID
  .long 0x00340413	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x8014e218	#Animation Callback
  .long 0x8014e2b0	#IASA Callback
  .long 0x8014e394	#Physics Callback
  .long 0x8014e3d4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013d	#Move ID
  .long 0x003c0014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8014d014	#Animation Callback
  .long 0x8014d1ac	#IASA Callback
  .long 0x8014d31c	#Physics Callback
  .long 0x8014d3b4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013e	#Move ID
  .long 0x00340014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8014d6b4	#Animation Callback
  .long 0x8014d834	#IASA Callback
  .long 0x8014d83c	#Physics Callback
  .long 0x8014d87c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013f	#Move ID
  .long 0x00340014	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8014da60	#Animation Callback
  .long 0x8014db80	#IASA Callback
  .long 0x8014db88	#Physics Callback
  .long 0x8014dbc8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000140	#Move ID
  .long 0x003c0414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8014d0e0	#Animation Callback
  .long 0x8014d264	#IASA Callback
  .long 0x8014d350	#Physics Callback
  .long 0x8014d3f0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000141	#Move ID
  .long 0x00340414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8014d774	#Animation Callback
  .long 0x8014d838	#IASA Callback
  .long 0x8014d85c	#Physics Callback
  .long 0x8014d8b8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000142	#Move ID
  .long 0x00340414	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8014daf0	#Animation Callback
  .long 0x8014db84	#IASA Callback
  .long 0x8014dba8	#Physics Callback
  .long 0x8014dc04	#Collision Callback
  .long 0x800761c8	#Camera Callback

  FighterMoveLogic_Ganondorf:
  .long 0xffffffff	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x00000000	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x00000000	#Physics Callback
  .long 0x00000000	#Collision Callback
  .long 0x00000000	#Camera Callback
  .long 0xffffffff	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x00000000	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x00000000	#Physics Callback
  .long 0x00000000	#Collision Callback
  .long 0x00000000	#Camera Callback
  .long 0xffffffff	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x00000000	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x00000000	#Physics Callback
  .long 0x00000000	#Collision Callback
  .long 0x00000000	#Camera Callback
  .long 0xffffffff	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x00000000	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x00000000	#Physics Callback
  .long 0x00000000	#Collision Callback
  .long 0x00000000	#Camera Callback
  .long 0xffffffff	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x00000000	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x00000000	#Physics Callback
  .long 0x00000000	#Collision Callback
  .long 0x00000000	#Camera Callback
  .long 0xffffffff	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x00000000	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x00000000	#Physics Callback
  .long 0x00000000	#Collision Callback
  .long 0x00000000	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x00340211	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800e2c80	#Animation Callback
  .long 0x800e2e38	#IASA Callback
  .long 0x800e2f2c	#Physics Callback
  .long 0x800e3168	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012e	#Move ID
  .long 0x00340611	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x800e2d5c	#Animation Callback
  .long 0x800e2e3c	#IASA Callback
  .long 0x800e3018	#Physics Callback
  .long 0x800e31f4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012f	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800e384c	#Animation Callback
  .long 0x800e3b0c	#IASA Callback
  .long 0x800e3b1c	#Physics Callback
  .long 0x800e3c38	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000130	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800e3888	#Animation Callback
  .long 0x800e3b10	#IASA Callback
  .long 0x800e3b3c	#Physics Callback
  .long 0x800e3d44	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000131	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800e3964	#Animation Callback
  .long 0x800e3b14	#IASA Callback
  .long 0x800e3b5c	#Physics Callback
  .long 0x800e3de4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000132	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x800e39f0	#Animation Callback
  .long 0x800e3b18	#IASA Callback
  .long 0x800e3bd0	#Physics Callback
  .long 0x800e3e40	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000133	#Move ID
  .long 0x00340013	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800e4b00	#Animation Callback
  .long 0x800e4b60	#IASA Callback
  .long 0x800e4bf8	#Physics Callback
  .long 0x800e4e1c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000134	#Move ID
  .long 0x00340413	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800e4ee8	#Animation Callback
  .long 0x800e4f48	#IASA Callback
  .long 0x800e4fdc	#Physics Callback
  .long 0x800e50d8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00340013	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800e51f8	#Animation Callback
  .long 0x800e5234	#IASA Callback
  .long 0x800e5238	#Physics Callback
  .long 0x800e523c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000136	#Move ID
  .long 0x00340013	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x800e5310	#Animation Callback
  .long 0x800e5384	#IASA Callback
  .long 0x800e5388	#Physics Callback
  .long 0x800e54b8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000137	#Move ID
  .long 0x00340214	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e415c	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800e4408	#Physics Callback
  .long 0x800e46b8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000138	#Move ID
  .long 0x00340214	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e4268	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800e449c	#Physics Callback
  .long 0x800e47b0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000139	#Move ID
  .long 0x00340614	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e42e0	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800e45e4	#Physics Callback
  .long 0x800e48bc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013a	#Move ID
  .long 0x00340614	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e4354	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800e4618	#Physics Callback
  .long 0x800e493c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013c	#Move ID
  .long 0x00340614	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e4390	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800e4678	#Physics Callback
  .long 0x800e495c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013b	#Move ID
  .long 0x00340214	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e42a4	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800e455c	#Physics Callback
  .long 0x800e4838	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013d	#Move ID
  .long 0x00340614	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x800e43cc	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800e4698	#Physics Callback
  .long 0x800e49dc	#Collision Callback
  .long 0x800761c8	#Camera Callback

  FighterMoveLogic_Roy:
  .long 0x00000127	#Move ID
  .long 0x00340211	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80136844	#Animation Callback
  .long 0x80136914	#IASA Callback
  .long 0x8013691c	#Physics Callback
  .long 0x801369a4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000128	#Move ID
  .long 0x00340211	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80136adc	#Animation Callback
  .long 0x80136c8c	#IASA Callback
  .long 0x80136cfc	#Physics Callback
  .long 0x80136d3c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000129	#Move ID
  .long 0x00340211	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80136ee4	#Animation Callback
  .long 0x8013713c	#IASA Callback
  .long 0x80137144	#Physics Callback
  .long 0x80137184	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012a	#Move ID
  .long 0x00340211	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80136ee4	#Animation Callback
  .long 0x8013713c	#IASA Callback
  .long 0x80137144	#Physics Callback
  .long 0x80137184	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012b	#Move ID
  .long 0x00340611	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x801368ac	#Animation Callback
  .long 0x80136918	#IASA Callback
  .long 0x8013695c	#Physics Callback
  .long 0x801369e0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012c	#Move ID
  .long 0x00340611	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80136bb4	#Animation Callback
  .long 0x80136cc4	#IASA Callback
  .long 0x80136d1c	#Physics Callback
  .long 0x80136d78	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x00340611	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80137010	#Animation Callback
  .long 0x80137140	#IASA Callback
  .long 0x80137164	#Physics Callback
  .long 0x801371c0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012e	#Move ID
  .long 0x00340611	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80137010	#Animation Callback
  .long 0x80137140	#IASA Callback
  .long 0x80137164	#Physics Callback
  .long 0x801371c0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012f	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80137558	#Animation Callback
  .long 0x801375b8	#IASA Callback
  .long 0x80137618	#Physics Callback
  .long 0x8013767c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000130	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x801377b0	#Animation Callback
  .long 0x80137810	#IASA Callback
  .long 0x80137870	#Physics Callback
  .long 0x801378d4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000131	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x801377b0	#Animation Callback
  .long 0x80137810	#IASA Callback
  .long 0x80137870	#Physics Callback
  .long 0x801378d4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000132	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80137b34	#Animation Callback
  .long 0x80137b94	#IASA Callback
  .long 0x80137bf4	#Physics Callback
  .long 0x80137c50	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000133	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80137b34	#Animation Callback
  .long 0x80137b94	#IASA Callback
  .long 0x80137bf4	#Physics Callback
  .long 0x80137c50	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000134	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80137b34	#Animation Callback
  .long 0x80137b94	#IASA Callback
  .long 0x80137bf4	#Physics Callback
  .long 0x80137c50	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80137ecc	#Animation Callback
  .long 0x80137f2c	#IASA Callback
  .long 0x80137f30	#Physics Callback
  .long 0x80137f8c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000136	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80137ecc	#Animation Callback
  .long 0x80137f2c	#IASA Callback
  .long 0x80137f30	#Physics Callback
  .long 0x80137f8c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000137	#Move ID
  .long 0x00340212	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80137ecc	#Animation Callback
  .long 0x80137f2c	#IASA Callback
  .long 0x80137f30	#Physics Callback
  .long 0x80137f8c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000138	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80137558	#Animation Callback
  .long 0x801375b8	#IASA Callback
  .long 0x80137618	#Physics Callback
  .long 0x8013767c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000139	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x801377b0	#Animation Callback
  .long 0x80137810	#IASA Callback
  .long 0x80137870	#Physics Callback
  .long 0x801378d4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013a	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x801377b0	#Animation Callback
  .long 0x80137810	#IASA Callback
  .long 0x80137870	#Physics Callback
  .long 0x801378d4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013b	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80137b34	#Animation Callback
  .long 0x80137b94	#IASA Callback
  .long 0x80137bf4	#Physics Callback
  .long 0x80137c50	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013c	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80137b34	#Animation Callback
  .long 0x80137b94	#IASA Callback
  .long 0x80137bf4	#Physics Callback
  .long 0x80137c50	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013d	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80137b34	#Animation Callback
  .long 0x80137b94	#IASA Callback
  .long 0x80137bf4	#Physics Callback
  .long 0x80137c50	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013e	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80137ecc	#Animation Callback
  .long 0x80137f2c	#IASA Callback
  .long 0x80137f30	#Physics Callback
  .long 0x80137f8c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013f	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80137ecc	#Animation Callback
  .long 0x80137f2c	#IASA Callback
  .long 0x80137f30	#Physics Callback
  .long 0x80137f8c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000140	#Move ID
  .long 0x00340612	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80137ecc	#Animation Callback
  .long 0x80137f2c	#IASA Callback
  .long 0x80137f30	#Physics Callback
  .long 0x80137f8c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000141	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x801382e8	#Animation Callback
  .long 0x801383a8	#IASA Callback
  .long 0x80138638	#Physics Callback
  .long 0x801388b4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000142	#Move ID
  .long 0x00340613	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80138348	#Animation Callback
  .long 0x801384f0	#IASA Callback
  .long 0x8013873c	#Physics Callback
  .long 0x80138940	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000143	#Move ID
  .long 0x00340214	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x80138aa8	#Animation Callback
  .long 0x80138c20	#IASA Callback
  .long 0x80138c28	#Physics Callback
  .long 0x80138cc0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000144	#Move ID
  .long 0x00340214	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x80138e68	#Animation Callback
  .long 0x80138fc0	#IASA Callback
  .long 0x80138fc8	#Physics Callback
  .long 0x80139008	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000145	#Move ID
  .long 0x00340614	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x80138b64	#Animation Callback
  .long 0x80138c24	#IASA Callback
  .long 0x80138c5c	#Physics Callback
  .long 0x80138cfc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000146	#Move ID
  .long 0x00340614	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x80138f14	#Animation Callback
  .long 0x80138fc4	#IASA Callback
  .long 0x80138fe8	#Physics Callback
  .long 0x80139044	#Collision Callback
  .long 0x800761c8	#Camera Callback

  FighterMoveLogic_MasterHand:
  .long 0x00000127	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80150230	#Animation Callback
  .long 0x8015082c	#IASA Callback
  .long 0x80150870	#Physics Callback
  .long 0x80150890	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000128	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80150230	#Animation Callback
  .long 0x8015082c	#IASA Callback
  .long 0x80150870	#Physics Callback
  .long 0x80150890	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000129	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80151168	#Animation Callback
  .long 0x801511b0	#IASA Callback
  .long 0x801511f4	#Physics Callback
  .long 0x801511f8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012a	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x801515b8	#Animation Callback
  .long 0x801517b0	#IASA Callback
  .long 0x801517f4	#Physics Callback
  .long 0x80151824	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012b	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x801516b4	#Animation Callback
  .long 0x801517b0	#IASA Callback
  .long 0x801517f4	#Physics Callback
  .long 0x80151824	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012c	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80151874	#Animation Callback
  .long 0x801518b0	#IASA Callback
  .long 0x801518f4	#Physics Callback
  .long 0x80151914	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8015198c	#Animation Callback
  .long 0x80151a44	#IASA Callback
  .long 0x80151a88	#Physics Callback
  .long 0x80151ac4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012e	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80151b14	#Animation Callback
  .long 0x80151b70	#IASA Callback
  .long 0x80151b50	#Physics Callback
  .long 0x80151bb4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012f	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80151c04	#Animation Callback
  .long 0x80151c40	#IASA Callback
  .long 0x80151c84	#Physics Callback
  .long 0x80151ca4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000130	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80151e10	#Animation Callback
  .long 0x80151e4c	#IASA Callback
  .long 0x80151e90	#Physics Callback
  .long 0x80151eb0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000131	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80151f00	#Animation Callback
  .long 0x8015204c	#IASA Callback
  .long 0x80152090	#Physics Callback
  .long 0x801520d4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000132	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80152138	#Animation Callback
  .long 0x80152174	#IASA Callback
  .long 0x801521b8	#Physics Callback
  .long 0x801521d8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000133	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80151d20	#Animation Callback
  .long 0x80151d5c	#IASA Callback
  .long 0x80151da0	#Physics Callback
  .long 0x80151dc0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000134	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8015223c	#Animation Callback
  .long 0x80152278	#IASA Callback
  .long 0x801522bc	#Physics Callback
  .long 0x8015236c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x801523bc	#Animation Callback
  .long 0x80152414	#IASA Callback
  .long 0x80152458	#Physics Callback
  .long 0x80152478	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000136	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x801524c8	#Animation Callback
  .long 0x80152544	#IASA Callback
  .long 0x80152588	#Physics Callback
  .long 0x801525dc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000137	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80152634	#Animation Callback
  .long 0x80152670	#IASA Callback
  .long 0x801526b4	#Physics Callback
  .long 0x801526d4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000138	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80152738	#Animation Callback
  .long 0x80152774	#IASA Callback
  .long 0x801527b8	#Physics Callback
  .long 0x8015287c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000139	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80152928	#Animation Callback
  .long 0x80152a0c	#IASA Callback
  .long 0x80152a50	#Physics Callback
  .long 0x80152bc8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013a	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x801529d0	#Animation Callback
  .long 0x80152a0c	#IASA Callback
  .long 0x80152a50	#Physics Callback
  .long 0x80152bc8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013b	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80152c34	#Animation Callback
  .long 0x80152c70	#IASA Callback
  .long 0x80152cb4	#Physics Callback
  .long 0x80152cd4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013c	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80152d44	#Animation Callback
  .long 0x80152dc0	#IASA Callback
  .long 0x80152e04	#Physics Callback
  .long 0x80152e24	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013d	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80153000	#Animation Callback
  .long 0x8015303c	#IASA Callback
  .long 0x80153080	#Physics Callback
  .long 0x801530a0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013e	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80153160	#Animation Callback
  .long 0x80153210	#IASA Callback
  .long 0x80153254	#Physics Callback
  .long 0x801533c8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013f	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8015346c	#Animation Callback
  .long 0x80153548	#IASA Callback
  .long 0x8015358c	#Physics Callback
  .long 0x801535ac	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000140	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8015377c	#Animation Callback
  .long 0x801537b8	#IASA Callback
  .long 0x801537fc	#Physics Callback
  .long 0x8015381c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000141	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8015386c	#Animation Callback
  .long 0x801538a8	#IASA Callback
  .long 0x801538ec	#Physics Callback
  .long 0x8015390c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000142	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x801539a4	#Animation Callback
  .long 0x801539ec	#IASA Callback
  .long 0x80153a30	#Physics Callback
  .long 0x80153a60	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000143	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80153aec	#Animation Callback
  .long 0x80153b28	#IASA Callback
  .long 0x80153b6c	#Physics Callback
  .long 0x80153b8c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000144	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80153c48	#Animation Callback
  .long 0x80153c90	#IASA Callback
  .long 0x80153cd4	#Physics Callback
  .long 0x80153d28	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000145	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80153f8c	#Animation Callback
  .long 0x80154114	#IASA Callback
  .long 0x80154158	#Physics Callback
  .long 0x801541c4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000146	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80154230	#Animation Callback
  .long 0x80154278	#IASA Callback
  .long 0x801542bc	#Physics Callback
  .long 0x801542dc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000147	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80154360	#Animation Callback
  .long 0x801543e8	#IASA Callback
  .long 0x8015442c	#Physics Callback
  .long 0x8015459c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000148	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80154620	#Animation Callback
  .long 0x80154670	#IASA Callback
  .long 0x801546b4	#Physics Callback
  .long 0x801546d4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000149	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x801548d8	#Animation Callback
  .long 0x80154964	#IASA Callback
  .long 0x801549a8	#Physics Callback
  .long 0x80154a08	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000014a	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80154d78	#Animation Callback
  .long 0x80154dd0	#IASA Callback
  .long 0x80154e14	#Physics Callback
  .long 0x80154e74	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000014b	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80154d78	#Animation Callback
  .long 0x80154dd0	#IASA Callback
  .long 0x80154e14	#Physics Callback
  .long 0x80154e74	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000014c	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80154b2c	#Animation Callback
  .long 0x80154bb0	#IASA Callback
  .long 0x80154bf4	#Physics Callback
  .long 0x80154c54	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000014d	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80154ed8	#Animation Callback
  .long 0x80154fac	#IASA Callback
  .long 0x80154ff0	#Physics Callback
  .long 0x80155010	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000014e	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80155074	#Animation Callback
  .long 0x8015512c	#IASA Callback
  .long 0x80155170	#Physics Callback
  .long 0x80155190	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000014f	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80154758	#Animation Callback
  .long 0x80154794	#IASA Callback
  .long 0x801547d8	#Physics Callback
  .long 0x80154838	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000150	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8015521c	#Animation Callback
  .long 0x80155290	#IASA Callback
  .long 0x801552d4	#Physics Callback
  .long 0x801552f4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000151	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80155388	#Animation Callback
  .long 0x8015541c	#IASA Callback
  .long 0x80155460	#Physics Callback
  .long 0x80155480	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000152	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8015550c	#Animation Callback
  .long 0x80155580	#IASA Callback
  .long 0x801555c4	#Physics Callback
  .long 0x801555e4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000153	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x801555e8	#Animation Callback
  .long 0x8015565c	#IASA Callback
  .long 0x801556a0	#Physics Callback
  .long 0x801556c0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000154	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x801556c4	#Animation Callback
  .long 0x801557b0	#IASA Callback
  .long 0x801557f4	#Physics Callback
  .long 0x80155814	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000155	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80155864	#Animation Callback
  .long 0x801558a0	#IASA Callback
  .long 0x801558e4	#Physics Callback
  .long 0x80155904	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000156	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80155908	#Animation Callback
  .long 0x80155990	#IASA Callback
  .long 0x801559d4	#Physics Callback
  .long 0x80155a34	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000157	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80150f00	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x80150f68	#Physics Callback
  .long 0x80150fc8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000158	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80150f00	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x80150f68	#Physics Callback
  .long 0x80150fc8	#Collision Callback
  .long 0x800761c8	#Camera Callback

  FighterMoveLogic_CrazyHand:
  .long 0x00000127	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80156404	#Animation Callback
  .long 0x80156a70	#IASA Callback
  .long 0x80156ab4	#Physics Callback
  .long 0x80156ad4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000128	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80156404	#Animation Callback
  .long 0x80156a70	#IASA Callback
  .long 0x80156ab4	#Physics Callback
  .long 0x80156ad4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000129	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80156fdc	#Animation Callback
  .long 0x80157018	#IASA Callback
  .long 0x8015705c	#Physics Callback
  .long 0x8015707c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012a	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x801570cc	#Animation Callback
  .long 0x80157108	#IASA Callback
  .long 0x8015714c	#Physics Callback
  .long 0x8015716c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012b	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80157204	#Animation Callback
  .long 0x801572d4	#IASA Callback
  .long 0x80157318	#Physics Callback
  .long 0x80157378	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012c	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x801573c8	#Animation Callback
  .long 0x80157424	#IASA Callback
  .long 0x80157404	#Physics Callback
  .long 0x80157468	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x801574b8	#Animation Callback
  .long 0x801574f4	#IASA Callback
  .long 0x80157538	#Physics Callback
  .long 0x80157558	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012e	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x801575a8	#Animation Callback
  .long 0x801575e4	#IASA Callback
  .long 0x80157628	#Physics Callback
  .long 0x80157648	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012f	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x801576b0	#Animation Callback
  .long 0x80157724	#IASA Callback
  .long 0x80157768	#Physics Callback
  .long 0x801578e4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000130	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80157844	#Animation Callback
  .long 0x80157880	#IASA Callback
  .long 0x801578c4	#Physics Callback
  .long 0x801578e4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000131	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80157934	#Animation Callback
  .long 0x8015798c	#IASA Callback
  .long 0x801579d0	#Physics Callback
  .long 0x801579f0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000132	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80157a40	#Animation Callback
  .long 0x80157abc	#IASA Callback
  .long 0x80157b00	#Physics Callback
  .long 0x80157b54	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000133	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80157bac	#Animation Callback
  .long 0x80157be8	#IASA Callback
  .long 0x80157c2c	#Physics Callback
  .long 0x80157c4c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000134	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80157cb0	#Animation Callback
  .long 0x80157cec	#IASA Callback
  .long 0x80157d30	#Physics Callback
  .long 0x80157df4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80157ea0	#Animation Callback
  .long 0x80157f84	#IASA Callback
  .long 0x80157fc8	#Physics Callback
  .long 0x80158140	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000136	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80157f48	#Animation Callback
  .long 0x80157f84	#IASA Callback
  .long 0x80157fc8	#Physics Callback
  .long 0x80158140	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000137	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x801581a4	#Animation Callback
  .long 0x801581e0	#IASA Callback
  .long 0x80158224	#Physics Callback
  .long 0x801582d4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000138	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80158340	#Animation Callback
  .long 0x8015837c	#IASA Callback
  .long 0x801583c0	#Physics Callback
  .long 0x801583e0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000139	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80158450	#Animation Callback
  .long 0x801584cc	#IASA Callback
  .long 0x80158510	#Physics Callback
  .long 0x80158530	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013a	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8015870c	#Animation Callback
  .long 0x80158748	#IASA Callback
  .long 0x8015878c	#Physics Callback
  .long 0x801587ac	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013b	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80158814	#Animation Callback
  .long 0x80158850	#IASA Callback
  .long 0x80158894	#Physics Callback
  .long 0x801588b4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013c	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80158bbc	#Animation Callback
  .long 0x80158c44	#IASA Callback
  .long 0x80158c88	#Physics Callback
  .long 0x80158df8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013d	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80158e7c	#Animation Callback
  .long 0x80158ecc	#IASA Callback
  .long 0x80158f10	#Physics Callback
  .long 0x80158f30	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013e	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80159134	#Animation Callback
  .long 0x801591c0	#IASA Callback
  .long 0x80159204	#Physics Callback
  .long 0x80159264	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013f	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8015acd0	#Animation Callback
  .long 0x8015ad28	#IASA Callback
  .long 0x8015ad6c	#Physics Callback
  .long 0x8015adcc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000140	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8015acd0	#Animation Callback
  .long 0x8015ad28	#IASA Callback
  .long 0x8015ad6c	#Physics Callback
  .long 0x8015adcc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000141	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80159388	#Animation Callback
  .long 0x8015940c	#IASA Callback
  .long 0x80159450	#Physics Callback
  .long 0x801594b0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000142	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80159534	#Animation Callback
  .long 0x80159608	#IASA Callback
  .long 0x8015964c	#Physics Callback
  .long 0x8015966c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000143	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x801596d0	#Animation Callback
  .long 0x80159788	#IASA Callback
  .long 0x801597cc	#Physics Callback
  .long 0x801597ec	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000144	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80158fb4	#Animation Callback
  .long 0x80158ff0	#IASA Callback
  .long 0x80159034	#Physics Callback
  .long 0x80159094	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000145	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80159858	#Animation Callback
  .long 0x801598a0	#IASA Callback
  .long 0x801598e4	#Physics Callback
  .long 0x80159904	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000146	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x801599c0	#Animation Callback
  .long 0x80159a08	#IASA Callback
  .long 0x80159a4c	#Physics Callback
  .long 0x80159aa0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000147	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80159d04	#Animation Callback
  .long 0x80159e8c	#IASA Callback
  .long 0x80159ed0	#Physics Callback
  .long 0x80159f3c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000148	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x80159f8c	#Animation Callback
  .long 0x80159fc8	#IASA Callback
  .long 0x8015a00c	#Physics Callback
  .long 0x8015a02c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000149	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8015a0c4	#Animation Callback
  .long 0x8015a10c	#IASA Callback
  .long 0x8015a150	#Physics Callback
  .long 0x8015a180	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000014a	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8015a20c	#Animation Callback
  .long 0x8015a248	#IASA Callback
  .long 0x8015a28c	#Physics Callback
  .long 0x8015a2ac	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000014b	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8015a318	#Animation Callback
  .long 0x8015a38c	#IASA Callback
  .long 0x8015a3d0	#Physics Callback
  .long 0x8015a3f0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000014c	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8015a464	#Animation Callback
  .long 0x8015a4f8	#IASA Callback
  .long 0x8015a53c	#Physics Callback
  .long 0x8015a55c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000014d	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8015a5d0	#Animation Callback
  .long 0x8015a664	#IASA Callback
  .long 0x8015a6a8	#Physics Callback
  .long 0x8015a6c8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000014e	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8015a6cc	#Animation Callback
  .long 0x8015a750	#IASA Callback
  .long 0x8015a794	#Physics Callback
  .long 0x8015a7b4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000014f	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8015a7b8	#Animation Callback
  .long 0x8015a820	#IASA Callback
  .long 0x8015a864	#Physics Callback
  .long 0x8015a884	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000150	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8015a8d4	#Animation Callback
  .long 0x8015a910	#IASA Callback
  .long 0x8015a954	#Physics Callback
  .long 0x8015a974	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000151	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8015a978	#Animation Callback
  .long 0x8015aa00	#IASA Callback
  .long 0x8015aa44	#Physics Callback
  .long 0x8015aaa4	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000152	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8015ab04	#Animation Callback
  .long 0x8015ab84	#IASA Callback
  .long 0x8015abc8	#Physics Callback
  .long 0x8015abcc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000153	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8015af04	#Animation Callback
  .long 0x8015b0fc	#IASA Callback
  .long 0x8015b140	#Physics Callback
  .long 0x8015b170	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000154	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8015b000	#Animation Callback
  .long 0x8015b0fc	#IASA Callback
  .long 0x8015b140	#Physics Callback
  .long 0x8015b170	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000155	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8015b22c	#Animation Callback
  .long 0x8015b274	#IASA Callback
  .long 0x8015b2b8	#Physics Callback
  .long 0x8015b2bc	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000156	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8015bb70	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x8015bbd8	#Physics Callback
  .long 0x8015bc38	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000157	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x8015bb70	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x8015bbd8	#Physics Callback
  .long 0x8015bc38	#Collision Callback
  .long 0x800761c8	#Camera Callback

  FighterMoveLogic_GigaBowser:
  .long 0x00000127	#Move ID
  .long 0x00340011	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80134f48	#Animation Callback
  .long 0x801351b0	#IASA Callback
  .long 0x80135438	#Physics Callback
  .long 0x801354f8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000128	#Move ID
  .long 0x003c0011	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80134f9c	#Animation Callback
  .long 0x801351b4	#IASA Callback
  .long 0x80135458	#Physics Callback
  .long 0x80135564	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000129	#Move ID
  .long 0x00340011	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80135040	#Animation Callback
  .long 0x801352f0	#IASA Callback
  .long 0x80135478	#Physics Callback
  .long 0x801355d0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012a	#Move ID
  .long 0x00340411	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x8013507c	#Animation Callback
  .long 0x801352f4	#IASA Callback
  .long 0x80135498	#Physics Callback
  .long 0x8013563c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012b	#Move ID
  .long 0x003c0411	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x801350d0	#Animation Callback
  .long 0x801352f8	#IASA Callback
  .long 0x801354b8	#Physics Callback
  .long 0x801356a8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012c	#Move ID
  .long 0x00340411	#Bitflags
  .long 0x12000000	#Attack ID
  .long 0x80135174	#Animation Callback
  .long 0x80135434	#IASA Callback
  .long 0x801354d8	#Physics Callback
  .long 0x80135714	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012d	#Move ID
  .long 0x00340012	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80133654	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x80134224	#Physics Callback
  .long 0x80134388	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012e	#Move ID
  .long 0x00340012	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x801336cc	#Animation Callback
  .long 0x80133bf4	#IASA Callback
  .long 0x80134288	#Physics Callback
  .long 0x801343d8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000012f	#Move ID
  .long 0x00340012	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x801336cc	#Animation Callback
  .long 0x80133bf4	#IASA Callback
  .long 0x80134288	#Physics Callback
  .long 0x801343d8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0xffffffff	#Move ID
  .long 0x00340012	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x801339ac	#Animation Callback
  .long 0x80133e4c	#IASA Callback
  .long 0x801342c8	#Physics Callback
  .long 0x80134428	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000130	#Move ID
  .long 0x00340012	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x801339b4	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x80134308	#Physics Callback
  .long 0x80134478	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000131	#Move ID
  .long 0x00340012	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80133a90	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x80134328	#Physics Callback
  .long 0x801344a0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000132	#Move ID
  .long 0x00340412	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80133690	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x80134244	#Physics Callback
  .long 0x801343b0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000133	#Move ID
  .long 0x00340412	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8013383c	#Animation Callback
  .long 0x80133d20	#IASA Callback
  .long 0x801342a8	#Physics Callback
  .long 0x80134400	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000134	#Move ID
  .long 0x00340412	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x8013383c	#Animation Callback
  .long 0x80133d20	#IASA Callback
  .long 0x801342a8	#Physics Callback
  .long 0x80134400	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0xffffffff	#Move ID
  .long 0x00340012	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x801339b0	#Animation Callback
  .long 0x80134038	#IASA Callback
  .long 0x801342e8	#Physics Callback
  .long 0x80134450	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000135	#Move ID
  .long 0x00340412	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80133ad4	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x80134348	#Physics Callback
  .long 0x801344c8	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000136	#Move ID
  .long 0x00340412	#Bitflags
  .long 0x13000000	#Attack ID
  .long 0x80133bb0	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x80134368	#Physics Callback
  .long 0x801344f0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000137	#Move ID
  .long 0x00340213	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80135c08	#Animation Callback
  .long 0x80135d78	#IASA Callback
  .long 0x80135d80	#Physics Callback
  .long 0x80135e4c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000138	#Move ID
  .long 0x00340613	#Bitflags
  .long 0x14000000	#Attack ID
  .long 0x80135c60	#Animation Callback
  .long 0x80135d7c	#IASA Callback
  .long 0x80135de0	#Physics Callback
  .long 0x80135f6c	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x00000139	#Move ID
  .long 0x00340214	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x8013474c	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x801347c4	#Physics Callback
  .long 0x801348a0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013a	#Move ID
  .long 0x00340614	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x80134788	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x80134804	#Physics Callback
  .long 0x801348c0	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000013b	#Move ID
  .long 0x00340214	#Bitflags
  .long 0x15000000	#Attack ID
  .long 0x801349c4	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x80134a00	#Physics Callback
  .long 0x80134a20	#Collision Callback
  .long 0x800761c8	#Camera Callback
  .long 0x0000000e	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01000000	#Attack ID
  .long 0x00000000	#Animation Callback
  .long 0x00000000	#IASA Callback
  .long 0x800c74ac	#Physics Callback
  .long 0x00000000	#Collision Callback
  .long 0x00000000	#Camera Callback

  FighterMoveLogic_Sandbag:
  .long 0x00000127	#Move ID
  .long 0x00000000	#Bitflags
  .long 0x01400000	#Attack ID
  .long 0x8014fc20	#Animation Callback
  .long 0x8014fc24	#IASA Callback
  .long 0x8014fc28	#Physics Callback
  .long 0x8014fc48	#Collision Callback
  .long 0x800761c8	#Camera Callback
Fighter_CostumeSymbolTable:
  blrl
  #Mario
  bl FighterCostumeSymbols_Mario
  .byte 5          #Amount of Costumes
  .align 2
  #Fox
  bl FighterCostumeSymbols_Fox
  .byte 4          #Amount of Costumes
  .align 2
  #Falcon
  bl FighterCostumeSymbols_Falcon
  .byte 6          #Amount of Costumes
  .align 2
  #DK
  bl FighterCostumeSymbols_DK
  .byte 5          #Amount of Costumes
  .align 2
  #Kirby
  bl FighterCostumeSymbols_Kirby
  .byte 6          #Amount of Costumes
  .align 2
  #Bowser
  bl FighterCostumeSymbols_Bowser
  .byte 4          #Amount of Costumes
  .align 2
  #Link
  bl FighterCostumeSymbols_Link
  .byte 5          #Amount of Costumes
  .align 2
  #Sheik
  bl FighterCostumeSymbols_Sheik
  .byte 5          #Amount of Costumes
  .align 2
  #Ness
  bl FighterCostumeSymbols_Ness
  .byte 4          #Amount of Costumes
  .align 2
  #Peach
  bl FighterCostumeSymbols_Peach
  .byte 5          #Amount of Costumes
  .align 2
  #Popo
  bl FighterCostumeSymbols_Popo
  .byte 4          #Amount of Costumes
  .align 2
  #Nana
  bl FighterCostumeSymbols_Nana
  .byte 4          #Amount of Costumes
  .align 2
  #Pikachu
  bl FighterCostumeSymbols_Pikachu
  .byte 4          #Amount of Costumes
  .align 2
  #Samus
  bl FighterCostumeSymbols_Samus
  .byte 5          #Amount of Costumes
  .align 2
  #Yoshi
  bl FighterCostumeSymbols_Yoshi
  .byte 6          #Amount of Costumes
  .align 2
  #Jigglypuff
  bl FighterCostumeSymbols_Jigglypuff
  .byte 5          #Amount of Costumes
  .align 2
  #Mewtwo
  bl FighterCostumeSymbols_Mewtwo
  .byte 4          #Amount of Costumes
  .align 2
  #Luigi
  bl FighterCostumeSymbols_Luigi
  .byte 4          #Amount of Costumes
  .align 2
  #Marth
  bl FighterCostumeSymbols_Marth
  .byte 5          #Amount of Costumes
  .align 2
  #Zelda
  bl FighterCostumeSymbols_Zelda
  .byte 5          #Amount of Costumes
  .align 2
  #YoungLink
  bl FighterCostumeSymbols_YoungLink
  .byte 5          #Amount of Costumes
  .align 2
  #DrMario
  bl FighterCostumeSymbols_DrMario
  .byte 5          #Amount of Costumes
  .align 2
  #Falco
  bl FighterCostumeSymbols_Falco
  .byte 4          #Amount of Costumes
  .align 2
  #Pichu
  bl FighterCostumeSymbols_Pichu
  .byte 4          #Amount of Costumes
  .align 2
  #GaW
  bl FighterCostumeSymbols_GaW
  .byte 4          #Amount of Costumes
  .align 2
  #Ganondorf
  bl FighterCostumeSymbols_Ganondorf
  .byte 5          #Amount of Costumes
  .align 2
  #Roy
  bl FighterCostumeSymbols_Roy
  .byte 5          #Amount of Costumes
  .align 2
  #NewChar1
  bl FighterCostumeSymbols_NewChar1
  .byte NewChar1_CostumeCount          #Amount of Costumes
  .align 2
  #MasterHand
  bl FighterCostumeSymbols_MasterHand
  .byte 1          #Amount of Costumes
  .align 2
  #CrazyHand
  bl FighterCostumeSymbols_CrazyHand
  .byte 1          #Amount of Costumes
  .align 2
  #WireframeBoy
  bl FighterCostumeSymbols_WireframeBoy
  .byte 1          #Amount of Costumes
  .align 2
  #WireframeGirl
  bl FighterCostumeSymbols_WireframeGirl
  .byte 1          #Amount of Costumes
  .align 2
  #GigaBowser
  bl FighterCostumeSymbols_GigaBowser
  .byte 1          #Amount of Costumes
  .align 2
  #Sandbag
  bl FighterCostumeSymbols_Sandbag
  .byte 1          #Amount of Costumes
  .align 2
  .long -1
  FighterCostumeSymbols_Mario:
  #Costume0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume1
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume2
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume3
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume4
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0

  FighterCostumeSymbols_Fox:
  #Costume0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume1
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume2
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume3
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0

  FighterCostumeSymbols_Falcon:
  #Costume0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume1
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume2
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume3
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume4
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume5
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0

  FighterCostumeSymbols_DK:
  #Costume0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume1
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume2
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume3
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume4
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0

  FighterCostumeSymbols_Kirby:
  #Costume0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume1
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume2
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume3
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume4
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume5
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0

  FighterCostumeSymbols_Bowser:
  #Costume0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume1
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume2
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume3
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0

  FighterCostumeSymbols_Link:
  #Costume0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume1
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume2
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume3
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume4
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0

  FighterCostumeSymbols_Sheik:
  #Costume0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume1
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume2
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume3
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume4
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0

  FighterCostumeSymbols_Ness:
  #Costume0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume1
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume2
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume3
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0

  FighterCostumeSymbols_Peach:
  #Costume0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume1
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume2
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume3
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume4
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0

  FighterCostumeSymbols_Popo:
  #Costume0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume1
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume2
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume3
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0

  FighterCostumeSymbols_Nana:
  #Costume0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume1
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume2
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume3
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0

  FighterCostumeSymbols_Pikachu:
  #Costume0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume1
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume2
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume3
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0

  FighterCostumeSymbols_Samus:
  #Costume0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume1
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume2
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume3
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume4
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0

  FighterCostumeSymbols_Yoshi:
  #Costume0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume1
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume2
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume3
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume4
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume5
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0

  FighterCostumeSymbols_Jigglypuff:
  #Costume0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume1
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume2
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume3
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume4
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0

  FighterCostumeSymbols_Mewtwo:
  #Costume0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume1
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume2
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume3
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0

  FighterCostumeSymbols_Luigi:
  #Costume0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume1
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume2
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume3
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0

  FighterCostumeSymbols_Marth:
  #Costume0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume1
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume2
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume3
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume4
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0

  FighterCostumeSymbols_Zelda:
  #Costume0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume1
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume2
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume3
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume4
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0

  FighterCostumeSymbols_YoungLink:
  #Costume0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume1
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume2
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume3
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume4
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0

  FighterCostumeSymbols_DrMario:
  #Costume0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume1
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume2
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume3
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume4
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0

  FighterCostumeSymbols_Falco:
  #Costume0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume1
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume2
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume3
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0

  FighterCostumeSymbols_Pichu:
  #Costume0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume1
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume2
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume3
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0

  FighterCostumeSymbols_GaW:
  #Costume0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume1
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume2
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume3
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0

  FighterCostumeSymbols_Ganondorf:
  #Costume0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume1
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume2
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume3
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume4
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0

  FighterCostumeSymbols_Roy:
  #Costume0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume1
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume2
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume3
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  #Costume4
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0

  FighterCostumeSymbols_NewChar1:
  .rept NewChar1_CostumeCount * 6
  .long 0
  .endr

  FighterCostumeSymbols_MasterHand:
  #Costume0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0

  FighterCostumeSymbols_CrazyHand:
  #Costume0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0

  FighterCostumeSymbols_WireframeBoy:
  #Costume0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0

  FighterCostumeSymbols_WireframeGirl:
  #Costume0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0

  FighterCostumeSymbols_GigaBowser:
  #Costume0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0

  FighterCostumeSymbols_Sandbag:
  #Costume0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0

#Special Move Table
Fighter_DownSpecialLw:
  blrl
  .long 0x800e207c        #Mario
  .long 0x800e8560        #Fox
  .long 0x800e4040        #Falcon
  .long 0x8010dc80        #DK
  .long 0x800f3d50        #Kirby
  .long 0x8013460c        #Bowser
  .long 0x800eb65c        #Link
  .long 0x80114160        #Sheik
  .long 0x80119e14        #Ness
  .long 0x8011d11c        #Peach
  .long 0x80122904        #Popo
  .long 0x80122904        #Nana
  .long 0x801278bc        #Pikachu
  .long 0x8012af5c        #Samus
  .long 0x8012e6f8        #Yoshi
  .long 0x8013ce8c        #Jigglypuff
  .long 0x801461f0        #Mewtwo
  .long 0x801445f0        #Luigi
  .long 0x801389cc        #Marth
  .long 0x8013aee0        #Zelda
  .long 0x800eb65c        #YoungLink
  .long 0x800e207c        #DrMario
  .long 0x800e8560        #Falco
  .long 0x801278bc        #Pichu
  .long 0x8014cef0        #GaW
  .long 0x800e4040        #Ganondorf
  .long 0x801389cc        #Roy
  .long 0x8011d11c        #NewChar1
  .long 0x00000000        #MasterHand
  .long 0x00000000        #CrazyHand
  .long 0x00000000        #WireframeBoy
  .long 0x00000000        #WireframeGirl
  .long 0x8013460c        #GigaBowser
  .long 0x00000000        #Sandbag
  .long -1
Fighter_SideSpecialLw:
  blrl
  .long 0x800e1450        #Mario
  .long 0x800e9ee8        #Fox
  .long 0x800e32b0        #Falcon
  .long 0x8010e1c4        #DK
  .long 0x800f5564        #Kirby
  .long 0x80132efc        #Bowser
  .long 0x800ec354        #Link
  .long 0x80111038        #Sheik
  .long 0x80116c94        #Ness
  .long 0x8011c34c        #Peach
  .long 0x8011f99c        #Popo
  .long 0x00000000        #Nana
  .long 0x80124e38        #Pikachu
  .long 0x8012a1d8        #Samus
  .long 0x8012f4b4        #Yoshi
  .long 0x8013d234        #Jigglypuff
  .long 0x801466c4        #Mewtwo
  .long 0x80142b14        #Luigi
  .long 0x8013741c        #Marth
  .long 0x8013b638        #Zelda
  .long 0x800ec354        #YoungLink
  .long 0x800e1450        #DrMario
  .long 0x800e9ee8        #Falco
  .long 0x80124e38        #Pichu
  .long 0x8014c7a0        #GaW
  .long 0x800e32b0        #Ganondorf
  .long 0x8013741c        #Roy
  .long 0x8011c34c        #NewChar1
  .long 0x00000000        #MasterHand
  .long 0x00000000        #CrazyHand
  .long 0x00000000        #WireframeBoy
  .long 0x00000000        #WireframeGirl
  .long 0x80132efc        #GigaBowser
  .long 0x00000000        #Sandbag
  .long -1
Fighter_NeutralSpecialLw:
  blrl
  .long 0x800e0da8        #Mario
  .long 0x800e608c        #Fox
  .long 0x800e2b80        #Falcon
  .long 0x8010e574        #DK
  .long 0x800f1630        #Kirby
  .long 0x80134e58        #Bowser
  .long 0x800ecdac        #Link
  .long 0x801120e8        #Sheik
  .long 0x80116f94        #Ness
  .long 0x8011e3d0        #Peach
  .long 0x8011f1f8        #Popo
  .long 0x8011f1f8        #Nana
  .long 0x80124830        #Pikachu
  .long 0x8012954c        #Samus
  .long 0x8012cde8        #Yoshi
  .long 0x8013dea8        #Jigglypuff
  .long 0x80147320        #Mewtwo
  .long 0x8014267c        #Luigi
  .long 0x80136744        #Marth
  .long 0x8013a928        #Zelda
  .long 0x800ecdac        #YoungLink
  .long 0x800e0da8        #DrMario
  .long 0x800e608c        #Falco
  .long 0x80124830        #Pichu
  .long 0x8014e644        #GaW
  .long 0x800e2b80        #Ganondorf
  .long 0x80136744        #Roy
  .long 0x8011e3d0        #NewChar1
  .long 0x00000000        #MasterHand
  .long 0x00000000        #CrazyHand
  .long 0x00000000        #WireframeBoy
  .long 0x00000000        #WireframeGirl
  .long 0x80134e58        #GigaBowser
  .long 0x00000000        #Sandbag
  .long -1
Fighter_UpSpecialLw:
  blrl
  .long 0x800e1a54        #Mario
  .long 0x800e7238        #Fox
  .long 0x800e4a78        #Falcon
  .long 0x8010fb1c        #DK
  .long 0x800f2300        #Kirby
  .long 0x80135a2c        #Bowser
  .long 0x800ebb1c        #Link
  .long 0x801130d0        #Sheik
  .long 0x80118120        #Ness
  .long 0x8011d72c        #Peach
  .long 0x801211b4        #Popo
  .long 0x00000000        #Nana
  .long 0x80125de8        #Pikachu
  .long 0x8012a674        #Samus
  .long 0x8012e2c4        #Yoshi
  .long 0x8013c9c8        #Jigglypuff
  .long 0x801451dc        #Mewtwo
  .long 0x80143fc8        #Luigi
  .long 0x80138208        #Marth
  .long 0x80139834        #Zelda
  .long 0x800ebb1c        #YoungLink
  .long 0x800e1a54        #DrMario
  .long 0x800e7238        #Falco
  .long 0x80125de8        #Pichu
  .long 0x8014e0ac        #GaW
  .long 0x800e4a78        #Ganondorf
  .long 0x80138208        #Roy
  .long 0x8011d72c        #NewChar1
  .long 0x00000000        #MasterHand
  .long 0x00000000        #CrazyHand
  .long 0x00000000        #WireframeBoy
  .long 0x00000000        #WireframeGirl
  .long 0x80135a2c        #GigaBowser
  .long 0x00000000        #Sandbag
  .long -1
Fighter_DownSpecialHi:
  blrl
  .long 0x800e2194        #Mario
  .long 0x800e85ec        #Fox
  .long 0x800e40d8        #Falcon
  .long 0x00000000        #DK
  .long 0x800f3e68        #Kirby
  .long 0x801346a4        #Bowser
  .long 0x800eb6dc        #Link
  .long 0x80114224        #Sheik
  .long 0x80119e90        #Ness
  .long 0x8011d1c4        #Peach
  .long 0x80122988        #Popo
  .long 0x80122988        #Nana
  .long 0x80127924        #Pikachu
  .long 0x8012b09c        #Samus
  .long 0x8012e78c        #Yoshi
  .long 0x8013cf2c        #Jigglypuff
  .long 0x80146264        #Mewtwo
  .long 0x80144708        #Luigi
  .long 0x80138a30        #Marth
  .long 0x8013afa4        #Zelda
  .long 0x800eb6dc        #YoungLink
  .long 0x800e2194        #DrMario
  .long 0x800e85ec        #Falco
  .long 0x80127924        #Pichu
  .long 0x8014cf78        #GaW
  .long 0x800e40d8        #Ganondorf
  .long 0x80138a30        #Roy
  .long 0x8011d1c4        #NewChar1
  .long 0x00000000        #MasterHand
  .long 0x00000000        #CrazyHand
  .long 0x00000000        #WireframeBoy
  .long 0x00000000        #WireframeGirl
  .long 0x801346a4        #GigaBowser
  .long 0x00000000        #Sandbag
  .long -1
Fighter_SideSpecialHi:
  blrl
  .long 0x800e14c8        #Mario
  .long 0x800e9f6c        #Fox
  .long 0x800e33e0        #Falcon
  .long 0x8010e234        #DK
  .long 0x800f55d0        #Kirby
  .long 0x80132f94        #Bowser
  .long 0x800ec404        #Link
  .long 0x8011108c        #Sheik
  .long 0x80116d04        #Ness
  .long 0x8011c3c4        #Peach
  .long 0x8011fb08        #Popo
  .long 0x00000000        #Nana
  .long 0x80124eac        #Pikachu
  .long 0x8012a2ac        #Samus
  .long 0x8012f588        #Yoshi
  .long 0x8013d2a0        #Jigglypuff
  .long 0x8014677c        #Mewtwo
  .long 0x80142b88        #Luigi
  .long 0x801374a0        #Marth
  .long 0x8013b6d8        #Zelda
  .long 0x800ec404        #YoungLink
  .long 0x800e14c8        #DrMario
  .long 0x800e9f6c        #Falco
  .long 0x80124eac        #Pichu
  .long 0x8014c828        #GaW
  .long 0x800e33e0        #Ganondorf
  .long 0x801374a0        #Roy
  .long 0x8011c3c4        #NewChar1
  .long 0x00000000        #MasterHand
  .long 0x00000000        #CrazyHand
  .long 0x00000000        #WireframeBoy
  .long 0x00000000        #WireframeGirl
  .long 0x80132f94        #GigaBowser
  .long 0x00000000        #Sandbag
  .long -1
Fighter_NeutralSpecialHi:
  blrl
  .long 0x800e1040        #Mario
  .long 0x800e61a8        #Fox
  .long 0x800e2c00        #Falcon
  .long 0x8010e69c        #DK
  .long 0x800f1680        #Kirby
  .long 0x80134ed0        #Bowser
  .long 0x800ecf78        #Link
  .long 0x80112198        #Sheik
  .long 0x80117034        #Ness
  .long 0x8011e45c        #Peach
  .long 0x8011f26c        #Popo
  .long 0x8011f26c        #Nana
  .long 0x8012489c        #Pikachu
  .long 0x801295f0        #Samus
  .long 0x8012ce64        #Yoshi
  .long 0x8013df60        #Jigglypuff
  .long 0x801473f4        #Mewtwo
  .long 0x801426ec        #Luigi
  .long 0x801367b8        #Marth
  .long 0x8013a9a4        #Zelda
  .long 0x800ecf78        #YoungLink
  .long 0x800e1040        #DrMario
  .long 0x800e61a8        #Falco
  .long 0x8012489c        #Pichu
  .long 0x8014e6c0        #GaW
  .long 0x800e2c00        #Ganondorf
  .long 0x801367b8        #Roy
  .long 0x8011e45c        #NewChar1
  .long 0x00000000        #MasterHand
  .long 0x00000000        #CrazyHand
  .long 0x00000000        #WireframeBoy
  .long 0x00000000        #WireframeGirl
  .long 0x80134ed0        #GigaBowser
  .long 0x00000000        #Sandbag
  .long -1
Fighter_UpSpecialHi:
  blrl
  .long 0x800e1ab0        #Mario
  .long 0x800e72c4        #Fox
  .long 0x800e4cf4        #Falcon
  .long 0x8010fbfc        #DK
  .long 0x800f23b8        #Kirby
  .long 0x80135b04        #Bowser
  .long 0x800ebb80        #Link
  .long 0x8011312c        #Sheik
  .long 0x80118250        #Ness
  .long 0x8011d7f0        #Peach
  .long 0x8012122c        #Popo
  .long 0x00000000        #Nana
  .long 0x80125e60        #Pikachu
  .long 0x8012a738        #Samus
  .long 0x8012e33c        #Yoshi
  .long 0x8013ca98        #Jigglypuff
  .long 0x80145258        #Mewtwo
  .long 0x80144024        #Luigi
  .long 0x8013826c        #Marth
  .long 0x801398e8        #Zelda
  .long 0x800ebb80        #YoungLink
  .long 0x800e1ab0        #DrMario
  .long 0x800e72c4        #Falco
  .long 0x80125e60        #Pichu
  .long 0x8014e158        #GaW
  .long 0x800e4cf4        #Ganondorf
  .long 0x8013826c        #Roy
  .long 0x8011d7f0        #NewChar1
  .long 0x00000000        #MasterHand
  .long 0x00000000        #CrazyHand
  .long 0x00000000        #WireframeBoy
  .long 0x00000000        #WireframeGirl
  .long 0x80135b04        #GigaBowser
  .long 0x00000000        #Sandbag
  .long -1
######################
Items_Data:
  #Item Pointers
    blrl
    bl  NewItem1
  NewItem1:
      bl  NewItem1_InterruptFunctions
    #OnEvent Functions
      .long 0x00000000      #OnSpawn Function
      .long 0x00000000      #OnDestroy Function
      .long 0x00000000      #OnPickup Function
      .long 0x00000000      #OnDrop Function
      .long 0x00000000      #OnThrow Function
      .long 0x8029ca78      #OnGiveDamage
      .long 0x00000000      #OnTakeDamage
      .long 0x00000000      #OnEnterAir
      .long 0x8029ca80      #OnReflect
      .long 0x8029ca78      #OnUnk
      .long 0x8029cc4c      #OnUnk
      .long 0x8029cc54      #OnHitShieldBounce
      .long 0x8029ccf0      #OnHitShieldDetermineDestroy
      .long 0x8029ccf8      #OnUnk
    #Creation Data
      .long 0x8026eecc      #GX Link
    NewItem1_InterruptFunctions:
    #State 0
      .long 0x00000000      #Ground/Air/Held
      .long 0x8029c6f4      #Animation Callback
      .long 0x8029c9cc      #Physics Callback
      .long 0x8029c9ec      #Collision Callback
    #State 1
      .long 0x00000001      #Ground/Air/Held
      .long 0x8029c6f4      #Animation Callback
      .long 0x8029c9cc      #Physics Callback
      .long 0x8029c9ec      #Collision Callback

  .long -1
Items_Index:
  blrl
  .rept NumOfAddedItems
  .long 0x0
  .endr
####################
ConvertPointers:
  #Init Loop
  .set  REG_Pointers,12
  .set  REG_OrigPointer,11
  mr  REG_Pointers,r3
  mr  REG_OrigPointer,r3

  ConvertPointers_Loop:
    lwz r3,0x0(REG_Pointers)          #Load bl instruction
    cmpwi r3,-1
    beq ConvertPointers_Exit          #keep going until -1
    rlwinm r5,r3,8,25,29    #extract opcode bits
    cmpwi r5,0x48           #if not a bl instruction, exit
    bne ConvertPointers_IncLoop
    rlwinm  r3,r3,0,6,29  #extract offset bits
  	rlwinm	r5,r3,7,31,31		#Get signed bit
  	lis	r6,0xFC00
  	mullw	r5,r5,r6
  	or	r3,r3,r5
    add r3,r3,REG_Pointers
    stw r3,0x0(REG_Pointers)
  #If it points to itself, make it 0
    cmpw  r3,REG_Pointers
    bne ConvertPointers_IncLoop
    li  r3,0
    stw r3,0x0(REG_Pointers)
  ConvertPointers_IncLoop:
    addi  REG_Pointers,REG_Pointers,0x4
    b ConvertPointers_Loop
  ConvertPointers_Exit:
    mr  r3,REG_OrigPointer
    blr
####################

Injection_Exit:
  li	r3, 1
