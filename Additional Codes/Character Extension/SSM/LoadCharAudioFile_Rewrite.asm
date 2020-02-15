#To be inserted @ 80026cbc
.include "../../../Globals.s"
.include "../Header.s"

.set  REG_Count,12

LoopStart:
  li  r4,0
  addi	r5, r31, 720
  addi	r6, r30, SSM_DisposableCopy_OFST
  addi	r7, r30, SSM_PersistentOrig_OFST
  li  REG_Count,0
Loop:
  lbz	r0, 0x0001 (r5)   #get 0x1 of unk ssm struct
  extsb	r0, r0
  cmpw	r3, r0
  bne IncLoop
  lwz	r0, 0 (r6)
  cmpwi	r0, 1
  bne IncLoop
  lwz	r0, 0 (r7)
  cmpwi	r0, -1
  bne IncLoop
  branch  r12,0x80026df8
IncLoop:
  addi  r4,r4,1
  addi  r5,r5,4
  addi	r6, r6, 4
  addi	r7, r7, 4
  addi  REG_Count,REG_Count,1
  cmpwi REG_Count, 55 + NumOfAddedChars
  blt Loop
#Go through all audio groups
  subic.  r3,r3,1
  bge+ LoopStart
  branch  r12,0x80026df4
