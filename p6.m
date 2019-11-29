clear
clc
H_100 = hilb(100);
load('portfolio100.mat');
b = Portfolio100(1,:)';
x = inv(H_100)*b;

% LU
[L U P] = lu(H_100);
n = length(b);
y(n,1) = b(n)/U(n,n);
for i=n-1:-1:1
    y(i,1) = (b(i)-U(i,i+1:n)*y(i+1:n,1))./U(i,i);
end

x_lu(1,1) = b(1)/L(1,1);
for i=2:n
    x_lu(i,1) = (b(i)-L(i,1:i-1)*x_lu(1:i-1,1))./L(i,i);
end

% QR
[Q R] = qr(H_100);
y = Q'*b;

n = length(y);
x_qr(n,1) = y(n)/R(n,n);
for i=n-1:-1:1
    x_qr(i,1) = (y(i)-R(i,i+1:n)*x_qr(i+1:n,1))./R(i,i);
end

b_x = H_100*x;
b_lu = H_100*x_lu;
b_qr = H_100*x_qr;

disp(norm(b-b_x));
disp(norm(b-b_lu));
disp(norm(b-b_qr));