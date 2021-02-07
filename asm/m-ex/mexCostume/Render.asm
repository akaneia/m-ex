#To be inserted at 80080bcc
.include "../../Globals.s"
.include "../Header.s"

backup

.set REG_Unk,28
.set REG_ModelAddDescArr,30
.set REG_FighterData,31

# Loop through all FtModelAdds
.set REG_ModelAddCount,20
.set REG_FtModelAdd,21      # in fighter data
.set REG_AttachBoneJOBJ,22
.set REG_ModelAddJOBJ,23
  li REG_ModelAddCount,0
  b FtModelAddArr_LoopCheck
FtModelAddArr_Loop:
    # Get this FtModelAdd
      lwz r3,MEX_FtModelAdd_ptr(REG_FighterData)
      mulli r0,REG_ModelAddCount,4
      lwzx REG_FtModelAdd,r3,r0

    # Ensure JOBJ exists
      lwz REG_ModelAddJOBJ,mdAddDesc_JOBJ(REG_FtModelAdd)
      cmpwi REG_ModelAddJOBJ,0
      beq FtModelAddArr_LoopAdd

      # Get bone to attach to
        lwz r3,0x5E8(REG_FighterData)
        lwz r0,mdAdd_attachbone(REG_FtModelAdd)
        mulli r0,r0,0x10
        lwzx REG_AttachBoneJOBJ,r3,r0
      # Sub MTX
        mr r3,REG_AttachBoneJOBJ
        branchl r12,HSD_JObjSetMtxDirtySub
      # MTX Copy
        addi r3,REG_AttachBoneJOBJ,0x44
        addi r4,REG_ModelAddJOBJ,0x44
        branchl r12,0x803421d0
      # Set JOBJ flags on model add jobj
        lwz r3,0x14(REG_ModelAddJOBJ)
        oris r3,r3,0x0380
        stw r3,0x14(REG_ModelAddJOBJ)
      # Sub MTX
        mr r3,REG_ModelAddJOBJ
        branchl r12,HSD_JObjSetMtxDirtySub
      # Get RenderPass
        mr r3,REG_Unk
        branchl r12,0x80390eb8
        mr r5,r3
      # Disp
        mr r3, REG_ModelAddJOBJ
        li r4,0
        li r6,0
        branchl r12,0x803709dc

FtModelAddArr_LoopAdd:
  addi REG_ModelAddCount,REG_ModelAddCount,1
FtModelAddArr_LoopCheck:
  lwz r0,MEX_FtModelAdd_num(REG_FighterData)
  cmpw REG_ModelAddCount,r0
  blt FtModelAddArr_Loop


Exit:
  restore
  mr	r3, r31