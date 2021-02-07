#To be inserted at 800751f0
.include "../../Globals.s"
.include "../Header.s"

# call custom
  mr r3,r30
  mr r4,r29
  mr r5,r31
  branchl r12,FtModelAdd_DObjToggle

lwz	r4, 0x0004 (r30)