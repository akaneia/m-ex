#To be inserted @ 8006f66c
.include "../../../Globals.s"
.include "../../Header.s"

.set  REG_FighterData,22

#Check if anim is coming from opponent
  lwz r0,MEX_AnimOwner(REG_FighterData)
  cmpwi r0,0
  beq UseFtKind

# Anim comes from opponent, so use ftkind num so 
# we use the last entry in the PlCo bone table 
# (thrown anim skeleton additional bones @ 0x14)
  lwz r29,OFST_Metadata_FtIntNum(rtoc)
  # addi r29,r29,1
  b Exit

UseFtKind:
# get ft_kind from fighterdata instead of the animation flags
  lwz r29, 0x4(REG_FighterData)

Exit: