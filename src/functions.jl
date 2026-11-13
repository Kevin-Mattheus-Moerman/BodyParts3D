function bp3ddir()
    joinpath(@__DIR__, "..","assets","BodyParts3D_data")
end

function create_FMA_dict()
    dataDir = bp3ddir()
    FMA_set = CSV.File(joinpath(dataDir,"FMA.csv"))
    FMA_dict = Dict{Int, String}()
    for i in eachindex(FMA_set)    
        FMA_ID = FMA_set[i].FMAID
        Preferred_Label = FMA_set[i].Preferred_Label 
        if !ismissing(FMA_ID) 
            if ismissing(Preferred_Label)
                FMA_dict[FMA_ID] = ""
            else                
                FMA_dict[FMA_ID] = FMA_set[i].Preferred_Label
            end 
        end    
    end
    return FMA_dict
end

function get_mesh_FMAID(FMA_ID)
    stl_dir =joinpath(bp3ddir(),"stl")
    stlSet = readdir(stl_dir)
    for f ∈ stlSet
        fName, _ = splitext(f)
        if contains(fName, "nsn") # Cope with nsn in name
            fName = fName[1:end-3]
        end
        if contains(fName,"FMA")            
            FMA_ID_now = parse(Int,fName[4:end])             
            if FMA_ID_now == FMA_ID                
                M = load(joinpath(stl_dir, f))   
                F = [TriangleFace{Int}(f) for f in M.faces]
                P = [Point{3, Float64}(v) for v in M.position]             
                return F, P
                break
            end            
        end        
    end 
    return missing, missing
end

function get_preferred_label_FMAID(FMA_ID)
    FMA_dict = create_FMA_dict()
    return FMA_dict[FMA_ID]
end

function search_labels(s)
    s = lowercase(s)
    FMA_dict = create_FMA_dict()
    stl_dir =joinpath(bp3ddir(),"stl")
    stlSet = readdir(stl_dir)
    # FMA_ID_set = Vector{Int}()
    FMA_dict_sub= Dict{Int, String}()
    for f ∈ stlSet
        fName, _ = splitext(f)
        if contains(fName, "nsn") # Cope with nsn in name
            fName = fName[1:end-3]
        end
        if contains(fName,"FMA")            
            FMA_ID_now = parse(Int,fName[4:end])   
            preferred_label = FMA_dict[FMA_ID_now]
            if contains(lowercase(preferred_label), s)
                FMA_dict_sub[FMA_ID_now] = preferred_label
                # push!(FMA_ID_set, FMA_ID_now)
            end            
        end        
    end 
    return FMA_dict_sub
end
