#To be inserted @ 8025dac8
.include "../../../Globals.s"
.include "../Header.s"

lwz r4,OFST_MnSlChrData(rtoc)
addi  r4,r4,0x3b4+(NumOfAddedChars*0x1C)
