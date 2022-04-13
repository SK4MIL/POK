close all;
clear;

% given data for interpolation
X = [  10,   20,   30,  40,  50];
Y = [0.98, 0.93, 0.86, .76, .64];

% allocate memory calculated coefficients
a = zeros(1,length(X));
w = zeros(length(X)-1);

% for every element given in X
for i = 1:length(X)
    mian = 1;
    k = 1;
    %add elements to denominator except "index one"
    for j = 1:length(X)
        if (j == i)
            continue;
        else
            mian = mian .* (X(i)-X(j));
        end
        k=k+1;
    end
    % set elements of coefficient
    a(1,i) = Y(i)./mian;
end

% make matrix of parameters next to each coefficient
for i = 1:length(X)
    k = 1;
    for j = 1:(length(X))
        % omiting "indexed one"
        if (j == i) 
            continue;
        else
            w(i,k) = (X(j));
        end
        k = k+1;
    end
end

% create function using calculated polynominal
f = @(x) ... 
    (a(1).*(x-w(1,1)).*(x-w(1,2)).*(x-w(1,3)).*(x-w(1,4))) + ...
    (a(2).*(x-w(2,1)).*(x-w(2,2)).*(x-w(2,3)).*(x-w(2,4))) + ...
    (a(3).*(x-w(3,1)).*(x-w(3,2)).*(x-w(3,3)).*(x-w(3,4))) + ...
    (a(4).*(x-w(4,1)).*(x-w(4,2)).*(x-w(4,3)).*(x-w(4,4))) + ...
    (a(5).*(x-w(5,1)).*(x-w(5,2)).*(x-w(5,3)).*(x-w(5,4)));

t = 0:50;
figure(1);
plot(t, f(t), '--b',  X, Y, '.r', 'MarkerSize', 12);
hold on;
plot( 21, f(21), '.b', 'MarkerSize', 20);
value = f(21);
text(21,f(21),sprintf('    f(21) = %.6f', value));
legend(["Wielomian", "Punkty", "Zadane x = 21"], 'location', 'southwest');

