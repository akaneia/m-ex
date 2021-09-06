#To be inserted at 8025fe6c
.include "../../Globals.s"
.include "../Header.s"

# the CSS has code to preserve kirbys costume when pressing B to return
# the puck when hovered over the random icon area apparently...
# https://twitter.com/danielddizzle/status/1434554498832379909
# the game compares the current icons CKIND to the 13th icon's CKIND (kirby),
# so instead im gonna just hardcode check against kirbys CKIND, since the m-ex
# can change the order of the icons

li r0, 4