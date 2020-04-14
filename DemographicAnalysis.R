#Importing Dataset 
Data <- read.csv(file.choose())

#Exploring Dataset
head(Data)
tail(Data, n=7)
str(Data)
summary(Data)

#Filtering Required Data

Data1960 <- Data[Data$Year == 1960,]
Data2013 <- Data[Data$Year == 2013,]

#Creating additional dataframes

add1960 <- data.frame(Code = Country_Code, Life.Exp = Life_Expectancy_At_Birth_1960)
add2013 <- data.frame(Code = Country_Code, Life.Exp = Life_Expectancy_At_Birth_2013)

#Merging two dataframes

merged1960 <- merge(Data1960, add1960, by.x = "Country.Code", by.y = "Code")
merged2013 <- merge(Data2013, add2013, by.x = "Country.Code", by.y = "Code")

#Removing year columns

merged1960$Year <- NULL
merged2013$Year <- NULL

#Merged Dataset Exploration

head(merged1960)
head(merged2013)

#1960 Dataset Visualization

qplot(data = merged1960, x = Fertility.Rate, y = Life.Exp, colour = Region, size = I(2), 
      alpha = I(0.5), main = "Life Expectancy V/S Fertility Rate in 1960")

#2013 Dataset Visualization

qplot(data = merged2013, x = Fertility.Rate, y = Life.Exp, colour = Region, size = I(2), 
      alpha = I(0.5), main = "Life Expectancy V/S Fertility Rate in 2013")