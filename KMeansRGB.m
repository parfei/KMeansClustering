%KMeansRGB.m is a function that partitions the points, in an image, into k
%clusters. Computation is done using the the k-means algorithm.
%Inputs: image = 3D array with m rows, n columns and 3 layers, containing
%        an RGB image.
%        inimean = 3D array containing k rows, 1 column and 3 layers which
%        are the intial mean values for the k-means algorithm.
%        maxitera = Maximum number of iterations to perform.
%Outputs: clusteridentify = 2D array with m rows and n columns specifying
%        which cluster each pixel belongs to.
%        meanvalues = 3D array containing k rows, 1 column and 3 layers,
%        where each row contains the mean colour values for the cluster
%        corresponding to that row number.
%Author: Jennifer Lowe

function [clusteridentify,newmean] = KMeansRGB(image,inimean,maxitera)

%Retrieving the number of clusters.
noofcluster = size(inimean,1);

%Set newmean value to a string value, where it will never be the
%same as the oldmean for the first iteration of the while loop.
newmean = 'not oldmean';
oldmean = inimean; %Set old mean to inimean value.
iterations = 0; %Set iterations to zero.

%Repeat until the oldmean is NOT exactly the same as the newmean.
while (~isequal(oldmean,newmean))
    
    %From the second iteration onwards, compute the if statement. For the
    %first iteration, compute the else statement.
    if (iterations >= 1)
        %Assign the oldmean to be the previous mean calculated.
        oldmean = newmean;
        
        %Assign means to a cluster using the previous mean values.
        clusteridentify = AssignToClusters(image,newmean);
    else
        %Assign means to a new cluster using the initial mean values.
        clusteridentify = AssignToClusters(image,inimean);
    end
    
    %Calculating the new mean values.
    newmean = UpdateMeans(image,noofcluster,clusteridentify);
    
    %Increasing the iteration count.
    iterations = iterations + 1; 
    
    %If maxinum iteration number has been reached, the function will
    %display a warning message and return from the function.
    if (iterations == maxitera)
        warning(['Maximum number of iterations reached'...
            ' before convergence was achieved.']);
        return
    end
    
end

return