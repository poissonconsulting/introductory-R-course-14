rm(list = ls())
graphics.off()
data(ToothGrowth)

mod <- lm(len ~ supp + dose, data = ToothGrowth)
mod2 <- lm(len ~ supp, data = ToothGrowth)
mod3 <- lm(len ~ dose, data = ToothGrowth)
mod4 <- lm(len ~ supp * dose, data = ToothGrowth)

summary(mod4)

newdata <- datalist::new_data(ToothGrowth, c("dose", "supp"))

newdata$len <- predict(mod, newdata = newdata)
newdata$len2 <- predict(mod2, newdata = newdata)
newdata$len3 <- predict(mod3, newdata = newdata)
newdata$len4 <- predict(mod4, newdata = newdata)

gp <- ggplot(data = ToothGrowth, aes(x = dose, y = len, colour = supp))
gp <- gp + geom_point(position = position_jitter(width = 0.1))
gp <- gp + geom_line(data = newdata, aes(group = supp, y = len))
quartz()
print(gp)

gp <- ggplot(data = ToothGrowth, aes(x = dose, y = len, colour = supp))
gp <- gp + geom_point(position = position_jitter(width = 0.1))
gp <- gp + geom_line(data = newdata, aes(group = supp, y = len2))
quartz()
print(gp)

gp <- ggplot(data = ToothGrowth, aes(x = dose, y = len, colour = supp))
gp <- gp + geom_point(position = position_jitter(width = 0.1))
gp <- gp + geom_line(data = newdata, aes(group = supp, y = len3))
quartz()
print(gp)

gp <- ggplot(data = ToothGrowth, aes(x = dose, y = len, colour = supp))
gp <- gp + geom_point(position = position_jitter(width = 0.1))
gp <- gp + geom_line(data = newdata, aes(group = supp, y = len4))
quartz()
print(gp)

