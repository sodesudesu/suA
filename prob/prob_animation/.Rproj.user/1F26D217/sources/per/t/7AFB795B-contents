#15th August 2023
#決定版
#prob_animation_heatmap1のつづき
#このスクリプト全体を繰り返し実行すればanimationもどきにはなる

#random numbers 
random = as.integer(runif(t, 1, l^2))

#change the numbers of base (=trials)
j = 1 #count

for (i in random) {
  map_vec[i] = ( map_vec[i] + 1 ) %% 2
  j = j + 1
  the_number_of_black = sum(map_vec)
}

#heat map!!!
#convert into matrix(data frame)
df_map <- data.frame(
  row = rep(1:l, each = l),
  col = rep(1:l, times = l),
  value = map_vec
)

#draw heat map
ggplot(df_map, aes(x = col, y = row, fill = value)) +
  geom_tile() +
  scale_fill_gradient(low = "white", high = "black") +
  theme_bw() +
  theme(legend.position = "none") +
  coord_fixed(ratio = 1) 