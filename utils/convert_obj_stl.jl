using BodyParts3D
using BodyParts3D.ProgressMeter

"""
This code converts all OBJ files contained in a folder to STL files
"""

function objfolder2stlfolder(objDir, stlDir=joinpath(bp3ddir(),"stl"))    
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

##
objDir = joinpath(bp3ddir(),"obj")
stlDir = joinpath(bp3ddir(),"stl")
objfolder2stlfolder(objDir, stlDir)