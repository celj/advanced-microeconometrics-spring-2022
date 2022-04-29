source('src/data.R')

n <- 10000

bootstrap <- function(df, samples, resampling_size) {
    output <- matrix(NA, nrow = 0, ncol = dim(df)[2])
    
    for (i in 1:samples) {
        resample <- colMeans(df[sample(nrow(df),
                                       size = resampling_size,
                                       replace = TRUE), ])
        output <- rbind(output, resample)
    }
    
    return(output)
}

sim_data <- bootstrap(data, n, 100)

# sim_data[, c(5, 7:20)] <- round(sim_data[, c(5, 7:20)])

summary(data[, c(1:5, 7:20)])[4, ]
summary(sim_data[, c(1:5, 7:20)])[4, ]
