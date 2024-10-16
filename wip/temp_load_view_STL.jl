using BodyParts3D
using GLMakie
using MeshIO
using FileIO
using ProgressMeter

"""
This code plots all STL files contained in a folder
"""

fig = Figure(size = (800,800))
ax = Axis3(fig[1, 1], aspect = :data)

plotall_stl(ax; stlDir = joinpath(bp3ddir(),"stl"))

fig