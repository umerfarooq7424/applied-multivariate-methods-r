rm(list=ls())
# setwd() removed — set your own working directory
library(readr)
pregmortality <- read.csv("pregmortality.csv")
install.packages("lmtest")
install.packages("car")
install.packages("MASS")
install.packages("lme4")
install.packages("glmnet")
library(questionr)
library(nnet)
library(lmtest)

## Factor the variable for all relevant categories
pregmortality$cause2 <- factor(pregmortality$cause2) 
pregmortality$raceth <- factor(pregmortality$raceth) 
pregmortality$bor <- factor(pregmortality$bor) 
pregmortality$preg <- factor(pregmortality$preg)

## Specify reference categories as given in the questions of the Homework
pregmortality$cause2 <- relevel(pregmortality$cause2, ref = 2)
pregmortality$raceth <- relevel(pregmortality$raceth, ref = 1) 
pregmortality$bor <- relevel(pregmortality$bor, ref = 2) 
pregmortality$preg <- relevel(pregmortality$preg, ref = 1)

## Fit multinomial logit and later testing it for wald tests

model <- multinom(cause2 ~ raceth + bor + preg, data = pregmortality)
summary(model, Wald.ratios = TRUE)

## Partial likelihood to test: race with respect to its relevance in the model.
reduced_model <- multinom(cause2 ~ bor + preg, data = pregmortality) 
lmtest::lrtest(model, reduced_model)

##Finding all odds ratios and 95% CI for each questionr::odds.ratio(model)
## Compute predicted probability 

# Asian or pacific islander
OR_data = data.frame(raceth = "3", bor = "3", preg = "1")
OR_Probable <- predict(model, OR_data, type = "probs") 
OR_Probable


# Non-hispanic black
OR_data = data.frame(raceth = "1", bor = "3", preg = "1") 
OR_Probable <- predict(model, OR_data, type = "probs") 
OR_Probable

# Hispanic
OR_data = data.frame(raceth = "2", bor = "3", preg = "1") 
OR_Probable <- predict(model, OR_data, type = "probs") 
OR_Probable

# Non-Hispanic White
OR_data = data.frame(raceth = "4", bor = "3", preg = "1") 
OR_Probable <- predict(model, OR_data, type = "probs") 
OR_Probable

# Non-hispanic black
OR_data = data.frame(raceth = "4", bor = "3", preg = "1") 
OR_Probable <- predict(model, OR_data, type = "probs") 
OR_Probable


