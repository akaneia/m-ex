#include "mario.h"

///////////////////////
//    Mario Basic    //
///////////////////////
///
/// 0x800E0960
///
void OnLoad(GOBJ *gobj)
{
	// get fighter data
	FighterData *fighter_data = gobj->userdata;

	// copy attributes
	for (int i = 0; i < 0x21; i++)
	{
		fighter_data->special_attributes2[i] = fighter_data->ftData->charAttributes[i];
	}

	// copy pointer to attributes
	fighter_data->special_attributes = fighter_data->special_attributes2;

	// get fighter item pointer
	int *fighter_items = fighter_data->ftData->items;

	// init fire ball
	//Items_StoreItemDataToCharItemTable(fighter_items[0], VANILLA_ITEM_FIREBALL);
	MEX_IndexFighterItem(fighter_data->kind, fighter_items[MEX_ITEM_FIREBALL], MEX_ITEM_FIREBALL);

	// init cape
	//Items_StoreItemDataToCharItemTable(fighter_items[2], fighter_data->special_attributes[5]);
	MEX_IndexFighterItem(fighter_data->kind, fighter_items[MEX_ITEM_CAPE], MEX_ITEM_CAPE);
}
///
/// 0x800E08CC
///
void OnDeath(GOBJ *gobj)
{
	FighterData *fighter_data = gobj->userdata;

	// clear the fighter flags
	Fighter_SetCharacterFlags(gobj, 0, 0);

	// reset character variables 1-6
	fighter_data->fighter_var.ft_var1 = 9;
	fighter_data->fighter_var.ft_var2 = 9;
	fighter_data->fighter_var.ft_var3 = 0;
	fighter_data->fighter_var.ft_var4 = 0;
	fighter_data->fighter_var.ft_var5 = 0;
	fighter_data->fighter_var.ft_var6 = 0;
	return;
}
///
///
///
__attribute__((used)) static struct MoveLogic move_logic[] = {
	// State: 341 - Animation: FFFFFFFF
	{
		-1,	 // AnimationID
		0x0, // StateFlags
		0x1, // AttackID
		0x0, // BitFlags
		0x0, // AnimationCallback
		0x0, // IASACallback
		0x0, // PhysicsCallback
		0x0, // CollisionCallback
		0x0, // CameraCallback
	},
	// State: 342 - Animation: FFFFFFFF
	{
		-1,	 // AnimationID
		0x0, // StateFlags
		0x1, // AttackID
		0x0, // BitFlags
		0x0, // AnimationCallback
		0x0, // IASACallback
		0x0, // PhysicsCallback
		0x0, // CollisionCallback
		0x0, // CameraCallback
	},
	// State: 343 - SpecialN
	{
		295,						// AnimationID
		0x340111,					// StateFlags
		0x12,						// AttackID
		0x0,						// BitFlags
		SpecialN_AnimationCallback, // AnimationCallback
		SpecialN_IASACallback,		// IASACallback
		SpecialN_PhysicCallback,	// PhysicsCallback
		SpecialN_CollisionCallback, // CollisionCallback
		Fighter_UpdateCameraBox,	// CameraCallback
	},
	// State: 344 - SpecialAirN
	{
		296,						   // AnimationID
		0x340511,					   // StateFlags
		0x12,						   // AttackID
		0x0,						   // BitFlags
		SpecialAirN_AnimationCallback, // AnimationCallback
		SpecialAirN_IASACallback,	   // IASACallback
		SpecialAirN_PhysicCallback,	   // PhysicsCallback
		SpecialAirN_CollisionCallback, // CollisionCallback
		Fighter_UpdateCameraBox,	   // CameraCallback
	},
	// State: 345 - SpecialS
	{
		297,						// AnimationID
		0x341012,					// StateFlags
		0x13,						// AttackID
		0x0,						// BitFlags
		SpecialS_AnimationCallback, // AnimationCallback
		SpecialS_IASACallback,		// IASACallback
		SpecialS_PhysicCallback,	// PhysicsCallback
		SpecialS_CollisionCallback, // CollisionCallback
		Fighter_UpdateCameraBox,	// CameraCallback
	},
	// State: 346 - SpecialSAir
	{
		298,						   // AnimationID
		0x341012,					   // StateFlags
		0x13,						   // AttackID
		0x0,						   // BitFlags
		SpecialAirS_AnimationCallback, // AnimationCallback
		SpecialAirS_IASACallback,	   // IASACallback
		SpecialAirS_PhysicCallback,	   // PhysicsCallback
		SpecialAirS_CollisionCallback, // CollisionCallback
		Fighter_UpdateCameraBox,	   // CameraCallback
	},
	// State: 347 - SpecialHi
	{
		299,						 // AnimationID
		0x340213,					 // StateFlags
		0x14,						 // AttackID
		0x0,						 // BitFlags
		SpecialHi_AnimationCallback, // AnimationCallback
		SpecialHi_IASACallback,		 // IASACallback
		SpecialHi_PhysicCallback,	 // PhysicsCallback
		SpecialHi_CollisionCallback, // CollisionCallback
		Fighter_UpdateCameraBox,	 // CameraCallback
	},
	// State: 348 - SpecialAirHi
	{
		300,							// AnimationID
		0x340613,						// StateFlags
		0x14,							// AttackID
		0x0,							// BitFlags
		SpecialAirHi_AnimationCallback, // AnimationCallback
		SpecialAirHi_IASACallback,		// IASACallback
		SpecialAirHi_PhysicCallback,	// PhysicsCallback
		SpecialAirHi_CollisionCallback, // CollisionCallback
		Fighter_UpdateCameraBox,		// CameraCallback
	},
	// State: 349 - SpecialLw
	{
		301,						 // AnimationID
		0x340214,					 // StateFlags
		0x15,						 // AttackID
		0x0,						 // BitFlags
		SpecialLw_AnimationCallback, // AnimationCallback
		SpecialLw_IASACallback,		 // IASACallback
		SpecialLw_PhysicCallback,	 // PhysicsCallback
		SpecialLw_CollisionCallback, // CollisionCallback
		Fighter_UpdateCameraBox,	 // CameraCallback
	},
	// State: 350 - SpecialAirLw
	{
		302,							// AnimationID
		0x340614,						// StateFlags
		0x15,							// AttackID
		0x0,							// BitFlags
		SpecialAirLw_AnimationCallback, // AnimationCallback
		SpecialAirLw_IASACallback,		// IASACallback
		SpecialAirLw_PhysicCallback,	// PhysicsCallback
		SpecialAirLw_CollisionCallback, // CollisionCallback
		Fighter_UpdateCameraBox,		// CameraCallback
	}};
