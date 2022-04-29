clear 
% randn('seed', 181121)

global D T W X Y Z

read;

[beta_T1, sigma_T1] = OLS(W, T(:, 1));
[beta_T2, sigma_T2] = OLS(W, T(:, 2));
[beta_T3, sigma_T3] = OLS(W, T(:, 3));
[beta_T4, sigma_T4] = OLS(W, T(:, 4));
[beta_D, sigma_D] = OLS(Z, D); % we normalize sigma_D = 1
[beta_1, sigma_1] = OLS(X, Y);
[beta_0, sigma_0] = OLS(X, Y);

[alpha_T1, alpha_T2, alpha_T3, alpha_T4, alpha_I, alpha_1, alpha_0, sigma_theta] = deal(1);

guess = [beta_0; beta_1; beta_D; beta_T1; beta_T2; beta_T3; beta_T4; ...
    sigma_0; sigma_1; sigma_T1; sigma_T2; sigma_T3; sigma_T4; ...
    alpha_0; alpha_1; alpha_I; alpha_T2; alpha_T3; alpha_T4; ...
    sigma_theta];

tic
options = optimoptions(@fminunc, 'Algorithm', 'quasi-newton', 'Display', 'iter',...
    'GradObj', 'off', 'HessUpdate', 'bfgs', 'UseParallel', false,...
    'TolFun', 1e-6, 'TolX', 1e-6, 'MaxIter', 1e6, 'MaxFunEvals', 1e6);
[estimates, estimatesF, exitflag, output, grad, hessian] = fminunc('roy_loglikelihood', guess, options);

runtime = toc;

se = sqrt(diag(inv(hessian)));
