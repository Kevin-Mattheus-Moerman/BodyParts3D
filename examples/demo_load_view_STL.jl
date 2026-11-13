using BodyParts3D
using BodyParts3D.ProgressMeter
using Comodo.GLMakie

#=
This demo plots all STL files contained in a folder
=#

function plotall_stl(ax; stlDir = joinpath(bp3ddir(),"stl"))
    fileSet = readdir(stlDir) # The list of files   
    @showprogress 1 "Plotting STL files..." for f in fileSet    
        _,fExt = splitext(f)        
        if fExt == ".stl" # If the current file is an STL file
            M = load(joinpath(stlDir,f)) # Load as mesh            
            mesh!(ax, M, color =  RGBAf(rand(1)[1],rand(1)[1],rand(1)[1],1) ,transparency=true)            
        end
    end
end

fig = Figure(size = (800,800))
ax = AxisGeom(fig[1, 1])
plotall_stl(ax; stlDir = joinpath(bp3ddir(),"stl"))
fig