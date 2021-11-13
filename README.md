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



