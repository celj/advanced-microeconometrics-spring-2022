source('src/data.R')

model_2 <- lm(wage ~ privateHS + male + north + center,
              data = data.frame(data))

summary(model_2)
