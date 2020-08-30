#To be inserted @ 800f7b94
.include "../../Globals.s"
.include "../Header.s"

.set REG_FighterData,31
.set REG_VictimGObj,29

#Store pointer to this fighter
  stw REG_VictimGObj,MEX_kbAbilitySource(REG_FighterData)

#Orig
addi	r3, r28, 0