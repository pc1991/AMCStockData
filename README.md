# AMC Stock Data from 2014-Present

(Courtesy: Arpit Verma of Kaggle)

# What is AMC Entertainment?

AMC Entertainment Holdings, Inc. (d/b/a AMC Theatres, originally an abbreviation for American Multi-Cinema; often referred to simply as AMC and known in some countries as AMC Cinemas or AMC Multi-Cinemas) is an American movie theater chain headquartered in Leawood, Kansas, and the largest movie theater chain in the world. Founded in 1920, AMC has the largest share of the U.S. theater market ahead of Regal and Cinemark Theatres. After acquiring Odeon Cinemas, UCI Cinemas, and Carmike Cinemas in 2016, it became the largest movie theater chain in the world. It has 2,866 screens in 358 theatres in Europe and 7,967 screens in 620 theatres in the United States.

# Information about this dataset

This dataset provides historical data of AMC Entertainment Holdings, Inc. (AMC). The data is available at a daily level. Currency is USD.


Key:

Date - Actual Date

Open - Price from the first transaction of a trading day

High - Maximum price in a trading day

Low - Minimum price in a trading day

Close - Price from the last transaction of a trading day

Adj Close - Closing price adjusted to reflect the value after accounting for any corporate actions

Volume - Number of units traded in a day.

# Setting Up The Validation Dataset

Now, in order to figure out which model works well for this dataset, a validation dataset is generated with 80% of the rows in the original dataset to use for training, with the remaining 20% of the data to be validated. The following graphs monitor the behavior of this training dataset.

# Validation Boxplots:

![AMC Stock Open Boxplot](https://user-images.githubusercontent.com/87962854/141599591-3e9b3e68-74cc-404f-bb8b-1cca39ff9593.png)

![AMC Stock High Boxplot](https://user-images.githubusercontent.com/87962854/141599605-7f86c0d1-8995-41af-bab4-40ef29746dfd.png)

![AMC Stock Low Boxplot](https://user-images.githubusercontent.com/87962854/141599612-13862abe-247a-4a31-aaa0-1763bc58e707.png)

![AMC Stock Close Boxplot](https://user-images.githubusercontent.com/87962854/141599625-14f2e4fb-3704-4780-ba2c-b594cfcfe489.png)

![AMC Stock Adj Close Boxplot](https://user-images.githubusercontent.com/87962854/141599632-9098fad2-7fb6-4219-a0cc-e0501ce2dbf5.png)

![AMC Stock Volume Boxplot](https://user-images.githubusercontent.com/87962854/141599642-c169d687-b8a3-4dfe-88fa-261464c9dd43.png)

# Validation Histograms:

![AMC Stock Open Histogram](https://user-images.githubusercontent.com/87962854/141599735-d69845f6-803c-4e2e-b6e1-e4851fe90e57.png)

![AMC Stock High Histogram](https://user-images.githubusercontent.com/87962854/141599744-c60a2e3b-d1f5-4f45-813a-a56ac6d5e05f.png)

![AMC Stock Low Histogram](https://user-images.githubusercontent.com/87962854/141599752-41c4c725-abc6-48bf-b48c-a2726eeaf10e.png)

![AMC Stock Close Histogram](https://user-images.githubusercontent.com/87962854/141599762-6729f7ac-a788-43d6-a250-380207b96b8e.png)

![AMC Stock Adj Close Histogram](https://user-images.githubusercontent.com/87962854/141599771-b4dee698-92f0-49b8-8865-4a4ebd25ba72.png)

![AMC Stock Volume Histogram](https://user-images.githubusercontent.com/87962854/141599779-e8a2ed0a-7795-4ba6-a6bf-0a0b0734542f.png)

# Validation Density Plots:

![AMC Stock Open Density Plot](https://user-images.githubusercontent.com/87962854/141600173-178d179e-e458-418a-a0ac-75bc5bc42d67.png)

![AMC Stock High Density Plot](https://user-images.githubusercontent.com/87962854/141600184-2f4d78ed-360c-4614-a82d-0162c0ba1216.png)

![AMC Stock Low Density Plot](https://user-images.githubusercontent.com/87962854/141600192-b7a3696d-a349-423d-be73-e3b3dc2e2d4f.png)

![AMC Stock Close Density Plot](https://user-images.githubusercontent.com/87962854/141600199-543566d2-1652-499d-8680-59795f7a9731.png)

![AMC Stock Adj Close Density Plot](https://user-images.githubusercontent.com/87962854/141600206-380eac98-96df-442c-93d5-0c20d6074517.png)

![AMC Stock Volume Density Plot](https://user-images.githubusercontent.com/87962854/141600213-aba15111-5181-466c-b5cd-7e4909ae4a86.png)

# Scatter Plot:

![AMC Stock Scatter Plot](https://user-images.githubusercontent.com/87962854/141600390-2bb17c6f-239c-4c8c-9f5a-83a53488ce91.png)

# Correlation Plot:

![AMC Stock Correlation Plot](https://user-images.githubusercontent.com/87962854/141600413-9ff9da4a-d636-4f9f-a740-0e9066529dbd.png)

# Finding The Best Model To Run The Data

In order to figure out which model to use to best predict where the data will trend, we would have to develop a test-harness using 10-fold cross validation with three repeats using various algorithms using various units of measure. The dot-plots showing the performances of each algorithm will be shown below.

# First Outcome Comparing AMC Stock Algorithms:

The algorithms in this first outcome are currently centered and scaled with the highly correlated values.

> outcome <- resamples(list(LM = fit.lm, GLM = fit.glm, GLMNET = fit.glmnet, SVM = fit.svm, KNN = fit.knn))
> 
> summary(outcome)
>
> Call:
> 
> summary.resamples(object = outcome)
>
> Models: LM (Linear Model), GLM (Generalized Linear Model), GLMNET (Penalized Linear Model), SVM (Support Vector Machines), KNN (k-Nearest Neighbors)
> 
> Number of resamples: 30 
>
> MAE 
> 
>            Min.  1st Qu.   Median     Mean  3rd Qu.     Max. NA's
>            
> LM     12953051 15748600 18889597 18867085 20288098 28714143    0
> 
> GLM    12953051 15748600 18889597 18867085 20288098 28714143    0
> 
> GLMNET 12525068 14823381 16795523 16891746 18838886 21194430    0
> 
> SVM     5469373  9163424 11043345 11686925 14508471 18779865    0
> 
> KNN     3680526  7838716  9201742  9888181 12449735 18141919    0
>
> RMSE 
> 
>            Min.  1st Qu.   Median     Mean  3rd Qu.      Max. NA's
>            
> LM     18448670 28932707 39036872 45528957 54000982  90905224    0
> 
> GLM    18448670 28932707 39036872 45528957 54000982  90905224    0
> 
> GLMNET 15277092 26185167 37147190 41555763 52632754  90660491    0
> 
> SVM     7514733 26758981 40627907 44926372 60926524 101696784    0
> 
> KNN    11264514 27632479 39947197 45696253 59777525 106387510    0
>
> Rsquared 
> 
>              Min.   1st Qu.    Median      Mean   3rd Qu.      Max. NA's
>              
> LM     0.30432783 0.4632728 0.5191817 0.5231661 0.5945303 0.7912763    0
> 
> GLM    0.30432783 0.4632728 0.5191817 0.5231661 0.5945303 0.7912763    0
> 
> GLMNET 0.31383694 0.4896796 0.5381849 0.5549713 0.6309693 0.8571197    0
> 
> SVM    0.32678897 0.4956748 0.5800586 0.5776315 0.7037011 0.8830470    0
> 
> KNN    0.03048308 0.3402185 0.5595156 0.4853565 0.6163114 0.8478114    0

![First Dotplot Outcome Comparing AMC Stock Algorithms](https://user-images.githubusercontent.com/87962854/141601114-e506d18d-1aaa-40b1-aedb-c42d622830e8.png)

# Second Dotplot Outcome Comparing AMC Stock Algorithms:

The algorithms in this second outcome are currently centered and scaled without the highly correlated values.

> outcome2 <- resamples(list(LM = fit.lm, GLM = fit.glm, GLMNET = fit.glmnet, SVM = fit.svm, KNN = fit.knn))
> 
> summary(outcome2)
>
> Call:
> 
> summary.resamples(object = outcome2)
>
> Models: LM, GLM, GLMNET, SVM, KNN 
>
> Number of resamples: 30 
>
> MAE 
> 
>            Min.  1st Qu.   Median     Mean  3rd Qu.     Max. NA's
>            
> LM     17120963 21566122 23612492 24000348 26919221 30935049    0
> 
> GLM    17120963 21566122 23612492 24000348 26919221 30935049    0
> 
> GLMNET 12525068 14823381 16795523 16891746 18838886 21194430    0
> 
> SVM     7473668 13559723 15741403 16038858 18803797 23202159    0
> 
> KNN    11324251 16083905 17852422 18445773 21068954 24700748    0
>
> RMSE 
> 
>            Min.  1st Qu.   Median     Mean  3rd Qu.      Max. NA's
>            
> LM     22152423 40720829 53675120 57491085 72138560 112722853    0
> 
> GLM    22152423 40720829 53675120 57491085 72138560 112722853    0
> 
> GLMNET 15277092 26185167 37147190 41555763 52632754  90660491    0
> 
> SVM    11644364 35641578 48940324 53708943 69864280 111750830    0
> 
> KNN    22902736 38815155 48411236 56359413 72153949 111490350    0
> 
>
> Rsquared 
> 
>                Min.      1st Qu.      Median       Mean    3rd Qu.       Max. NA's
>                
> LM     1.483748e-05 0.0009268357 0.006890912 0.01918216 0.03102276 0.08289168    0
> 
> GLM    1.483748e-05 0.0009268357 0.006890912 0.01918216 0.03102276 0.08289168    0
> 
> GLMNET 3.138369e-01 0.4896796108 0.538184948 0.55497133 0.63096929 0.85711975    0
> 
> SVM    6.511007e-03 0.0458225992 0.142131962 0.20097528 0.30306220 0.71290539    0
> 
> KNN    7.462957e-03 0.0339076231 0.121907488 0.14276862 0.21591304 0.51108661    0

![Second Dotplot Outcome Comparing AMC Stock Algorithms](https://user-images.githubusercontent.com/87962854/141603286-f7f2ead0-7074-4b2f-a664-481c7cc33864.png)

# Third Outcome Comparing AMC Stock Algorithms:

The algorithms in this third outcome are currently centered, scaled, and transformed using the Box-Cox method with the highly correlated values.

> outcome3 <- resamples(list(LM = fit.lm, GLM = fit.glm, GLMNET = fit.glmnet, SVM = fit.svm, KNN = fit.knn))
> 
> summary(outcome3)
>
> Call:
> 
> summary.resamples(object = outcome3)
>
> Models: LM, GLM, GLMNET, SVM, KNN 
> 
> Number of resamples: 30 
>
> MAE 
> 
>            Min.  1st Qu.   Median     Mean  3rd Qu.     Max. NA's
>            
> LM     14317954 19166740 20684487 20684035 22974526 26701879    0
> 
> GLM    14317954 19166740 20684487 20684035 22974526 26701879    0
> 
> GLMNET 15919979 18634403 20616042 20416441 22130482 24761106    0
> 
> SVM     5680386  8945198 10876737 11650119 14548465 18924878    0
> 
> KNN     4032008  7916614  9216504  9910743 12324078 17621998    0
>
> RMSE 
> 
>            Min.  1st Qu.   Median     Mean  3rd Qu.      Max. NA's
>            
> LM     20952996 29348149 36896169 42420653 49173955  94586011    0
> 
> GLM    20952996 29348149 36896169 42420653 49173955  94586011    0
> 
> GLMNET 20668753 29614356 36502576 41740995 48523019  87240671    0
> 
> SVM     7826026 26266721 39953805 44807230 60338621 102646673    0
> 
> KNN    13423914 28075877 39029866 45705324 59636949 104705672    0
>
> Rsquared 
> 
>              Min.   1st Qu.    Median      Mean   3rd Qu.      Max. NA's
>              
> LM     0.20995793 0.4161312 0.5313362 0.5180253 0.6168191 0.8587488    0
> 
> GLM    0.20995793 0.4161312 0.5313362 0.5180253 0.6168191 0.8587488    0
> 
> GLMNET 0.21172570 0.4511238 0.5180361 0.5098385 0.5880617 0.7885906    0
> 
> SVM    0.29198507 0.4809362 0.5704306 0.5699200 0.7150422 0.8766482    0
> 
> KNN    0.02963859 0.3563041 0.5478481 0.4798609 0.6387612 0.8239043    0

![Third Dotplot Outcome Comparing AMC Stock Algorithms](https://user-images.githubusercontent.com/87962854/141603594-fe6a87ca-324f-400f-88b1-edbb4c1a6971.png)

# Ensemble Outcomes Comparing AMC Stock Algorithms

Three additional ensemble outcomes are added to improve the analysis of analyzing the data, all of which are transformed via the Box-Cox method.

> ensemble <- resamples(list(RF = fit.rf, GBM = fit.gbm, CUBIST = fit.cubist))
> 
> summary(ensemble)
>
> Call:
> 
> summary.resamples(object = ensemble)
>
> Models: RF (Random Forest), GBM (Gradient Booster Method), CUBIST 
> 
> Number of resamples: 30 
> 
> MAE 
> 
>            Min.  1st Qu.   Median     Mean  3rd Qu.     Max. NA's
>            
> RF      5665450  7472449  8695215  9341970 11044333 14681649    0
> 
> GBM    10711818 13155020 14458774 14632866 16536161 18984534    0
> 
> CUBIST  3757394  5768194  7417536  7440709  8955991 12277018    0
>
> RMSE 
> 
>            Min.  1st Qu.   Median     Mean  3rd Qu.     Max. NA's
>            
> RF     16168780 22975529 32974827 38079897 48155583 70467545    0
> 
> GBM    20919656 27326500 36363300 42106731 52561442 88884199    0
> 
> CUBIST 10527833 17260591 24987716 31072433 41017138 67678798    0
>
> Rsquared 
> 
>             Min.   1st Qu.    Median      Mean   3rd Qu.      Max. NA's
>             
> RF     0.1021230 0.5789694 0.6794716 0.6267992 0.7462763 0.8697522    0
> 
> GBM    0.1110092 0.4715421 0.5421579 0.5268957 0.6505939 0.7527193    0
> 
> CUBIST 0.1621931 0.6962783 0.7533742 0.7322539 0.8724464 0.9536887    0 

![Ensemble Dotplot Outcomes Comparing AMC Stock Algorithms](https://user-images.githubusercontent.com/87962854/141604946-4f7d0c39-17c9-49b7-89ea-eca24e555c42.png)

# Picking The Most Efficient Model

> #Train the Final Model#
> 
> library(Cubist)
> 
> set.seed(7)
> 
> x <- amc[,1:5]
> 
> y <- amc[,6]
> 
> preprocessParams <- preProcess(x)
> 
> tX <- sample(1:nrow(amc), floor(.8*nrow(amc)))
> 
> p <- c("Open", "High", "Low", "Close", "Adj Close")
> 
> tXp <- amc[tX, p]
> 
> tXr <- amc$Volume[tX]
> 
> fM <- cubist(x = tXp, y = tXr, commitees = 20, neighbors = 0)
> 
> fM
> 
> summary(fM)
> 
> predictions <- predict(fM, tXp)
> 
>
> #Compute the RMSE & R^2#
> 
> rmse <- sqrt(mean((predictions - tXr)^2))
> 
> r2 <- cor(predictions, tXr)^2
> 
> print(rmse) #15074650#
> 
> print(r2) #0.9479295#
