--[[
Ah, the Menger Sponge.  Probably the fractal
that 'fits' most easily into a 3D voxel
representation.

divide space into a 3x3x3 grid, and then cut out the
centers when viewed from each side.

then subdivide each 1x1x1 in the larger object into
its own 3x3x3 and repeat.

although, this is only 2 levels here, so you can also
just do it manually without any fancy recursion or loops.
--]]