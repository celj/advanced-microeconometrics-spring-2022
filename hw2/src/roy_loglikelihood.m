function output = roy_loglikelihood(initial_guess)

global D T W X Y Z

colW = size(W, 2);
colX = size(X, 2);
colZ = size(Z, 2);

index = [colX, ...
    2 * colX, ...
    2 * colX + colZ, ...
    2 * colX + colZ + colW, ...
    2 * colX + colZ + 2 * colW, ...
    2 * colX + colZ + 3 * colW, ...
    2 * colX + colZ + 4 * colW, ...
    2 * colX + colZ + 4 * colW + 1, ...
    2 * colX + colZ + 4 * colW + 2, ...
    2 * colX + colZ + 4 * colW + 3, ...
    2 * colX + colZ + 4 * colW + 4, ...
    2 * colX + colZ + 4 * colW + 5, ...
    2 * colX + colZ + 4 * colW + 6, ...
    2 * colX + colZ + 4 * colW + 7, ...
    2 * colX + colZ + 4 * colW + 8, ...
    2 * colX + colZ + 4 * colW + 9, ...
    2 * colX + colZ + 4 * colW + 10, ...
    2 * colX + colZ + 4 * colW + 11, ...
    2 * colX + colZ + 4 * colW + 12, ...
    2 * colX + colZ + 4 * colW + 13];

beta_0 = initial_guess(1:index(1));
beta_1 = initial_guess(index(1) + 1:index(2));
beta_D = initial_guess(index(2) + 1:index(3));
beta_T1 = initial_guess(index(3) + 1:index(4));
beta_T2 = initial_guess(index(4) + 1:index(5));
beta_T3 = initial_guess(index(5) + 1:index(6));
beta_T4 = initial_guess(index(6) + 1:index(7));
sigma_0 = initial_guess(index(7) + 1:index(8));
sigma_1 = initial_guess(index(8) + 1:index(9));
sigma_T1 = initial_guess(index(9) + 1:index(10));
sigma_T2 = initial_guess(index(10) + 1:index(11));
sigma_T3 = initial_guess(index(11) + 1:index(12));
sigma_T4 = initial_guess(index(12) + 1:index(13));
alpha_0 = initial_guess(index(13) + 1:index(14));
alpha_1 = initial_guess(index(14) + 1:index(15));
alpha_I = initial_guess(index(15) + 1:index(16));
alpha_T2 = initial_guess(index(16) + 1:index(17));
alpha_T3 = initial_guess(index(17) + 1:index(18));
alpha_T4 = initial_guess(index(18) + 1:index(19));
sigma_theta = initial_guess(index(19) + 1:index(20));

ithL = @(theta) (normpdf(Y - X * beta_0 - theta * alpha_0, 0, exp(sigma_0)) ...
    .* normpdf(Y - X * beta_1 - theta * alpha_1, 0, exp(sigma_1)) ...
    .* normpdf(T(:, 1) - W * beta_T1 - theta, 0, exp(sigma_T1)) ...
    .* normpdf(T(:, 2) - W * beta_T2 - theta * alpha_T2, 0, exp(sigma_T2)) ...
    .* normpdf(T(:, 3) - W * beta_T3 - theta * alpha_T3, 0, exp(sigma_T3)) ...
    .* normpdf(T(:, 4) - W * beta_T4 - theta * alpha_T4, 0, exp(sigma_T4)) ...
    .* (1 - normcdf(Z * beta_D + theta * alpha_I, 0, 1)) .^ (1 - D) ...
    .* normcdf(Z * beta_D + theta * alpha_I, 0, 1) .^ D ...
    .* normpdf(theta, 0, exp(sigma_theta)));

q = integral(ithL, -Inf, Inf, 'ArrayValued', true);

output = -sum(log(q));

end
