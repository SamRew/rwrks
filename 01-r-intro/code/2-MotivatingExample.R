## ------------------------------------------------------------------------
tips <- read.csv("http://heike.github.io/rwrks/01-r-intro/data/tips.csv")

## ------------------------------------------------------------------------
head(tips)

## ------------------------------------------------------------------------
str(tips)

## ------------------------------------------------------------------------
summary(tips)

## ---- eval=FALSE---------------------------------------------------------
## install.packages("ggplot2")
## library(ggplot2)

## ---- echo=FALSE---------------------------------------------------------
library(ggplot2)

## ---- fig.height=3, fig.width=7------------------------------------------
qplot(tip, total_bill, geom = "point", data = tips)

## ---- fig.height=4, fig.width=7------------------------------------------
qplot(tip, total_bill, geom = "point", data = tips, colour = time)

## ---- fig.height=4, fig.width=7------------------------------------------
qplot(tip, total_bill, geom = "point", data = tips) + 
    geom_smooth(method = "lm")

## ------------------------------------------------------------------------
tips$rate <- tips$tip / tips$total_bill

summary(tips$rate)

## ---- fig.height=4, fig.width=7------------------------------------------
qplot(rate, data = tips, binwidth = .01)

## ------------------------------------------------------------------------
tips[which.max(tips$rate),]

## ------------------------------------------------------------------------
mean(tips$rate[tips$sex == "Male"])
mean(tips$rate[tips$sex == "Female"])

## ------------------------------------------------------------------------
t.test(rate ~ sex, data = tips)

## ---- fig.height=3, fig.width=7------------------------------------------
qplot(smoker, rate, geom = "boxplot", data = tips)

## ---- fig.height=3, fig.width=7------------------------------------------
qplot(smoker, rate, geom = "boxplot", data = tips, color = sex)

