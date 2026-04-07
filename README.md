
# Replicube lua exporter

This was a fun project to help me cleanly export the lua code I create in the game into some nicely
named directories and files. 

Download the latest version of the command line tool over here:
- https://github.com/andxyz/replicube_lua_exporter/releases/latest


This little tool helped me share my code over here:
- https://github.com/andxyz/replicube_solutions


The golang binary processes the replicube `progress.dat` (save file)
and outputs the lua code from the puzzles!

```shell
# make a directory for our exported code
mkdir replicube_solutions
./replicube_lua_exporter -f ./progress.dat -o ./replicube_solutions/
```

Notes: 
- on my linux machine my save file was located at ~/.local/share/Replicube/progress.dat
- on my windows machine my save file was located at %AppData%\Replicube\progress.dat
