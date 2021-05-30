#To be inserted @ 80186678
.include "../../../Globals.s"
.include "../../Header.s"

# get table


.set  REG_Count,12
.set  REG_Lookup, 11
#Init
  li  REG_Count,0
  lwz r3,OFST_mexData(rtoc)
  lwz r3,Arch_Fighter(r3)
  lwz REG_Lookup,Arch_Fighter_RuntimeIntroPointers(r3)

Loop:
#Init as 0
  li  r3,0
  stw r3,0x0(REG_Lookup)  

IncLoop:
  addi  REG_Lookup,REG_Lookup,RuntimeIntroPointers_Stride
  addi  REG_Count,REG_Count,1
  lwz r3,OFST_Metadata_FtIntNum(rtoc)
  cmpw REG_Count,r3
  blt Loop

Exit:
  li	r3, 12