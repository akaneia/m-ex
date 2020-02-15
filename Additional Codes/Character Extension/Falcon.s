#To be inserted at 8015ff90
.include "../../Globals.s"
.include "Header.s"

#Costume File Names
  bl  MnSlChr_CostumeFiles
  mflr  r3
  bl  ConvertPointers
  load  r4,0x803c2368
  stw r3,0x0(r4)

  b Injection_Exit

####################

MnSlChr_CostumeFiles:
  blrl
  MnSlChrCostumes_Falcon:
  bl MnSlChrCostumes_Falcon0_FileName
  bl MnSlChrCostumes_Falcon0_JointName
  bl MnSlChrCostumes_Falcon0_MatAnimName
  bl MnSlChrCostumes_Falcon1_FileName
  bl MnSlChrCostumes_Falcon1_JointName
  bl MnSlChrCostumes_Falcon1_MatAnimName
  bl MnSlChrCostumes_Falcon2_FileName
  bl MnSlChrCostumes_Falcon2_JointName
  bl MnSlChrCostumes_Falcon2_MatAnimName
  bl MnSlChrCostumes_Falcon3_FileName
  bl MnSlChrCostumes_Falcon3_JointName
  bl MnSlChrCostumes_Falcon3_MatAnimName
  bl MnSlChrCostumes_Falcon4_FileName
  bl MnSlChrCostumes_Falcon4_JointName
  bl MnSlChrCostumes_Falcon4_MatAnimName
  bl MnSlChrCostumes_Falcon5_FileName
  bl MnSlChrCostumes_Falcon5_JointName
  bl MnSlChrCostumes_Falcon5_MatAnimName
  .long -1
  MnSlChrCostumes_Falcon0_FileName:
  .string "PlCaNr.dat"
  .align 2
  MnSlChrCostumes_Falcon0_JointName:
  .string "PlyCaptain5K_Share_joint"
  .align 2
  MnSlChrCostumes_Falcon0_MatAnimName:
  .string "PlyCaptain5K_Share_matanim_joint"
  .align 2

  MnSlChrCostumes_Falcon1_FileName:
  .string "PlCaGy.dat"
  .align 2
  MnSlChrCostumes_Falcon1_JointName:
  .string "PlyCaptain5KGy_Share_joint"
  .align 2
  MnSlChrCostumes_Falcon1_MatAnimName:
  .string "PlyCaptain5KGy_Share_matanim_joint"
  .align 2

  MnSlChrCostumes_Falcon2_FileName:
  .string "PlCaRe."
  .align 2
  MnSlChrCostumes_Falcon2_JointName:
  .string "PlyCaptain5KRe_Share_joint"
  .align 2
  MnSlChrCostumes_Falcon2_MatAnimName:
  .string "PlyCaptain5KRe_Share_matanim_joint"
  .align 2

  MnSlChrCostumes_Falcon3_FileName:
  .string "PlCaWh.dat"
  .align 2
  MnSlChrCostumes_Falcon3_JointName:
  .string "PlyCaptain5KWh_Share_joint"
  .align 2
  MnSlChrCostumes_Falcon3_MatAnimName:
  .string "PlyCaptain5KWh_Share_matanim_joint"
  .align 2

  MnSlChrCostumes_Falcon4_FileName:
  .string "PlCaGr.dat"
  .align 2
  MnSlChrCostumes_Falcon4_JointName:
  .string "PlyCaptain5KGr_Share_joint"
  .align 2
  MnSlChrCostumes_Falcon4_MatAnimName:
  .string "PlyCaptain5KGr_Share_matanim_joint"
  .align 2

  MnSlChrCostumes_Falcon5_FileName:
  .string "PlCaBu.dat"
  .align 2
  MnSlChrCostumes_Falcon5_JointName:
  .string "PlyCaptain5KBu_Share_joint"
  .align 2
  MnSlChrCostumes_Falcon5_MatAnimName:
  .string "PlyCaptain5KBu_Share_matanim_joint"
  .align 2

ConvertPointers:
  #Init Loop
  .set  REG_Pointers,12
  .set  REG_OrigPointer,11
  mr  REG_Pointers,r3
  mr  REG_OrigPointer,r3

  ConvertPointers_Loop:
    lwz r3,0x0(REG_Pointers)          #Load bl instruction
    cmpwi r3,-1
    beq ConvertPointers_Exit          #keep going until -1
    rlwinm r5,r3,8,25,29    #extract opcode bits
    cmpwi r5,0x48           #if not a bl instruction, exit
    bne ConvertPointers_IncLoop
    rlwinm  r3,r3,0,6,29  #extract offset bits
  	rlwinm	r5,r3,7,31,31		#Get signed bit
  	lis	r6,0xFC00
  	mullw	r5,r5,r6
  	or	r3,r3,r5
    add r3,r3,REG_Pointers
    stw r3,0x0(REG_Pointers)
  #If it points to itself, make it 0
    cmpw  r3,REG_Pointers
    bne ConvertPointers_IncLoop
    li  r3,0
    stw r3,0x0(REG_Pointers)
  ConvertPointers_IncLoop:
    addi  REG_Pointers,REG_Pointers,0x4
    b ConvertPointers_Loop
  ConvertPointers_Exit:
    mr  r3,REG_OrigPointer
    blr
####################
Injection_Exit:
  li	r3, 1
