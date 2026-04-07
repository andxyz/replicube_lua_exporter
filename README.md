
# Replicube lua exporter

This was a fun project to help we cleanly export the lua code I create in the game into some nicely
named directories and files. This little tool helped me share my code over here:
- https://github.com/andxyz/replicube_solutions


The golang binary processes the replicube `progress.dat` (save file)
and outputs the lua code from the puzzles!

```shell
./replicube_lua_exporter -f ./progress.dat -o ./
```
