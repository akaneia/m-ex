#Constants
.set  NumOfAddedChars,1
.set  NumOfAddedItems,1

#Character Strings
NewChar1:
  .set  NewChar1_InternalID,27
  .set  NewChar1_SubcharInternalID,-1
  .set  NewChar1_SubcharType,0
  .set  NewChar1_CostumeCount, 5
  .set  NewChar1_AnimationCount, 318
  .set  NewChar1_InsigniaID, 6
  .set  NewChar1_VictorySong, 0x16
  .set  NewChar1_EffectFileID, 0x33
  .set  NewChar1_RedCostumeID,0
  .set  NewChar1_GreemCostumeID,3
  .set  NewChar1_BlueCostumeID,4
  .set  NewChar1_NrNameSFXID, 510054
  .macro  NewChar1_ShortName
    .ascii "Dy"
    .endm
  .macro  NewChar1_LongName
    .ascii "Peach"
    .endm
  .macro  NewChar1_FullName
    .string "Daisy"
    .endm
  .macro  NewChar1_SoundName
    .ascii "daisy"
    .endm
  .macro  NewChar1_Costume0
    .ascii "Nr"
    .endm
  .macro  NewChar1_Costume1
    .ascii "Ye"
    .endm
  .macro  NewChar1_Costume2
    .ascii "Wh"
    .endm
  .macro  NewChar1_Costume3
    .ascii "Bu"
    .endm
  .macro  NewChar1_Costume4
    .ascii "Gr"
    .endm

#Derived Constants
.set  SSM_MaxID,(54+1+NumOfAddedChars) * 10000

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
.set  OFST_FighterSpecialS,0x3C
.set  OFST_FighterSpecialN,0x40
.set  OFST_FighterSpecialHi,0x44
.set  OFST_FighterSpecialLwAir,0x48
.set  OFST_FighterSpecialSAir,0x4C
.set  OFST_FighterSpecialNAir,0x50
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

#SSM Struct Offsets
#Header
.set  SSM_Header_OFST,0x0
  .set  SSM_Header_Length,45*4
#Disposable Orig
.set  SSM_ToLoadOrig_OFST, SSM_Header_OFST + SSM_Header_Length
  .set  SSM_ToLoadOrig_Length, (55 + NumOfAddedChars) * 4
#Disposable Copy
.set  SSM_ToLoadCopy_OFST, SSM_ToLoadOrig_OFST + SSM_ToLoadOrig_Length
  .set  SSM_ToLoadCopy_Length, (55 + NumOfAddedChars) * 4
#Persist Orig
.set  SSM_IsLoadedOrig_OFST, SSM_ToLoadCopy_OFST + SSM_ToLoadCopy_Length
  .set  SSM_IsLoadedOrig_Length, (55 + NumOfAddedChars) * 4
#Persist Copy
.set  SSM_IsLoadedCopy_OFST, SSM_IsLoadedOrig_OFST + SSM_IsLoadedOrig_Length
  .set  SSM_IsLoadedCopy_Length, (55 + NumOfAddedChars) * 4
#Unk
.set  SSM_Footer_OFST, SSM_IsLoadedCopy_OFST + SSM_IsLoadedCopy_Length
  .set  SSM_Footer_Length, (56 + NumOfAddedChars) * 4
