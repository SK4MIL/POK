close all;
clear;
format long;

f1 = @(x) x + log10(x) - sin(x).^2;
f2 = @(x) x.^2 + log10(x) - sin(x);

iter = 5;

%% Sieczne
sieczne(f1, 1, 4, iter);
sieczne(f2, 1, 4, iter);

%% Regula Falsi
root = regula_falsi(f1, 1, 4, iter);
fprintf('Calculated in: %d iterations using Regula Falsi method\n',iter);
fprintf('The Root of f1 is : %f \n',root);

root = regula_falsi(f2, 1, 2, iter);
fprintf('The Root of f2 is : %f \n',root);
