using BodyParts3D
using BodyParts3D.FileIO
using BodyParts3D.GeometryBasics
using BodyParts3D.ProgressMeter
using Comodo.GLMakie

"""
This code plots all STL files contained in a folder and stores a PNG screenshot for each object
"""

function stl2png(saveDir, stlDir=joinpath(bp3ddir(),"stl"); image_size=(500,500))
    fig = Figure(size = image_size)
    ax = AxisGeom(fig[1, 1])

    fileSet = readdir(stlDir) # The list of files   
    @showprogress 1 "Plotting STL's, saving PNG's..." for f in fileSet    
        fName,fExt = splitext(f)
        if fExt == ".stl" # If the current file is an STL file
            M = load(joinpath(stlDir,f)) # Load as mesh            
            F = [TriangleFace{Int}(f) for f in M.faces]
            P = [Point{3, Float64}(v) for v in M.position]  
            hp = meshplot!(ax, F, P, color=:white, transparency=false)
            fig

            imName = fName*".png"
            save(joinpath(saveDir,imName), fig)    
            delete!(ax, hp)    
        end    
    end
end

##
saveDir = joinpath(bp3ddir(),"png")

stl2png(saveDir; image_size=(500,500))










