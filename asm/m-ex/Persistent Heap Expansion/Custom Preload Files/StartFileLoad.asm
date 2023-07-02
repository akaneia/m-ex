#To be inserted @ 80017c08
.include "../../../Globals.s"
.include "../../Header.s"

# Custom file kinds trigger the same as default
  cmpwi r3, 5
  bne Exit
  branch r12,0x80017c20

Exit:
  cmpwi	r3, 2