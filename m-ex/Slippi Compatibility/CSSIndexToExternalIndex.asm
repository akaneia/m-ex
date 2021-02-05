#To be inserted @ 800056b8
.include "../../Globals.s"
.include "../Header.s"

# Get CSS Char Id
  lwz  r3,OFST_MnSlChrIconData(rtoc)

EXIT:
  blr
