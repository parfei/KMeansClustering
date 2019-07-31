%SquaredDistance.m is a function that calculates the square of the
%distance between two points in 3D space.
%Inputs: point1 = array containing 3 elements representing a point in 3D
%        space.
%        point2 = array containing 3 elements representing another point
%        in 3D space.
%Output: squadist = square of the distance between the two points in 3D
%        space.
%Author: Jennifer Lowe

function squadist = SquaredDistance(point1,point2)

%Compute the squared distance between point1 and point2 by subtracting
%point2 from point1 elements, squaring it and summing the result.
squadist = (point1(1) - point2(1)).^2 + ...
    (point1(2) - point2(2)).^2 + ...
    (point1(3) - point2(3)).^2;

return