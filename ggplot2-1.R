#### Load the `airquality' dataset form the datasets package in R
library(datasets)
data(airquality)

# I am interested in examining how the relationship between ozone and wind speed varies across each month. 
airquality = transform(airquality, Month = factor(Month))
library(ggplot2)
qplot(Wind, Ozone, data = airquality, facets = . ~ Month)



#### Los Angeles January Precipitation: 1945-2015
setwd("C:/Users/Philip Abraham/OneDrive/TECHNOLOGY/Data Analysis/Data/Meteorological/US Cities Precipitation Data/Los Angeles Intl Arpt")
jan_LAprecip<-read.csv("./LA_Precip-Jan.csv", header = TRUE)
str(jan_LAprecip)

complete<-complete.cases(jan_LAprecip)

jan_LAprecip<-jan_LAprecip[complete,]

# Precip Plots
qplot(YearF, TotalPrecip, data = jan_LAprecip, color = MeanT)
qplot(YearF, TotalPrecip, data = jan_LAprecip, color = WarmestMinT )
qplot(YearF, TotalPrecip, data = jan_LAprecip, color = AvgMinT)
qplot(YearF, TotalPrecip, data = jan_LAprecip, color = AvgMaxT)
qplot(YearF, TotalPrecip, data = jan_LAprecip, color = AvgMaxT)
qplot(YearF, TotalPrecip, data = jan_LAprecip, color = dev)
qplot(MeanT, TotalPrecip, data = jan_LAprecip, color = YearF)

# adding a geopm for statistical info
qplot(MeanT, TotalPrecip, data = jan_LAprecip, geom = c("point", "smooth"))

#Histograms
qplot(TotalPrecip, data = jan_LAprecip, fill = YearF, bins = 15)
qplot(MeanT, data = jan_LAprecip, fill = YearF, bins = 15)

