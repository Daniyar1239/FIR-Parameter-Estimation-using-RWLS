% Function that performs the whiteness test on the residuals
% Input: the residuals e, number of the autocorrelation samples m, and the
% parameter alpha
% Output: test statistic variable x and the chi-square critical value

function [x, chi2_val]  = myValidation(e, m, alpha)

N = length(e);

% Calculate the autocorrelation function of the residuals
r = zeros(m, 1);
for k = 1:m
    r(k) = (1/(N-k)) * sum(e(1:N-k) .* e(k+1:N));
end

% Calculate the statistical test value x and the chi2 value for a given m
% and alpha
df = m;
x = N * (r' * r)/var(e);
chi2_val = chi2inv(1 - alpha, df);

end