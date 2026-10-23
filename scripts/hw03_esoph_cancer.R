
# setwd() removed — set your own working directory
library(readr)
c.cases <- read_csv("data/esoph_cancer.csv")
esoph_cancer <- read_csv("data/esoph_cancer.csv")
esoph_cancer$tobgrp <- ifelse(esoph_cancer$TOBACCO == 8 | esoph_cancer$TOBACCO == 9, NA,
                              
                              ifelse(esoph_cancer$TOBACCO == 0, 0,
                                     
                                     ifelse(esoph_cancer$TOBACCO >= 5, 3,
                                            
                                            ifelse(esoph_cancer$TOBACCO >= 3, 2,
                                                   
                                                   ifelse(esoph_cancer$TOBACCO >= 1, 1, NA)))))

esoph_cancer$tbg1 <- ifelse(esoph_cancer$tobgrp == 1,1,0)
esoph_cancer$tbg2 <- ifelse(esoph_cancer$tobgrp == 2,1,0)
esoph_cancer$tbg3 <- ifelse(esoph_cancer$tobgrp == 3,1,0)
model1 <- lm(ALCOHOL ~ AGE + tbg1 + tbg2 + tbg3, data = esoph_cancer)
str (esoph)
summary (model1)
model2 <- lm (ALCOHOL ~ AGE + TOBACCO, data = esoph_cancer)
summary (model2)
