# setwd() removed — set your own working directory 
library(readr)
rm(list=ls())
ebldata <- read.csv("data/eblcat.csv")
ebldata$eblcat <- 0
ebldata$eblcat[ebldata$ebl > 660] <- 1
install.packages("lmtest")
install.packages("car")
install.packages("MASS")
install.packages("lme4")
install.packages("glmnet")
install.packages("lmtest")
library(lmtest)
install.packages("questionr")

model1 <- glm(ICU ~ eblcat, data = ebldata, family = "binomial")
summary(model1)
lrtest(model1)
questionr::odds.ratio(model1)
model2 <- glm(ICU ~ eblcat + op, data = ebldata, family = "binomial")
summary(model2)
lrtest(model2)
questionr::odds.ratio(model2)
lmtest::lrtest(model1, model2)

