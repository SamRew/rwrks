## ----chunk1, verbatim = TRUE---------------------------------------------
1 + 1

## print "a" + "b"

## ----setup, verbatim = TRUE----------------------------------------------
knitr::opts_chunk$set(message = FALSE, warning = FALSE)

## ------------------------------------------------------------------------
m <- lm(mpg ~ disp, data = mtcars)
summary(m) # output isn't very attractive

## ------------------------------------------------------------------------
library(pander)
pander(m)

## ------------------------------------------------------------------------
a <- anova(m)
a

## ------------------------------------------------------------------------
pander(a)

## ------------------------------------------------------------------------
methods(pander)

