#To be inserted @ 801b1360
.include "../../Globals.s"
.include "../Header.s"

# this injection runs when a non vanilla scene returns to the main menu
# storing -1 to indicate to "Load MxMn.asm" to adjust this value
  li r0,-1