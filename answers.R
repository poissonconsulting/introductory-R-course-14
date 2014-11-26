rm(list = ls())
graphics.off()

exercise_function <- function () {
  i <- 0
  function (x) {
    i <<- i + 1
    message(paste0("Exercise ", i, ": ", x))
  }
}

exercise <- exercise_function()

exercise("What is nine raised to the power of three?")
9^3

exercise("And nine raised to the power of 0.5?")
9^0.5

exercise("97 out of 284 eggs survive. What is the mortality expressed as a percentage?")
(284 - 97) / 284 * 100

exercise("What is the result of `3 * 4 + 5`? And `5 + 3 * 4`? What does this indicate?")
3 * 4 + 5
5 + 3 * 4
(5 + 3) * 4

exercise("Does the `*` operator have precedence over the `^` operator? Demonstrate with an example.")
3*2^3
(3*2)^3
3*(2^3)

exercise("Which function calculates cumulative sums? And what arguments does it take?")
??"cumulative sum"

exercise("What arguments does the function `sqrt` take?")
?sqrt

exercise("Set `x` to be `7`. What is the value of `x^x`. Save the value in a object called `i`. If you assign the value `20` to the object `x` does the value of `i` change? What does this indicate about how R assigns values to objects?")
x <- 7
x^x
i <- x^x
x <- 20
i

exercise("Using the `rm` function and the assignment operator arrange your workspace so that 
it contains three objects `x`, `y` and `z` with values of `3`, `5` and `7`, respectively.")
#rm(list = ls())
x <- 3
y <- 5
z <- 7

exercise("Use the `seq` function to generate a vector of `30` evenly spaced numbers from `0` to `1`. Confirm its length.")
x <- seq(0, 1, length.out = 30)
length(x)

exercise("Create the vector that is the square root of all the whole numbers from `1` to `100`.")
sqrt(seq(1, 100))

exercise("Create a vector that gives the deviation of the values in the vector `seq(1, 10)` from their mean.")
x <- seq(1, 10)
x - mean(x)

exercise("Try combining character and numeric values together in the same vector. What happens?")
c("one", "1", "txt", 1, 999)

exercise("Coerce the factor `x` to a vector of class numeric using `as.numeric`. What happens?")
x <- c("blue", "green", "blue", "red", "green")
x <- as.factor(x)
as.numeric(x)

exercise("What are the data in the `ToothGrowth` data set?")
?ToothGrowth

exercise("Add a column `Diameter` to `trees` bearing in mind that `pi` is the ratio of the circumference (girth) to the diameter.")
data(trees)
trees$Diameter <- trees$Girth / pi

exercise("Load the package `foreign`. What arguments does the function `read.dbf` in the `foreign` package take?")
library(foreign)
?read.dbf

exercise("Install the package `ggplot2` onto your computer and then load it. What arguments does the function `ggplot` take.")
if(!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)
?ggplot

exercise("Install the latest version of the `jaggernaut` package from GitHub at
  <https://github.com/poissonconsulting/jaggernaut>. As it uses a number of GitHub packages you should follow the installation instructions on the [README](https://github.com/poissonconsulting/jaggernaut/blob/master/README.md) file.")
print("Ignore this exercise because requires JAGS to be installed")

exercise("Create a new folder on your desktop called RCourse and make this folder the working directory. To ensure you have been successful confirm that the output of `getwd()` refers to your RCourse folder.")
print("Achieve through GUI")

exercise("Create a new project called RCourse in the RCourse folder on your desktop. As the folder already exists choose the **Create project from: Existing Directory** option.
  To confirm you were successful quit RStudio and double-click the RCourse.Rproj file
  in the RCourse folder - RStudio should restart with RCourse as the working directory.")
print("Achieve through GUI")

exercise("Run the line of code above and then open the StocksMissing csv file in a spreadsheet program and replace the first five values in the `X` column with `NA`. Now use the `read.csv` function to import the StocksMissing csv file into the workspace. Use the `na.omit` function to delete the 
missing values. What happens to the data frame when the missing values are deleted?")
print("Achieve through other programs")

exercise("What does each of the following lines of R code do to the ToothGrowth data frame?")
if(!require(dplyr)) install.packages("dplyr")
library(dplyr)

head(ToothGrowth)
summary(ToothGrowth)
summary(filter(datasets::ToothGrowth, len < 30))
summary(mutate(datasets::ToothGrowth, len2 = len * 2))
summary(select(datasets::ToothGrowth, supp, dose))
head(arrange(datasets::ToothGrowth, dose, supp, len))

exercise("What happens if you filter negative prices from the gathered `dayCount` data frame before spreading?")
if(!require(tidyr)) install.packages("tidyr")
library(tidyr)
dayCount <- data.frame(day = 1:3, year1 = seq(-3,-4, length.out = 3), year2 = 4:6, year3 = -1:1)
dayCount <- gather(dayCount, year, count, -day)
spread(dayCount, year, count)
spread(filter(dayCount, count >= 0), year, count)

exercise("Append code to the `trees.R` script to convert 45 farenheit to celcius.
  Note The correct answer is 7.22.")
(45 - 32) * 5 / 9

exercise("Now use the code to convert the following temperatures in farenheit to celcius:
  0 , 32, 64 and 100.")

(c(0,32,64,100) - 32) * 5 / 9

exercise("Paste the code into a script and then execute it. What happens?
  Now type `farenheit_to_kelvin`. What happens? Finally type
  `farenheit_to_kelvin(c(0, 32))`. What happens now?")
farenheit_to_kelvin <- function (farenheit) {
  kelvin <- ((farenheit - 32) * 5 / 9) + 273.15
  return (kelvin)
}
farenheit_to_kelvin
farenheit_to_kelvin(c(0, 32))

exercise("What happens if you replace `geom_point` with `geom_line`?")
library(ggplot2)
gp <- ggplot(data = trees, aes(x = Girth, y = Volume))
gp <- gp + geom_line()
print(gp)

exercise("And what happens if you add both geoms to the `gp` object?")
gp <- gp + geom_point()
print(gp)

exercise("Create a new script called `ToothGrowth.R` and produce a plot of the `ToothGrowth` data for inclusion in a word report.")
data(ToothGrowth)
gp <- ggplot(data = ToothGrowth, aes(x = dose, y = len, color = supp, shape = supp))
gp <- gp + geom_jitter(position = position_jitter(width = 0.1))
gp <- gp + expand_limits(y = 0, x = c(0, 2.5))
print(gp)
#ggsave("ToothGrowth.png", width = 4, height = 4, dpi = 600)

exercise("Modify your `ToothGrowth.R` script so that it produces a second plot facetted by `supp`.")
gp <- gp + facet_grid(supp~.)
print(gp)

exercise("Alter your `ToothGrowth.R` script so that it produces a third plot using the black and white theme without grid lines.")

theme_set(theme_bw())
gp <- gp + theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())
print(gp)

exercise("Step through the above code line by line and document what each line is doing.")
if(!require(devtools)) install.packages("devtools")
library(devtools)
if(!require(datalist)) install_github("poissonconsulting/datalist@v0.4")
library(datalist)
newdata <- datalist::new_data(trees, "Girth")
newdata$Volume <- predict(mod,newdata=newdata)

gp <- ggplot(data=trees, aes(x=Girth,y=Volume))
gp <- gp + geom_point()
gp <- gp + geom_line(data=newdata)
print(gp)

exercise("Modify your `trees.R` script so that it fits a linear model to `Volume` against `Girth` and plots the observed data with 
confidence and prediction intervals.")
data(trees)
mod <- lm(Volume ~ Girth, data = trees)

newdata <- datalist::new_data(trees, "Girth")
conf <- data.frame(predict(mod,newdata,interval="conf"))
pred <- data.frame(predict(mod,newdata,interval="pred"))

newdata$Volume <- conf$fit
newdata$lower <- conf$lwr
newdata$upper <- conf$upr

newdata$lower_pred <- pred$lwr
newdata$upper_pred <- pred$upr

gp <- ggplot(data=newdata, aes(x=Girth,y=Volume))
gp <- gp + geom_point(data = trees)
gp <- gp + geom_line()
gp <- gp + geom_line(aes(y=lower),linetype='dashed')
gp <- gp + geom_line(aes(y=upper),linetype='dashed')
gp <- gp + geom_line(aes(y=lower_pred),linetype='dotted')
gp <- gp + geom_line(aes(y=upper_pred),linetype='dotted')

print(gp)

exercise("What does the previous diagnostic plot suggest to you?")
qplot(.fitted, .stdresid, data = mod) + 
  geom_hline(yintercept = 0) + geom_smooth(se = FALSE)

exercise("Try fitting an allometric relationship by `log` transforming
`Volume` and `Girth` and then using the same basic linear regression model.
Does the diagnostic plot suggest an improvement in
the model?")
mod <- lm(log(Volume) ~ log(Girth), data = trees)

conf <- data.frame(predict(mod,newdata,interval="conf"))
pred <- data.frame(predict(mod,newdata,interval="pred"))

newdata$Volume <- exp(conf$fit)
newdata$lower <- exp(conf$lwr)
newdata$upper <- exp(conf$upr)

newdata$lower_pred <- exp(pred$lwr)
newdata$upper_pred <- exp(pred$upr)

gp %+% newdata

qplot(.fitted, .stdresid, data = mod) + 
  geom_hline(yintercept = 0) + geom_smooth(se = FALSE)

exercise("Are the model's residuals consistent with the assumed error structure?")
mod <- lm(len ~ supp + dose, data = ToothGrowth)

qplot(.fitted, .stdresid, data = mod, color = supp) + 
  geom_hline(yintercept = 0)

exercise("Modify your script so that it adds the predicted line for both levels of `supp` to the scatter plot of the `ToothGrowth` data using the previous code.")

newdata <- datalist::new_data(ToothGrowth, c("dose", "supp"))
newdata$len <- data.frame(predict(mod,newdata,interval="conf"))$fit

gp <- ggplot(data = newdata, aes(x = dose, y = len, color = supp, shape = supp))
gp <- gp + geom_jitter(data = ToothGrowth, position = position_jitter(width = 0.1))
gp <- gp + geom_line()
gp <- gp + expand_limits(y = 0, x = c(0, 2.5))
print(gp)

exercise("Modify your script so that it fits all four competing models and then each model's predictions (along with the raw data) in separate windows.")

mod2 <- lm(len ~ supp, data = ToothGrowth)
mod3 <- lm(len ~ dose, data = ToothGrowth)
mod4 <- lm(len ~ dose * supp, data = ToothGrowth)

newdata$len <- data.frame(predict(mod2,newdata,interval="conf"))$fit
gp %+% newdata

newdata$len <- data.frame(predict(mod3,newdata,interval="conf"))$fit
gp %+% newdata

newdata$len <- data.frame(predict(mod4,newdata,interval="conf"))$fit
gp %+% newdata

exercise("Which model provides the best fit to the data?
Functions you might find useful are `anova` and `AIC`.")
AIC(mod, mod2, mod3, mod4)
anova(mod, mod2, mod3, mod4)
