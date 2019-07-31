%GetRGBValuesForPoints.m is a function that returns the RGB colour values
%for a list of specified points from an image.
%Inputs: image = 3D image array to collect RGB values from.
%        idx = 2D array of k rows and 2 columns identifying which points
%        to extract colour values for.
%Output: colourinfo = 3D array containing k rows, 1 column and 3 layers
%        that represent the colours for k points from the image.
%Author: Jennifer Lowe

function colourinfo = GetRGBValuesForPoints(image,idx)

%Separate the RGB layers of the 3D image array into different 2D colour
%arrays to work with.
[imager,imageg,imageb] = deal(image(:,:,1),image(:,:,2),image(:,:,3));

%Convert the rows and column idxs, of the input idx array, to linear
%indices. We can apply the linear indices for the other 2D arrays after
%finding it on one array.
indidx = sub2ind(size(imager),idx(:,1),idx(:,2));

%Extract the required information from each 2D colour array. Then
%concantenate all 2D arrays along the third dimension to create the
%output 3 array.
colourinfo = cat(3,imager(indidx),imageg(indidx),imageb(indidx));

return