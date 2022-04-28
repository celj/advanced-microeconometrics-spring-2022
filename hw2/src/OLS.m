function [beta, sigma] = OLS(X, Y)
%OLS regression
beta = inv(X' * X) * X' * Y;
er = Y - X*beta;
sigma = sqrt((er' * er) / (size(Y, 1) - size(X, 2)));
end

