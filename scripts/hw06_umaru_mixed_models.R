# setwd() removed — set your own working directory 
library(readr)
rm(list=ls())
Umaru_data <- read.csv("data/UMARU.csv")
install.packages("lmtest")
install.packages("car")
install.packages("MASS")
install.packages("lme4")
install.packages("glmnet")
install.packages("lmtest")
library(lmtest)
library(car)
install.packages("questionr")
summary(Umaru_data)

log_model_Umaru <- glm(DFREE ~ SITE + RACE + SITE*RACE, family = "binomial", data = Umaru_data) 

summary(log_model_Umaru)

questionr::odds.ratio(log_model_Umaru)

#reduced logistic model to tests the validity/results without the interaction of race with SITE

log_reduce_model_Umaru <- glm(DFREE ~ SITE + RACE, family = "binomial", data = Umaru_data) 

summary(log_reduce_model_Umaru)

questionr::odds.ratio(log_reduce_model_Umaru)

#Likelihood Ratio test for checking the significance of the interaction


lmtest::lrtest(log_reduce_model_Umaru, log_model_Umaru)
#OR and 95% CI for OR
questionr::odds.ratio(log_model_Umaru)
