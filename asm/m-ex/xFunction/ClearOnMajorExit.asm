#To be inserted @ 801a44f8
.include "../../Globals.s"
.include "../Header.s"

.set REG_xFuncLookup, 12

  lwz REG_xFuncLookup,OFST_XFunctionLookup(rtoc)
  
# set num
  li r3, 0
  stw r3, xFuncLookup_Num (REG_xFuncLookup)
# clear pointers
  addi r3,REG_xFuncLookup,xFuncLookup_Start                   # get to xFunction ptr array
  li r4,0
  li r5, xFuncLookup_Max * xFuncLookup_Start_Size
  branchl r12,memset

Exit:
  lbz	r3, 0x0001 (r31)