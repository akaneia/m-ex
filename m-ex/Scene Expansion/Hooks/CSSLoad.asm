#To be inserted @ 802640f8
.include "../../../Globals.s"
.include "../../Header.s"

# orig codeline
stmw	r17, 0x011C (sp)

# somehow check for a css sceneload function
  lwz r3,OFST_scCSSLoad(rtoc)
  cmpwi r3,0
  beq   Original
  mtctr r3
  bctrl

Exit:
 branch r12,0x8026681c

Original: