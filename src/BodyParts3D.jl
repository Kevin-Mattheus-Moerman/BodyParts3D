module BodyParts3D
    using CSV
    using FileIO
    using ProgressMeter
    using GeometryBasics

    include("functions.jl")

    export GeometryBasics
    
    # Export functions
    export bp3ddir, FMA_dict, get_preferred_label_FMAID, get_mesh_FMAID
    export search_labels
end # module BodyParts3D
