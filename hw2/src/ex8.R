source('src/data.R')

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

sim_data <- bootstrap(data, 10000, 10)
