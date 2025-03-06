% Function that computes the vector phi of shifted input samples  based on
% the order n and the current time stamp k
% Input: input u, order n, and current time k
% Output: vector phi

function phi = myPhi(u,n,k) % if n = 5, k = 6 

phi_u = [u(k-n)]; % [u(1)];

for j = k-n+1:k-1 % j = 2:5
    phi_u = [u(j) phi_u];
end

phi=phi_u';

end
