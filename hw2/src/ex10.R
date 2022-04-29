source('src/data.R')
source('src/ex09.R')

set.seed(181121)

sim_x <- cbind(1, sim_data[, c(7, 19, 20)])
sim_z <- cbind(1, sim_data[, c(7, 19:22)])

alpha_0 <- 0.14479556
alpha_1 <- 0.14479572
alpha_I <- 0.03696093

b_0 <- c(7.81921708, 0.30213284, 0.47635371, 0.2734988)
b_1 <- c(7.8192177, 0.30213257, 0.47635472, 0.27349878)

gamma <-
    c(-0.4353483,
      0.1362415,-0.1255597,
      0.27133711,
      0.84976264,-0.1442248)

sigma_0 <- 0.13653706
sigma_1 <- 0.13653707

u_0 <- rnorm(n, 0, sigma_0)
u_1 <- rnorm(n, 0, sigma_1)

v <- rnorm(n, 0, 1)

y_0 <- (sim_x %*% b_0) + (theta * alpha_0) + u_0
y_1 <- (sim_x %*% b_1) + (theta * alpha_1) + u_1

sim_i <- (sim_z %*% gamma) + (theta * alpha_I) + v
sim_d <- ifelse(sim_i >= 0, 1, 0)

sim_df <- data.frame('beta' = y_1 - y_0,
                     'decision' = sim_d)

plot(
    density(sim_df$beta),
    main = 'Distribution of Gains',
    xlab = expression(y[1] - y[0]),
    ylab = NA
)
