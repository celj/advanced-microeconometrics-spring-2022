source('src/data.R')
source('src/ex08.R')

set.seed(181121)

sigma_theta <- -0.3167767
theta <- rnorm(n, 0, exp(sigma_theta))
plot(density(theta),
     main = expression(theta),
     xlab = expression(sigma))
