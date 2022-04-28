source('src/data.R')

privateHS_est <- round(lm(d ~ z)$fitted.values)

data_2sls <- cbind(data.frame(data), privateHS_est)

model_3 <- lm(wage ~ privateHS_est, data = data_2sls)

summary(model_3)
