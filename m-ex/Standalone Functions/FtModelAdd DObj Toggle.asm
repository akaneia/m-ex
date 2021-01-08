#To be inserted at 803d7098
.include "../../Globals.s"
.include "../Header.s"


.set REG_Unk,29
.set REG_Pass,30
.set REG_FighterData,31

backup
mr REG_FighterData,r3
mr REG_Pass,r4
mr REG_Unk,r5

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

      # Decide how to toggle?
        cmpwi REG_Unk,0
        beq UnkToggle
        b UnkToggle2

        UnkToggle:
          addi r3,REG_FtModelAdd,mdAdd_ftpartsvis
          mr r4,REG_Pass
          addi r5,REG_FtModelAdd,mdAdd_DOBJLookup
          branchl r12,0x80074d7c
          b FtModelAddArr_LoopAdd

        UnkToggle2:
          addi r3,REG_FtModelAdd,mdAdd_ftpartsvis
          mr r4,REG_Pass
          addi r5,REG_FtModelAdd,mdAdd_DOBJLookup
          branchl r12,0x80074ca0
          b FtModelAddArr_LoopAdd

FtModelAddArr_LoopAdd:
  addi REG_ModelAddCount,REG_ModelAddCount,1
FtModelAddArr_LoopCheck:
  lwz r0,MEX_FtModelAdd_num(REG_FighterData)
  cmpw REG_ModelAddCount,r0
  blt FtModelAddArr_Loop

b Exit


Exit:
  restore
  blr