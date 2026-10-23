#HW08
#Applied Multivariate
#Umer Farooq

rm(list=ls())
install.packages("lmtest")
install.packages("car")
install.packages("MASS")
install.packages("lme4")
install.packages("glmnet")
library(questionr)
library(nnet)
library(lmtest)
# setwd() removed — set your own working directory
work_data <- read.csv("workdata.csv")
data$type <- factor(data$type)
data$loc <- factor(data$loc)
data$type <- relevel(data$type, ref = "0")
data$loc <- relevel(data$loc, ref = "0")
# Fit a Poisson regression model
model <- glm(daysabs ~ type, family = "poisson", data = data, offset = log(dayswk))
# Display the summary of the model
summary(model)
rate_ratio1 <- exp(coef(model))
conf_int1 <- exp(confint(model))
cbind(RR = rate_ratio1, conf_int1)
# Model M1: Using location and job type as predictors
M1 <- glm(daysabs ~ type + loc, family = "poisson", data = data, offset = log(dayswk))
summary(M1)
# Model M2: Using standardized test score, location, and job type as predictors
M2 <- glm(daysabs ~ type + loc + score, family = "poisson", data = data, offset = log(dayswk))
summary(M2)
# Compare the two models
anova_comparison <- anova(M1, M2, test = "Chisq")
# Display the comparison results
anova_comparison
rate_ratio2 <- exp(coef(M2))
conf_int2 <- exp(confint(M2))
cbind(RR = rate_ratio2, conf_int2)