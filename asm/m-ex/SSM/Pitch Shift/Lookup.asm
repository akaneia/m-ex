#To be inserted @ 80087d3c
.include "../../../Globals.s"
.include "../../Header.s"

.set    REG_SSMID,30


# perform hardcoded branches
  cmpwi REG_SSMID,0
  beq   isMain
  cmpwi REG_SSMID,13
  beq   isICs
  b Search

isMain:
  branch r12,0x80087d78
isICs:
  branch r12,0x80087f84

.set    REG_Lookup,12
.set    REG_Count,11
.set    REG_FtIntNum,10
Search:
# init search
  lwz   REG_Lookup,OFST_MnSlChrSSMFileIDs(rtoc)
  lwz   REG_FtIntNum,OFST_Metadata_FtIntNum(rtoc)
  li    REG_Count,0
  b CheckLoop
Loop:
# search fighter table ssm lookup for this ID
  mulli r3,REG_Count,0x10
  add r3,r3,REG_Lookup
  lbz  r3,0x0(r3)
  cmpw  r3,REG_SSMID
  beq Found
IncLoop:
  addi REG_Count,REG_Count,1
CheckLoop:
  cmpw REG_Count,REG_FtIntNum
  blt Loop

NotFound:
  branch r12,0x8008803c

Found:
  branch r12,0x80087ffc