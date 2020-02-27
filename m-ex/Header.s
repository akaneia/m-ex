#Constants
.set  NumOfAddedChars,1
.set  NumOfAddedSSMs,0

.set  NumOfAddedEffects,0
.set  NumOfAddedItems,0

#Derived Constants
.set  SSM_MaxID,(54+1+NumOfAddedChars) * 10000

#Archive Offsets
.set  Arch_Metadata,0x0
  .set  Arch_Metadata_VersionMajor,0x0
  .set  Arch_Metadata_VersionMinor,0x2
  .set  Arch_Metadata_InternalIDCount,0x4
  .set  Arch_Metadata_ExternalIDCount,0x8
  .set  Arch_Metadata_CSSIconCount,0xC
  .set  Arch_Metadata_SSMCount,0x10
  .set  Arch_Metadata_BGMCount,0x14
  .set  Arch_Metadata_EffectCount,0x18
.set  Arch_MnSlChr,0x4
.set  Arch_Fighter,0x8
  .set  Arch_Fighter_NameText,0x0
  .set  Arch_Fighter_CharFiles,0x4
  .set  Arch_Fighter_InsigniaIDs,0x8
  .set  Arch_Fighter_DefineIDs,0xC
  .set  Arch_Fighter_CostumeIDs,0x10
  .set  Arch_Fighter_CostumeFileSymbols,0x14
  .set  Arch_Fighter_FtDemo_SymbolNames,0x18
  .set  Arch_Fighter_AnimFiles,0x1C
  .set  Arch_Fighter_AnimCounts,0x20
  .set  Arch_Fighter_EffectFileIDs,0x24
  .set  Arch_Fighter_GmRst_AnimFiles,0x28
  .set  Arch_Fighter_GmRst_Scale,0x2C
  .set  Arch_Fighter_GmRst_VictoryTheme,0x30
  .set  Arch_Fighter_AnnouncerCall,0x34
  .set  Arch_Fighter_SSMFileIDs,0x38
  .set  Arch_Fighter_RuntimeCostumePointers,0x3C
  .set  Arch_Fighter_ftDataPointers,0x40
    .set  ftDataPointers_Stride,8
.set  Arch_FighterFunc,0xC
  .set  Arch_FighterFunc_onLoad,0x0
  .set  Arch_FighterFunc_onDeath,0x4
  .set  Arch_FighterFunc_onUnknown,0x8
  .set  Arch_FighterFunc_MoveLogic,0xC
  .set  Arch_FighterFunc_SpecialN,0x10
  .set  Arch_FighterFunc_SpecialNAir,0x14
  .set  Arch_FighterFunc_SpecialS,0x18
  .set  Arch_FighterFunc_SpecialSAir,0x1C
  .set  Arch_FighterFunc_SpecialHi,0x20
  .set  Arch_FighterFunc_SpecialHiAir,0x24
  .set  Arch_FighterFunc_SpecialLw,0x28
  .set  Arch_FighterFunc_SpecialLwAir,0x2C
  .set  Arch_FighterFunc_onAbsorb,0x30
  .set  Arch_FighterFunc_onItemPickup,0x34
  .set  Arch_FighterFunc_onMakeItemInvisible,0x38
  .set  Arch_FighterFunc_onMakeItemVisible,0x3C
  .set  Arch_FighterFunc_onItemDrop,0x40
  .set  Arch_FighterFunc_onItemCatch,0x44
  .set  Arch_FighterFunc_onUnknownItemRelated,0x48
  .set  Arch_FighterFunc_onUnknownCharacterModelFlags1,0x4C
  .set  Arch_FighterFunc_onUnknownCharacterModelFlags2,0x50
  .set  Arch_FighterFunc_onHit,0x54
  .set  Arch_FighterFunc_onUnknownEyeTextureRelated,0x58
  .set  Arch_FighterFunc_onFrame,0x5C
  .set  Arch_FighterFunc_onActionStateChange,0x60
  .set  Arch_FighterFunc_onRespawn,0x64
  .set  Arch_FighterFunc_onModelRender,0x68
  .set  Arch_FighterFunc_onShadowRender,0x6C
  .set  Arch_FighterFunc_onUnknownMultijump,0x70
  .set  Arch_FighterFunc_onActionStateChangeWhileEyeTextureIsChanged,0x74
  .set  Arch_FighterFunc_onTwoEntryTable,0x78
.set  Arch_FGM,0x10
  .set  Arch_FGM_Files,0x0
  .set  Arch_FGM_Flags,0x4
  .set  Arch_FGM_LookupTable,0x8
  .set  Arch_FGM_RuntimeStruct,0xC
    .set  Arch_SSMRuntimeStruct_Header,0x0
    .set  Arch_SSMRuntimeStruct_DisposableOrig,0x4
    .set  Arch_SSMRuntimeStruct_DisposableCopy,0x8
    .set  Arch_SSMRuntimeStruct_PersistentOrig,0xC
    .set  Arch_SSMRuntimeStruct_PersistentCopy,0x10
    .set  Arch_SSMRuntimeStruct_Footer,0x14
.set  Arch_BGM,0x14
  .set  Arch_BGM_Files,0x0
  .set  Arch_BGM_MenuPlaylist,0x4
  .set  Arch_BGM_MenuPlaylistNum,0x8
.set  Arch_Effect,0x18
.set  Arch_Kirby,0x1C
  .set  Arch_Kirby_AbilityFileNames,0x0
  .set  Arch_Kirby_AbilityRuntimeStruct,0x4
  .set  Arch_Kirby_AbilityCostumeFileNames,0x8
  .set  Arch_Kirby_AbilityCostumeRuntimeStruct,0xC
  .set  Arch_Kirby_EffectIDs,0x10
  .set  Arch_Kirby_OnAbilityFunc,0x14
  .set  Arch_Kirby_SpecialN,0x18
  .set  Arch_Kirby_SpecialNAir,0x1C
  .set  Arch_Kirby_OnAbilityHit,0x20
  .set  Arch_Kirby_InitItem,0x24

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
.set  OFST_FighterSpecialLw,0x38
.set  OFST_FighterSpecialLwAir,0x3C
.set  OFST_FighterSpecialS,0x40
.set  OFST_FighterSpecialSAir,0x44
.set  OFST_FighterSpecialN,0x48
.set  OFST_FighterSpecialNAir,0x4C
.set  OFST_FighterSpecialHi,0x50
.set  OFST_FighterSpecialHiAir,0x54
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
.set  OFST_BGMFileNames,0x94
.set  OFST_ftDataPointers,0x98
.set  OFST_KirbyHatFileNames,0x9C
.set  OFST_KirbyHatCostumeFileNames,0xA0
.set  OFST_KirbyHatEffectFileIDs,0xA4
.set  OFST_KirbyAbilityCostumeRuntimeStruct,0xA8
.set  OFST_KirbyAbilityRuntimeStruct,0xAC
.set  OFST_KirbyOnAbilityFunc,0xB0
.set  OFST_KirbyOnAbilityTakeHit,0xB4
.set  OFST_KirbyInitItem,0xB8
.set  OFST_KirbySpecialN,0xBC
.set  OFST_KirbySpecialNAir,0xC0
.set  OFST_Metadata_InternalIDCount,OFST_KirbySpecialNAir+0x4
.set  OFST_Metadata_ExternalIDCount,OFST_Metadata_InternalIDCount+0x4
.set  OFST_Metadata_CSSIconCount,OFST_Metadata_ExternalIDCount+0x4
.set  OFST_Metadata_SSMCount,OFST_Metadata_CSSIconCount+0x4
.set  OFST_Metadata_BGMCount,OFST_Metadata_SSMCount+0x4
.set  OFST_Metadata_EffectCount,OFST_Metadata_BGMCount+0x4
.set  OFST_Metadata,OFST_Metadata_EffectCount+0x4
.set  OFST_mexData,OFST_Metadata+0x4

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
