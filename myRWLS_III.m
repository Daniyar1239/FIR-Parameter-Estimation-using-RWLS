% Function that estimates the unknown parameters of the FIR model using the
% RWLS III algorithm for a given order and a forgetting factor
% Input: input u, output y, order n, and forgetting factor lambda
% Output: estimated coefficients theta and the covariance matrix S

function [theta, S] = myRWLS_III(y,u,n,lambda)

N = length(y)-n;
theta_0 = zeros(n,1); % For FIR
phi_1 = myPhi(u,n,n+1); % For finding inital theta (theta_1) to kickstart the algorithm
S_1 = lambda * 1e6 * eye(n); % Initialization of the covariance matrix 
S_temp = pinv(S_1); % S(1)^-1
theta_1 = theta_0 + S_temp*phi_1*(y(n+1)-phi_1'*theta_0); % Finding the initial theta
theta_temp = theta_1;

% Solving RWLS III iteratively 
for i = 2:N
    curr_phi = myPhi(u,n,n+i);
    S_t_inv = ((1/lambda) * S_temp) - (S_temp * (curr_phi * curr_phi') * S_temp)/...
        (lambda * (lambda + curr_phi' * S_temp * curr_phi));
    theta_t = theta_temp + S_t_inv * curr_phi * (y(n+i) - curr_phi' * theta_temp);
    theta_temp = theta_t;
    S_temp = S_t_inv;
end

theta = theta_t;
S = pinv(S_t_inv);

end