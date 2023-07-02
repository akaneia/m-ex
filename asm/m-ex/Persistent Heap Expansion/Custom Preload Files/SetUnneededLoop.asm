#To be inserted @ 800182d0
.include "../../../Globals.s"
.include "../../Header.s"

.set REG_PreloadTable,31
.set REG_InterruptID,30
.set REG_ThisPreloadEntry,12
.set REG_Count, 11

Loop_Start:
  li REG_Count, 0
  addi REG_ThisPreloadEntry, REG_PreloadTable, 0xAC

Loop:
# Check for null entries
  lbz r0, 0x0 (REG_ThisPreloadEntry)
  cmpwi r0, 0
  beq Loop_Inc
# Check for custom entries (file_kind == 5)
  lbz r0, 0x1 (REG_ThisPreloadEntry)
  cmpwi r0, 5
  beq Loop_Inc
# If needed, mark as unneeded
  lha r0, 0x8 (REG_ThisPreloadEntry)
  cmpwi r0, 0
  ble Loop_Inc
  mulli r0,r0,-1
  sth r0, 0x8 (REG_ThisPreloadEntry)

Loop_Inc:
  addi REG_Count,REG_Count,1
  addi REG_ThisPreloadEntry,REG_ThisPreloadEntry,0x1C
Loop_Check:
  cmpwi REG_Count,80
  blt Loop

branch r12,0x80018438