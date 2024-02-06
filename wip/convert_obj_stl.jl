using MeshIO
using FileIO
using ProgressMeter

"""
This code converts all OBJ files contained in a folder to STL files
"""

objDir = joinpath(bp3ddir(),"obj")
stlDir = joinpath(bp3ddir(),"stl")

objfolder2stlfolder(objDir,stlDir)