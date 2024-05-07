#read library
library(ggplot2)
library(dplyr)
library(tibble)

#clear screen
rm(list = ls())

#(setting) length of one side "l" and number of iteration "t"
l = 4
t = 10000 #ここでのtは少なめに設定してこれを繰り返す

#map vector
map_vec = numeric(l^2)

#random numbers 
random = as.integer(runif(t, 1, l^2))

# Initialize map_vec with NA
map_vec <- rep(NA, l^2)

#heat map!!!
#convert into matrix(data frame)
df_map <- data.frame(
  row = rep(1:l, each = l),
  col = rep(1:l, times = l),
  value = map_vec
)

png("./4x4/4x4_t0.png", 400, 400)
# draw heat map at initial state (setting NA color to white)
ggplot(df_map, aes(x = col, y = row, fill = as.factor(value))) +
  geom_tile() +
  scale_fill_manual(values = c(low = "white", high = "black"), na.value = "white") +
  theme_bw() +
  theme(legend.position = "none") +
  coord_fixed(ratio = 1) 
dev.off()

map_vec = numeric(l^2)
