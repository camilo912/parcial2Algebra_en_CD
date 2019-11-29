clear
clc
load('portfolio100.mat');
X = Portfolio100;
[U S V] = svd(X, 'econ');
disp('el rango de la matriz es: ')
disp(rank(X));
disp('el número de valores singulares no nulo es: ')
disp(length(S));