if (!require("pacman"))
    install.packages("pacman")

pacman::p_load(rmarkdown,
               tidyverse,
               here)

setwd(paste0(here(), '/hw2'))

data <- data.matrix(read.csv('data/data.csv'))

d <- data[, c('privateHS')]
t_scores <- data[, grepl('test_', colnames(data))]
w <- data[, c(
    'male',
    'momschooling2',
    'momschooling3',
    'momschooling_miss',
    'dadschooling2',
    'dadschooling3',
    'dadschooling_miss',
    'broken_home1',
    'broken_home_miss',
    'incomehh2',
    'incomehh3',
    'incomehh_miss',
    'north',
    'center'
)]
x <- data[, c('male',
              'north',
              'center')]
y <- data[, c('wage')]
z <- data[, c('male',
              'north',
              'center',
              'share_private',
              'avg_price')]
