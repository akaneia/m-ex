#include "mex.h"

static void *Fighter_CPUProc = (void*)0x8006aba0; // TODO: should this go in the link file?

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
