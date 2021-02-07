#To be inserted @ 8008602c
.include "../../Globals.s"
.include "../Header.s"

#Get pointer to ftData
lwz  r3,OFST_ftDataPointers(rtoc)

#Get popo's entry
  lwz r3,0xA * ftDataPointers_Stride (r3)
