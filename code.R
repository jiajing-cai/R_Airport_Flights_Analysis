#install the package "GGally" for drawing the matrix
install.packages("GGally")

#install the package "xts" for time series analysis
install.packages("xts")

#install the package "ggplot2" for drawing the regression line
install.packages("ggplot2")

#install the package "readr"
install.packages("readr")

#load the package ggplot2
library(ggplot2)

#load the package GGally
library(GGally)

#load the package xts
library(xts)

#load the package readr
library(readr)

#choose the flight data as the original dataset, store as mydata
mydata <- read.csv(file.choose(),sep = ",", header = TRUE)

#select the delay,temp,vis,and wind to make a new dataset mydata2
mydata2 <- mydata[,c(3,9,10,11)]

#use matrix to show the correlation between each of the factors in mydata2
ggpairs(data = mydata2, columns = 1:4, title = "Flight Data")

#draw the plot of delay and vis, and add a blue line as regression line
ggplot(data = mydata2, aes(x = delay_flights, y = vis))+geom_point()+stat_smooth(method = "lm", col = "blue")+ggtitle("Linear Model of delay and vis")

#draw the plot of delay and wind, and add a red line as regression line
ggplot(data = mydata2, aes(x = delay_flights, y = wind))+geom_point()+stat_smooth(method = "lm", col = "red")+ggtitle("Linear Model of delay and wind")

#draw the plot of delay and temp, and add a yellow line as regression line
ggplot(data = mydata2, aes(x = delay_flights, y = temps_monthly))+geom_point()+stat_smooth(method = "lm", col = "yellow")+ggtitle("Linear Model of delay and temp")

#select the cancel,temp,vis,and wind to make a new dataset mydata3
mydata3 <- mydata[,c(4,9,10,11)]

#plot a matrix about correlation coefficients of variables in mydata3
ggpairs(data =mydata3, columns = 1:4, title = "Cancel flights,temp_monthly,vis and wind in flights data")

#draw the plot of cancel and wind, and add a pink line as regression line
ggplot(data = mydata3, aes(x = cancel_flights, y = wind))+geom_point()+
  stat_smooth(method = "lm", col = "pink")+ggtitle("Linear Model of cancel and wind")

#draw the plot of cancel and vis, and add a yellow line as regression line
ggplot(data = mydata3, aes(x = cancel_flights, y = wind))+geom_point()+
  stat_smooth(method = "lm", col = "yellow")+ggtitle("Linear Model of cancel and vis")

#draw the plot of cancel and temp, and add a blue line as regression line
ggplot(data = mydata3, aes(x = cancel_flights, y = temps_monthly))+geom_point()+
  stat_smooth(method = "lm", col = "blue")+ggtitle("Linear Model of cancel and temp")

#clean the dataset "mydata", and store the new one as flight_data for time series analysis
flight_data <- mydata[-(73:74), ]

# Convert date column to a time-based class
flight_data$date <- as.Date(flight_data$date)

# Convert flights to an xts object using as.xts
flights_xts <- as.xts(flight_data[ ,2:5], order.by = flight_data$date)

#check data class
class(flights_xts)

#view the first 6 rows of data
head(flights_xts)

#Identify the periodicity of flights_xts
periodicity(flights_xts)

#Identify the number of periods in flights_xts
nmonths(flights_xts)

# Use plot.zoo() to view all four columns of data in their own panels
plot.zoo(flights_xts, plot.type = "multiple")

# Use plot.xts() to view total monthly flights into BOS over time
plot.xts(flights_xts$total_flights)

# Use plot.xts() to view monthly delayed flights into BOS over time
plot.xts(flights_xts$delay_flights)

# Use plot.zoo() to view all four columns of data in one panel
plot.zoo(flights_xts, plot.type = "single",lty = 1:4)
legend("right",lty = 1:4, legend = c("Total","Delay","Cancel","Divert"))

#Decompose time series to observe seasonal changes
flights_ts <- ts(flights_xts, frequency=12, start=c(2010,1,1))

#Extract the "total" variable from flights_ts
total_flights <- flights_ts[,1]

#Decompose time series
decompose(total_flights)

#Generate a decomposed plot
plot(decompose(total_flights))

#Extract the "delay" variable from flights_ts
delay_flights <- flights_ts[,2]

#Decompose time series
decompose(delay_flights)

#Generate a decomposed plot
plot(decompose(delay_flights))

#Extract the "cancel" variable from flights_ts
cancel_flights <- flights_ts[,3]

#Decompose time series
decompose(cancel_flights)

#Generate a decomposed plot
plot(decompose(cancel_flights))
