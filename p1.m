clc
clear
load('portfolio100.mat')
X = Portfolio100(:, 1:5);
[U S V] = svd(X, 'econ');
vars = var(X);
disp(sum(diag(S)) - sum(vars))
