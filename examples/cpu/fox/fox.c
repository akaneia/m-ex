///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///
/// Custom Fox AI Example 
///
/// This example describes how to use Mex Custom CPU logic
///
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#include "../../../MexTK/mex.h"
void Fox_CPUThink(FighterData *fd);

/// --------------------------Setup--------------------------------
/// MexCPU is setup in the Fighter's OnLoad function
/// You have two options:
/// - Spoof Vanilla Melee fighter
/// - Define your own logic and params
///
/// This example will be implementing simple custom CPU data
/// A spoof example in inlcuded below as well (see SPOOFING)
///
/// NOTE:
/// If you do neither, the fighter ai will be unstable and
/// may crash if you are using a m-ex fighter
/// ---------------------------------------------------------------

/// We will define our attack data here
/// each of these 7 CpuAttack arrays define which moves the fighter can use under their respective condition

/// NOTE: For more in depth descriptions of each of these struct, see "MexCpuData"

static CpuAttack cpu_general[] = 
{
    /// check CpuAttack definition for more details
    // I will breifly describe them here as well
    {
        // this index refers a preset of inputs defined in PlCo.dat
        // 38 is simply the input for down special, for more details, check the PlCo cpu script document
        .plco_script_id = 38,

        // about how far away the target figher can be from the defined range
        .distance_scale = 1,

        // the attack range to check when target fighter gets near this area
        .x1 = -5.0,
        .x2 = 5.0,
        .y1 = 0.0,
        .y2 = 10.0,
        
        // affects the weighted chance this move will be selected
        // since this is the only attack, it will always be selected
        .chance = 1,
        
        // a fighter will only be able to use this move every X frames
        // in this case the fighter will be able to use it every other frame
        .frame_interval = 1,

        // minimal cpu level the fighter needs to be in order to use this attack
        // in this case the fighter will be able to use it at cpu level 1
        .min_cpu_level = 0,
    },
    /// NOTE: this array gets terminated with a blank entry
    /// IMPORTANT: make sure to always include one at the end
    {} 
};
static CpuAttack cpu_airborne[] = 
{
    {} // empty for purpose of example
};
static CpuAttack cpu_projectile[] = 
{
    {} // empty for purpose of example
};
static CpuAttack cpu_grab[] = 
{
    {} // empty for purpose of example
};
static CpuAttack cpu_item[] = 
{
    {} // empty for purpose of example
};
static CpuAttack cpu_battering[] = 
{
    {} // empty for purpose of example
};
static CpuAttack cpu_offstage[] = 
{
    {} // empty for purpose of example
};
/// @brief This is the struct that will contain all of custom cpu data
static MexCpuData cpu_data = 
{
    // this is fox's default attack radius and is fairly standard
    .attack_radius = 18.0, 

    // these are the custom attack data structs we defined above
    .general = &cpu_general,
    .airborne = &cpu_airborne,
    .projectile = &cpu_projectile,
    .grab = &cpu_grab,
    .item = &cpu_item,
    .batteringitem = &cpu_battering,
    .offstage = &cpu_offstage,
    
    // this is a custom cpu logic callback
    // see Fox_CPUThink for more details
    .Think = Fox_CPUThink,
};
/// @brief Override the Fighter's OnLoad function
/// @param gobj 
void OnLoad(GOBJ *fighter)
{
    // this will simply call Fox's original OnLoad
    // we are not making a custom fighter here, so no need for any changes
    void (*Fox_OnLoad)(GOBJ *fighter) = (void *)0x800e57ac;
    Fox_OnLoad(fighter);
    
    // Initialize our custom data by passing the 
    // address of the cpu_data struct we created above
    MexCPU_InitCustomData(fighter, &cpu_data);
    
    /// -----------------SPOOFING-----------------------
    // You can optionally choose to setup a spoofed id 
    // and just use a base fighter's AI instead

    // If you are making a clone of an existing fighter, this options is the easiest and most practical

    // Example: this fighter would have Mario's AI data
	// MexCPU_InitSpoofData(fighter, FTKIND_MARIO);
    /// ------------------------------------------------
    
    return;
}
/// @brief Custom CPU Think function
/// @param fd 
void Fox_CPUThink(FighterData *fd)
{
    // 361 - ground shine
    // 366 - air shine

    if (fd->state_id == ASID_WALKMIDDLE ||
        fd->state_id == ASID_LANDING)
    {
        // clear stick
        CPU_SET_LSTICK_X(fd, 0);
        CPU_SET_LSTICK_Y(fd, 0);

        // Jump
        CPU_HOLD_Y(fd, 1); // hold Y for 1 frame
        CPU_RELEASE_Y(fd); // release Y

        // Wait for jumpsquat to end
        CPU_WAIT(fd, 2);

        // Wave Dash
        CPU_SET_LSTICK_X_FIGHTER(fd, 80);   // angle left stick X towards fighter
        CPU_SET_LSTICK_Y(fd, -80);          // angle left stick Y towards ground
        CPU_PRESS_R(fd);                    // execute air dodge by pressing R
        CPU_WAIT(fd, 1);                    // wait 1 frame
        CPU_RELEASE_R(fd);                  // release R

        // commit and execute inputs
        CPU_EXECUTE(fd); 
    }

    // check if fox is in ground shine state
    if (fd->state_id == 361) 
    {
        // clear stick
        CPU_SET_LSTICK_X(fd, 0);
        CPU_SET_LSTICK_Y(fd, 0);

        // Jump
        CPU_HOLD_Y(fd, 1); // hold Y for 1 frame
        CPU_RELEASE_Y(fd); // release Y

        // Wait for jumpsquat to end
        CPU_WAIT(fd, 4);

        // Wave Dash
        CPU_SET_LSTICK_X_FIGHTER(fd, 80);   // angle left stick X towards fighter
        CPU_SET_LSTICK_Y(fd, -80);          // angle left stick Y towards ground
        CPU_PRESS_R(fd);                    // execute air dodge by pressing R
        CPU_WAIT(fd, 1);                    // wait 1 frame
        CPU_RELEASE_R(fd);                  // release R

        // commit and execute inputs
        CPU_EXECUTE(fd); 
    }
}