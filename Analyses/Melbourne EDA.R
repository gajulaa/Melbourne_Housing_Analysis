#GENERAL INFORMATION ON DATASET######################################
#
#
# This dataset is a snapshot of housing data from Domain. Domain is a website that
# hosts publicly available real estate data from the Australian property market. 

# DATA EXPLORATION =============================================================

# EDA will focus on certain aims: Missing values, insights into variable
# relationships, understanding distributions and identifying patterns in the 
# data. 

## PACKAGES 
library(dplyr) # assists with data manipulation
library(ggplot2) # assists creating elegant data visualizations
library(readr) # assists in importing or reading data into the environment 
library(GGally) # extension of the "ggplot2" package
library(skimr) # assists with creation of compact and flexible summaries of data
library(corrplot) # specializes in visualizing correlation matrices 
library(reshape2) # assists in reshaping data 
library(DataExplorer) # automates data exploration
library(dlookr)

# importing the source data 
melb_data <- read_csv("melb_data.csv")
View(melb_data)


dim(melb_data)
str(melb_data)
# Date is classified as character. Need to change.

melb_data$Date <- as.Date(melb_data$Date, format = "%Y-%m-%d")
# reformatted the variable type and also validated data to 
# display Year-Month-Date. 

sapply(melb_data, function(x) sum(is.na(x)))
# YearBuilt, BuildingArea, CouncilArea and Car have missing data

melb_data <- select(melb_data, -YearBuilt, -BuildingArea, -Car)
# removed irrelavnt numerical columns. 

sum(duplicated(melb_data))
# no duplicates 

summary(melb_data[, sapply(melb_data, is.numeric)])
# Most houses were built in 1965; on average, houses have 1.5
# bathrooms. Also, median price for houses borders on upwards
# of $90k AUD. 

ggplot(melb_data, aes(x = Price)) +
  geom_histogram(binwidth = 100000, fill = "dodgerblue", color = "black") +
  ggtitle("Distribution of Price")
# data is skewed by extremly high prices. this is evident as the 
# max price is 9 mill AUD. 

corrplot(cor(melb_data[, sapply(melb_data, is.numeric)]), type = "upper", 
         order = "hclust")
# usual correlations observed between postcode, price and number of 
# rooms; no correlation between land size with regards to price or 
# number of rooms; distance is negatively correlated with price. 

melb_data %>%
  select_if(is.factor) %>%
  group_by_all() %>%
  summarize(n = n())
