clear;
close all; 

A=[2  1  1  -1;
    1  1 -3  1;
    1  1  1  1;
    -1  2 -1  1;];
b= [3 4 10 4];

fprintf("Given matrix has: %s \n", ranking(A, b));

function result = ranking(MatA, SolA)
SolA = SolA' ;
MatB=[MatA SolA];
n=length(MatA);

rankA=rank(MatA);
rankB=rank(MatB);

if ( rankA ~= rankB)
    result = "No solutions";
elseif ( (rankA == rankB) && (rankA == n))
    result = "One solution"; 
else
    result = "Infinit number of solutions";
end
end