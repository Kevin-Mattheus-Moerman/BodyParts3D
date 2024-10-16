using BodyParts3D
using GLMakie
using MeshIO
using FileIO
using ProgressMeter

"""
This code plots all STL files contained in a folder and stores a PNG screenshot for each object
"""

saveDir = joinpath(bp3ddir(),"png")

stl2png(saveDir; image_size=(500,500))










