clear;
close all; 

A=[2  1  1  -1;
    1  1 -3  1;
    1  1  1  1;
    -1  2 -1  1;];
b= [3 4 10 4];
B=[A b']

fprintf("Given matrix has: %s \n", ranking(A, b));
if ( ranking(A,b) == "one solution")
    fprintf("Solution by Gaussian elimination method:\n");
    gaussianElimination(A, B);
    fprintf("\n\nSolution by gradient method:\n");
    gradientMethod(A, B, [0, 0, 0, 0], 1e-8, 1e-8);
end

function result = ranking(MatA, SolA)
SolA = SolA' ;
MatB=[MatA SolA];
n=length(MatA);

rankA=rank(MatA);
rankB=rank(MatB);

if ( rankA ~= rankB)
    result = "no solutions";
elseif ( (rankA == rankB) && (rankA == n))
    result = "one solution"; 
else
    result = "infinit number of solutions";
end
end