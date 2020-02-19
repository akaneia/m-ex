#Constants
.set  NumOfAddedChars,1
.set  NumOfAddedSSMs,0
.set  NumOfAddedEffects,0
.set  NumOfAddedItems,0

#Derived Constants
.set  SSM_MaxID,(54+1+NumOfAddedChars) * 10000

#Archive Offsets
.set  Arch_Metadata,0x0
.set  Arch_MnSlChr_IconData,0x4
.set  Arch_MnSlChr_NameText,0x8
.set  Arch_Char_CharFiles,0xC
.set  Arch_Char_CostumeIDs,0x10
.set  Arch_Char_CostumeFileSymbols,0x14
.set  Arch_Char_AnimFiles,0x18
.set  Arch_Char_AnimCount,0x1C
.set  Arch_Char_EffectFiles,0x20
.set  Arch_Char_EffectIDs,0x24
.set  Arch_GmRst_AnimFiles,0x28
.set  Arch_InsigniaIDs,0x2C
.set  Arch_GmRst_Scale,0x30
.set  Arch_GmRst_VictoryTheme,0x34
.set  Arch_FtDemo_SymbolNames,0x38
.set  Arch_Char_DefineIDs,0x3C
.set  Arch_SFX_NameDef,0x40
.set  Arch_SSM_CharSSMFileIDs,0x44
.set  Arch_SSMFiles,0x48
.set  Arch_SSMRuntimeStruct,0x4C
.set  Arch_Fighter_OnLoad,0x50
.set  Arch_Fighter_OnDeath,0x54
.set  Arch_Fighter_OnUnk,0x58
.set  Arch_Fighter_MoveLogic,0x5C
.set  Arch_Fighter_SpecialN,0x60
.set  Arch_Fighter_SpecialAirN,0x64
.set  Arch_Fighter_SpecialHi,0x68
.set  Arch_Fighter_SpecialAirHi,0x6C
.set  Arch_Fighter_SpecialLw,0x70
.set  Arch_Fighter_SpecialAirLw,0x74
.set  Arch_Fighter_SpecialS,0x78
.set  Arch_Fighter_SpecialAirS,0x7C
.set  Arch_SSBMBanks,0x80
.set  Arch_Char_CostumeRuntimePointers,0x84
.set  Arch_AudioGroups,0x88

#Offsets
.set  OFST_MnSlChrIconData,0x0
.set  OFST_MnSlChrNames,0x4
.set  OFST_MnSlChrDefineIDs,0x8
.set  OFST_MnSlChrCostumeFileSymbols,0xC
.set  OFST_MnSlChrCharFileNames,0x10
.set  OFST_MnSlChrAnimFileNames,0x14
.set  OFST_MnSlChrEffectFileIDs,0x18
.set  OFST_MnSlChrEffectFilesSymbols,0x1C
.set  OFST_MnSlChrSSMFileIDs,0x20
.set  OFST_MnSlChrSSMFileNames,0x24
.set  OFST_MnSlChrAnimCount,0x28
.set  OFST_FighterMoveLogic,0x2C
.set  OFST_FighterOnLoad,0x30
.set  OFST_FighterOnDeath,0x34
.set  OFST_FighterDownSpecialLw,0x38
.set  OFST_FighterSideSpecialLw,0x3C
.set  OFST_FighterNeutralSpecialLw,0x40
.set  OFST_FighterUpSpecialLw,0x44
.set  OFST_FighterDownSpecialHi,0x48
.set  OFST_FighterSideSpecialHi,0x4C
.set  OFST_FighterNeutralSpecialHi,0x50
.set  OFST_FighterUpSpecialHi,0x54
.set  OFST_MnSlChrCostumeIDs,0x58
.set  OFST_Char_CostumeRuntimePointers,0x5C
.set  OFST_SSMStruct,0x60
.set  OFST_SSMIDDef,0x64
.set  OFST_SSMBankSizes,0x68
.set  OFST_GmRstAnimFileNames,0x6C
.set  OFST_GmRstInsigniaIDs,0x70
.set  OFST_GmRstScale,0x74
.set  OFST_FtDemoSymbols,0x78
.set  OFST_SFXNameDef,0x7C
.set  OFST_GmRstVictoryTheme,0x80
.set  OFST_EffectCreate,0x84
.set  OFST_ItemFunctions,0x88
.set  OFST_ItemIndex,0x8C
.set  OFST_AudioGroups,0x90
.set  OFST_Metadata_InternalIDCount,0x94
.set  OFST_Metadata_ExternalIDCount,0x98
.set  OFST_Metadata_CSSIconCount,0x9C
.set  OFST_Metadata_SSMCount,0xA0
.set  OFST_Metadata_EffectCount,0xA4
.set  OFST_Metadata,0xA8
  .set  Metadata_InternalIDCount,0x0
  .set  Metadata_ExternalIDCount,0x4
  .set  Metadata_CSSIconCount,0x8
  .set  Metadata_SSMCount,0xC
  .set  Metadata_EffectCount,0x10

#SSM Struct Offsets
#Header
.set  SSM_Header_OFST,0x0
  .set  SSM_Header_Length,45*4
#Disposable Orig
.set  SSM_DisposableOrig_OFST, SSM_Header_OFST + SSM_Header_Length
  .set  SSM_DisposableOrig_Length, (56 + NumOfAddedChars) * 4
#Disposable Copy
.set  SSM_DisposableCopy_OFST, SSM_DisposableOrig_OFST + SSM_DisposableOrig_Length
  .set  SSM_DisposableCopy_Length, (56 + NumOfAddedChars) * 4
#Persist Orig
.set  SSM_PersistentOrig_OFST, SSM_DisposableCopy_OFST + SSM_DisposableCopy_Length
  .set  SSM_PersistentOrig_Length, (56 + NumOfAddedChars) * 4
#Persist Copy
.set  SSM_PersistentCopy_OFST, SSM_PersistentOrig_OFST + SSM_PersistentOrig_Length
  .set  SSM_PersistentCopy_Length, (56 + NumOfAddedChars) * 4
#Unk
.set  SSM_Footer_OFST, SSM_PersistentCopy_OFST + SSM_PersistentCopy_Length
  .set  SSM_Footer_Length, (56 + NumOfAddedChars) * 4
