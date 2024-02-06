module BodyParts3D

import CSV
import FileIO
import MeshIO
import ProgressMeter
import GeometryBasics
import GLMakie

include("functions.jl")

# Export functions
export bp3ddir, objfolder2stlfolder, stl2png, plotall_stl

end # module BodyParts3D
