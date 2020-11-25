function [Y] = ICA(X, maxiter, step_size)

X = X';
[M, N] = size(X);
W = eye(M);
epsi = 1e-6;
dW = zeros(size(W));
Y = zeros(M,N);


%% IVA processing
fprintf('Iteration:    ');
for iter=1:maxiter
    fprintf('\b\b\b\b%4d', iter);
    Y = W*X; % calculate output
    dW = (eye(M) - (Y./(abs(Y)+epsi))*Y' / N) * W;
    W = W + step_size*dW;
end

W = diag(diag(inv(W)))*W;
Y = W*X;