%AssignToClusters.m is a function that assigns each pixel in an image to a
%cluster, based on which mean that point is closest to.
%Inputs: image = 3D array with m rows, n columns and 3 layers, containing
%        an RGB image.
%        kpoints = 3D array containing k rows, 1 column and 3 layers
%        containing the colour information for each of the k mean points.
%Output: clusteridentify = 2D array with m rows and n columns, containing
%        the corresponding cluster number for each pixel in the image.
%Author: Jennifer Lowe

function clusteridentify = AssignToClusters(image,kpoints)

%Retrieve original image's number of rows and columns.
[imgr,imgc,~] = size(image);

%Reshape the image input into a 3D 1xno_of_elementsx3 array, so it can be
%used to compute matrix calculations with the 3D array kpoints.
image = reshape(image,1,[],3);

%Applying the squared distance formula between each RGB point 
%and all of the kpoints.
squadist = (image(:,:,1) - kpoints(:,1,1)).^2 + ...
    (image(:,:,2) - kpoints(:,1,2)).^2 + ...
    (image(:,:,3) - kpoints(:,1,3)).^2;

%Compute min function along the first dimension, and retrieve the index
%of the minimum of each squadist column.
[~,squadist] = min(squadist,[],1);

%Reshape squadist into the original image's dimensions.
clusteridentify = reshape(squadist,imgr,imgc,1);

return