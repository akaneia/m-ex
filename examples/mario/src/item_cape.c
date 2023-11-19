#include "mario.h"
////////////////////////
//        Cape        //
////////////////////////
///
/// 0x800e132c
///
void RemoveCapeItem(GOBJ *gobj)
{
    Fighter_RemoveHeldFighterItem(gobj);

    FighterData *fighter_data = gobj->userdata;

    fighter_data->fighter_var.ft_var5 = 0;

    fighter_data->cb.OnDeath_State = 0x0;
    fighter_data->cb.OnTakeDamage = 0x0;
    return;
}
///
/// OnDestroy 0x802B2644
///
int OnDestroy(GOBJ *gobj)
{
    ItemData *item_data = gobj->userdata;

    GOBJ *fighter_gobj = item_data->fighter_gobj;

    if (fighter_gobj)
    {
        RemoveCapeItem(fighter_gobj);
    }

    return 0;
}
///
/// OnPickup 0x802B2700
///
int OnPickup(GOBJ *gobj)
{
    ItemData *item_data = gobj->userdata;

    item_data->itcmd_var.flag1 = 0;
    item_data->itcmd_var.flag2 = 0;

    if (item_data->fighter_gobj)
    {
        if (Item_GetGroundAirState(gobj) == 1)
        {
            ItemStateChange(gobj, 1, 2);
        }
        else
        {
            ItemStateChange(gobj, 0, 2);
        }
        Item_AnimateAndUpdateSubactions(gobj);
        Item_ScaleToPlayerSize(gobj);
    }

    return 0;
}

// OnUnknown3 0x802B2870

///
/// 0x800e1428
///
int IsSpecialS_State(GOBJ *gobj)
{
    FighterData *fighter_data = gobj->userdata;

    int state = fighter_data->state_id;

    if (state >= STATE_SPECIALS &&
        state <= STATE_SPECIALSAIR)
        return 0;

    return 1;
}
///
/// 0x802B2788
///
int Cape_AnimCallback(GOBJ *gobj)
{
    ItemData *item_data = gobj->userdata;

    if (item_data->itcmd_var.flag1 != 0)
    {
        item_data->itcmd_var.flag1 = 0;
        Effect_SpawnAsync(gobj, (int)gobj->userdata + 0xbc0, 0, 0x47d, *(int *)(item_data->xbbc + 0x40));
    }

    if (item_data->itcmd_var.flag2 != 0)
    {
        item_data->itcmd_var.flag2 = 0;
        Effect_SpawnAsync(gobj, (int)gobj->userdata + 0xbc0, 0, 0x47e, *(int *)(item_data->xbbc + 0x18));
    }

    GOBJ *fighter_gobj = item_data->fighter_gobj;
    int return_var;

    if (fighter_gobj == 0x0)
    {
        return_var = 1;
    }
    else
    {
        return_var = IsSpecialS_State(fighter_gobj);
    }

    if (return_var == 0)
    {
        return_var = 0;
    }
    else
    {
        if (fighter_gobj != 0x0)
        {
            RemoveCapeItem(fighter_gobj);
        }
        return_var = 1;
    }

    return return_var;
}
///
/// item states
///
__attribute__((used)) static struct ItemState item_state_table[] =
    {
        {
            0,                 // anim ID
            Cape_AnimCallback, // anim callback
            0,                 // phys callback
            0,                 // coll callback
        },
        {
            1,                 // anim ID
            Cape_AnimCallback, // anim callback
            0,                 // phys callback
            0,                 // coll callback
        },
};