rm(list = ls())
data(ToothGrowth)

mod <- lm(len ~ supp + dose, data = ToothGrowth)
summary(mod)

quartz()
qplot(.fitted, .stdresid, data = mod) + geom_point(aes(color = supp))+ geom_hline(yintercept = 0) + geom_smooth(se = FALSE) + facet_wrap(~supp)
