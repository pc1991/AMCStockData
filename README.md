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

Validation Boxplots:

![AMC Stock Open Boxplot](https://user-images.githubusercontent.com/87962854/141599591-3e9b3e68-74cc-404f-bb8b-1cca39ff9593.png)

![AMC Stock High Boxplot](https://user-images.githubusercontent.com/87962854/141599605-7f86c0d1-8995-41af-bab4-40ef29746dfd.png)

![AMC Stock Low Boxplot](https://user-images.githubusercontent.com/87962854/141599612-13862abe-247a-4a31-aaa0-1763bc58e707.png)

![AMC Stock Close Boxplot](https://user-images.githubusercontent.com/87962854/141599625-14f2e4fb-3704-4780-ba2c-b594cfcfe489.png)

![AMC Stock Adj Close Boxplot](https://user-images.githubusercontent.com/87962854/141599632-9098fad2-7fb6-4219-a0cc-e0501ce2dbf5.png)

![AMC Stock Volume Boxplot](https://user-images.githubusercontent.com/87962854/141599642-c169d687-b8a3-4dfe-88fa-261464c9dd43.png)

Validation Histograms:

![AMC Stock Open Histogram](https://user-images.githubusercontent.com/87962854/141599735-d69845f6-803c-4e2e-b6e1-e4851fe90e57.png)

![AMC Stock High Histogram](https://user-images.githubusercontent.com/87962854/141599744-c60a2e3b-d1f5-4f45-813a-a56ac6d5e05f.png)

![AMC Stock Low Histogram](https://user-images.githubusercontent.com/87962854/141599752-41c4c725-abc6-48bf-b48c-a2726eeaf10e.png)

![AMC Stock Close Histogram](https://user-images.githubusercontent.com/87962854/141599762-6729f7ac-a788-43d6-a250-380207b96b8e.png)

![AMC Stock Adj Close Histogram](https://user-images.githubusercontent.com/87962854/141599771-b4dee698-92f0-49b8-8865-4a4ebd25ba72.png)

![AMC Stock Volume Histogram](https://user-images.githubusercontent.com/87962854/141599779-e8a2ed0a-7795-4ba6-a6bf-0a0b0734542f.png)

Validation Density Plots:

![AMC Stock Open Density Plot](https://user-images.githubusercontent.com/87962854/141600173-178d179e-e458-418a-a0ac-75bc5bc42d67.png)

![AMC Stock High Density Plot](https://user-images.githubusercontent.com/87962854/141600184-2f4d78ed-360c-4614-a82d-0162c0ba1216.png)

![AMC Stock Low Density Plot](https://user-images.githubusercontent.com/87962854/141600192-b7a3696d-a349-423d-be73-e3b3dc2e2d4f.png)

![AMC Stock Close Density Plot](https://user-images.githubusercontent.com/87962854/141600199-543566d2-1652-499d-8680-59795f7a9731.png)

![AMC Stock Adj Close Density Plot](https://user-images.githubusercontent.com/87962854/141600206-380eac98-96df-442c-93d5-0c20d6074517.png)

![AMC Stock Volume Density Plot](https://user-images.githubusercontent.com/87962854/141600213-aba15111-5181-466c-b5cd-7e4909ae4a86.png)

Scatter Plot:

![AMC Stock Scatter Plot](https://user-images.githubusercontent.com/87962854/141600390-2bb17c6f-239c-4c8c-9f5a-83a53488ce91.png)

Correlation Plot:

![AMC Stock Correlation Plot](https://user-images.githubusercontent.com/87962854/141600413-9ff9da4a-d636-4f9f-a740-0e9066529dbd.png)

# Finding The Best Model To Run The Data

In order to figure out which model to use to best predict where the data will trend, we would have to develop a test-harness using 10-fold cross validation with three repeats using various algorithms using various units of measure. The dot-plots showing the performances of each algorithm will be shown below.

First Outcome Comparing AMC Stock Algorithms:

> outcome <- resamples(list(LM = fit.lm, GLM = fit.glm, GLMNET = fit.glmnet, SVM = fit.svm, KNN = fit.knn))
> 
> summary(outcome)

> Call:
> 
> summary.resamples(object = outcome)

> Models: LM, GLM, GLMNET, SVM, KNN 
> 
> Number of resamples: 30 

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
