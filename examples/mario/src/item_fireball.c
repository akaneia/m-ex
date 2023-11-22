#include "mario.h"

////////////////////////
//   Item Functions   //
////////////////////////

/// @brief Original: 0x8029BA38
/// @param item 
/// @return true if item should be destroyed and false otherwise
bool OnGiveDamage(GOBJ *gobj)
{
    return true;
}

/// @brief Original: 0x8029BA78
/// @param item 
/// @return true if item should be destroyed and false otherwise
bool OnHitShieldBounce(GOBJ *item)
{
    Item_BounceOffShield(item);
    return false;
}

/// @brief Original: 0x8029BA68
/// @param item 
/// @return true if item should be destroyed and false otherwise
bool OnHitShieldDetermineDestroy(GOBJ *item)
{
    return true;
}

/// @brief Original: 0x8029BA40
/// @param item 
/// @return true if item should be destroyed and false otherwise
bool OnReflect(GOBJ *item)
{
    Item_ReflectVelocity(item);
    return false;
}

/// @brief Original: 0x8029BA60
/// @param item 
/// @return true if item should be destroyed and false otherwise
bool OnUnknown1(GOBJ *item)
{
    return true;
}

/// @brief Original: 0x8029BA70
/// @param gobj 
/// @return true if item should be destroyed and false otherwise
bool OnUnknown2(GOBJ *gobj)
{
    return true;
}

/// @brief Original: 0x8029BA98
/// @param gobj 
/// @param fighter 
void OnUnknown3(GOBJ *gobj, GOBJ *fighter)
{
    Item_RemoveFighterReference(gobj, fighter);
    return;
}

////////////////////////
//  State Functions   //
////////////////////////

/// @brief Original: 0x8029b8a0
/// @param gobj 
/// @return 1 if item should be destroyed and 0 otherwise
bool Fireball_AnimCB(GOBJ *item)
{
    return Item_DecLifeTimer(item);
}

/// @brief Original: 0x8029b8a0
/// @param gobj 
/// @return 1 if item should be destroyed and 0 otherwise
bool Fireball_PhysCB(GOBJ *item)
{
    ItemData *item_data = item->userdata;
    itCommonAttr *attributes = item_data->common_attr;
    itCommonData *stc_itCommon = *stc_itPublicData;

    Item_ProjectileVelocityCalculate(item, attributes->fall_speed, attributes->fall_speed_max);
    Item_UpdateSpin(item, stc_itCommon->x68);

    return;
}

/// @brief Original: 0x8029B8EC
/// @param item 
/// @return 1 if item should be destroyed and 0 otherwise
bool Fireball_CollCB(GOBJ *item)
{
    ItemData *item_data = (ItemData *)item->userdata;
    FireballAttr *attr = (FireballAttr *)item_data->itData->param_ext;
    JOBJ *jobj = (JOBJ *)item->hsd_object;

    // update item collision parameters
    Item_UpdatePositionCollision(item);

    // apply bounce physics and check if fireball bounced off of wall
    // this function will return 1 if the item collided with something
    // in addition it will make the item "bounce" off of any surface
    if (Item_Coll_Bounce(item))
    {
        // check to see if the current speed is within a certain threshold
        // if speed is slower than a given attribute, then destroy the fireball
        // by return 1
        float x_vel = item_data->self_vel.X;
        float y_vel = item_data->self_vel.Y;
        float speed = sqrtf(x_vel * x_vel + y_vel * y_vel);
        
        if (speed < attr->max_speed)
        {
            // if speed is lower than threshold, destroy fireball
            return 1;
        }
        else
        {
            // otherwise play fire sfx and spawn hit effect
            Item_PlayOnDestroySFXAgain(item_data, VANILLA_SOUND_FIREBALL_DESTROY, 0x7f, 0x40);
            Effect_SpawnAsync(item, &item_data->effect, 1, VANILLA_EFFECT_FIREBALL_FLAME, jobj);
        }
    }

    return false;
}

/// @brief \
This is the state struct that will get referenced when calling ItemStateChange\
The added attribute tag is necessary to prevent this structure from getting\
optimized away by certain compiler versions
__attribute__((used)) 
static struct ItemState item_state_table[] =
{
    // state 0: 
    {
        .state = 0,
        .animCallback = Fireball_AnimCB,
        .physCallback = Fireball_PhysCB,
        .collCallback = Fireball_CollCB,
    }
};