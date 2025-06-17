///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///
/// Custom Sword Trail Example 
///
/// This example describes how to use sword trails with m-ex
///
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#include "../../MexTK/mex.h"

// an incomplete description of Marth's attributes, the only thing 
// that matters for us is the location of his 
// sword trail (afterimage) descriptor
typedef struct MarthAttr
{
    int padding[0x1E]; // these are marth's other attributes
    AfterImageDesc desc; // at offset 0x78 is his trail descriptor
} MarthAttr;

/// @brief This m-ex hook should return a pointer to the definition of the sword trail
/// @param fighter 
/// @return pointer to sword trail description data
AfterImageDesc *GetTrailData(GOBJ *fighter)
{
    // get fighters user data
    FighterData *fd = (FighterData *)fighter->userdata;

    // get pointer to marth's static attributes
    MarthAttr *attr = (MarthAttr *)fd->special_attributes;

    // return the address of the after image desc
    return &attr->desc;

    // you may alternately return a static pointer defined in code if you wish
    // static AfterImageDesc desc = 
    // {
    //     .x0 = 0.2,
    //     .x4 = 1,
    //     .start_alpha = 255,
    //     .end_alpha = 0,
    //     .in_col = {0, 255, 255, 0},
    //     .out_col = {255, 255, 255, 0},
    //     .bone_index = 75,
    //     .offset_bottom = 1.75,
    //     .offset_top = 9.63,
    // };
    // return &desc;
}