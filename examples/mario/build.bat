SET "TKPATH=../../MexTK/"

:: compile main code
"%TKPATH%MexTK.exe" -ff -i "src/mario.c" -s ftFunction -dat "PlMr.dat" -ow 

:: compile item code
"%TKPATH%MexTK.exe" -ff -item 0 "src/item_fireball.c" -item 2 "src/item_cape.c" -dat "PlMr.dat" -s itFunction -ow

pause