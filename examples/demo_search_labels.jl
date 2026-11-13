using BodyParts3D
using Comodo.GLMakie

#=
This demo shows the use of search_labels to find a set of FMA id numbers given a
search string. 
=#

FMA_ID_set = search_labels("femur")

fig = Figure(size = (800,800))
ax = AxisGeom(fig[1, 1])

for FMA_ID in keys(FMA_ID_set)
    F, P = get_mesh_FMAID(FMA_ID)
    meshplot!(ax, F, P, strokewidth=0.0)
end

fig
