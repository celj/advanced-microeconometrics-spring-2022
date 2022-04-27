function [beta, sigma] = OLS(X, Y)
%OLS regression
beta = inv(X' * X) * X' * Y;
error = Y - X*beta;
sigma = sqrt((error' * error) / (size(Y, 1) - size(X, 2)));
end

