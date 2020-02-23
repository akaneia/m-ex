#To be inserted @ 80260bd4
.include "../../Globals.s"
.include "../Header.s"

.set  REG_CursorData,31
.set  REG_IconData,30
.set  REG_Count,29
.set  REG_Floats,28

backup

LoopStart:
#Get icon data
  lwz  REG_IconData,OFST_MnSlChrIconData(rtoc)
  addi	REG_IconData, REG_IconData, 220
#Init loop count
  li  REG_Count,0
#Get floats
  bl  Floats
  mflr  REG_Floats

Loop:
.set  REG_ThisIcon,27
.set  REG_ThisIconJObj,26
#Get this icons data
  mulli r3,REG_Count,28
  add REG_ThisIcon,r3,REG_IconData
  lwz	r3, -0x49E0 (r13)
  addi  r4,sp,0x80
  lbz r5,0x4(REG_ThisIcon)
  li  r6,-1
  crclr	6
  branchl r12,0x80011e24
  lwz  REG_ThisIconJObj,0x80(sp)

#Check if cursor is within bounds of it
#Get all floats
.set  REG_Width,9
.set  REG_Height,8
.set  REG_XOffset,7
.set  REG_YOffset,6
  lfs REG_Width,0x0(REG_Floats)
  lfs REG_Height,0x4(REG_Floats)
  lfs REG_XOffset,0x8(REG_Floats)
  lfs REG_YOffset,0xC(REG_Floats)
#Check if to the right of the left bound
  lfs f1,0x38(REG_ThisIconJObj)   #get icon X pos
  fadds f1,f1,REG_XOffset         #Offset
  lfs f2,0x0C(REG_CursorData)     #get cursor X pos
  fcmpo cr0,f2,f1                 #compare
  blt IncLoop
#Check if to the left of the right bound
  lfs f1,0x38(REG_ThisIconJObj)   #get icon X pos
  fadds f1,f1,REG_XOffset         #Offset
  fadds f1,f1,REG_Width           #add to get left bound
  lfs f2,0x0C(REG_CursorData)     #get cursor X pos
  fcmpo cr0,f2,f1                 #compare
  bgt IncLoop
#Check if above the bottom bound
  lfs f1,0x3C(REG_ThisIconJObj)   #get icon Y pos
  fadds f1,f1,REG_YOffset         #Offset
  fadds f1,f1,REG_Height          #add to get bottom bound
  lfs f2,0x10(REG_CursorData)     #get cursor Y pos
  fcmpo cr0,f2,f1                 #compare
  blt IncLoop
#Check if under the top bound
  lfs f1,0x3C(REG_ThisIconJObj)   #get icon Y pos
  fadds f1,f1,REG_YOffset         #Offset
  lfs f2,0x10(REG_CursorData)     #get cursor X pos
  fcmpo cr0,f2,f1                 #compare
  bgt IncLoop

#Check if unlocked?
  lbz	r0, 0x0002 (REG_ThisIcon)
  cmpwi r0,2
  blt IncLoop
#Display CSP
  mr  r3,REG_Count
  restore
  mr  r20,r3
  branch  r12,0x80260c20

IncLoop:
  addi  REG_Count,REG_Count,1
  cmpwi REG_Count,25 + NumOfAddedChars
  blt Loop

NotFound:
  restore
  branch  r12,0x80260da4

Floats:
blrl
.float  7.1   #Icon Width
.float  -7.2     #Icon Height
.float -2.6      #X offset
.float 1.25      #Y offset
