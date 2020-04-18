#To be inserted @ 80260bd4
.include "../../../Globals.s"
.include "../../Header.s"

#Check for mexSelectChr
  lwz r3,OFST_mexSelectChr(r13)
  cmpwi r3,0
  beq Original

.set  REG_CursorData,31
.set  REG_IconData,30
.set  REG_Count,29
.set  REG_Floats,28
.set  REG_NumOfIcons,27

backup

LoopStart:
.set  REG_CursorX,12
.set  REG_CursorY,11
#Get icon data
  lwz  REG_IconData,OFST_MnSlChrIconData(rtoc)
  addi	REG_IconData, REG_IconData, 220
#Init loop count
  li  REG_Count,0
#Get icon count
  lwz REG_NumOfIcons,OFST_Metadata_CSSIconCount(rtoc)
#Adjust cursor position
  bl  Floats
  mflr  r3
  lfs f1,0x4(r3)
  lfs f2,0x8(r3)
  lfs REG_CursorX,0x0C(REG_CursorData)     #get cursor X pos
  lfs REG_CursorY,0x10(REG_CursorData)     #get cursor Y pos
  fadds REG_CursorX,REG_CursorX,f1
  fadds REG_CursorY,REG_CursorY,f2

Loop:
.set  REG_ThisIcon,26
.set  REG_ThisIconJObj,25
#Get this icons data
  mulli r3,REG_Count,28
  add REG_ThisIcon,r3,REG_IconData

#Get this icons joint
  lwz	r3, OFST_mexSelectChr_IconJoint (r13)
  addi  r4,sp,0x80
  addi  r5,REG_Count,1
  li  r6,-1
  crclr	6
  branchl r12,0x80011e24
  lwz  REG_ThisIconJObj,0x80(sp)

#Offset definitions
.set  OFST_X,0xC
.set  OFST_Width,0x10
.set  OFST_Y,0x14
.set  OFST_Height,0x18

#Get all floats
.set  REG_LeftBound,9
.set  REG_RightBound,8
.set  REG_BottomBound,7
.set  REG_TopBound,6
#Determine left bound
  lfs f1,0x38(REG_ThisIconJObj)
  lfs f2,OFST_X(REG_ThisIcon)
  fadds REG_LeftBound,f1,f2
#Determine right bound
  lfs f1,OFST_Width(REG_ThisIcon)
  fadds REG_RightBound,REG_LeftBound,f1
#Determine bottom bound
  lfs f1,0x3C(REG_ThisIconJObj)
  lfs f2,OFST_Y(REG_ThisIcon)
  fadds REG_BottomBound,f1,f2
#Determine top bound
  lfs f1,OFST_Height(REG_ThisIcon)
  fadds REG_TopBound,REG_BottomBound,f1

#Check if cursor is within bounds of it
#Check if to the right of the left bound
  fcmpo cr0,REG_CursorX,REG_LeftBound                 #compare
  blt IncLoop
#Check if to the left of the right bound
  fcmpo cr0,REG_CursorX,REG_RightBound                 #compare
  bge IncLoop
#Check if above the bottom bound
  fcmpo cr0,REG_CursorY,REG_BottomBound                 #compare
  blt IncLoop
#Check if under the top bound
  fcmpo cr0,REG_CursorY,REG_TopBound                 #compare
  bge IncLoop

/*
#Check if unlocked?
  lbz	r0, 0x0002 (REG_ThisIcon)
  cmpwi r0,2
  blt IncLoop
*/
#Display CSP
  mr  r3,REG_Count
  restore
  mr  r20,r3
  branch  r12,0x80260c20
  b Exit

IncLoop:
  addi  REG_Count,REG_Count,1
  cmpw REG_Count,REG_NumOfIcons
  blt Loop

Exit:
NotFound:
  restore
  branch  r12,0x80260da4

Floats:
blrl
.float 2         #2
.float 2      #X offset
.float -1.25      #Y offset
.align 2

Original:
  #addi	r3, r30, 220
  load  r3,0x803f0b24 # using old icon data if no symbol is present
