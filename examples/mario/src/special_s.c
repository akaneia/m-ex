#include "mario.h"

///////////////////////
//  Inital SpecialS  //
///////////////////////

/// @brief Original: 0x800E1450
/// @param fighter 
void SpecialS(GOBJ *fighter)
{
	FighterData *fighter_data = fighter->userdata;
	SpecialSFtCmd *script_var = Fighter_GetScriptVars(fighter);
	SpecialSVar *state_var = Fighter_GetStateVars(fighter);

	// stop y velocity
	fighter_data->phys.self_vel.Y = 0;

	// switch to special s state and update subaction
	ActionStateChange(0, 1, 0, fighter, STATE_SPECIALS, 0, 0);
	Fighter_AdvanceScript(fighter);

	// clear flags that are going to be used by this action
	script_var->create_wind = 0;
	script_var->enable_reflect = 0;
	script_var->spawn_cape = 0;
	state_var->reflect_enabled = 0;

	// set the accessory callback for mario's cape
	// this function will spawn the cape item in mario's hand
	fighter_data->cb.Accessory4 = SpecialS_SpawnCapeThink;
	return;
}

/// @brief Original: 0x800E14C8
/// @param fighter 
void SpecialAirS(GOBJ *fighter)
{
	FighterData *fighter_data = fighter->userdata;
	MarioAttr *mrAttr = Fighter_GetSpecialAttributes(fighter);
	SpecialSFtCmd *script_var = Fighter_GetScriptVars(fighter);
	SpecialSVar *state_var = Fighter_GetStateVars(fighter);

	// slow down x velocity by rate defined in special attributes
	fighter_data->phys.self_vel.X = fighter_data->phys.self_vel.X / mrAttr->specialS_horizontal_momentum;

	// change to aerial special s state and update subaction
	ActionStateChange(0, 1, 0, fighter, STATE_SPECIALSAIR, 0, 0);
	Fighter_AdvanceScript(fighter);

	// clear flags that are going to be used by this action
	script_var->create_wind = 0;
	script_var->enable_reflect = 0;
	script_var->spawn_cape = 0;
	state_var->reflect_enabled = 0;

	// set the accessory callback for mario's cape
	// this function will spawn the cape item in mario's hand
	fighter_data->cb.Accessory4 = SpecialS_SpawnCapeThink;
	return;
}

//////////////////////
//       Misc       //
//////////////////////

/// @brief Original: 0x802b2560 Spawns the cape item with the given parameters
/// @param fighter fighter GOBJ
/// @param position position to spawn item at
/// @param bone_index bone index to attach item to
/// @param kind kind of item to spawn
/// @param facing_direction direction the fighter is facing
/// @return a GOBJ containing the newly created Item
GOBJ *SpecialS_SpawnCape(GOBJ *fighter, Vec3 *position, int bone_index, int kind, float facing_direction)
{
	// initialize spawn struct for cape
	SpawnItem spawnItem = 
	{
		.parent_gobj = fighter,
		.parent_gobj2 = fighter,
		.it_kind = kind,
		.pos = *position,
		.pos2 = *position,
		.vel = {0, 0, 0},
		.facing_direction = facing_direction,
		.damage = 0,
		.unk6 = 0,
		.is_raycast_below = 1,
	};

	// create cape item
	GOBJ *item = Item_CreateItem1(&spawnItem);

	// if item successfully spawned
	if (item != 0)
	{
		// have mario hold the item
		Item_Hold(item, fighter, bone_index);

		// copy develop mode stuff
		Item_CopyDevelopState(item, fighter);
	}

	return item;
}

/// @brief destroys the Cape item and removes reference to it in fighter
/// @param gobj 
void SpecialS_OnDamagedCB(GOBJ *fighter)
{
	FighterData *fd = (FighterData *)fighter->userdata;
	MarioCharVar *char_var = Fighter_GetFighterVars(fighter);

	// clear hitlag flag for cape
	if (char_var->item_cape)
	{
		// clear callbacks
		fd->cb.OnDeath_State = 0;
		fd->cb.OnTakeDamage = 0;

		// destroy cape
		Item_Destroy(char_var->item_cape);
	}
	return;
}

/// @brief disables cape items hitlag
/// @param fighter 
void SpecialS_ExitHitlagCB(GOBJ *fighter)
{
	MarioCharVar *char_var = Fighter_GetFighterVars(fighter);

	// clear hitlag flag for cape
	if (char_var->item_cape)
	{
		Item_ClearHitlagFlag(char_var->item_cape);
	}

	return;
}

/// @brief enables cape items hitlag
/// @param fighter 
void SpecialS_EnterHitlagCB(GOBJ *fighter)
{
	MarioCharVar *char_var = Fighter_GetFighterVars(fighter);

	// enable hitlag flag for cape
	if (char_var->item_cape)
	{
		Item_EnableHitlagFlag(char_var->item_cape);
	}
	return;
}

/// @brief checks for script flag to be set and spawns cape item
/// @param fighter 
void SpecialS_SpawnCapeThink(GOBJ *fighter)
{
	FighterData *fd = fighter->userdata;
	MarioCharVar *char_var = Fighter_GetFighterVars(fighter);
	MarioAttr *mrAttr = Fighter_GetSpecialAttributes(fighter);
	SpecialSFtCmd *script_var = Fighter_GetScriptVars(fighter);

	// this flag is used to track if the cape has been spawned already
	if (script_var->spawn_cape == 0)
	{
		script_var->spawn_cape = 1;

		// get the index of mario's right holding bone (RHaveN)
		int bone_index = Fighter_BoneLookup(fd, RHaveN);

		// get the position of this bone
		Vec3 pos;
		JOBJ_GetWorldPosition(fd->bones[bone_index].joint, 0, &pos);

		// create the cape item
		// cape kind was originally stored in mario's attributes
		int mex_cape_kind = MEX_GetFtItemID(fighter, MEX_ITEM_CAPE);
		GOBJ *cape = SpecialS_SpawnCape(fighter, &pos, bone_index, mex_cape_kind, fd->facing_direction);

		// store the cape pointer to a ft_var5 and the special help item location
		char_var->item_cape = cape;
		fd->item_held_spec = cape;

		// if the cape successully spawned, set the callbacks to remove it
		if (char_var->item_cape != 0)
		{
			fd->cb.OnDeath_State = SpecialS_OnDamagedCB;
			fd->cb.OnTakeDamage = SpecialS_OnDamagedCB;
		}

		// set hitlag callbacks
		fd->cb.EnterHitlag = SpecialS_EnterHitlagCB;
		fd->cb.ExitHitlag = SpecialS_ExitHitlagCB;

		// clear the accessory callback so this function will no longer be called
		fd->cb.Accessory4 = 0;
	}

	return;
}

/// @brief checks to enable item reflection and updates its position
/// @param fighter 
void Mario_ReflectionThink(GOBJ *fighter)
{
	FighterData *fd = fighter->userdata;
	MarioAttr *mrAttr = Fighter_GetSpecialAttributes(fighter);
	SpecialSVar *state_var = Fighter_GetStateVars(fighter);
	SpecialSFtCmd *script_var = Fighter_GetScriptVars(fighter);
	
	// create the reflect bubble when flags are set
	if (script_var->enable_reflect == 1 && state_var->reflect_enabled == 0)
	{
		state_var->reflect_enabled = 1;
		Fighter_CreateReflect(fighter, &mrAttr->reflect_data, 0);
	}
	else if (script_var->enable_reflect == 0 && state_var->reflect_enabled == 1)
	{
		state_var->reflect_enabled = 0;
		fd->flags.reflect_enable = 0;
	}

	// update the reflect so that it follows fighter
	Fighter_EnableReflectUpdate(fighter);
}

/// @brief creates a gust of wind from mario
/// @param fighter 
void Mario_CreateCapeWind(GOBJ *fighter)
{
	FighterData *fd = fighter->userdata;

	// i'm not sure why the Hip bone, but that's what it uses
	int bone_index = Fighter_BoneLookup(fd, HipN);

	// get this bones position
	Vec3 bone_position;
	JOBJ_GetWorldPosition(fd->bones[bone_index].joint, 0, &bone_position);

	// move the position forward a little
	bone_position.X += 3 * fd->facing_direction;

	// create wind at this position
	Wind_FighterCreate(&bone_position, 120, 0.9f, 0.02f, 1.0471976f);
}

/// @brief Initializes callbacks for SpecialS, should be called after state changes
/// @param fighter 
void SpecialS_InitCallbacks(GOBJ *fighter)
{
	FighterData *fighter_data = fighter->userdata;
	SpecialSVar *state_var = Fighter_GetStateVars(fighter);
	MarioCharVar *char_var = Fighter_GetFighterVars(fighter);

	// check if reflect has already been set
	// and enable reflection if it has
	if (state_var->reflect_enabled)
	{
		fighter_data->flags.reflect_enable = 1;
	}

	// if cape is set then make sure the damage callbacks are set
	// these callbacks will remove the cape when mario is hit or dies
	if (char_var->item_cape != 0)
	{
		fighter_data->cb.OnDeath_State = SpecialS_OnDamagedCB;
		fighter_data->cb.OnTakeDamage = SpecialS_OnDamagedCB;
	}

	// set hitlag callbacks for cape
	fighter_data->cb.EnterHitlag = SpecialS_EnterHitlagCB;
	fighter_data->cb.ExitHitlag = SpecialS_ExitHitlagCB;

	// set cape spawn accessory
	fighter_data->cb.Accessory4 = SpecialS_SpawnCapeThink;
}

///////////////////////
// Grounded SpecialS //
///////////////////////

/// @brief Original: 0x800E1550
/// @param fighter 
void SpecialS_AnimationCallback(GOBJ *fighter)
{
	// return to wait animation after animation ends
	if (FrameTimerCheck(fighter) == 0)
	{
		Fighter_EnterWait(fighter);
	}

	return;
}

/// @brief Original: 0x800E15C8
/// @param fighter 
void SpecialS_IASACallback(GOBJ *fighter)
{
	return;
}

/// @brief Original: 0x800E15D0
/// @param fighter 
void SpecialS_PhysicCallback(GOBJ *fighter)
{
	FighterData *fighter_data = fighter->userdata;
	MarioAttr *mrAttr = Fighter_GetSpecialAttributes(fighter);
	SpecialSVar *state_var = Fighter_GetStateVars(fighter);
	SpecialSFtCmd *script_var = Fighter_GetScriptVars(fighter);

	// ftCmd sets this subaction flag
	// creates wind when it is set
	if (script_var->create_wind == 1)
	{
		script_var->create_wind = 2;
		Mario_CreateCapeWind(fighter);
	}

	// apply friction
	Fighter_PhysGround_ApplyFriction(fighter);

	// process reflection 
	Mario_ReflectionThink(fighter);

	return;
}

/// @brief Original: 0x800e18b8
/// @param fighter 
void SpecialS_PassLedge(GOBJ *fighter)
{
	FighterData *fighter_data = fighter->userdata;
	SpecialSVar *state_var = Fighter_GetStateVars(fighter);
	SpecialSFtCmd *script_var = Fighter_GetScriptVars(fighter);
	MarioCharVar *char_var = Fighter_GetFighterVars(fighter);

	// set fighter to air state
	Fighter_SetAirborne(fighter_data);

	// enter air state
	ActionStateChange(fighter_data->state.frame, 1, 0, 
		fighter, 
		STATE_SPECIALSAIR, 
		SPECIALS_TRANSITION_FLAGS, 
		0);

	// disable ability to spawn wind
	// this prevents the little extra 
	// jump mario gets from this move
	// from occuring
	if (script_var->create_wind == 1)
	{
		script_var->create_wind = 2;
	}

	// re initialize callbacks after state change
	SpecialS_InitCallbacks(fighter);

	return;
}

/// @brief Original: 0x800E1840
/// @param fighter 
void SpecialS_CollisionCallback(GOBJ *fighter)
{
	// enter aerial state when falling off ledge
	if (Fighter_CollGround_StopLedge(fighter) == 0)
	{
		SpecialS_PassLedge(fighter);
	}

	return;
}

///////////////////////
//  Aerial SpecialS  //
///////////////////////

/// @brief Original: 0x800E158C
/// @param fighter 
void SpecialAirS_AnimationCallback(GOBJ *fighter)
{
	// enter fall state when animation ends
	if (FrameTimerCheck(fighter) == 0)
	{
		Fighter_EnterFall(fighter);
	}

	return;
}

/// @brief Original: 0x800E15CC
/// @param fighter 
void SpecialAirS_IASACallback(GOBJ *fighter)
{
	return;
}

/// @brief Original: 0x800E16E0
/// @param fighter 
void SpecialAirS_PhysicCallback(GOBJ *fighter)
{
	FighterData *fd = fighter->userdata;
	MarioAttr *mrAttr = Fighter_GetSpecialAttributes(fighter);
	SpecialSVar *state_var = Fighter_GetStateVars(fighter);
	SpecialSFtCmd *script_var = Fighter_GetScriptVars(fighter);
	MarioCharVar *char_var = Fighter_GetFighterVars(fighter);

	// apply physics based on script flag
	switch (script_var->create_wind)
	{
		case 0:
		{
			// apply physics
			Fighter_Phys_ApplyVerticalAirFriction(fd);
		}
		break;
		case 1:
		{
			// check to apply extra jump momentum
			script_var->create_wind = 2;
			if (char_var->var4 == 0)
			{
				char_var->var4 = 1;
				fd->phys.self_vel.Y = mrAttr->specialS_vertical_momentum;
			}
			else
			{
				fd->phys.self_vel.Y = 0;
			}

			// create wind effect
			Mario_CreateCapeWind(fighter);
			
			// apply physics
			Fighter_PhysAir_ApplyGravity(fd, mrAttr->specialS_gravity, mrAttr->specialS_gravity_limit);
		}
		break;
		case 2:
		{
			// apply physics
			Fighter_PhysAir_ApplyGravity(fd, mrAttr->specialS_gravity, mrAttr->specialS_gravity_limit);
		}
		break;
	}

	// apply horizontal friction
	Fighter_PhysAir_DecayXVelocity(fd, mrAttr->specialS_horizontal_friction);

	// process reflection
	Mario_ReflectionThink(fighter);

	return;
}

/// @brief Original: 0x800e198c
/// @param fighter 
void SpecialAirS_TouchGround(GOBJ *fighter)
{
	FighterData *fighter_data = fighter->userdata;
	SpecialSVar *state_var = &fighter_data->state_var;

	fighter_data->fighter_var.ft_var4 = 0;

	// ground fighter
	Fighter_SetGrounded2(fighter_data);

	// change into grounded special state and preserve frame
	ActionStateChange(fighter_data->state.frame, 1, 0, 
		fighter, 
		STATE_SPECIALS, 
		SPECIALS_TRANSITION_FLAGS, 
		0);

	// re initialize callbacks after state change
	SpecialS_InitCallbacks(fighter);

	return;
}

/// @brief Original: 0x800E187C
/// @param fighter 
void SpecialAirS_CollisionCallback(GOBJ *fighter)
{
	// if fighter collides with ground switch to grounded state
	if (Fighter_CollAir_IgnoreLedge_NoCB(fighter) != 0)
	{
		SpecialAirS_TouchGround(fighter);
	}
	return;
}
