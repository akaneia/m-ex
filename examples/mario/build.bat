SET "TKPATH=../../MexTK/"
SET "TKPARAM=-l "%TKPATH%melee.link" -q -ow -w -c"

:: compile main code
"%TKPATH%MexTK.exe" -ff -i "src/mario.c" "src/special_n.c" "src/special_s.c" "src/special_lw.c" "src/special_hi.c" -s ftFunction -o "ftFunction.dat" -t "%TKPATH%ftFunction.txt" %TKPARAM%

:: compile item code
"%TKPATH%MexTK.exe" -ff -item 0 "src/item_fireball.c" -item 2 "src/item_cape.c" -s itFunction -o "itFunction.dat" -t "%TKPATH%itFunction.txt" %TKPARAM%

pause