#To be inserted @ 8006f66c
.include "../../../Globals.s"
.include "../../Header.s"

.set  REG_FighterData,22

# get ft_kind from fighterdata instead of the animation flags
  lwz r29, 0x4(REG_FighterData)
