#To be inserted @ 800673a0
.include "../../../Globals.s"
.include "../Header.s"

# note to self, the + 1 is because of a bge

cmpwi	r30, 50 + 1 + NumOfAddedChars
