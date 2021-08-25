clear; close all; clc; 

%% Description 
% This code parses all OBJ files in the /obj folder and exports them as STL
% files to the /stl folder. 
%
% This code requires the GIBBON MATLAB toolbox 
% <www.gibboncode.org>

%%

% Path names
mainDir = fileparts(fileparts(mfilename('fullpath'))); %Main code path
loadDir=fullfile(mainDir,'obj'); %The OBJ loading folder
saveDir=fullfile(mainDir,'stl'); %The STL saving folder

%%

%Get list of all OBJ files
objFileList = dir(fullfile(loadDir,['*','obj']));
objFileList={objFileList(1:end).name};

%Convert all OBJ files to STL
numFiles=numel(objFileList); %Number of files to parse
for q=1:1:numFiles %Loop over all files   
    [~,fileNameClean,~]=fileparts(objFileList{q}); %File name without path or extension    
    fileName_obj=fullfile(loadDir,objFileList{q}); %OBJ file name           
    disp(['Parsing file ', num2str(q),' of ',num2str(numFiles),', ',sprintf('%3.0f',round(100*q/numFiles)),'% done, ID: ',fileNameClean,]);    
    if exist(fileName_obj,'file') %Process if the file exists       
        [f,v]=import_obj_geom(fileName_obj); %Import OBJ file
        stlwrite(triangulation(f,v),fullfile(saveDir,[fileNameClean,'.stl']),'binary'); %Save as binary STL file        
    end    
end

%%