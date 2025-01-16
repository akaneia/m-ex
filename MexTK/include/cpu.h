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

static PlCoCpuTable **plco_cpu_table = (void*)0x804d64fc;  // TODO: should this go in the link file?

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
#endif
