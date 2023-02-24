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

# exploring the data 
create_report(melb_data)

create_report(melb_data, y = "BuildingArea")
diagnose_report(melb_data, output_format = "html")
diagnose_web_report(melb_data)
