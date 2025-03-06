% Function that computes the value of the weighted cost function for the given
% lambda and model order
% Input: output y, input u, estimated parameters theta, and a forgetting
% factor lambda
% Output: J value for a given order

function J = myCostFunc(y,u,theta,lambda)

N = length(y);
n = length(theta);

H = myHank(u,n);
weights = lambda.^(N-n:-1:1)';

% Weighted and normalized cost function for the RWLS III
J = (1/(N-n)) * (y(n+1:end)-H*theta)' * diag(weights) * (y(n+1:end)-H*theta);

end

