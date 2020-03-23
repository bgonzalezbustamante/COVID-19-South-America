##############################################################

## Johns Hopkins University CSSE COVID-19 Dataset Scraper
## R version 3.6.1 (2019-07-05) -- "Action of the Toes"
## Bastián González-Bustamante
## University of Oxford
## E-mail: bastian.gonzalezbustamante@politics.ox.ac.uk
## Website: http://users.ox.ac.uk/~shil5311/

## COVID-19 Pandemic in South America Project
## OSF-Project DOI: 10.17605/OSF.IO/6FM7X
## http://bgonzalezbustamante.github.io/COVID-19-South-America/

##############################################################

## Packages
library(tidyverse)
library(lubridate)

## Local Directory
setwd("C:/Users/basti/Dropbox/22.COVID-19/00.Data")

## Johns Hopkins University CSSE COVID-19 Dataset
JHU_data <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Confirmed.csv", sep = ",")

## Period Coverage
dd <- as.numeric((today()-1) - as.Date("2020-01-22"))
begin <- ((today()-1)-dd) ## 22 January
today <- (today()-1)
dates <- seq(as.Date(begin), as.Date(today), by="days")
dates

## UNITED KINGDOM
## which(JHU_data[,2] == "United Kingdom")
## Channel Islands, Gibraltar, Caymand Islands excluded
which(JHU_data[,1] == "United Kingdom")
uk <- slice(JHU_data, which(JHU_data[,1] == "United Kingdom"):
              which(JHU_data[,1] == "United Kingdom")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
## view(uk)
uk <- data.frame(uk, dates)
uk$Province.State <- NULL
uk$Country.Region <- NULL
uk$Lat <- NULL
uk$Long <- NULL
uk$Long <- NULL
uk$Date <- NULL
uk$cumulative_cases <- NULL
names(uk)[1] = "GBR"
sum(uk$GBR)

## SPAIN
which(JHU_data[,2] == "Spain")
esp <- slice(JHU_data, which(JHU_data[,2] == "Spain"):
               which(JHU_data[,2] == "Spain")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
## view(esp)
esp <- data.frame(esp, dates)
esp$Province.State <- NULL
esp$Country.Region <- NULL
esp$Lat <- NULL
esp$Long <- NULL
esp$Long <- NULL
esp$Date <- NULL
esp$cumulative_cases <- NULL
names(esp)[1] = "ESP"
sum(esp$ESP)

## ITALY
which(JHU_data[,2] == "Italy")
ita <- slice(JHU_data, which(JHU_data[,2] == "Italy"):
               which(JHU_data[,2] == "Italy")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
## view(ita)
ita <- data.frame(ita, dates)
ita$Province.State <- NULL
ita$Country.Region <- NULL
ita$Lat <- NULL
ita$Long <- NULL
ita$Long <- NULL
ita$Date <- NULL
ita$cumulative_cases <- NULL
names(ita)[1] = "ITA"
sum(ita$ITA)

## ARGENTINA
which(JHU_data[,2] == "Argentina")
arg <- slice(JHU_data, which(JHU_data[,2] == "Argentina"):
               which(JHU_data[,2] == "Argentina")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
## view(arg)
arg <- data.frame(arg, dates)
arg$Province.State <- NULL
arg$Country.Region <- NULL
arg$Lat <- NULL
arg$Long <- NULL
arg$Long <- NULL
arg$Date <- NULL
arg$cumulative_cases <- NULL
names(arg)[1] = "ARG"
sum(arg$ARG)

## BOLIVIA
which(JHU_data[,2] == "Bolivia")
bol <- slice(JHU_data, which(JHU_data[,2] == "Bolivia"):
               which(JHU_data[,2] == "Bolivia")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
## view(bol)
bol <- data.frame(bol, dates)
bol$Province.State <- NULL
bol$Country.Region <- NULL
bol$Lat <- NULL
bol$Long <- NULL
bol$Long <- NULL
bol$Date <- NULL
bol$cumulative_cases <- NULL
names(bol)[1] = "BOL"
sum(bol$BOL)

## BRAZIL
which(JHU_data[,2] == "Brazil")
bra <- slice(JHU_data, which(JHU_data[,2] == "Brazil"):
               which(JHU_data[,2] == "Brazil")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
## view(bra)
bra <- data.frame(bra, dates)
bra$Province.State <- NULL
bra$Country.Region <- NULL
bra$Lat <- NULL
bra$Long <- NULL
bra$Long <- NULL
bra$Date <- NULL
bra$cumulative_cases <- NULL
names(bra)[1] = "BRA"
sum(bra$BRA)

## CHILE
which(JHU_data[,2] == "Chile")
chl <- slice(JHU_data, which(JHU_data[,2] == "Chile"):
               which(JHU_data[,2] == "Chile")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
## view(chl)
chl <- data.frame(chl, dates)
chl$Province.State <- NULL
chl$Country.Region <- NULL
chl$Lat <- NULL
chl$Long <- NULL
chl$Long <- NULL
chl$Date <- NULL
chl$cumulative_cases <- NULL
names(chl)[1] = "CHL"
sum(chl$CHL)

## COLOMBIA
which(JHU_data[,2] == "Colombia")
col <- slice(JHU_data, which(JHU_data[,2] == "Colombia"):
               which(JHU_data[,2] == "Colombia")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
## view(col)
col <- data.frame(col, dates)
col$Province.State <- NULL
col$Country.Region <- NULL
col$Lat <- NULL
col$Long <- NULL
col$Long <- NULL
col$Date <- NULL
col$cumulative_cases <- NULL
names(col)[1] = "COL"
sum(col$COL)

## ECUADOR
which(JHU_data[,2] == "Ecuador")
ecu <- slice(JHU_data, which(JHU_data[,2] == "Ecuador"):
               which(JHU_data[,2] == "Ecuador")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
## view(ecu)
ecu <- data.frame(ecu, dates)
ecu$Province.State <- NULL
ecu$Country.Region <- NULL
ecu$Lat <- NULL
ecu$Long <- NULL
ecu$Long <- NULL
ecu$Date <- NULL
ecu$cumulative_cases <- NULL
names(ecu)[1] = "ECU"
sum(ecu$ECU)

## PARAGUAY
which(JHU_data[,2] == "Paraguay")
pry <- slice(JHU_data, which(JHU_data[,2] == "Paraguay"):
               which(JHU_data[,2] == "Paraguay")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
## view(pry)
pry <- data.frame(pry, dates)
pry$Province.State <- NULL
pry$Country.Region <- NULL
pry$Lat <- NULL
pry$Long <- NULL
pry$Long <- NULL
pry$Date <- NULL
pry$cumulative_cases <- NULL
names(pry)[1] = "PRY"
sum(pry$PRY)

## PERU
which(JHU_data[,2] == "Peru")
per <- slice(JHU_data, which(JHU_data[,2] == "Peru"):
               which(JHU_data[,2] == "Peru")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
## view(per)
per <- data.frame(per, dates)
per$Province.State <- NULL
per$Country.Region <- NULL
per$Lat <- NULL
per$Long <- NULL
per$Long <- NULL
per$Date <- NULL
per$cumulative_cases <- NULL
names(per)[1] = "PER"
sum(per$PER)

## URUGUAY
which(JHU_data[,2] == "Uruguay")
ury <- slice(JHU_data, which(JHU_data[,2] == "Uruguay"):
               which(JHU_data[,2] == "Uruguay")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
## view(ury)
ury <- data.frame(ury, dates)
ury$Province.State <- NULL
ury$Country.Region <- NULL
ury$Lat <- NULL
ury$Long <- NULL
ury$Long <- NULL
ury$Date <- NULL
ury$cumulative_cases <- NULL
names(ury)[1] = "URY"
sum(ury$URY)

## VENEZUELA
which(JHU_data[,2] == "Venezuela")
ven <- slice(JHU_data, which(JHU_data[,2] == "Venezuela"):
               which(JHU_data[,2] == "Venezuela")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
## view(ven)
ven <- data.frame(ven, dates)
ven$Province.State <- NULL
ven$Country.Region <- NULL
ven$Lat <- NULL
ven$Long <- NULL
ven$Long <- NULL
ven$Date <- NULL
ven$cumulative_cases <- NULL
names(ven)[1] = "VEN"
sum(ven$VEN)

# Combine Datasets
covid19 <- merge(uk, esp, by = "dates", all = TRUE)
covid19 <- merge(covid19, ita, by = "dates", all = TRUE)
covid19 <- merge(covid19, arg, by = "dates", all = TRUE)
covid19 <- merge(covid19, bol, by = "dates", all = TRUE)
covid19 <- merge(covid19, bra, by = "dates", all = TRUE)
covid19 <- merge(covid19, chl, by = "dates", all = TRUE)
covid19 <- merge(covid19, col, by = "dates", all = TRUE)
covid19 <- merge(covid19, ecu, by = "dates", all = TRUE)
covid19 <- merge(covid19, pry, by = "dates", all = TRUE)
covid19 <- merge(covid19, per, by = "dates", all = TRUE)
covid19 <- merge(covid19, ury, by = "dates", all = TRUE)
covid19 <- merge(covid19, ven, by = "dates", all = TRUE)

## Slice Data 
covid19 <- slice(covid19, 10:nrow(covid19))

## Export CSV
write.csv(covid19,'data_covid19.csv')
