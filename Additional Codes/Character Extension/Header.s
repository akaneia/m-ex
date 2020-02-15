#Constants
.set  NumOfAddedChars,1
.set  NumOfAddedItems,1

#Character Strings
NewChar1:
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
.set  OFST_MnSlChrData,0x0
.set  OFST_MnSlChrNames,0x4
.set  OFST_MnSlChrDefineIDs,0x8
.set  OFST_MnSlChrCostumeFiles,0xC
.set  OFST_MnSlChrCharFiles,0x10
.set  OFST_MnSlChrAnimFiles,0x14
.set  OFST_MnSlChrEffectFileIDs,0x18
.set  OFST_MnSlChrEffectFiles,0x1C
.set  OFST_MnSlChrSSMFileIDs,0x20
.set  OFST_MnSlChrSSMFiles,0x24
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
.set  OFST_MnSlChrCostumeCounts,0x58
.set  OFST_FighterCostumePointers,0x5C
.set  OFST_SSMStruct,0x60
.set  OFST_SSMIDDef,0x64
.set  OFST_SSMBankSizes,0x68
.set  OFST_FtDemoAnimFiles,0x6C
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
.set  SSM_DisposableOrig_OFST, SSM_Header_OFST + SSM_Header_Length
  .set  SSM_DisposableOrig_Length, (55 + NumOfAddedChars) * 4
#Disposable Copy
.set  SSM_DisposableCopy_OFST, SSM_DisposableOrig_OFST + SSM_DisposableOrig_Length
  .set  SSM_DisposableCopy_Length, (55 + NumOfAddedChars) * 4
#Persist Orig
.set  SSM_PersistentOrig_OFST, SSM_DisposableCopy_OFST + SSM_DisposableCopy_Length
  .set  SSM_PersistentOrig_Length, (55 + NumOfAddedChars) * 4
#Persist Copy
.set  SSM_PersistentCopy_OFST, SSM_PersistentOrig_OFST + SSM_PersistentOrig_Length
  .set  SSM_PersistentCopy_Length, (55 + NumOfAddedChars) * 4
#Unk
.set  SSM_Footer_OFST, SSM_PersistentCopy_OFST + SSM_PersistentCopy_Length
  .set  SSM_Footer_Length, (56 + NumOfAddedChars) * 4
