using BodyParts3D
using CSV
using GLMakie
using FileIO
using MeshIO

dataDir = bp3ddir()

FMA_key = CSV.File(joinpath(dataDir,"composite_parts.txt"))

composite_name_select = Set(["skeletal system",""])

fig = Figure(size = (800,800))
ax = Axis3(fig[1, 1], aspect = :data)

seen = Set{String}()
for s ∈ FMA_key
    if in(s.var"composite name",composite_name_select) 
        n = s.var"primitive id"
        f = joinpath(dataDir,"stl",n * ".stl")        
        if !in(n,seen) & isfile(f)
            push!(seen,n)
            println(n)
            M = load(f) # Load as mesh            
            mesh!(ax, M, color = :white,transparency=false,shading = FastShading)
        end
    end
end
fig