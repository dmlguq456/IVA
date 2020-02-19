function [y] = IVA(x, nfft, maxiter, step_size)

nol = fix(3*nfft/4);
nshift = nfft - nol;
X = permute(STFT(x, nfft, nshift),[3 2 1]);
[M, N, K] = size(X);
epsi = 1e-6;

W = zeros(M,M,K);
dW = zeros(size(W));
Y = zeros(M,N,K);
for k=1:K
    W(:,:,k) = eye(M);
end

%% IVA processing
fprintf('Iteration:    ');
for iter=1:maxiter
    fprintf('\b\b\b\b%4d', iter);
    for k=1:K
        Y(:,:,k) = W(:,:,k)*X(:,:,k);
    end
    r = sqrt(sum(abs(Y).^2,3))+epsi;
    for k=1:K
        dW(:,:,k) = (eye(M) - (Y(:,:,k)./r)*Y(:,:,k)'/N)*W(:,:,k);
    end
    % Update unmixing matrices
    W = W + step_size*dW;
end

%% Calculate outputs
for k=1:K
    W(:,:,k) = diag(diag(inv(W(:,:,k))))*W(:,:,k);
    Y(:,:,k) = W(:,:,k)*X(:,:,k);
end
y = ISTFT(permute(Y,[3 2 1]),nfft,nshift,size(x,1));