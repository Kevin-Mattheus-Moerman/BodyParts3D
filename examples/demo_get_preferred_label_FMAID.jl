using BodyParts3D

#=
This demo shows the use of get_preferred_label_FMAID to obtain the 
"preferred_label" information from the FMA id. 
=#

FMA_ID = 24475 # "Left femur"
s = get_preferred_label_FMAID(FMA_ID)