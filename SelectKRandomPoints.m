%SelectKRandomPoints.m is a function that generates a list of k randomly
%selected pixels from an image.
%Inputs: image = 3D image array to select points from.
%        k = the number of points to randomly select for.
%Output: randpoints = a 2D kx2 array containing information about the
%        rows and columns representing the randomly selected points.
%Author: Jennifer Lowe

function randpoints = SelectKRandomPoints(image,k)

%Select k random linear indices from the range of all possible indices.
randidx = randperm(size(image,1)*size(image,2),k);

%Convert linear indices into subscripts (rows and columns) using the
%ind2sub function.
[randrows,randcols] = ind2sub(size(image),randidx);

%Concantenate the randomly selected rows and cols indices into a
%kx2 output array.
randpoints = [randrows;randcols]';

return