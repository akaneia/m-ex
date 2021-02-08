#include "mario.h"
////////////////////////
//  Inital SpecialLw  //
////////////////////////
///
/// 0x800e2050
///
void ResetFighterBoneYaw(GOBJ *gobj)
{
	Fighter_RotateBone_Yaw(0, gobj->userdata, 0);
	return;
}
/// 
/// 0x800E207C
///
void SpecialLw(GOBJ *gobj)
{
	// get fighter data
	FighterData *fighter_data = gobj->userdata;
	
	// get special attributes pointer
	MarioAttr *mrAttr = fighter_data->special_attributes;
	
	// clear flag
	fighter_data->ftcmd_var.flag2 = 0;
	
	// change to special lw state and update
	ActionStateChange(0, 1, 0,gobj, STATE_SPECIALLWAIR, 0, 0);
	Fighter_AdvanceScript(gobj);
	
	// set initial Y velocity and clamp X velocity
	fighter_data->phys.self_vel.Y = mrAttr->specialLw_grounded_rise_resistance - mrAttr->specialLw_rising_tap_power;
	Fighter_ClampHorizontalVelocity(fighter_data, mrAttr->specialLw_base_air_speed);
	
	// clear flags for this state
	fighter_data->ftcmd_var.flag0 = 0;
	fighter_data->ftcmd_var.flag1 = 0;
	
	// clear state variables
	fighter_data->state_var.stateVar1 = 0;
	fighter_data->state_var.stateVar2 = mrAttr->specialLw_state_Var2 + 1;
	fighter_data->state_var.stateVar4 = 0;
	
	// set take damage and death callbacks
	// these reset some kind of bone rotation yaw
	fighter_data->cb.OnTakeDamage = 0x800e2050;
	fighter_data->cb.OnDeath2 = 0x800e2050;
	
	// spawn effect
	Effect_SpawnSync(VANILLA_EFFECT_DSPECIAL, gobj, gobj->hsd_object);
	
	// enable gfx bit flag
	fighter_data->flags.persistent_gfx = 1;
	
	// set endlag callbacks to pause and resume
	fighter_data->cb.EnterHitlag = Effect_PauseAll;
	fighter_data->cb.ExitHitlag = Effect_ResumeAll;
	return;
}
/// 
/// 0x800E2194
///
void SpecialAirLw(GOBJ *gobj)
{
	// get fighter data
	FighterData *fighter_data = gobj->userdata;
	
	// get special attributes pointer
	MarioAttr *mrAttr = fighter_data->special_attributes;
	
	// clear flag
	fighter_data->ftcmd_var.flag2 = 0;

	// change to special lw state and update
	ActionStateChange(0, 1, 0, gobj, STATE_SPECIALLWAIR, 0, 0);
	Fighter_AdvanceScript(gobj);

	// set initial Y velocity and clamp X velocity
	float y_vel = 0;

	// if this variable is set then set y vel reduction to initial rising power
	if (fighter_data->fighter_var.charVar3 == 0)
		y_vel = mrAttr->specialLw_rising_tap_power;
	
	fighter_data->phys.self_vel.Y = mrAttr->specialLw_grounded_rise_resistance - y_vel;

	// clamp vertical velocity
	Fighter_ClampHorizontalVelocity(fighter_data, mrAttr->specialLw_base_air_speed);

	// clear flags
	fighter_data->ftcmd_var.flag0 = 0;
	fighter_data->ftcmd_var.flag1 = 0;
	
	// clear state variables
	fighter_data->state_var.stateVar1 = 0;
	fighter_data->state_var.stateVar2 = mrAttr->specialLw_state_Var2 + 1;
	fighter_data->state_var.stateVar4 = 0;

	// set take damage and death callbacks
	// these reset some kind of bone rotation yaw
	fighter_data->cb.OnTakeDamage = 0x800e2050;
	fighter_data->cb.OnDeath2 = 0x800e2050;

	// spawn effect
	Effect_SpawnSync(VANILLA_EFFECT_DSPECIAL, gobj, gobj->hsd_object);

	// enable gfx bit flag
	fighter_data->flags.persistent_gfx = 1;

	// set endlag callbacks to pause and resume
	fighter_data->cb.EnterHitlag = Effect_PauseAll;
	fighter_data->cb.ExitHitlag = Effect_ResumeAll;
	return;
}
////////////////////////
// Grounded SpecialLw //
////////////////////////
///
/// 0x800E22BC
///
void SpecialLw_AnimationCallback(GOBJ *gobj)
{
	FighterData *fighter_data = gobj->userdata;

	if (FrameTimerCheck(gobj) == 0) {
		fighter_data->cb.OnTakeDamage = (void *)0x0;
		fighter_data->cb.OnDeath2 = (void *)0x0;
		Fighter_EnterWait(gobj);
	}
	return;
}
///
/// 0x800E23DC
///
void SpecialLw_IASACallback(GOBJ *gobj)
{
	return;
}
///
/// 0x800E23E4
///
void SpecialLw_PhysicCallback(GOBJ *gobj)
{
	FighterData *fighter_data = gobj->userdata;
	MarioAttr *mrAttr = fighter_data->special_attributes;

	float base_air_speed = mrAttr->specialLw_base_air_speed;
	float airSpeed = base_air_speed;

	if (fighter_data->ftcmd_var.flag0 != 0) 
	{
		float new_air_speed = AS_FLOAT(fighter_data->state_var.stateVar1) - mrAttr->speicalLw_air_speed_decel;

		fighter_data->state_var.stateVar1 = AS_INT(new_air_speed);

		airSpeed = base_air_speed + new_air_speed;

		if (airSpeed < 0)
			airSpeed = 0;
	}

	Fighter_QueueAllowXDrift(fighter_data, 0, mrAttr->specialLw_x_accel, airSpeed);

	Fighter_PhysGround_UnkFriction(gobj);

	if ((fighter_data->ftcmd_var.flag2 != 0) && ((fighter_data->input.down & HSD_BUTTON_B) != 0)) 
	{
		fighter_data->phys.self_vel.Y = fighter_data->phys.self_vel.Y + mrAttr->specialLw_rising_tap_power;

		fighter_data->ftcmd_var.flag2 = 0;

		Fighter_SetAirborne(fighter_data);

		ActionStateChange(fighter_data->stateFrame, 1, 0, gobj, STATE_SPECIALLWAIR, 0xc4c508a, 0);
	
		Fighter_ClampFallSpeed(fighter_data, mrAttr->specialLw_terminal_velocity);

		Fighter_ClampHorizontalVelocity(fighter_data, mrAttr->specialLw_x_vel_clamp);

		fighter_data->cb.EnterHitlag = Effect_PauseAll;
		fighter_data->cb.ExitHitlag = Effect_ResumeAll;
	}
	return;
}
///
/// 0x80082888
///
int SpecialLw_UpdateECBBox(GOBJ *gobj, ECBSize *ecb_bones)
{
	FighterData *fighter_data = (FighterData *)gobj->userdata;
	
	fighter_data->coll_data.topN_Prev.X = fighter_data->coll_data.topN_Curr.X;
	fighter_data->coll_data.topN_Prev.Y = fighter_data->coll_data.topN_Curr.Y;
	fighter_data->coll_data.topN_Prev.Z = fighter_data->coll_data.topN_Curr.Z;

	fighter_data->coll_data.topN_Curr.X = fighter_data->phys.pos.X;
	fighter_data->coll_data.topN_Curr.Y = fighter_data->phys.pos.Y;
	fighter_data->coll_data.topN_Curr.Z = fighter_data->phys.pos.Z;

	if (fighter_data->facing_direction < 0) 
	{
		ecb_bones->right.X = -ecb_bones->right.X;
		ecb_bones->left.X = -ecb_bones->left.X;
	}

	int is_touching_ground = ECB_CollGround_PassLedge(&fighter_data->coll_data, ecb_bones);

	fighter_data->phys.pos.X = fighter_data->coll_data.topN_Curr.X;
	fighter_data->phys.pos.Y = fighter_data->coll_data.topN_Curr.Y;
	fighter_data->phys.pos.Z = fighter_data->coll_data.topN_Curr.Z;

	return is_touching_ground;
}
///
/// 0x800E25C4
///
void SpecialLw_CollisionCallback(GOBJ *gobj)
{
	FighterData *fighter_data = gobj->userdata;
	MarioAttr *mrAttr = fighter_data->special_attributes;

	ECBSize fake_ecb = { 12, 0, -6, 6, 6, 6 };

	if (fighter_data->phys.air_state == 0) 
	{
		if (SpecialLw_UpdateECBBox(gobj, &fake_ecb) == 0) 
		{
			fighter_data->ftcmd_var.flag2 = 0;
			Fighter_SetAirborne(fighter_data);
			ActionStateChange(fighter_data->stateFrame, 1, 0, gobj, STATE_SPECIALLWAIR, 0xc4c508a, 0);
			Fighter_ClampFallSpeed(fighter_data, mrAttr->specialLw_terminal_velocity);
			Fighter_ClampHorizontalVelocity(fighter_data, mrAttr->specialLw_x_vel_clamp);
			fighter_data->cb.EnterHitlag = Effect_PauseAll;
			fighter_data->cb.ExitHitlag = Effect_ResumeAll;
			fighter_data->state_var.stateVar4 = 0;
		}
		else 
		{
			fighter_data->state_var.stateVar4 = 1;
		}
	}
	else 
	{
		if (Fighter_CollAir_DefineECB(gobj, &fake_ecb) == 0) 
		{
			fighter_data->ftcmd_var.flag2 = 0;
			Fighter_SetAirborne(fighter_data);
			ActionStateChange(fighter_data->stateFrame, 1, 0, gobj, STATE_SPECIALLWAIR, 0xc4c508a, 0);
			Fighter_ClampFallSpeed(fighter_data, mrAttr->specialLw_terminal_velocity);
			Fighter_ClampHorizontalVelocity(fighter_data, mrAttr->specialLw_x_vel_clamp);
			fighter_data->cb.EnterHitlag = Effect_PauseAll;
			fighter_data->cb.ExitHitlag = Effect_ResumeAll;
			fighter_data->state_var.stateVar4 = 0;
		}
		else 
		{
			fighter_data->state_var.stateVar4 = 1;
		}
	}
	
	if ((fighter_data->ftcmd_var.flag3 == 0) || (fighter_data->state_var.stateVar4 == 0)) 
	{
		// Reset Rotation
		Fighter_RotateBone_Yaw(fighter_data, 0, 0);
	}
	else 
	{
		// Rotate to ground slope angle
		float angle = atan2(fighter_data->coll_data.ground_slope.X, fighter_data->coll_data.ground_slope.Y);
		Fighter_RotateBone_Yaw(fighter_data, 0, fighter_data->facing_direction * angle);
	}
	return;
}
////////////////////////
//  Aerial SpecialLw  //
////////////////////////
///
/// 0x800E2308
///
void SpecialAirLw_AnimationCallback(GOBJ *gobj)
{
	FighterData *fighter_data = gobj->userdata;
	MarioAttr *mrAttr = fighter_data->special_attributes;

	if (fighter_data->ftcmd_var.flag1 != 0) {
		fighter_data->ftcmd_var.flag1 = 0;
		fighter_data->fighter_var.charVar3 = 1;
	}

	if (FrameTimerCheck(gobj) == 0) 
	{
		fighter_data->cb.OnTakeDamage = (void *)0x0;
		fighter_data->cb.OnDeath2 = (void *)0x0;

		if(mrAttr->specialLw_freefall_toggle == 0)
		{
			Fighter_EnterFall(gobj);
		}
		else {
			Fighter_EnterSpecialFall(gobj, 1, 0, 1, 1, mrAttr->specialLw_freefall_toggle);
		}
	}
	return;
}
///
/// 0x800E23E0
///
void SpecialAirLw_IASACallback(GOBJ *gobj)
{
	return;
}
///
/// 0x800E2508
///
void SpecialAirLw_PhysicCallback(GOBJ *gobj)
{
	FighterData *fighter_data = gobj->userdata;
	MarioAttr *mrAttr = fighter_data->special_attributes;

	if (fighter_data->fighter_var.charVar3 == 0) 
	{
		if ((fighter_data->ftcmd_var.flag2 != 0) && ((fighter_data->input.down & HSD_BUTTON_B) != 0)) 
		{
			Fighter_AddClampYPosition(fighter_data, mrAttr->specialLw_rising_tap_power, mrAttr->specialLw_terminal_velocity);
		}
	}

	Fighter_Phys_ApplyVerticalAirFriction(fighter_data);

	float base_air_speed = mrAttr->specialLw_base_air_speed;
	float airSpeed = base_air_speed;

	if (fighter_data->ftcmd_var.flag0 != 0) 
	{
		float new_air_speed = AS_FLOAT(fighter_data->state_var.stateVar1) - mrAttr->speicalLw_air_speed_decel;

		fighter_data->state_var.stateVar1 = AS_INT(new_air_speed);

		airSpeed = base_air_speed + new_air_speed;

		if (airSpeed < 0)
			airSpeed = 0;
	}

	Fighter_AllowXDrift(fighter_data, 0, mrAttr->specialLw_x_drift, airSpeed);
	return;
}
///
/// 0x800E2778
///
void SpecialAirLw_CollisionCallback(GOBJ *gobj)
{
	FighterData *fighter_data = gobj->userdata;

	MarioAttr *mrAttr = fighter_data->special_attributes;
	
	ECBSize fake_ecb[] = { 12, 0, -6, 6, 6, 6 };

	if (Fighter_CollAir_DefineECB(gobj, &fake_ecb) == 0) {
		fighter_data->state_var.stateVar4 = 0;
	}
	else 
	{
		fighter_data->ftcmd_var.flag2 = 0;

		Fighter_SetGrounded2(fighter_data);

		fighter_data->phys.self_vel.Y = 0;
		fighter_data->fighter_var.charVar3 = 0;

		ActionStateChange(fighter_data->stateFrame, 1, 0, gobj, STATE_SPECIALLW, 0xc4c508a, 0);

		Fighter_ClampHorizontalGroundVelocity(fighter_data, mrAttr->specialLw_base_air_speed);

		fighter_data->cb.EnterHitlag = Effect_PauseAll;
		fighter_data->cb.ExitHitlag = Effect_ResumeAll;
		fighter_data->state_var.stateVar4 = 1;
	}
	
	if ((fighter_data->ftcmd_var.flag3 == 0) || (fighter_data->state_var.stateVar4 == 0)) {
		Fighter_RotateBone_Yaw(fighter_data, 0, 0);
	}
	else {
		float angle = atan2(fighter_data->coll_data.ground_slope.X, fighter_data->coll_data.ground_slope.Y);

		Fighter_RotateBone_Yaw(fighter_data, 0, fighter_data->facing_direction * angle);
	}
	return;
}