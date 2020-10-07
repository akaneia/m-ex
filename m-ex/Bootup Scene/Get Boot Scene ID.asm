#To be inserted at 801BFA20
.include "../../Globals.s"

  lwz r3,OFST_Metadata(rtoc)
  lwz r3,Arch_Metadata_BootScene(r3)
