#include "mario.h"
////////////////////////
//  Inital SpecialHi  //
////////////////////////
///
/// 0x800E1A54
///
void SpecialHi(GOBJ *gobj)
{
	FighterData *fighter_data = gobj->userdata;
	SpecialHiFtCmd *script_flags = &fighter_data->ftcmd_var;

	// clear flags that are going to be used by this action
	script_flags->can_control = 0;
	fighter_data->flags.throw_release = 0;

	// change state and update subaction
	ActionStateChange(0, 1, 0, gobj, STATE_SPECIALHI, 0, 0);
	Fighter_AdvanceScript(gobj);

	return;
}
///
/// 0x800E1AB0
///
void SpecialAirHi(GOBJ *gobj)
{
	FighterData *fighter_data = gobj->userdata;
	MarioAttr *mrAttr = fighter_data->special_attributes;
	SpecialHiFtCmd *script_flags = &fighter_data->ftcmd_var;

	// clear flags that are going to be used by this action
	script_flags->can_control = 0;
	fighter_data->flags.throw_release = 0;

	// stop y velocity and boost x velocity by value defined in special attributes
	fighter_data->phys.self_vel.Y = 0;
	fighter_data->phys.self_vel.X = fighter_data->phys.self_vel.X * mrAttr->specialHi_initial_x_momemtum;

	// change state and update subaction
	ActionStateChange(0, 1, 0, gobj, STATE_SPECIALHIAIR, 0, 0);
	Fighter_AdvanceScript(gobj);

	return;
}
////////////////////////
// Grounded SpecialHi //
////////////////////////
///
/// 0x800E1B24
///
void SpecialHi_AnimationCallback(GOBJ *gobj)
{
	FighterData *fighter_data = gobj->userdata;

	MarioAttr *mrAttr = fighter_data->special_attributes;

	if (FrameTimerCheck(gobj) == 0)
	{
		Fighter_EnterSpecialFall(gobj, 0, 1, 0, mrAttr->specialHi_fall_air_mobility, mrAttr->specialHi_landing_lag);
	}
	return;
}
///
/// 0x800E1BE4
///
void SpecialHi_IASACallback(GOBJ *gobj)
{
	FighterData *fighter_data = gobj->userdata;

	MarioAttr *mrAttr = fighter_data->special_attributes;

	SpecialHiFtCmd *script_flags = &fighter_data->ftcmd_var;

	float lstick_x = fighter_data->input.lstick.X;
	float stick_threshold = mrAttr->specialHi_stick_threshold;

	float lstick_x_clamp = lstick_x;

	if (lstick_x < 0)
	{
		lstick_x_clamp = -lstick_x;
	}

	if ((script_flags->can_control == 0) && stick_threshold < lstick_x_clamp)
	{
		float new_angle = mrAttr->specialHi_stick_control * ((lstick_x_clamp - stick_threshold) / (1 - stick_threshold));

		if (lstick_x <= 0)
		{
			new_angle = M_1DEGREE * new_angle;
		}
		else
		{
			new_angle = -(M_1DEGREE * new_angle);
		}

		float stick_angle = fighter_data->input_stickangle;

		if (stick_angle < M_1DEGREE)
		{
			stick_angle = -stick_angle;
		}

		if (new_angle < M_1DEGREE)
		{
			new_angle = -new_angle;
		}

		if (stick_angle < new_angle)
		{
			fighter_data->input_stickangle = new_angle;
		}
	}

	if (fighter_data->flags.throw_release != 0)
	{
		fighter_data->flags.throw_release = 0;

		lstick_x = fighter_data->input.lstick.X;

		if (lstick_x < 0)
		{
			lstick_x = -lstick_x;
		}

		if (mrAttr->specialHi_stick_reverse_threshold < lstick_x)
		{
			Fighter_SetFacingToStickDirection(fighter_data);
			Fighter_RotateBone_Pitch(fighter_data, 0, 1.57079632f * fighter_data->facing_direction);
		}
	}
	return;
}
///
/// 0x800E1E74
///
void SpecialHi_PhysicCallback(GOBJ *gobj)
{
	FighterData *fighter_data = gobj->userdata;

	if (fighter_data->phys.air_state == 1)
	{
		Fighter_Phys_UseAnimPosAndStick(gobj);
	}
	else
	{
		Fighter_Phys_AnimationFriction(gobj);
	}

	return;
}

///
/// 0x800e1f40
///
void SpecialHi_OnLand(GOBJ *gobj)
{
	FighterData *fighter_data = gobj->userdata;

	MarioAttr *mrAttr = fighter_data->special_attributes;

	Fighter_EnterSpecialLanding(gobj, 0, mrAttr->specialHi_landing_lag);

	return;
}
///
/// 0x800E1F70
///
void SpecialHi_CollisionCallback(GOBJ *gobj)
{
	FighterData *fighter_data = gobj->userdata;
	SpecialHiFtCmd *script_flags = &fighter_data->ftcmd_var;

	if (fighter_data->phys.air_state == 1)
	{
		if ((script_flags->can_control == 0) || (0 <= fighter_data->phys.self_vel.Y))
		{
			Fighter_CollAir(gobj);
		}
		else
		{
			Fighter_CollAir_GrabLedgeWalljump(gobj, Fighter_Coll_CheckToPass, SpecialHi_OnLand);
		}
	}
	else
	{
		Fighter_CollGround_StopLedge(gobj);
	}
	return;
}
////////////////////////
//  Aerial SpecialHi  //
////////////////////////
///
/// 0x800E1B84
///
void SpecialAirHi_AnimationCallback(GOBJ *gobj)
{
	FighterData *fighter_data = gobj->userdata;

	MarioAttr *mrAttr = fighter_data->special_attributes;

	if (FrameTimerCheck(gobj) == 0)
	{
		Fighter_EnterSpecialFall(gobj, 0, 1, 0, mrAttr->specialHi_fall_air_mobility, mrAttr->specialHi_landing_lag);
	}
	return;
}
///
/// 0x800E1D2C
///
void SpecialAirHi_IASACallback(GOBJ *gobj)
{
	FighterData *fighter_data = gobj->userdata;

	MarioAttr *mrAttr = fighter_data->special_attributes;

	SpecialHiFtCmd *script_flags = &fighter_data->ftcmd_var;

	float lstick_x = fighter_data->input.lstick.X;
	float stick_threshold = mrAttr->specialHi_stick_threshold;

	float lstick_x_clamp = lstick_x;

	if (lstick_x < 0)
	{
		lstick_x_clamp = -lstick_x;
	}

	if ((script_flags->can_control == 0) && stick_threshold < lstick_x_clamp)
	{
		float new_angle = mrAttr->specialHi_stick_control * ((lstick_x_clamp - stick_threshold) / (1 - stick_threshold));

		if (lstick_x <= 0)
		{
			new_angle = M_1DEGREE * new_angle;
		}
		else
		{
			new_angle = -(M_1DEGREE * new_angle);
		}

		float stick_angle = fighter_data->input_stickangle;

		if (stick_angle < M_1DEGREE)
		{
			stick_angle = -stick_angle;
		}

		if (new_angle < M_1DEGREE)
		{
			new_angle = -new_angle;
		}

		if (stick_angle < new_angle)
		{
			fighter_data->input_stickangle = new_angle;
		}
	}

	if (fighter_data->flags.throw_release != 0)
	{
		fighter_data->flags.throw_release = 0;

		lstick_x = fighter_data->input.lstick.X;

		if (lstick_x < 0)
		{
			lstick_x = -lstick_x;
		}

		if (mrAttr->specialHi_stick_reverse_threshold < lstick_x)
		{
			Fighter_SetFacingToStickDirection(fighter_data);
			Fighter_RotateBone_Pitch(fighter_data, 0, 1.57079632f * fighter_data->facing_direction);
		}
	}
	return;
}
///
/// 0x800E1EAC
///
void SpecialAirHi_PhysicCallback(GOBJ *gobj)
{
	FighterData *fighter_data = gobj->userdata;

	MarioAttr *mrAttr = fighter_data->special_attributes;

	SpecialHiFtCmd *script_flags = &fighter_data->ftcmd_var;

	if (script_flags->can_control == 0)
	{
		Fighter_PhysAir_ApplyGravity(fighter_data, mrAttr->specialHi_initial_gravity, fighter_data->attr.terminal_velocity);

		Fighter_PhysAir_LimitXVelocity(fighter_data);
	}
	else
	{
		Fighter_Phys_UseAnimPosAndStick(gobj);
		fighter_data->phys.self_vel.X *= mrAttr->specialHi_initial_y_momemtum;
		fighter_data->phys.self_vel.Y *= mrAttr->specialHi_initial_y_momemtum;
		fighter_data->phys.self_vel.Z *= mrAttr->specialHi_initial_y_momemtum;
	}
	return;
}
///
/// 0x800E1FE0
///
void SpecialAirHi_CollisionCallback(GOBJ *gobj)
{
	FighterData *fighter_data = gobj->userdata;

	SpecialHiFtCmd *script_flags = &fighter_data->ftcmd_var;

	if (fighter_data->phys.air_state == 1)
	{
		if ((script_flags->can_control == 0) || (0 <= fighter_data->phys.self_vel.Y))
		{
			Fighter_CollAir(gobj);
		}
		else
		{
			Fighter_CollAir_GrabLedgeWalljump(gobj, Fighter_Coll_CheckToPass, SpecialHi_OnLand);
		}
	}
	else
	{
		Fighter_CollGround_StopLedge(gobj);
	}
	return;
}