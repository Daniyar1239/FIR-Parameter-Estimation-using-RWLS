% Function that computes the AIC complexity criterion to estimate the order
% of the FIR model
% Input: output y, input u, estimated parameters theta, and a forgetting
% factor lambda
% Output: AIC value for a given order

function AIC = myAIC(y,u,theta,lambda)

N=length(y);
n=length(theta);

J=myCostFunc(y,u,theta,lambda);

% Calculating AIC criterion for order estimation
AIC=N*log(J)+2*n;

end

