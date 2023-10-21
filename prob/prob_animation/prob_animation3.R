#only heat map
library(ggplot2)
library(dplyr)

rm(list = ls())

#the length of the sides of the square
l = 100

#number of trials
t = 1000

#a vector before making the matrix
base = numeric(l^2)

#the number of 1
how_many_1 = numeric(t)

#random
random = as.integer(runif(t, 1, l^2))

#change the numbers of base (=trials)
j = 1 #count

for (i in random) {
  base[i] = ( base[i] + 1 ) %% 2
  j = j + 1
  how_many_1[j] = sum(base) 
}

#convert into data frame
df_how_many_1 <- data.frame(step = 0:t, count = how_many_1)

#heat map!!!
#convert into matrix(data frame)
df_base <- data.frame(
  row = rep(1:l, each = l),
  col = rep(1:l, times = l),
  value = base
)

#draw heat map
ggplot(df_base, aes(x = col, y = row, fill = value)) +
  geom_tile() +
  scale_fill_gradient(low = "white", high = "black") +
  theme_bw()
