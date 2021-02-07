#To be inserted @ 80229c14
.include "../../Globals.s"
.include "../Header.s"

# check if exists
  lwz r12,OFST_mexMenu(r13)
  cmpwi r12,0
  beq Original
  lwz r31,mexMenu_MenuNameFrames(r12)
  subi  r31,r31,0x24    # offset cause original struct 
  b Exit


Original:
  subi	r31, r5, 20888

Exit: