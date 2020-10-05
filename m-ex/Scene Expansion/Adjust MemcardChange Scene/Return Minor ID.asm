#To be inserted @ 8001ceac
.include "../../../Globals.s"
.include "../../Header.s"

lwz r3,OFST_MetaData_MajorNum(rtoc)
#subi    r3,r3,1