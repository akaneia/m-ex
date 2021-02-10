#include "mario.h"
///////////////////////
//  Inital SpecialM  //
///////////////////////
/// SpecialN
/// 0x800E0DA8
///
void SpecialN(GOBJ *gobj)
{
	FighterData *fighter_data = gobj->userdata;
	SpecialNFtCmd *script_flags = &fighter_data->ftcmd_var;

	// clear subaction flags used by this special
	script_flags->interruptable = 0;
	fighter_data->flags.throw_1 = 0;

	// change to special n state and update subaction
	ActionStateChange(0, 1, 0, gobj, STATE_SPECIALN, 0, 0);
	Fighter_AdvanceScript(gobj);

	// set the accessory callback for mario's fireball
	// this function will spawn the fireball when the flag0 is set
	fighter_data->cb.Accessory4 = FireBallThink;
	return;
}
/// SpecialNAir
/// 0x800E1040
///
void SpecialAirN(GOBJ *gobj)
{
	FighterData *fighter_data = gobj->userdata;
	SpecialNFtCmd *script_flags = &fighter_data->ftcmd_var;

	// clear subaction flags used by this function
	script_flags->interruptable = 0;
	fighter_data->flags.throw_1 = 0;

	// change to special n state and update subaction
	ActionStateChange(0, 1, 0, gobj, STATE_SPECIALNAIR, 0, 0);
	Fighter_AdvanceScript(gobj);

	// set the accessory callback for mario's fireball
	// this function will actually spawn the fireball
	fighter_data->cb.Accessory4 = FireBallThink;
	return;
}
///////////////////////
// Grounded SpecialN //
///////////////////////
///
/// 0x800E0E18
///
void SpecialN_AnimationCallback(GOBJ *gobj)
{
	// if animation timer has ended return to wait state
	if (FrameTimerCheck(gobj) == 0)
	{
		Fighter_EnterWait(gobj);
	}

	return;
}
///
/// 0x800E0E54
///
void SpecialN_IASACallback(GOBJ *gobj)
{
	FighterData *fighter_data = gobj->userdata;
	SpecialNFtCmd *script_flags = &fighter_data->ftcmd_var;

	// flag0 is set by ftCmd and determines when you can interupt
	if (script_flags->interruptable != 0)
	{
		Fighter_Interrupt_AllGrounded(gobj);
	}
	return;
}
///
/// 0x800E0E84
///
void SpecialN_PhysicCallback(GOBJ *gobj)
{
	Fighter_PhysGround_ApplyFriction(gobj);
	return;
}
///
/// 0x800e1178
/// changes the fireball state to the aerial version
///
void SpecialN_EnterAerial(GOBJ *gobj)
{
	FighterData *fighter_data = (FighterData *)gobj->userdata;

	Fighter_SetAirborne(fighter_data);

	ActionStateChange(fighter_data->state.frame, 1, 0, gobj, STATE_SPECIALNAIR, 0x5000, 0);

	fighter_data->cb.Accessory4 = FireBallThink;
	return;
}
///
/// 0x800E0EA4
///
void SpecialN_CollisionCallback(GOBJ *gobj)
{
	// when entering the air change to air state
	if (Fighter_CollGround_PassLedge(gobj) == 0)
	{
		SpecialN_EnterAerial(gobj);
	}

	return;
}
///////////////////////
//  Aerial SpecialN  //
///////////////////////
///
/// 0x800E10B0
///
void SpecialAirN_AnimationCallback(GOBJ *gobj)
{
	// if animation timer has ended return to fall state
	if (FrameTimerCheck(gobj) == 0)
	{
		Fighter_EnterFall(gobj);
	}

	return;
}
///
/// 0x800E10EC
///
void SpecialAirN_IASACallback(GOBJ *gobj)
{
	FighterData *fighter_data = gobj->userdata;
	SpecialNFtCmd *script_flags = &fighter_data->ftcmd_var;

	// ftcmd_var.flag0 is set by ftCmd and determines when you can interupt
	if (script_flags->interruptable != 0)
	{
		Fighter_Interrupt_AllAerial(gobj);
	}

	return;
}
///
/// 0x800E111C
///
void SpecialAirN_PhysicCallback(GOBJ *gobj)
{
	Fighter_PhysAir_ApplyGravityAndFastfall(gobj);
	return;
}
///
/// 0x800e11e0
///
void SpecialAirN_EnterGrounded(GOBJ *gobj)
{
	FighterData *fighter_data = (FighterData *)gobj->userdata;

	Fighter_SetGrounded2(fighter_data);

	ActionStateChange(fighter_data->state.frame, 1, 0, gobj, STATE_SPECIALN, 0x5000, 0);

	fighter_data->cb.Accessory4 = FireBallThink;

	return;
}
///
/// 0x800E113C
///
void SpecialAirN_CollisionCallback(GOBJ *gobj)
{
	// when colliding with the ground change to the grounded state
	if (Fighter_CollAir_IgnoreLedge_NoCB(gobj) != 0)
	{
		SpecialAirN_EnterGrounded(gobj);
	}

	return;
}
///
/// 0x8029b7c0
///
void IS_MarioFireballSpawn(GOBJ *gobj)
{
	ItemData *item_data = gobj->userdata;

	// get the fireball custom attributes
	FireballAttr *attributes = item_data->itData->param_ext;

	float speed = attributes->speed;
	float angle = attributes->angle;

	// set velocity of fireball accordint to params
	item_data->self_vel.X = item_data->facing_direction * speed * cos(angle);
	item_data->self_vel.Y = speed * sin(angle);
	item_data->self_vel.Z = 0;

	// set the fireball lifetime
	Item_SetLifeTimer(gobj, attributes->life);

	// change the item's state
	ItemStateChange(gobj, STATE_FIREBALL, 2);

	return;
}
///
/// 0x8029b6f8
///
void CreateFireball(float facing_direction, GOBJ *gobj, Vec3 *position, int it_kind)
{
	Vec3 ecb_center_pos;
	Fighter_GetECBPosition(gobj, &ecb_center_pos);

	// setup item creation struct
	SpawnItem spawnItem;
	spawnItem.parent_gobj = gobj;
	spawnItem.parent_gobj2 = gobj;
	spawnItem.it_kind = it_kind;
	spawnItem.pos = ecb_center_pos;
	spawnItem.pos2.X = position->X;
	spawnItem.pos2.Y = position->Y;
	spawnItem.pos2.Z = 0;
	spawnItem.vel.X = 0;
	spawnItem.vel.Y = 0;
	spawnItem.vel.Z = 0;
	spawnItem.facing_direction = facing_direction;
	spawnItem.damage = 0;
	spawnItem.unk6 = 0;
	spawnItem.unk7 = 0x80;

	// create the new item
	GOBJ *item = Item_CreateItem1(&spawnItem);

	// initialize the fireball behavior
	IS_MarioFireballSpawn(item);

	// develop mode stuff
	Item_CopyDevelopState(item, gobj);

	// update phys and collision for item
	Item_UpdatePhysAndColl(item);

	return;
}
///
/// 0x800e0ee0 (Only ported Mario's specific code; not Dr. Mario)
///
void FireBallThink(GOBJ *gobj)
{
	// get fighter data
	FighterData *fighter_data = (FighterData *)gobj->userdata;

	// check for bitflag set by ftCmd subaction
	if (fighter_data->flags.throw_1 != 0)
	{
		// clear bit flag
		fighter_data->flags.throw_1 = 0;

		// grab bone index
		int bone_index = Fighter_BoneLookup(fighter_data, L1stNa);

		// get position of bone in world
		Vec3 bone_position;
		JOBJ_GetWorldPosition(fighter_data->bones[bone_index].joint, 0, &bone_position);

		// create fireball item
		int fireball_id = MEX_GetFtItemID(fighter_data->kind, MEX_ITEM_FIREBALL);
		CreateFireball(fighter_data->facing_direction, gobj, &bone_position, fireball_id); //VANILLA_ITEM_FIREBALL);

		// create fireball effect
		Effect_SpawnSync(VANILLA_EFFECT_FIREBALL, gobj, fighter_data->bones[bone_index].joint, &fighter_data->facing_direction);
	}
	return;
}