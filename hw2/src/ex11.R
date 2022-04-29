source('src/data.R')
source('src/ex10.R')

ATE <- sim_df %>%
    pull(beta) %>%
    mean()

TT <- sim_df %>%
    filter(decision == 1) %>%
    pull(beta) %>%
    mean()
