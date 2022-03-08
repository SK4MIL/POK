% clear;
% close all;
% 
% A = [ 2,  1,  1, -1;
%       1,  1, -1, 1;
%       1,  1,  1,  1;
%      -1,  2, -1,  1];
% 
% B = [3, 4, 10, 4]';
% 
% GaussianElimination(A, B);
% test = MetodaGradientowa(A, B, [0, 0, 0, 0], 1e-8, 1e-8);



function result = gradientMethod(A, B, x0, TolX, TolFun)
    fun = @(x) mean(abs(A*[x(1); x(2); x(3); x(4)] - B));
    options = optimset('TolX', TolX, 'TolFun', TolFun);
    [x, fval, exitflag, output] = fminunc(fun, x0, options);
    result = x;
end