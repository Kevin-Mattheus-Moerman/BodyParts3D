using BodyParts3D
using Comodo
using Comodo.GLMakie

#=
This demo shows the use of get_mesh_FMAID to obtain a mesh (faces and points)
from the FMA id. 
=#

FMA_ID = 24475 # "Left femur"
F, P = get_mesh_FMAID(FMA_ID)

## Visualisation
fig = Figure(size = (800,800))
ax = AxisGeom(fig[1, 1])
meshplot!(ax, F, P)
fig