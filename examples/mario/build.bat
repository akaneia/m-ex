SET "TKPATH=../../MexTK/"

:: compile main code
"%TKPATH%MexTK.exe" -ff -i "src/mario.c" "src/special_n.c" "src/special_s.c" "src/special_lw.c" "src/special_hi.c" -s ftFunction -dat "PlMr.dat" -ow 

:: compile item code
"%TKPATH%MexTK.exe" -ff -item 0 "src/item_fireball.c" -item 2 "src/item_cape.c" -dat "PlMr.dat" -s itFunction -ow

pause