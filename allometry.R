rm(list = ls())
graphics.off()
data(trees)

library(datalist)
theme_set(theme_bw())

trees$Volume <- log(trees$Volume)
trees$Girth <- log(trees$Girth)

mod <- lm(Volume ~ Girth, data = trees)
summary(mod)
newdata <- datalist::new_data(trees, "Girth")
newdata$Volume <- predict(mod, newdata = newdata)

quartz()
gp <- ggplot(data = trees, aes(x = exp(Girth), y = exp(Volume)))
gp <- gp + geom_point()
gp <- gp + geom_line(data = newdata)
gp <- gp + scale_x_continuous(name = "Girth")
gp <- gp + scale_y_continuous(name = "Volume")
print(gp)
#conf name
pred <- data.frame(predict(mod, newdata, interval = "conf"))
newdata$Volume <- pred$fit
newdata$lwr <- pred$lwr
newdata$upr <- pred$upr
gp <- gp + geom_line(data = newdata, aes(y = exp(lwr)), linetype = "dashed")
gp <- gp + geom_line(data = newdata, aes(y = exp(upr)), linetype = "dashed")
print(gp)

pred2 <- data.frame(predict(mod, newdata, interval = "pred"))
newdata$lwr2 <- pred2$lwr
newdata$upr2 <- pred2$upr

gp <- gp + geom_line(data = newdata, aes(y = exp(lwr2)), linetype = "dotted")
gp <- gp + geom_line(data = newdata, aes(y = exp(upr2)), linetype = "dotted")
print(gp)

quartz()
qplot(.fitted, .stdresid, data = mod) + geom_hline(yintercept = 0) + geom_smooth(se = FALSE)
