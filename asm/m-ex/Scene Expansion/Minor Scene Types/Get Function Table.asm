#To be inserted @ 801a4d14
.include "../../../Globals.s"
.include "../../Header.s"

lwz r12,OFST_MetaData_TermMinor(rtoc)
cmplw	r0, r12
