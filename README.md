# Analysis-of-Flights-Arriving-at-Boston-s-Logan-Airport

## Summary:
This project is mainly based on the ideas of time series analysis and linear regression analysis, in the R language environment, conducting the research and analysis for the selected data set, flights arriving at Boston's Logan International Airport (BOS).

### Data Set:
This data set records the aircraft situation at Boston Logan Airport from January 2010 to December 2015, including the total number of flight departures, delays, cancellations, temperature, wind speed and visibility of the day, etc. 

## Business Problem:
The impact of wind speed, temperature and visibility on flight delays and their correlation. 
The impact of wind speed, temperature and visibility on flight cancellation and their correlation.
The tendency and seasonal trends of departures, delays and cancellations at Boston Logan Airport, from January 2010 to December 2015 .

## Methods and Solutions: 
This project conducts a correlation test and the linear regression analysis, then analyzes the factors that may affect flight delays and cancellations, including wind speed, temperature, and visibility, and explores their correlation and impact. Through regression analysis, find that flights are obviously affected by temperature and the temperature changes with the seasons. Subsequently, analyze the seasonal time series of the number of flight departures, delays, and cancellations at Logan Airport, and then analyzes and separates its seasonal factors to extract the information behind it. Finally, based on the research and analysis, summarize the flight time series trend and the factors related to flight delays and cancellations.

## Conclusion and result
Among the factors that affect flight delays, wind speed and visibility are not the obvious factors, while temperature is positively correlated with flight delays. The higher the temperature, the more likely it is to be delayed. For flight cancellations, wind speed is not a significant factor; visibility has a weak negative correlation with the number of aircraft cancellations that the lower the monthly visibility, the higher the number of flight cancellations; however, temperature shows an relatively strong negative correlation with the flights cancellations. 

From the time series analysis we could find that the flights departure, delay and cancellation show obvious seasonal trends and for every year, July and August are the peak periods of flights, while December and January are the trough periods
