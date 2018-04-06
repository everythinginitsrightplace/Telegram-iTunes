library(itunesr)
#Latest (Page 1-10) Telegram Reviews for the Country: Russia
telegram_reviews1 <- getReviews(686449807,'ru',1)
telegram_reviews2 <- getReviews(686449807,'ru',2)
telegram_reviews3 <- getReviews(686449807,'ru',3)
telegram_reviews4 <- getReviews(686449807,'ru',4)
telegram_reviews5 <- getReviews(686449807,'ru',5)
telegram_reviews6 <- getReviews(686449807,'ru',6)
telegram_reviews7 <- getReviews(686449807,'ru',7)
telegram_reviews8 <- getReviews(686449807,'ru',8)
telegram_reviews9 <- getReviews(686449807,'ru',9)
telegram_reviews10 <- getReviews(686449807,'ru',10)
h <- rbind(telegram_reviews1, telegram_reviews2, telegram_reviews3, telegram_reviews4, 
           telegram_reviews5, telegram_reviews6, telegram_reviews7, telegram_reviews8,
           telegram_reviews9, telegram_reviews10)

names(h)
library(highcharter)
library(dplyr)
library(lubridate)
dt <- h
dt$Date <- as.Date(dt$Date)
dt$Rating <- as.numeric(dt$Rating)    
dt <- dt %>% select(Date,Rating) %>% group_by(Date) %>% summarise(Rating = round(mean(Rating),2))
highchart() %>%   hc_add_series_times_values(dt$Date,dt$Rating, name = 'Average Rating')