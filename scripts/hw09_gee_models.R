#HW09
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
install.packages("geepack")
library(geepack)
# setwd() removed - set your own working directory
Atlantic <- read.csv("inun_TWL_and_NFHL_cty_Atlantic.csv")
Bergen <- read.csv("inun_TWL_and_NFHL_cty_Bergen.csv")
Burlington <- read.csv("inun_TWL_and_NFHL_cty_Burlington.csv")
Camden <- read.csv("inun_TWL_and_NFHL_cty_Camden.csv")
CapeMay <- read.csv("inun_TWL_and_NFHL_cty_CapeMay.csv")
Cumberland <- read.csv("inun_TWL_and_NFHL_cty_Cumberland.csv")
Essex <- read.csv("inun_TWL_and_NFHL_cty_Essex.csv")
Gloucester <- read.csv("inun_TWL_and_NFHL_cty_Gloucester.csv")
Hudson <- read.csv("inun_TWL_and_NFHL_cty_Hudson.csv")
Hunterdon <- read.csv("inun_TWL_and_NFHL_cty_Hunterdon.csv")
Mercer <- read.csv("inun_TWL_and_NFHL_cty_Mercer.csv")
Middlesex <- read.csv("inun_TWL_and_NFHL_cty_Middlesex.csv")
Monmouth <- read.csv("inun_TWL_and_NFHL_cty_Monmouth.csv")
Morris <- read.csv("inun_TWL_and_NFHL_cty_Morris.csv")
Ocean <- read.csv("inun_TWL_and_NFHL_cty_Ocean.csv")
Passaic <- read.csv("inun_TWL_and_NFHL_cty_Passaic.csv")
Salem <- read.csv("inun_TWL_and_NFHL_cty_Salem.csv")
Somerset <- read.csv("inun_TWL_and_NFHL_cty_Somerset.csv")
Sussex <- read.csv("inun_TWL_and_NFHL_cty_Sussex.csv")
Union <- read.csv("inun_TWL_and_NFHL_cty_Union.csv")
Union <- read.csv("inun_TWL_and_NFHL_cty_Union.csv")
Warren <- read.csv("inun_TWL_and_NFHL_cty_Warren.csv")
csv_files <- list.files(pattern = "*.csv")
data_list <- lapply(csv_files, read.csv)
combined_data <- do.call(rbind, data_list)
write.csv(combined_data, "MODIV22.csv", row.names = FALSE)
# GEE Model with temperature and time
Gee_temp <- geeglm(temp ~ time + group + time:group, data = stress_data, id = ID, family = gaussian(link = "identity"), corstr = "exchangeable")
summary(Gee_temp)

# Autoregressive model AR(1) correlation structure
Gee_Auto_reg <- geeglm(temp ~ time + group + time:group, data = stress_data, id = ID, family = gaussian(link = "identity"), corstr = "ar1")
summary(Gee_Auto_reg)

# Unstructured Model correlation structure
Gee_Unstruc <- geeglm(temp ~ time + group + time:group, data = stress_data, id = ID, family = gaussian(link = "identity"), corstr = "unstructured")
summary(Gee_Unstruc)

#Respective QIC for each model using the correct function
QIC_exch <- QIC(Gee_temp)
QIC_ar1 <- QIC(Gee_Auto_reg)
QIC_unstr <- QIC(Gee_Unstruc)

cat("QIC for Exchangeable model:", QIC_exch, "\n")
cat("QIC for AR(1) model:", QIC_ar1, "\n")
cat("QIC for Unstructured model:", QIC_unstr, "\n")
