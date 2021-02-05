#To be inserted at 801bfa24
.include "../../Globals.s"
.include "../Header.s"

# If not slippi, boot specified scene
  load r3,0x801a5014
  lwz r3,0x0(r3)
  load r4,0x40820010
  cmpw r3,r4
  bne isSlippi

notSlippi:
  lwz r3,OFST_Metadata(rtoc)
  lwz r3,Arch_Metadata_BootScene(r3)
  b Exit

isSlippi:
  li r3, 0x1 # Load menu first

Exit:
  branchl r12,0x801a42f8