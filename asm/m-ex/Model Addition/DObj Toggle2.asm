#To be inserted at 80075188
.include "../../Globals.s"
.include "../Header.s"

# call custom
  mr r3,r30
  li r4,3
  mr r5,r31
  branchl r12,FtModelAdd_DObjToggle

lwz	r4, 0x0004 (r30)