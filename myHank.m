% Function that forms the Hankel matrix based on the input samples of the
% FIR model
% Input: input u and order n
% Output: Hankel matrix H

function H = myHank(u,n)
    
N=length(u);
H=zeros(N-n,n);
    
% Hankel matrix generation, where u is the input of FIR model and n is 
% the model order
for j=1:n
    H(:,n-j+1)=u(j:N-n+(j-1));  % N = 5000, n = 5 => H(:,5) = u(1:4995); H(:,4) = u(2:4996) etc.
end
    
end


