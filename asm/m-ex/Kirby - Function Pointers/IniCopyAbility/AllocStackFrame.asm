#To be inserted @ 800eed58
.include "../../../Globals.s"
.include "../../Header.s"


stwu	sp, -0x0020 - 4 (sp)

# init archive pointer to 0
  li r0,0
  stw r0,0x20(sp)