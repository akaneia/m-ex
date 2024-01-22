#To be inserted @ 802599ec
.include "../../Globals.s"
.include "../Header.s"

.set  REG_RandomIcon,31
.set  REG_EligibleIcons,30
.set  REG_Index,29
.set  REG_IconData,28
.set  REG_IconCount,27

.set  Memcard_GetRules4,0x8015cc58

#Init
  backup
  lwz REG_IconData,OFST_Menu_SSS(rtoc)
  lwz REG_IconCount,OFST_Metadata_SSSIconCount(rtoc)
  subi REG_IconCount,REG_IconCount,1                    # except the random icon

# Load Eligible from rules
.set  REG_OldIcon,30
.set  REG_Value,31
.set  REG_Temp,26
  branchl r12,Memcard_GetRules4
  lwzx r3,0x18(r3)
  li REG_Index, 0

OriginalLoop:
#Get random id
  mulli REG_OldIcon,REG_Index,0x1C
  lis r4,0x803f
  ori r4,0x06d0
  addi REG_OldIcon,r4
  lbzx REG_Value,0x0A(REG_OldIcon)
#Check if random enabled
  li REG_Temp,1
  slw REG_Value,REG_Temp,REG_Value
  and REG_Value,r3,REG_Value
  beq OriginalContinueLoop
#Set random enabled for stage with external id
  lbzx REG_Value,0x0B(REG_OldIcon) # get external id
#Find stage with external id
  mr REG_Temp,0
SearchLoop:
#find external id
#set random enabled
  addi REG_Temp,REG_Temp,1
  cmpw  REG_Temp,REG_IconCount
  blt SearchLoop
  
OriginalContinueLoop:
  addi REG_Index,REG_Index,1
  cmpwi REG_Index,29
  blt OriginalLoop



    // grab random enabled from vanilla save data
    // Rules4 *rules = Memcard_GetRules4();
    // typedef struct MnSlMapIcon
    // {
    //     JOBJ *joint;
    //     int flags;
    //     u8 state;
    //     u8 preview_id;
    //     u8 random_id;
    //     u8 external_id;
    //     Vec2 cursor_size;
    //     Vec2 outline_size;
    // } MnSlMapIcon;
    // static MnSlMapIcon *icons = 0x803f06d0;
    // for (int i = 0; i < 29; i++)
    // {
    //     MnSlMapIcon *icon = &icons[i];

    //     if (rules->stage_switch & (1 << icon->random_id))
    //     {
    //         AkaneiaStageData *data = Save_GetStageData(icon->external_id);

    //         if (data != 0)
    //         {
    //             data->random_enabled = 1;
    //         }
    //     }
    // }


#Alloc space for n icons
  mr  r3,REG_IconCount
  branchl r12,HSD_MemAlloc
  mr  REG_EligibleIcons,r3
  li  REG_Index,0

#Loop through all stages, find ones that are eligible
.set  REG_Count,20
StageSearch_Init:
  li  REG_Count,0
StageSearch_Loop:
  mulli r3,REG_Count,SSS_Stride
  add r4,r3,REG_IconData
  lbz     r3,0x4(r4)      #Check if was selected this session
  rlwinm. r0,r3,0,0x80         
  bne StageSearch_IncLoop
/*
  lbz r3,0xA(r4)          #Check if is enabled in random stage select
  branchl r12,0x80164330
  cmpwi r3,0
  beq StageSearch_IncLoop
*/
  lbz     r3,0x4(r4)      #Check if is enabled in random stage select
  rlwinm. r0,r3,0,0x40       
  beq StageSearch_IncLoop
# exclude fod during doubles
  lbz r3,0xb(r4)
  branchl r0,0x8022519c
  cmpwi r3, 12
  bne StageSearch_Eligible
# check if doubles
  lwz r3,-0x4a10(r13)
  lbz r3,0x18(r3)
  rlwinm. r0,r3,0,0x01
  bne StageSearch_IncLoop
StageSearch_Eligible:
#Is eligible
  stbx  REG_Count,REG_Index,REG_EligibleIcons
  addi  REG_Index,REG_Index,1
StageSearch_IncLoop:
  addi  REG_Count,REG_Count,1
  cmpw  REG_Count,REG_IconCount
  blt StageSearch_Loop
#Check if no eligible stages
  cmpwi REG_Index,0
  bne StageRoll

#Reset all stages selected status
  mr  r5,REG_IconCount
  b StageReset_IncLoop
StageReset_Loop:
  mulli r4,r5,SSS_Stride
  add r4,r4,REG_IconData
  lbz     r0,0x4(r4)
  li      r3,0
  rlwimi  r0,r3,0,0x80
  stb     r0,0x4(r4)
StageReset_IncLoop:
  subi  r5,r5,1
  cmpwi r5,0
  bge StageReset_Loop
  #b StageSearch_Init Not sure what this was for, results in infinite loop

CheckValid:
#Check number of valid stages
  cmpwi REG_Index,0
  bne StageRoll
#no valid stages found
  li REG_RandomIcon,0 # not sure how to handle this
  b SetSelectStatus

StageRoll:
#Get stage icon ID
  mr  r3,REG_Index
  branchl r12,HSD_Randi
  lbzx  REG_RandomIcon,r3,REG_EligibleIcons

SetSelectStatus:
#Set selected status
  mulli r4,REG_RandomIcon,SSS_Stride
  add r4,r4,REG_IconData
  lbz     r0,0x4(r4)
  ori     r0,r0,0x80
  stb     r0,0x4(r4)

FreeMem:
  mr  r3,REG_EligibleIcons
  branchl r12,HSD_Free

Exit:
  mr  r3,REG_RandomIcon
  restore
  blr
