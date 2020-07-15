#To be inserted @ 800c09d0
.include "../../Globals.s"
.include "../Header.s"

/*
The reason this is in SFX is because both the stage SFX 
lookup standalone function and ftChkDevice fighter init
function references the internal ID. Spoofing the stage
to init this data causes custom stage SFX to break...
*/

b 0x40