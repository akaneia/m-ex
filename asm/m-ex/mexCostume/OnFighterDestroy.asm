#To be inserted at 8006dbd0
.include "../../Globals.s"
.include "../Header.s"

.set REG_FighterData, 30

backup

# If exists
  lwz r3,MEX_FtModelAdd_num(REG_FighterData)
  cmpwi r3,0
  beq Exit

# Loop through all modeladddescs
.set REG_ModelDescCount,20
.set REG_FtModelAdd,22      # in fighter data
  li REG_ModelDescCount,0
  b ModelAddDescArr_LoopCheck
ModelAddDescArr_Loop:
    # Get this FtModelAdd
    lwz r3,MEX_FtModelAdd_ptr(REG_FighterData)
    mulli r0,REG_ModelDescCount,4
    lwzx REG_FtModelAdd,r3,r0

      # Free DObj lookup 
       lwz r3,mdAdd_DOBJLookup + mdAdd_dobjarr(REG_FtModelAdd)
       branchl r12,0x8037abc8

      # Free JObj
       lwz r3,mdAdd_JOBJ(REG_FtModelAdd)
       branchl r12,0x80371590

    # Free FtModelAdd
    lwzx REG_FtModelAdd,r3,r0
    branchl r12,HSD_Free

ModelAddDescArr_LoopAdd:
  addi REG_ModelDescCount,REG_ModelDescCount,1
ModelAddDescArr_LoopCheck:
  lwz r0,MEX_FtModelAdd_num(REG_FighterData)
  cmpw REG_ModelDescCount,r0
  blt ModelAddDescArr_Loop

# Free FtModelAdd
  lwz r3, MEX_FtModelAdd_ptr(REG_FighterData)
  branchl r12,HSD_Free

Exit:
  restore
  addi	r3, r31, 0