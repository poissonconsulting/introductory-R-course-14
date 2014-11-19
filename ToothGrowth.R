rm(list = ls())
data(ToothGrowth)
summary(ToothGrowth)

gp <- ggplot(data = ToothGrowth, aes(x = dose, y = len, color = supp, shape = supp))
gp <- gp + facet_grid(supp~.)
gp <- gp + geom_jitter(position = position_jitter(width = 0.1))
gp <- gp + expand_limits(y = 0, x = c(0, 2.5))
quartz()

theme_set(theme_bw())

gp <- gp + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())

print(gp)
