#To be inserted at 803753b4
.include "../../Globals.s"
.include "Header.s"

.set  REG_HeapLo,31
.set  REG_FileSize,28
.set  REG_File,27
.set  REG_HeapID,26
.set  REG_Header,25

backup

#Check if file exists
  bl  FileName
  mflr  r3
  branchl r12,0x8033796c
  cmpwi r3,-1
  beq Exit
#Get size of MnDt.dat
  bl  FileName
  mflr  r3
  branchl r12,0x800163d8
  addi  REG_FileSize,r3,0
#ALlign
  addi  REG_FileSize,REG_FileSize,31
  rlwinm	REG_FileSize, REG_FileSize, 0, 0, 26
#Create heap of this size
  add r4,REG_HeapLo,REG_FileSize     #heap hi = start + filesize
  addi  r4,r4,32*5              #plus 96 for header
  mr  r3,REG_HeapLo                  #heap lo = start
  mr  REG_HeapLo,r4             #new start = heap hi
  branchl r12,0x803440e8
  mr  REG_HeapID,r3
#Alloc header
  li  r4,68
  branchl r12,0x80343ef0
  mr  REG_Header,r3
#Alloc from this heap
  mr  r3,REG_HeapID
  mr  r4,REG_FileSize
  branchl r12,0x80343ef0
  mr  REG_File,r3
#Load file here
  bl  FileName
  mflr  r3
	mr r4, REG_File
	addi	r5, sp, 0x80
	branchl	r12,0x8001668C
#Init Archive
  lwz r5,0x80(sp)
  mr  r3,REG_Header   #store header
  mr  r4,REG_File      #file
  branchl r12,0x80016a54
#Get symbol offset
  mr  r3,REG_Header
  bl  SymbolName
  mflr  r4
  branchl r12,0x80380358

#Store Pointers
#Metadata
  lwz r4,Arch_Metadata(r3)
  stw r4,OFST_Metadata(rtoc)
  lwz r5,Metadata_InternalIDCount(r4)
  stw r5,OFST_Metadata_InternalIDCount(rtoc)
  lwz r5,Metadata_ExternalIDCount(r4)
  stw r5,OFST_Metadata_ExternalIDCount(rtoc)
  lwz r5,Metadata_CSSIconCount(r4)
  stw r5,OFST_Metadata_CSSIconCount(rtoc)
  lwz r5,Metadata_SSMCount(r4)
  stw r5,OFST_Metadata_SSMCount(rtoc)
  lwz r5,Metadata_EffectCount(r4)
  stw r5,OFST_Metadata_EffectCount(rtoc)
#Other
  lwz r4,Arch_MnSlChr_IconData(r3)
  stw r4,OFST_MnSlChrIconData(rtoc)
  lwz r4,Arch_MnSlChr_NameText(r3)
  stw r4,OFST_MnSlChrNames(rtoc)
  lwz r4,Arch_Char_CharFiles(r3)
  stw r4,OFST_MnSlChrCharFileNames(rtoc)
  lwz r4,Arch_Char_CostumeIDs(r3)
  stw r4,OFST_MnSlChrCostumeIDs(rtoc)
  lwz r4,Arch_Char_CostumeFileSymbols(r3)
  stw r4,OFST_MnSlChrCostumeFileSymbols(rtoc)
  lwz r4,Arch_Char_AnimFiles(r3)
  stw r4,OFST_MnSlChrAnimFileNames(rtoc)
  lwz r4,Arch_Char_AnimCount(r3)
  stw r4,OFST_MnSlChrAnimCount(rtoc)
  lwz r4,Arch_Char_EffectFiles(r3)
  stw r4,OFST_MnSlChrEffectFilesSymbols(rtoc)
  lwz r4,Arch_Char_EffectIDs(r3)
  stw r4,OFST_MnSlChrEffectFileIDs(rtoc)
  lwz r4,Arch_GmRst_AnimFiles(r3)
  stw r4,OFST_GmRstAnimFileNames(rtoc)
  lwz r4,Arch_InsigniaIDs(r3)
  stw r4,OFST_GmRstInsigniaIDs(rtoc)
  lwz r4,Arch_GmRst_Scale(r3)
  stw r4,OFST_GmRstScale(rtoc)
  lwz r4,Arch_GmRst_VictoryTheme(r3)
  stw r4,OFST_GmRstVictoryTheme(rtoc)
  lwz r4,Arch_FtDemo_SymbolNames(r3)
  stw r4,OFST_FtDemoSymbols(rtoc)
  lwz r4,Arch_Char_DefineIDs(r3)
  stw r4,OFST_MnSlChrDefineIDs(rtoc)
  lwz r4,Arch_SFX_NameDef(r3)
  stw r4,OFST_SFXNameDef(rtoc)
  lwz r4,Arch_SSM_CharSSMFileIDs(r3)
  stw r4,OFST_MnSlChrSSMFileIDs(rtoc)
  lwz r4,Arch_SSMFiles(r3)
  stw r4,OFST_MnSlChrSSMFileNames(rtoc)
  lwz r4,Arch_SSMRuntimeStruct(r3)
  stw r4,OFST_SSMStruct(rtoc)
  lwz r4,Arch_Fighter_OnLoad(r3)
  stw r4,OFST_FighterOnLoad(rtoc)
  lwz r4,Arch_Fighter_OnDeath(r3)
  stw r4,OFST_FighterOnDeath(rtoc)
  lwz r4,Arch_Fighter_OnUnk(r3)
  #stw r4,OFST_(rtoc)
  lwz r4,Arch_Char_CostumeRuntimePointers(r3)
  stw r4,OFST_Char_CostumeRuntimePointers(rtoc)
  lwz r4,Arch_Fighter_MoveLogic(r3)
  stw r4,OFST_FighterMoveLogic(rtoc)
  lwz r4,Arch_Fighter_SpecialN(r3)
  stw r4,OFST_FighterNeutralSpecialLw(rtoc)
  lwz r4,Arch_Fighter_SpecialAirN(r3)
  stw r4,OFST_FighterNeutralSpecialHi(rtoc)
  lwz r4,Arch_Fighter_SpecialHi(r3)
  stw r4,OFST_FighterUpSpecialLw(rtoc)
  lwz r4,Arch_Fighter_SpecialAirHi(r3)
  stw r4,OFST_FighterUpSpecialHi(rtoc)
  lwz r4,Arch_Fighter_SpecialLw(r3)
  stw r4,OFST_FighterDownSpecialLw(rtoc)
  lwz r4,Arch_Fighter_SpecialAirLw(r3)
  stw r4,OFST_FighterDownSpecialHi(rtoc)
  lwz r4,Arch_Fighter_SpecialS(r3)
  stw r4,OFST_FighterSideSpecialLw(rtoc)
  lwz r4,Arch_Fighter_SpecialAirS(r3)
  stw r4,OFST_FighterSideSpecialHi(rtoc)
  lwz r4,Arch_SSBMBanks(r3)
  stw r4,OFST_SSMBankSizes(rtoc)
  lwz r4,Arch_AudioGroups(r3)
  stw r4,OFST_AudioGroups(rtoc)

#Init preload table
PreloadInit:
  lwz r3,OFST_Metadata_ExternalIDCount(rtoc)
  load  r4,0x803ba648
  li  r5,0
PreloadInit_Loop:
  stw r3,0x0(r4)
  addi  r4,r4,8
  addi  r5,r5,1
  cmpwi r5,8
  blt PreloadInit_Loop

#Flush instruction cache so code can be run from this file
  mr  r3,REG_File
  mr  r4,REG_FileSize
  branchl r12,0x80328f50

  b Exit

FileName:
blrl
.string "MxDt.dat"
.align 2
SymbolName:
blrl
.string "mexData"
.align 2

Exit:
  mr  r3,REG_HeapLo
  restore
  mr  r31,r3
  stw	r31, -0x3FE8 (r13)
  mr	r3, r31
  mr	r4, r29
