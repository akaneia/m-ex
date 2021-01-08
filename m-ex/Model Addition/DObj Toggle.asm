#To be inserted at 80075124
.include "../../Globals.s"
.include "../Header.s"

# call custom
  mr r3,r30
  li r4,2
  mr r5,r31
  branchl r12,FtModelAdd_DObjToggle

lwz	r4, 0x0004 (r30)