source('src/data.R')

model_4 <-
    lm(
        wage ~ privateHS + male + north + center + test_lect + test_mate + test_soc + test_nat,
        data = data.frame(data)
    )

summary(model_4)
