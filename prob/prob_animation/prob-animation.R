library(ggplot2)
library(dplyr)
library(tibble)
library(gganimate)

#clear screen
rm(list = ls())

#(setting) length and iteration
l = 10
t = 1000

#map vector
map_vec = numeric(l^2)

#random
random = as.integer(runif(t, 1, l^2))

#the number of "1"
how_many_1 = numeric(t + 1)

#change the numbers of base (=trials)
j = 1 #count

for (i in random) {
  map_vec[i] = ( map_vec[i] + 1 ) %% 2
  j = j + 1
  how_many_1[j] = sum(map_vec) 
}

#count the number of "1"
count_df = tibble(
  iteration = 0:t, 
  count = how_many_1 )

#draw figure
anim <- ggplot(count_df, aes(x = iteration, y = count)) + 
  scale_y_continuous(limits = c(0, l^2)) +
  geom_point(color = "hotpink", size = 3) + # 散布図
  geom_path(color = "hotpink",) + # 折れ線
  transition_reveal(along = iteration) + # フレーム
  labs(subtitle = "試行の回数 : {closest_state} \n 黒石の数 : {frame_along}",
       xlab("試行回数"),
       ylab("黒石の数"))

#make animation
animate(plot = anim, nframes = t+1, fps = 10)

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