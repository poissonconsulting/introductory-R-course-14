rm(list = ls())

mod <- lm(Volume ~ Girth, data = trees)
summary(mod)
library(datalist)
newdata <- datalist::new_data(trees, "Girth")
newdata$Volume <- predict(mod, newdata = newdata)

quartz()
gp <- ggplot(data = trees, aes(x = Girth, y = Volume))
gp <- gp + geom_point()
gp <- gp + geom_line(data = newdata)
print(gp)
#conf name
pred <- data.frame(predict(mod, newdata, interval = "conf"))
newdata$Volume <- pred$fit
newdata$lwr <- pred$lwr
newdata$upr <- pred$upr
gp <- gp + geom_line(data = newdata, aes(y = lwr), linetype = "dashed")
gp <- gp + geom_line(data = newdata, aes(y = upr), linetype = "dashed")
print(gp)

pred2 <- data.frame(predict(mod, newdata, interval = "pred"))
newdata$lwr2 <- pred2$lwr
newdata$upr2 <- pred2$upr

gp <- gp + geom_line(data = newdata, aes(y = lwr2), linetype = "dotted")
gp <- gp + geom_line(data = newdata, aes(y = upr2), linetype = "dotted")
print(gp)


