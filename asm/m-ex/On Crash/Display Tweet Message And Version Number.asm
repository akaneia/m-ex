#To be inserted at 80394a6c
.include "../../Globals.s"
.include "../Header.s"

# Remove all previous OSReports
  #load r3,0x804cf7e8
  #li  r4,0
  #stw r4,0xC(r3)

# Play SFX?
  li r3, 317 #188 = warning #317 = gasp
  branchl r12,0x801c53ec

#############################
## OS Report Tweet Message ##
#############################

load	r20,0x803456a8			  # OSReport
lwz r29,OFST_Metadata(rtoc) # get meta data
cmpwi r29, 0
beq Exit
lwz r29,0x3C(r29)          # load build info
cmpwi r29, 0
beq Exit

#OSReport Error Message
  bl	Header
  mflr	r3
  lwz r4,0x0C(r29)
  mtctr	r20
  bctrl

#OSReport Version
  bl	Version
  mflr	r3
  lwz r4,0x00(r29)
  lbz r5,0x04(r29)
  lbz r6,0x05(r29)
  lbz r7,0x06(r29)
  mtctr	r20
  bctrl

b	Exit

#########################################################

Header:
blrl
.string "\n%s\n\n"
.align 2

Version:
blrl
.string "%s v%d.%d.%d\n"
.align 2

#########################################################

Exit:
addi	r3, r30, 2252