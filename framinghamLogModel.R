str(framingham)

library(caTools)

set.seed(100)
split<-sample.split(framingham$TenYearCHD, SplitRatio = 0.65)
train<-subset(framingham,split==TRUE)
test<-subset(framingham,split=FALSE)

framinghamLog<-glm(TenYearCHD~male+age+cigsPerDay+totChol+sysBP+glucose,data=train,family = "binomial")
summary(framinghamLog)

predictTest = predict(framinghamLog, type="response", newdata=test)

table(test$TenYearCHD, predictTest > 0.50)
library(ROCR)
ROCRpred = prediction(predictTest, test$TenYearCHD)
as.numeric(performance(ROCRpred, "auc")@y.values)
