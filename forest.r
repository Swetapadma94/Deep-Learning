fire<-read.csv("E:\\Assignment\\neural network\\forestfires.csv")
View(fire)
fire$size_category<-as.numeric(fire$size_category)
fire$month<-as.numeric((fire$month))
fire$day<-as.numeric(fire$day)
View(fire)
attach((fire))
firenorm<-scale(fire)
View(firenorm)
fire1<-as.data.frame(firenorm)
View(fire1)
summary(fire1)
summary(fire1$size_category)
train<-fire1[1:370,]
test<-fire1[371:517,]
# Using multilayered feed forward nueral network
# package nueralnet
library(neuralnet)
library(nnet)
# Building model
model<-neuralnet(size_category~.,data = train)
plot(model)
str(model)
## SSE sum of squared errors . least SSE best model
# Evaluating model performance
# compute function to generate ouput for the model prepared
result<-compute(model,test[1:30])
summary(result)
predictedsize<-result$net.result
result$neurons
cor(predictedsize,test$size_category)
plot(predictedsize,test$size_category)
# new model
model1<-neuralnet(size_category~.,data = fire1,hidden = c(5,3))
plot(model1)
result1<-compute(model1,test[1:30])
prdsize<-result1$net.result
result1$neurons
cor(prdsize,test$size_category)
plot(prdsize,test$size_category)
