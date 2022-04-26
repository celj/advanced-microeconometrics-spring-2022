if (!require("pacman"))
    install.packages("pacman")

pacman::p_load(rmarkdown,
               tidyverse,
               here)

setwd(paste0(here(), '/hw2'))

data <- read.csv('data/data.csv')

D <- data[names(data) %in% c('privateHS')]
W <- data[names(data) %in% c(
    'male',
    'momschoolingX',
    'dadschoolingX',
    'broken_homeX',
    'incomehhX',
    'north',
    'center'
)]
X <- data[names(data) %in% c('male',
                             'north',
                             'center')]
Y <- data[names(data) %in% c('wage')]
Z <- data[names(data) %in% c('male',
                             'north',
                             'center',
                             'share_private',
                             'avg_price')]
