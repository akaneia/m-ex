#To be inserted @ 801b1368
.include "../../Globals.s"
.include "../Header.s"

# this injection runs when a non vanilla scene returns to the main menu

# use whatever the previous menu and cursor value was
load  r3,0x804a04f0
lbz r0,0x0(r3)
stb r0,0x0(r31)
lhz r0,0x2(r3)
stb r0,0x1(r31)

Exit: