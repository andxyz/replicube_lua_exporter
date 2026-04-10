
# Replicube lua exporter

This was a fun project. It helps me cleanly export the lua code I create in the game into some nicely named directories and files. 

Download the latest version of the command line tool over here:

- https://github.com/andxyz/replicube_lua_exporter/releases/latest

For example, this little tool helped me share _my_ code over here:

- https://github.com/andxyz/replicube_solutions

The supplied download of the golang binary processes the replicube `progress.dat` (save file) from replicube
and it outputs the lua code from the puzzles into nicely named directories!

### Example usage:

```shell
# make a directory for our exported code
mkdir replicube_solutions

# run the tool to export the code from our progress.dat file
./replicube_lua_exporter -f ./progress.dat -o ./replicube_solutions/
```

### Notes: 

- on my linux machine my save file was located at `~/.local/share/Replicube/progress.dat`
- on my windows machine my save file was located at `%AppData%\Replicube\progress.dat`
