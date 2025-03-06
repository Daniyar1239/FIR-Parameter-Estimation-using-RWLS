% Function that computes the MDL complexity criterion to estimate the order
% of the FIR model
% Input: output y, input u, estimated parameters theta, and a forgetting
% factor lambda
% Output: MDL value for a given order

function MDL = myMDL(y,u,theta,lambda)

N=length(y);
n=length(theta);

J=myCostFunc(y,u,theta,lambda);

% Calculating MDL criterion for order estimation
MDL=N*log(J)+2*n*log(N);

end

