#include "mario.h"

////////////////////////
//  Helper Functions  //
////////////////////////

/// @brief Original: 0x800e132c removes reference to cape item from fighter
/// @param fighter 
void Mario_RemoveCapeItem(GOBJ *fighter)
{
    FighterData *fd = (FighterData *)fighter->userdata;
	MarioCharVar *charvar = (MarioCharVar *)&fd->fighter_var;

    // clear hitlag flag
    if (charvar->item_cape != 0)
        Item_ClearHitlagFlag(charvar->item_cape);

    // clear reference to cape item
    charvar->item_cape = 0;

    // clear callbacks
    fd->cb.OnDeath_State = 0;
    fd->cb.OnTakeDamage = 0;
    return;
}

////////////////////////
//   Item Functions   //
////////////////////////

/// @brief Original: 0x802B2644
/// @param item 
/// @return true if item should be destroyed and false otherwise
bool OnDestroy(GOBJ *item)
{
    ItemData *id = (ItemData *)item->userdata;
    GOBJ *fighter = id->fighter_gobj;

    // check if fighter is not null
    if (fighter)
    {   
        // remove cape from fighter
        Mario_RemoveCapeItem(fighter);
    }

    return false;
}

/// @brief Original: 0x802B2700
/// @param item 
/// @return true if item should be destroyed and false otherwise
bool OnPickup(GOBJ *item)
{
    ItemData *id = item->userdata;
    CapeItCmdFlags *flags = Item_GetItCmdFlags(item);

    // clear itcmd flags
    // these flags are set via action scripts
    // within the fighter's files
    flags->spawn_effect1 = 0;
    flags->spawn_effect2 = 0;

    // check if item is held by fighter
    if (id->fighter_gobj)
    {
        // check if item is grounded or airborne
        if (Item_GetGroundAirState(item) == 1)
        {   
            // enter airborne animation state
            ItemStateChange(item, 1, 2);
        }
        else
        {   
            // enter grounded animation state
            ItemStateChange(item, 0, 2);
        }

        // apply first frame of animation and subaction immediatly
        Item_AnimateAndUpdateSubactions(item);

        // scale cape to fighter's size
        Item_ScaleToPlayerSize(item);
    }

    return false;
}

/// @brief Original: 0x802B2870
/// @param item 
/// @param fighter 
void OnUnknown3(GOBJ *item, GOBJ *fighter)
{
    Item_RemoveFighterReference(item, fighter);
    return;
}

////////////////////////
//  State Functions   //
////////////////////////

/// @brief Original: 0x800e1428 Checks if the fighters current state is valid
/// @param fighter 
/// @return true if fighter is not in valid SPECIALS state and false otherwise
bool Mario_NotInSpecialS(GOBJ *fighter)
{
    FighterData *fd = fighter->userdata;

    int state = fd->state_id;
    
    if (state >= STATE_SPECIALS &&
        state <= STATE_SPECIALSAIR)
        return false;

    return true;
}

/// @brief Original: 0x802B2788
/// @param gobj 
/// @return true if item should be destroyed and false otherwise
bool Cape_AnimCallback(GOBJ *item)
{
    ItemData *id = (ItemData *)item->userdata;
    CapeItCmdFlags *flags = Item_GetItCmdFlags(item);

    // check to spawn effects
    // these flags get set via the items script within the files
    if (flags->spawn_effect1)
    {
        flags->spawn_effect1 = 0;
        Effect_SpawnAsync(item, &id->effect, 0, VANILLA_EFFECT_CAPE1, id->bones[16]);
    }
    if (flags->spawn_effect2)
    {
        flags->spawn_effect2 = 0;
        Effect_SpawnAsync(item, &id->effect, 0, VANILLA_EFFECT_CAPE2, id->bones[6]);
    }

    // check if fighter is null or not in special s state
    // destroy the item in those cases
    GOBJ *fighter = id->fighter_gobj;
    bool destroy_item = fighter == 0 || Mario_NotInSpecialS(fighter);
    return destroy_item;
}

/// @brief \
This is the state struct that will get referenced when calling ItemStateChange\
The added attribute tag is necessary to prevent this structure from getting\
optimized away by certain compiler versions
__attribute__((used)) 
static struct ItemState item_state_table[] =
{
    {
        .state = 0,
        .animCallback = Cape_AnimCallback,
        .physCallback = 0,
        .collCallback = 0,
    },
    {
        .state = 1,
        .animCallback = Cape_AnimCallback,
        .physCallback = 0,
        .collCallback = 0,
    }
};