clear
clc

x1 = 1 + randn(1000, 1);
x2 = 2 + randn(1000, 1);
x3 = 3 + randn(1000, 1);
x4 = 4 + randn(1000, 1);
x5 = 5 + randn(1000, 1);
A = [x1 x2 x3 x4 x5];

y = zeros(1000, 1);
for i=1:1000
    y(i) = (1/i)*(i+randn(1,1)) + randn(1,1)*0.5;
end

A_i = pinv(A);
resultado = y'*A_i';
%% punto 9
fitlm(A, y)
