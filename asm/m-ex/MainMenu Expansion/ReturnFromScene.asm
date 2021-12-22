#To be inserted @ 801b1360
.include "../../Globals.s"
.include "../Header.s"

# check for a vanilla scene (use main menu)\
  branchl r12,0x801a4320
  cmpwi r3,44
  ble isVanilla

# this code runs when a non vanilla scene returns to the main menu
# storing -1 to indicate to "Load MxMn.asm" to adjust this value
  li r0,-1
  b Exit

isVanilla:
# use menu 0 if coming from a vanilla scene
  li r0,0

Exit: