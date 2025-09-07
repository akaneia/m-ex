#Check if Slippi
  load r3, 0x801a5014
  lwz r3, 0x0(r3)
  load r4, 0x40820010
  cmpw r3, r4
  bne EndPatches

#Apply Slippi patches
  bl SlippiPatches
  mflr  r22

ApplySlippiPatchLoop:
  lwz r3,0x00(r22)
  cmpwi r3,-1
  beq EndPatches

#Apply Patch
  lwz r4,0x04(r22)
  stw r4,0x00(r3)

#Flush Cache
  li r4, 4
  branchl r12,0x80328f50

#Advance to next entry
  addi r22, r22, 8
  b ApplySlippiPatchLoop

SlippiPatches:
blrl
.long 0x800163f8 # CheckOnFileLength
.long 0x4bfffe0d
.long 0x800166b4 # CheckOnFileRead
.long 0x4bfffb51
.long -1

EndPatches:
