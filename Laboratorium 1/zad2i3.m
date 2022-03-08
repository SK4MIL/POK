clear;
close all;

A = [ 2,  1,  1, -1;
      1,  1, -1, 1;
      1,  1,  1,  1;
     -1,  2, -1,  1];

B = [3, 4, 10, 4]';

GaussianElimination(A, B);
test = MetodaGradientowa(A, B, [0, 0, 0, 0], 1e-8, 1e-8);

function GaussianElimination(A, B)
   AB = [A, B];
   [r, c] = size(AB);

    for i = (1 : r - 1)
        [~, j] = max(abs(AB(i : r, i)));
        j = j + i - 1;
        if(AB(j, i) ~= 0)
            if(j ~= i)
                AB([i j], :) = AB([j i], :);
            end
        end
        for k = (i + 1 : r)
            AB(k, i : c) = AB(k, i : c) - AB(k, i) / AB(i, i) * AB(i, i : c);
        end
    end

    y = zeros(r, 1);
    y(r) = AB(r, c) / AB(r, r);

    for i = r - 1 : -1 : 1
        y(i) = (AB(i, c) - AB(i, i + 1 : r) * y(i + 1 : r)) / AB(i, i);
    end
    
    fprintf('For given A and B:\n');
    for i = 1 : length(y)
        fprintf('x%.0d = %.2f\n', i, y(i));
    end
end

function result = MetodaGradientowa(A, B, x0, TolX, TolFun)
    fun = @(x) mean(abs(A*[x(1); x(2); x(3); x(4)] - B));
    options = optimset('TolX', TolX, 'TolFun', TolFun);
    [x, fval, exitflag, output] = fminunc(fun, x0, options)
    result = x;
end