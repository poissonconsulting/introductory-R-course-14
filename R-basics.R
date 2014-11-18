rm(list = ls())
graphics.off()

message("What is nine raised to the power of three?")

9^3

message("Nine powe 0.5")

9^0.5

message("97 - 284")

(284 - 97) / 284 * 100

message("3 * 4 + 5")

3* 4 + 5

5 + 3 * 4

(5 + 3) * 4

message("Does the * operator have precedence over the ˆ operator? Demonstrate with an example.")

3*2^3
(3*2)^3
3*(2^3)

message("Which function calculates cumulative sums? And what arguments does it take?")

??"cumulative sum"

message("What arguments does the function sqrt take?")

message("Using the rm function and the assignment operator arrange your workspace so that it contains three objects x, y and z with values of 3, 5 and 7, respectively.")

message("Use the seq function to generate a vector of 30 evenly spaced numbers from 0 to 1. Confirm its length.")

seq(0, 1, by = 1/29)
seq(0, 1, length.out = 30)

message("Try combining character and numeric values together in the same vector. What happens?")

rm(list = ls())
x <- 7.7
y <- x^x
y
