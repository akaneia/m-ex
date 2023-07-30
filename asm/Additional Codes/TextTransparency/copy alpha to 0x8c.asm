#To be inserted at 803a8d90
.include "../../Globals.s"

# orig
stb	r0, 0x008E (r31)

lbz r0, 0x33(r31)
stb	r0, 0x008F (r31)
