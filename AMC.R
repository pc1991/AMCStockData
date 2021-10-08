library(faraway)
library(readr)
AMC <- read_csv("AMC.csv")
View(pfizer)

library(mlbench)
library(caret)
library(corrplot)

validationIndex <- createDataPartition(AMC$Volume, p = .8, list = FALSE)
validation <- AMC[-validationIndex,]
amc <- AMC[validationIndex,]

dim(amc)
sapply(amc, class)
head(amc, n = 20)
amc[,1] <- as.numeric(as.character((amc[,1])))
amc <- amc[,-1]
sapply(amc, class)
cor(amc[,1:6])

#Histograms with attributes#
hist(amc$Open, main = "Open")
hist(amc$High, main = "High")
hist(amc$Low, main = "Low")
hist(amc$Close, main = "Close")
hist(amc$`Adj Close`, main = "Adj Close")
hist(amc$Volume, main = "Volume")

#Density Plots with attributes#
plot(density(amc$Open), main = "Open")
plot(density(amc$High), main = "High")
plot(density(amc$Low), main = "Low")
plot(density(amc$Close), main = "Close")
plot(density(amc$`Adj Close`), main = "Adj Close")
plot(density(amc$Volume), main = "Volume")

#Boxplots with attributes#
boxplot(amc$Open, main = "Open")
boxplot(amc$High, main = "High")
boxplot(amc$Low, main = "Low")
boxplot(amc$Close, main = "Close")
boxplot(amc$`Adj Close`, main = "Adj Close")
boxplot(amc$Volume, main = "Volume")

#Scatter plot Matrix#
pairs(amc[,1:6])

#Correlation Plot#
correlations <- cor(amc[,1:6])
corrplot(correlations, method = "circle")

#Run the algorithms using 10-fold cross-validation#
trainControl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
metric <- "RMSE"

#Linear Model#
set.seed(7)
fit.lm <- train(Volume ~ ., data = amc, method = "lm", metric = metric, preProc = c("center", "scale"), trControl = trainControl)

#General Linear Model
set.seed(7)
fit.glm <- train(Volume ~ ., data = amc, method = "glm", metric = metric, preProc = c("center", "scale"), trControl = trainControl)

#Penalized Linear Model (GLMNET)#
set.seed(7)
fit.glmnet <- train(Volume ~ ., data = amc, method = "glmnet", metric = metric, preProc = c("center", "scale"), trControl = trainControl)

#Support Vector Machines#
set.seed(7)
fit.svm <- train(Volume ~ ., data = amc, method = "svmRadial", metric = metric, preProc = c("center", "scale"), trControl = trainControl)

#k-Nearest Neighbors#
set.seed(7)
fit.knn <- train(Volume ~ ., data = amc, method = "knn", metric = metric, preProc = c("center", "scale"), trControl = trainControl)

outcome <- resamples(list(LM = fit.lm, GLM = fit.glm, GLMNET = fit.glmnet, SVM = fit.svm, KNN = fit.knn))
summary(outcome)
dotplot(outcome)

#Remove the correlated attributes#
#Find the attributes that are highly correlated#
set.seed(7)
ghost <- .7
highlyCorrelated <- findCorrelation(correlations, cutoff = ghost)

for (value in highlyCorrelated) {
  print(names(amc)[value])
}

#Create a new dataset without highly correlated features#
amcFeatures <- amc[,-highlyCorrelated]
dim(amcFeatures)

#Second Comparison without the highly correlated features#
#Run the algorithms using 10-fold cross-validation#
trainControl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
metric <- "RMSE"

#Linear Model#
set.seed(7)
fit.lm <- train(Volume ~ ., data = amcFeatures, method = "lm", metric = metric, preProc = c("center", "scale"), trControl = trainControl)

#General Linear Model
set.seed(7)
fit.glm <- train(Volume ~ ., data = amcFeatures, method = "glm", metric = metric, preProc = c("center", "scale"), trControl = trainControl)

#Penalized Linear Model (GLMNET)#
set.seed(7)
fit.glmnet <- train(Volume ~ ., data = amcFeatures, method = "glmnet", metric = metric, preProc = c("center", "scale"), trControl = trainControl)

#Support Vector Machines#
set.seed(7)
fit.svm <- train(Volume ~ ., data = amcFeatures, method = "svmRadial", metric = metric, preProc = c("center", "scale"), trControl = trainControl)

#k-Nearest Neighbors#
set.seed(7)
fit.knn <- train(Volume ~ ., data = amcFeatures, method = "knn", metric = metric, preProc = c("center", "scale"), trControl = trainControl)

outcome2 <- resamples(list(LM = fit.lm, GLM = fit.glm, GLMNET = fit.glmnet, SVM = fit.svm, KNN = fit.knn))
summary(outcome2)
dotplot(outcome2)

#Third Comparison using the Box-Cox Transformation#
#Run the algorithms using 10-fold cross-validation#
trainControl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
metric <- "RMSE"

#Linear Model#
set.seed(7)
fit.lm <- train(Volume ~ ., data = amc, method = "lm", metric = metric, preProc = c("center", "scale", "BoxCox"), trControl = trainControl)

#General Linear Model
set.seed(7)
fit.glm <- train(Volume ~ ., data = amc, method = "glm", metric = metric, preProc = c("center", "scale", "BoxCox"), trControl = trainControl)

#Penalized Linear Model (GLMNET)#
set.seed(7)
fit.glmnet <- train(Volume ~ ., data = amc, method = "glmnet", metric = metric, preProc = c("center", "scale", "BoxCox"), trControl = trainControl)

#Support Vector Machines#
set.seed(7)
fit.svm <- train(Volume ~ ., data = amc, method = "svmRadial", metric = metric, preProc = c("center", "scale", "BoxCox"), trControl = trainControl)

#k-Nearest Neighbors#
set.seed(7)
fit.knn <- train(Volume ~ ., data = amc, method = "knn", metric = metric, preProc = c("center", "scale", "BoxCox"), trControl = trainControl)

outcome3 <- resamples(list(LM = fit.lm, GLM = fit.glm, GLMNET = fit.glmnet, SVM = fit.svm, KNN = fit.knn))
summary(outcome3)
dotplot(outcome3)

#Apply Ensemble Methods#
trainControl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
metric <- "RMSE"

#Random Forest#
set.seed(7)
fit.rf <- train(Volume ~ ., data = amc, method = "rf", metric = metric, preProc = c("BoxCox"), trControl = trainControl)

#Stochastic Gradient Boosting Model#
set.seed(7)
fit.gbm <- train(Volume ~ ., data = amc, method = "gbm", metric = metric, preProc = c("BoxCox"), trControl = trainControl, verbose = FALSE)

#Cubist#
set.seed(7)
fit.cubist <- train(Volume ~ ., data = amc, method = "cubist", metric = metric, preProc = c("BoxCox"), trControl = trainControl)

#Compare the ensemble algorithms#
ensemble <- resamples(list(RF = fit.rf, GBM = fit.gbm, CUBIST = fit.cubist))
summary(ensemble)
dotplot(ensemble)

#Cubist Wins#

#Look deeper into winning model#
print(fit.cubist)

#Train the Final Model#
library(Cubist)
set.seed(7)
x <- amc[,1:5]
y <- amc[,6]
preprocessParams <- preProcess(x)
tX <- sample(1:nrow(amc), floor(.8*nrow(amc)))
p <- c("Open", "High", "Low", "Close", "Adj Close")
tXp <- amc[tX, p]
tXr <- amc$Volume[tX]
fM <- cubist(x = tXp, y = tXr, commitees = 20, neighbors = 0)
fM
summary(fM)
predictions <- predict(fM, tXp)

#Compute the RMSE & R^2#
rmse <- sqrt(mean((predictions - tXr)^2))
r2 <- cor(predictions, tXr)^2
print(rmse) #15074650#
print(r2) #0.9479295#

