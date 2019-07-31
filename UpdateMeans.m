%UpdateMeans.m is a function that calculates the mean values for each
%cluster.
%Inputs: image = 3D array with m rows, n columns and 3 layers containing a
%        RGB image.
%        noofcluster = single value k specifying number of clusters.
%        clusteridentify = 2D array with m rows and m columns specifying 
%        cluster each pixel belongs to.
%Output: meanvalues = 3D array containing k rows, 1 column and 3 layers
%        containing the mean values for each cluster.
%Author: Jennifer Lowe

function meanvalues = UpdateMeans(image,noofcluster,clusteridentify)

%Separate the RGB layers of the 3D image array into different 2D colour
%arrays to work with.
[imager,imageg,imageb] = deal(image(:,:,1),image(:,:,2),image(:,:,3));

%Initialise the array meanvalues with ones.
meanvalues = ones(noofcluster,1,3);

%Repeat for the number of clusters there are.
for clusnumber = 1:noofcluster
    %Find matches with clusteridentify with the current cluster number, and
    %return a logical array to work with.
    matches = (clusteridentify==clusnumber);
    
    %Retrieve the information in each of the 2D colour arrays with matches.
    %Then concantenate them along the third dimension.
    meancompute = cat(3,imager(matches),imageg(matches),imageb(matches));
    
    %Find the mean values for each layer, and put this into the array
    %meanvalues for the current cluster number's row.
    meanvalues(clusnumber,1,:) = mean(meancompute);
end

return