#To be inserted @ 801695f0
.include "../../../Globals.s"
.include "../../Header.s"

# limiting random costumes to 6 because they are all loaded to ARAM,
# and if enough costumes are present, we can quickly run out of memory.

# get costume amount
  rlwinm.	r31, r3, 0, 24, 31
  cmpwi   r31, 6
  ble Exit
  li r31, 6

Exit:
