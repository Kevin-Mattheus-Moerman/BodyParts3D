using CSV
using FileIO
using MeshIO
using ProgressMeter
using GeometryBasics
using GLMakie

function bp3ddir()
    joinpath(@__DIR__, "..","assets","BodyParts3D_data")
end

function objfolder2stlfolder(objDir,stlDir=joinpath(bp3ddir(),"stl"))    
    # Check for STL directory, make it if it doesn't exist yet
    if !isdir(stlDir)
        mkdir(stlDir)
    end
    
    # The list of files   
    fileSet = readdir(objDir) 

    # Loop over all files and convert any OBJ to STL
    @showprogress 1 "Converting OBJ files..." for f in fileSet    
        fName,fExt = splitext(f)
        if lowercase(fExt) == ".obj" # If the current file is an OBJ file
            M = load(joinpath(objDir,f)) # Load as mesh            
            save(File{format"STL_BINARY"}(joinpath(stlDir,fName*".stl")),M) # Export to binary STL
        end
    end
end

function stl2png(saveDir, stlDir=joinpath(bp3ddir(),"stl"); image_size=(500,500))
    fig = Figure(size = image_size)
    ax = Axis3(fig[1, 1], aspect = :data)

    fileSet = readdir(stlDir) # The list of files   
    @showprogress 1 "Plotting STL's, saving PNG's..." for f in fileSet    
        fName,fExt = splitext(f)
        if fExt == ".stl" # If the current file is an STL file
            M = load(joinpath(stlDir,f)) # Load as mesh            
            hp = mesh!(ax, M, color=:white,transparency=false,shading = FastShading)
            fig

            imName = fName*".png"
            save(joinpath(saveDir,imName), fig)    
            delete!(ax,hp)    
        end    
    end
end

function plotall_stl(ax; stlDir = joinpath(bp3ddir(),"stl"))
    fileSet = readdir(stlDir) # The list of files   
    @showprogress 1 "Plotting STL files..." for f in fileSet    
        _,fExt = splitext(f)        
        if fExt == ".stl" # If the current file is an STL file
            M = load(joinpath(stlDir,f)) # Load as mesh            
            mesh!(ax, M, color =  :white ,transparency=true,shading = FastShading)
            
        end
    end
end
