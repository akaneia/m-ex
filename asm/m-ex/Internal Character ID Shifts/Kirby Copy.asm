#To be inserted @ 800bda14
.include "../../Globals.s"
.include "../Header.s"

# check if wireframe boy
  lwz r12,OFST_Metadata_FtIntNum(rtoc)
  subi  r0,r12,4
  cmpw r3,r0
  beq IsWire
# check if wireframe girl
  lwz r12,OFST_Metadata_FtIntNum(rtoc)
  subi  r0,r12,3
  cmpw r3,r0
  beq IsWire
# check if sandbag
  lwz r12,OFST_Metadata_FtIntNum(rtoc)
  subi  r0,r12,1
  cmpw r3,r0
  beq IsSandbag
# check if nana
  cmpwi r3,11
  beq IsNana

b Exit
  
IsNana:
  li r3, 10
  b Exit

IsWire:
IsSandbag:
  lwz	r3, 0x2238 (r5)   # load kirbys index

Exit:
  branch r12,0x800bda3c