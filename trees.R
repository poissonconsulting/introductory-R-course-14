# this is a comment
graphics.off()
rm(list = ls())

f <- c(0, 32, 64, 100)
C <- (f - 32) * 5/9
print(C)

farenheit_to_kelvin <- function(farenheit) {
    kelvin <- ((farenheit - 32) * 5/9) + 273.15
    stop(paste(farenheit,"F is", kelvin, "K"))
    return(kelvin)
}

farenheit_to_kelvin(100)
print
message
warning
stop

library(ggplot2)
gp <- ggplot(data = trees, aes(x = Girth, y = Volume, size = Girth))
gp <- gp + geom_point()
print(gp)

gp <- ggplot(data = msleep, aes(x = bodywt, y = brainwt, size = sleep_total))
gp <- gp + facet_wrap(~vore)
gp <- gp + geom_point()
gp <- gp + scale_x_continuous(name = "Body Weight (kg)", trans = "log10")
gp <- gp + scale_y_continuous(name = "Brain Weight (kg)", trans = "log10")
gp <- gp + scale_size_continuous(name = "Sleep (hr)", breaks = c(5,10))
gp

