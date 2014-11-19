
http://r-pkgs.had.co.nz/style.html

dayCount <- data.frame(day = 1:3,
                       hour = 20:22, 
                       year1 = seq(-3, -4, length.out = 3), 
                       year2 = 4:6, 
                       year3 = -1:1)
dayCount

library(tidyr)
gather(dayCount, year, count, -day, -hour)
gather(dayCount, year, count, year1, year2, year3)
gather(dayCount, year, count, year1, year2)
gather(dayCount, year, count, -day)
gather(dayCount, year, count, year1, year2, year3, day, hour)
gather(dayCount, year, count, everything())
gather(dayCount, year, count)
gather(dayCount, zzz, yyy, everything())

library(dplyr)
gather(select(dayCount, starts_with("year")), year, count, everything())

http://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html
