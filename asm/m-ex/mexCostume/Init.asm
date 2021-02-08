#To be inserted at 8007b4c0
.include "../../Globals.s"
.include "../Header.s"

backup

.set REG_ModelAddDescArr,28
.set REG_FighterData,29
.set REG_CostumeArchive,30
.set REG_FighterGObj,31


  lwz REG_FighterGObj,0x0(REG_FighterData)

# Get costume dat archive
  lwz r3,0x4(REG_FighterData)
  lwz r4,OFST_Char_CostumeRuntimePointers(rtoc)
  mulli r3,r3,RuntimeCostumePointers_Stride
  lwzx r3,r3,r4
  lbz	r0, 0x0619 (REG_FighterData)
  mulli r0,r0,RuntimeCostumePointersSub_Stride
  add r3,r3,r0
  lwz REG_CostumeArchive,0x14(r3)


######################
## MODELADD DESCARR ##
######################

ModelAddDescArr_Check:
# Get custom string name
  mr r3,REG_CostumeArchive
  bl mexCostume_Symbol
  mflr r4
  branchl r12,0x80380358
# Check if costume has an mexCostume symbol
  cmpwi r3,0
  beq NoModelAdd
# Check if costume has a modelAdd node
  addi REG_ModelAddDescArr,r3,mexCostume_modeladd
  lwz r0,mdAddDescArr_num(REG_ModelAddDescArr)
  cmpwi r0,0
  beq NoModelAdd

# Copy modeladd_num
  lwz r0,mdAddDescArr_num(REG_ModelAddDescArr)
  stw r0,MEX_FtModelAdd_num(REG_FighterData)

# Alloc pointer array
  mulli r3,r0,4
  branchl r12,HSD_MemAlloc
  stw r3,MEX_FtModelAdd_ptr(REG_FighterData)

# Loop through all modeladddescs
.set REG_ModelDescCount,20
.set REG_ModelAddDesc,21    # descriptor, in file
.set REG_FtModelAdd,22      # in fighter data
  li REG_ModelDescCount,0
  b ModelAddDescArr_LoopCheck
ModelAddDescArr_Loop:
    # Get this ModelAddDesc
    lwz r3,mdAddDescArr_ptr(REG_ModelAddDescArr)
    mulli r0,REG_ModelDescCount,4
    lwzx REG_ModelAddDesc,r3,r0

    # Alloc this FtModelAdd
    li r3,mdAdd_size
    branchl r12,HSD_MemAlloc
    mr REG_FtModelAdd,r3
    # Store to array pointer
    lwz r3,MEX_FtModelAdd_ptr(REG_FighterData)
    mulli r0,REG_ModelDescCount,4
    stwx REG_FtModelAdd,r3,r0

        # Add model parts
            # Alloc DObj lookup 
            load r3,0x80459080
            branchl r12,0x8037abc8
            stw r3,mdAdd_DOBJLookup + mdAdd_dobjarr(REG_FtModelAdd)

            # Instantiate JObj
            lwz r3,mdAddDesc_JOBJ(REG_ModelAddDesc)
            branchl r12,HSD_JObjLoadJoint
            stw r3,mdAdd_JOBJ(REG_FtModelAdd)

            # Save attach bone
            lwz r0,mdAddDesc_attachbone(REG_ModelAddDesc)
            stw r0,mdAdd_attachbone(REG_FtModelAdd)

            # Init PObj
            branchl r12,0x80074148

            # Unk PObj
            branchl r12,0x80074170

            # Index DObj Lookup
            mr r3,REG_FighterGObj
            lwz r4,mdAdd_JOBJ(REG_FtModelAdd)
            addi	r5, REG_FtModelAdd, mdAdd_DOBJLookup
            branchl r12,0x80075650

            # Init FtParts
            addi	r6, REG_FtModelAdd, mdAdd_DOBJLookup
            mr	r7, r6
            li    r5,0
            addi	r4, REG_FtModelAdd, mdAdd_ftpartsvis
            addi  r3, REG_ModelAddDesc, mdAddDesc_modelvisdesc
            branchl r12,0x8007487c


        # Add all dynamics
        .set REG_DynamicsCount,23
        .set REG_DynamicsBoneset,24
        .set REG_DynamicsDesc,25
          li REG_DynamicsCount,0
          b Dynamics_Check
        Dynamics_Loop:
            # Get this dynamics desc
              lwz r3,mdAddDesc_dynamicsdesc(REG_ModelAddDesc)
              mulli r0,REG_DynamicsCount,4
              lwzx REG_DynamicsDesc,r3,r0
            # Get next boneset
              addi REG_DynamicsBoneset, REG_FighterData, 0x2F0
              lwz r3,0x3E0(REG_FighterData)
              mulli r0,r3,0x18
              add REG_DynamicsBoneset, REG_DynamicsBoneset, r0

            # Increment dynamic boneset num
              lwz r3,0x3E0(REG_FighterData)
              addi r3,r3,1
              stw r3,0x3E0(REG_FighterData)
            # Check if over max
              cmpwi r3,10
              bge DyanmicsOver

            # Get bone jobj
              lwz r3,mdAdd_JOBJ(REG_FtModelAdd)
              addi r4,sp,0x80
              lwz r5,0x0(REG_DynamicsDesc)
              li r6,-1
              branchl r12,0x80011e24

            # Create dynamics
              lwz r3,0x80(sp)
              addi r4,REG_DynamicsBoneset,0x4
              lwz r5,0x8(REG_DynamicsDesc)
              branchl r12,0x8000fd48

            # apply_phys_num
              li r0,0
              stw r0,0x0(REG_DynamicsBoneset)

            # Init boneset
              addi r3,REG_DynamicsDesc,0x4
              addi r4,REG_DynamicsBoneset,0x4
              branchl r12,0x80011710

        Dynamics_Inc:
        addi REG_DynamicsCount,REG_DynamicsCount,1
        Dynamics_Check:
        lwz r0,mdAddDesc_dynamicsnum(REG_ModelAddDesc)
        cmpw REG_DynamicsCount,r0
        blt Dynamics_Loop

        branchl r12,0x8021b2d8

        # Add all dynamics hit
        .set REG_DynamicsHitCount,23
        .set REG_DynamicsHit,24
        .set REG_DynamicsHitDesc,25
          li REG_DynamicsHitCount,0
          b DynamicsHit_Check
        DynamicsHit_Loop:
            # Get this dynamics desc
              lwz r3,mdAddDesc_dynamicshitdesc(REG_ModelAddDesc)
              mulli r0,REG_DynamicsHitCount,4
              lwzx REG_DynamicsHitDesc,r3,r0
            # Get next dynamics hit in fighter data
              addi REG_DynamicsHit, REG_FighterData, 0x1670
              lbz r3,0x166C(REG_FighterData)
              mulli r0,r3,0x28
              add REG_DynamicsHit, REG_DynamicsHit, r0

            # Increment dynamics hit num
              lbz r3,0x166C(REG_FighterData)
              addi r3,r3,1
              stb r3,0x166C(REG_FighterData)
            # Check if over max
              cmpwi r3,11
              bge DyanmicsHitOver

            # Store bone index
              lwz r3,0x0(REG_DynamicsHitDesc)
              stw r3,0x24(REG_DynamicsHit)
            # Store bone pointer
              lwz r3,0x0(REG_DynamicsHitDesc)
              lwz	r4, 0x05E8 (REG_FighterData)
              mulli r3,r3,0x10
              lwzx r3,r3,r4
              stw r3,0x10(REG_DynamicsHit)
            # Store offset
              lfs f1,0x4(REG_DynamicsHitDesc)
              stfs f1,0x0(REG_DynamicsHit)
              lfs f1,0x8(REG_DynamicsHitDesc)
              stfs f1,0x4(REG_DynamicsHit)
              lfs f1,0xC(REG_DynamicsHitDesc)
              stfs f1,0x8(REG_DynamicsHit)
            # Store size
              lfs f1,0x10(REG_DynamicsHitDesc)
              stfs f1,0xC(REG_DynamicsHit)

        DynamicsHit_Inc:
        addi REG_DynamicsHitCount,REG_DynamicsHitCount,1
        DynamicsHit_Check:
        lwz r0,mdAddDesc_dynamicshitnum(REG_ModelAddDesc)
        cmpw REG_DynamicsHitCount,r0
        blt DynamicsHit_Loop

ModelAddDescArr_LoopAdd:
  addi REG_ModelDescCount,REG_ModelDescCount,1
ModelAddDescArr_LoopCheck:
  lwz r0,mdAddDescArr_num(REG_ModelAddDescArr)
  cmpw REG_ModelDescCount,r0
  blt ModelAddDescArr_Loop

b Exit

mexCostume_Symbol:
blrl
.string "mexCostume"
.align 2

#############################################
DyanmicsOver:
#OSReport
  bl  ErrorString
  mflr  r3
  lwz  r4,OFST_MnSlChrCostumeFileSymbols(rtoc)
  lwz	r0, 0x04 (REG_FighterData)
  mulli r0,r0,4
  lwzx r4,r4,0
  lbz	r0, 0x0619 (REG_FighterData)
  mulli r0,r0,CostumeFileSymbols_Stride
  add r4,r4,r0
  lwz r4,CostumeFileSymbols_FileName(r4)
  branchl r12,0x803456a8
#Assert
  bl  Assert_Name
  mflr  r3
  li  r4,0
  load  r5,0x804d3940
  branchl r12,0x80388220
#############################################
DyanmicsHitOver:
#OSReport
  bl  DynHitErrorString
  mflr  r3
  lwz  r4,OFST_MnSlChrCostumeFileSymbols(rtoc)
  lwz	r0, 0x04 (REG_FighterData)
  mulli r0,r0,4
  lwzx r4,r4,0
  lbz	r0, 0x0619 (REG_FighterData)
  mulli r0,r0,CostumeFileSymbols_Stride
  add r4,r4,r0
  lwz r4,CostumeFileSymbols_FileName(r4)
  branchl r12,0x803456a8
#Assert
  bl  Assert_Name
  mflr  r3
  li  r4,0
  load  r5,0x804d3940
  branchl r12,0x80388220
#############################################
Assert_Name:
blrl
.string "m-ex"
.align 2
ErrorString:
blrl
.string "error: costume %s uses more than 10 dynamics\n"
.align 2
DynHitErrorString:
blrl
.string "error: costume %s uses more than 11 dynamics hits\n"
.align 2
###############################################

NoModelAdd:
  li r0,0
  stw r0,MEX_FtModelAdd_num(REG_FighterData)
  stw r0,MEX_FtModelAdd_ptr(REG_FighterData)

Exit:
  restore
  lwz	r0, 0x002C (sp)