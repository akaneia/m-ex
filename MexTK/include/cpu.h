#ifndef MEX_CPU
#define MEX_CPU

#define CPU_PRESS_A(fd)                     CPU_AddCmd1(fd, 0x01)
#define CPU_RELEASE_A(fd)                   CPU_AddCmd1(fd, 0x02)
#define CPU_PRESS_B(fd)                     CPU_AddCmd1(fd, 0x03)
#define CPU_RELEASE_B(fd)                   CPU_AddCmd1(fd, 0x04)
#define CPU_PRESS_X(fd)                     CPU_AddCmd1(fd, 0x05)
#define CPU_RELEASE_X(fd)                   CPU_AddCmd1(fd, 0x06)
#define CPU_PRESS_Y(fd)                     CPU_AddCmd1(fd, 0x07)
#define CPU_RELEASE_Y(fd)                   CPU_AddCmd1(fd, 0x08)
#define CPU_PRESS_R(fd)                     CPU_AddCmd1(fd, 0x09)
#define CPU_RELEASE_R(fd)                   CPU_AddCmd1(fd, 0x0A)
#define CPU_PRESS_L(fd)                     CPU_AddCmd1(fd, 0x0B)
#define CPU_RELEASE_L(fd)                   CPU_AddCmd1(fd, 0x0C)
#define CPU_PRESS_Z(fd)                     CPU_AddCmd1(fd, 0x0D)
#define CPU_RELEASE_Z(fd)                   CPU_AddCmd1(fd, 0x0E)
#define CPU_PRESS_UP(fd)                    CPU_AddCmd1(fd, 0x0F)
#define CPU_RELEASE_UP(fd)                  CPU_AddCmd1(fd, 0x10)
#define CPU_PRESS_DOWN(fd)                  CPU_AddCmd1(fd, 0x11)
#define CPU_RELEASE_DOWN(fd)                CPU_AddCmd1(fd, 0x12)
#define CPU_PRESS_RIGHT(fd)                 CPU_AddCmd1(fd, 0x13)
#define CPU_RELEASE_RIGHT(fd)               CPU_AddCmd1(fd, 0x14)
#define CPU_PRESS_LEFT(fd)                  CPU_AddCmd1(fd, 0x15)
#define CPU_RELEASE_LEFT(fd)                CPU_AddCmd1(fd, 0x16)
#define CPU_PRESS_START(fd)                 CPU_AddCmd1(fd, 0x17)
#define CPU_RELEASE_START(fd)               CPU_AddCmd1(fd, 0x18)
#define CPU_RELEASE_ALL(fd)                 CPU_AddCmd1(fd, 0x19)

#define CPU_END(fd)                                 CPU_AddCmd1(fd, 0x7F)

#define CPU_SET_LSTICK_X(fd, value)                 CPU_AddCmd2(fd, 0x80, value)
#define CPU_SET_LSTICK_Y(fd, value)                 CPU_AddCmd2(fd, 0x81, value)
#define CPU_SET_CSTICK_X(fd, value)                 CPU_AddCmd2(fd, 0x82, value)
#define CPU_SET_CSTICK_Y(fd, value)                 CPU_AddCmd2(fd, 0x83, value)
#define CPU_SET_RTRIGGER(fd, value)                 CPU_AddCmd2(fd, 0x84, value)
#define CPU_SET_LTRIGGER(fd, value)                 CPU_AddCmd2(fd, 0x85, value)
#define CPU_HOLD_A(fd, num_of_frames)               CPU_AddCmd2(fd, 0x86, num_of_frames)
#define CPU_RELEASE_A_WAIT(fd, num_of_frames)            CPU_AddCmd2(fd, 0x87, num_of_frames)
#define CPU_HOLD_B(fd, num_of_frames)               CPU_AddCmd2(fd, 0x88, num_of_frames)
#define CPU_RELEASE_B_WAIT(fd, num_of_frames)            CPU_AddCmd2(fd, 0x89, num_of_frames)
#define CPU_HOLD_X(fd, num_of_frames)               CPU_AddCmd2(fd, 0x8A, num_of_frames)
#define CPU_RELEASE_X_WAIT(fd, num_of_frames)            CPU_AddCmd2(fd, 0x8B, num_of_frames)
#define CPU_HOLD_Y(fd, num_of_frames)               CPU_AddCmd2(fd, 0x8C, num_of_frames)
#define CPU_RELEASE_Y_WAIT(fd, num_of_frames)            CPU_AddCmd2(fd, 0x8D, num_of_frames)
#define CPU_WAIT(fd, num_of_frames)                 CPU_AddCmd2(fd, 0x8E, num_of_frames)
#define CPU_SET_LSTICK_ANGLE_TARGET(fd, value)      CPU_AddCmd2(fd, 0x8F, value)
#define CPU_SET_LSTICK_X_TARGET(fd, value)          CPU_AddCmd2(fd, 0x90, value)
#define CPU_SET_LSTICK_X_FACING(fd, value)          CPU_AddCmd2(fd, 0x91, value)
#define CPU_WAIT_IN_STATE(fd, state_id)             CPU_AddCmd2(fd, 0x92, state_id)
#define CPU_SET_SCENARIO(fd, scenario_id)           CPU_AddCmd2(fd, 0x93, scenario_id)
#define CPU_SET_LSTICK_ANGLE_FIGHTER(fd, value)     CPU_AddCmd2(fd, 0x94, value)
#define CPU_SET_LSTICK_X_FIGHTER(fd, value)         CPU_AddCmd2(fd, 0x95, value)

#define CPU_ADD_LSTICK_ANGLE_TARGET(fd, add, max)   CPU_AddCmd3(fd, 0xC0, add, max)
#define CPU_ADD_LSTICK_X_TARGET(fd, add, max)       CPU_AddCmd3(fd, 0xC1, add, max)
#define CPU_ADD_LSTICK_X_FACING(fd, add, max)       CPU_AddCmd3(fd, 0xC2, add, max)

#define CPU_EXECUTE(fd)                             CPU_EndCmd(fd)

/// NOTE: the id chosen doesn't really matter
#define SPOOF_ID FTKIND_SANDBAG

typedef struct CpuAttack
{
    int plco_script_id; // input script to execute, there are 61 of these in plco
    int distance_scale; // used for predicting if target will enter range? Tends to match x1, but for some reason is an int
    float x1;           // start x offset from fighter position
    float x2;           // end x offset from fighter position
    float y1;           // start y offset from fighter position
    float y2;           // end y offset from fighter position
    float chance;       // chance this attack will be selected
    int frame_interval; // the interval, in frames, at which this attack can occur
    int min_cpu_level;  // minimum cpu Level for this attack to occur
} CpuAttack;

typedef struct PlCoCpuTable
{
    u8 ** scripts;
    CpuAttack **general;
    CpuAttack **airborne;
    CpuAttack **projectile;
    CpuAttack **grab;
    CpuAttack **item;
    CpuAttack **batteringitem;
    CpuAttack **offstage;
    float *attack_radius;
    float *item_radius;
} PlCoCpuTable;

typedef struct MexCpuData
{
    void (*Think)(FighterData *);   // custom cpu think callback, this is called before the default senario think, so you can do things like check state and cpu scenario to determine inputs
    float attack_radius;            // a general distance from self to target fighter used in decision making
    CpuAttack *general;             // used when fighter is grounded with no special conditions
    CpuAttack *airborne;            // used when fighter is airborne with no special conditions
    CpuAttack *projectile;          // used when there is distance between target fighter and self
    CpuAttack *grab;                // used when target fighter is shielding
    CpuAttack *item;                // used when fighter has a (throwable?) item
    CpuAttack *batteringitem;       // used when fighter has a battering item  0x18 (ITEM_FAN), 0x17 (ITEM_LIPSSTICK), 0x16 (ITEM_STARROD), 0xC (ITEM_BEAMSWORD), 0xB (ITEM_HOMERUNBAT), 0xD (ITEM_PARASOL)
    CpuAttack *offstage;            // used when target fighter is off stage
} MexCpuData;

static PlCoCpuTable **plco_cpu_table = 0x804d64fc;  // TODO: should this go in the link file?
void *Fighter_CPUProc = 0x8006aba0;                 // TODO: should this go in the link file?

/// @brief Resets the current cpu input buffer but resetting the cpu->pointer to cpu->buffer
void CPU_ResetCmd(FighterData *);

/// @brief (DO NOT CALL DIRECTLY; USE "CPU_" MACROS) Adds single command to cpu buffer
void CPU_AddCmd1(FighterData *, u8 cmd);

/// @brief (DO NOT CALL DIRECTLY; USE "CPU_" MACROS) Adds double command to cpu buffer
void CPU_AddCmd2(FighterData *, u8 cmd, s8 value);

/// @brief (DO NOT CALL DIRECTLY; USE "CPU_" MACROS) Adds triple command to cpu buffer
void CPU_AddCmd3(FighterData *, u8 cmd, s8 value1, s8 value2);

/// @brief (DO NOT CALL DIRECTLY; USE "CPU_EXECUTE") Sets the current create buffer to start executing
void CPU_EndCmd(FighterData *);

/// @brief Updates cpu information regarding collision
void CPU_UpdateCollisionData(FighterData *);

/// @brief Process AI Type and decides CPU scenario for the frame
void CPU_ProcessAIType(FighterData *);

/// @brief Process Scenario for this frame
void CPU_ProcessScenario(FighterData *);

/// @brief Process input command buffer for this frame
void CPU_ProcessCommandBuffer(FighterData *);

/// @brief returns plco script index if attack is chosen and 0 otherwise
int CPU_TryChooseAttackScript(FighterData *cpu, FighterData *target, CpuAttack *attacks);

/// Each fighter module can only have 1 mexcpu_data
static int mexcpu_spoof;
static MexCpuData* mexcpu_data;

/// @brief (DO NOT USE) Mimics the regular CPU proc, but with added custom logic hook (Note: nana specific data is also removed)
/// @param fighter 
void MexCPU_Process(GOBJ *fighter)
{
	FighterData *fd = fighter->userdata;
    CPU_UpdateCollisionData(fd);
    CPU_ProcessAIType(fd);
    if (mexcpu_data != 0 && 
        mexcpu_data->Think != 0)
    {
        if (fd->cpu.csP == 0 &&
            fd->cpu.cmd_wait == 0)
            {

                CPU_ResetCmd(fd);

                mexcpu_data->Think(fd);
            }

    }
    CPU_ProcessScenario(fd);
    CPU_ProcessCommandBuffer(fd);
    fd->cpu.cpu_frame = fd->cpu.cpu_frame + 1;
    return;
}
/// @brief (DO NOT USE) Mimics the regular CPU proc but with custom data
/// @param gobj 
void MexCPU_ProcCustom(GOBJ *fighter)
{
	FighterData *fd = fighter->userdata;
    int spoof_id = SPOOF_ID;

    // new cpu logic
    if (fd->flags.sleep == 0 &&
        Fighter_CheckToProcessCPU(fd) != 0)
    {
        PlCoCpuTable *tbl = *plco_cpu_table;

        // backup cpu data
        int temp_kind = fd->kind;
        MexCpuData backup = 
        {
            .attack_radius = tbl->attack_radius[spoof_id],
            .general = tbl->general[spoof_id],
            .airborne = tbl->airborne[spoof_id],
            .projectile = tbl->projectile[spoof_id],
            .grab = tbl->grab[spoof_id],
            .item = tbl->item[spoof_id],
            .batteringitem = tbl->batteringitem[spoof_id],
            .offstage = tbl->offstage[spoof_id],
        };

        // spoof cpu data
        fd->kind = spoof_id;
        tbl->attack_radius[spoof_id] = mexcpu_data->attack_radius;
        tbl->general[spoof_id] = mexcpu_data->general;
        tbl->airborne[spoof_id] = mexcpu_data->airborne;
        tbl->projectile[spoof_id] = mexcpu_data->projectile;
        tbl->grab[spoof_id] = mexcpu_data->grab;
        tbl->item[spoof_id] = mexcpu_data->item;
        tbl->batteringitem[spoof_id] = mexcpu_data->batteringitem;
        tbl->offstage[spoof_id] = mexcpu_data->offstage;
        
        // apply cpu logic
        MexCPU_Process(fighter);

        // restore cpu data
        fd->kind = temp_kind;
        tbl->attack_radius[spoof_id] = backup.attack_radius;
        tbl->general[spoof_id] = backup.general;
        tbl->airborne[spoof_id] = backup.airborne;
        tbl->projectile[spoof_id] = backup.projectile;
        tbl->grab[spoof_id] = backup.grab;
        tbl->item[spoof_id] = backup.item;
        tbl->batteringitem[spoof_id] = backup.batteringitem;
        tbl->offstage[spoof_id] = backup.offstage;
    }
}
/// @brief (DO NOT USE) Mimics the regular CPU proc but with spoofed fighter kind
/// @param gobj 
void MexCPU_ProcSpoof(GOBJ *fighter)
{
	FighterData *fd = fighter->userdata;

    // new cpu logic
    if (fd->flags.sleep == 0 &&
        Fighter_CheckToProcessCPU(fd) != 0)
    {
        // backup cpu data
        int temp_kind = fd->kind;
        fd->kind = mexcpu_spoof;

        // apply cpu logic
        MexCPU_Process(fighter);

        // restore cpu data
        fd->kind = temp_kind;
    }
}
/// @brief (DO NOT USE) This GOBJ proc will remove the default cpu proc and replace it with a custom one
/// @param gobj 
void MexCPU_InitProc(GOBJ *gobj)
{
    // search for and remove old CPU proc
    GOBJProc *proc = gobj->proc;
    while (proc != 0)
    {
        if (proc->cb == Fighter_CPUProc)
        {
            // OSReport("Mex CPU Initialized\n");
            // delete old proc
            GOBJ_DeleteProc(proc);

            // replace with new custom proc
            if (mexcpu_data != 0)
            {
                GObj_AddProc(gobj, MexCPU_ProcCustom, 2);
            }
            else
            {
                GObj_AddProc(gobj, MexCPU_ProcSpoof, 2);
            }
            break;
        }
        proc = proc->child;
    }
}
/// @brief Call during Fighter's OnLoad; initializes Mex Fighter with custom ai data, 
/// @param fighter 
/// @param CPU 
void MexCPU_InitCustomData(GOBJ *fighter, MexCpuData *data)
{
    mexcpu_data = data;
	GObj_AddProc(fighter, MexCPU_InitProc, 2);
}
/// @brief Init custom Mex Fighter CPU to spoof a base game fighter logic
/// @param fighter 
/// @param spoof_id 
void MexCPU_InitSpoofData(GOBJ *fighter, FighterKind spoof_id)
{
    if (mexcpu_data != 0)
        return;

    mexcpu_spoof = spoof_id;
	GObj_AddProc(fighter, MexCPU_InitProc, 2);
}
#endif