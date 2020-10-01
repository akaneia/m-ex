#To be inserted @ 80229dec
.include "../../Globals.s"
.include "../Header.s"

.set REG_Dest, 29

# check if exists
  lwz r12,OFST_mexMenu(r13)
  cmpwi r12,0
  beq Original
  lwz REG_Dest,mexMenu_MenuNameFrames(r12)
  subi  REG_Dest,REG_Dest,0x24    # offset cause original struct 
  b Exit


Original:
  subi	REG_Dest, r5, 20888

Exit: