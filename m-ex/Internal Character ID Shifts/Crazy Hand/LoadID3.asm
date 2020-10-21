#To be inserted @ 801554a4
.include "../../../Globals.s"
.include "../../Header.s"

lwz r3,OFST_Metadata_FtIntNum(rtoc)
subi  r3,r3,5