clc
clear
load('portfolio100.mat');
% idxs = randperm(500, 200);
X = Portfolio100; %(idxs, :);
n = 100;
orden = 100;
mu = zeros(orden,1);
sigma = hilb(orden);
rng('default');
R = mvnrnd(mu,sigma,n);
X_cont = [X; R];

[idx,~,~,sigma,~,~] = kur_main(X);
[idx_cont,~,~,~,~,~] = kur_main(X_cont);
[vectorcito valorcito] = eig(corr(X_cont));
X_cont = X_cont(idx==0, :);
X_rob = X(idx==0, :);
[vector valor] = eig(corr(X));
[vector_rob valor_rob] = eig(corr(X_rob));
[vector_cont valor_cont] = eig(corr(X_cont));
pcs = vector(:, 1:2);
pcs_rob = vector_rob(:, 1:2);
pcs_cont = vector_cont(:, 1:2);
pcs_ito = vectorcito(:, 1:2);
means = mean(X);
stds = std(X);
X_s = (X-means)./stds;
X_p = X_s*pcs;
X_p_rob = X_s*pcs_rob;
X_p_cont = X_s*pcs_cont;
X_p_ito = X_s*pcs_ito;

% hold off;
figure;
plot(X_p(:, 1), X_p(:, 2), 'go');
figure;
plot(X_p_rob(:, 1), X_p_rob(:, 2), 'bo');
figure;
plot(X_p_cont(:, 1), X_p_cont(:, 2), 'ro');
figure;
plot(X_p_ito(:, 1), X_p_ito(:, 2), 'yo');