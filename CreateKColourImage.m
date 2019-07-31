%CreateKColourImage.m is a function that creates a k-colour image that has
%had its image divided into k clusters. All pixels will be recoloured using
%the mean colour values for that cluster.
%Inputs: clusteridentify = 2D array with m rows and n columns, specifying
%        which cluster each pixel belongs to.
%        meanvalues = 3D array containing k rows, 1 column and 3 layers,
%        where each row contains the mean colour values for the cluster
%        corresponding to that row number.
%Output: kcolourimage = 3D array of unsigned 8 bit integers with m rows,
%        n columns and 3 layers, representing a RGB image. The colour of
%        each pixel in the image is determined by the colour
%        associated with that character.
%Author: Jennifer Lowe

function kcolourimage = CreateKColourImage(clusteridentify,meanvalues)

%Round the mean colour values to integers.
meanvalues = round(meanvalues);

%Copy the clusteridentify values to three 2D arrays.
[red,green,blue] = deal(clusteridentify);

%Retrieve the number of rows from meanvalues.
rows = size(meanvalues,1);

%Repeat for number of rows.
for i = 1:rows
    %Replace cluster numbers with the appropriate colour values for the
    %current row number.
    red(clusteridentify==i) = meanvalues(i,1,1); %Replace for red.
    green(clusteridentify==i) = meanvalues(i,1,2); %Replace for green.
    blue(clusteridentify==i) = meanvalues(i,1,3); %Replace for blue.
end

%Concantenate the 3 colour layers together to form the output array.
%Then convert into uint8 format.
kcolourimage = uint8(cat(3,red,green,blue));

return