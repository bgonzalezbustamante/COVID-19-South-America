Johns Hopkins CSSE COVID-19 Dataset scraper
================
Bastián González-Bustamante

### Precoding

``` r
## Packages
library(tidyverse)
library(lubridate)

## Forks Structure
fork1 <- "https://raw.githubusercontent.com/bgonzalezbustamante/COVID-19/"
fork2 <- "master/csse_covid_19_data/csse_covid_19_time_series/"

## JHU-CSSE COVID-19 Confirmed Dataset
fork_cases <- "time_series_covid19_confirmed_global.csv"
JHU_cases <- read.csv(paste(fork1, fork2, fork_cases, sep = ""), sep = ",")

## JHU-CSSE COVID-19 Deaths Dataset
fork_deaths <- "time_series_covid19_deaths_global.csv"
JHU_deaths <- read.csv(paste(fork1, fork2, fork_deaths, sep = ""), sep = ",")

## JHU-CSSE COVID-19 Recovered Dataset
fork_recovered <- "time_series_covid19_recovered_global.csv"
JHU_recovered <- read.csv(paste(fork1, fork2, fork_recovered, sep = ""), sep = ",")

## Period Coverage
dd_JHU <- as.numeric((as.Date("2020-05-19")) - as.Date("2020-01-22"))
begin_JHU <- ((as.Date("2020-05-19"))-dd_JHU) ## 22 January
dates_JHU <- seq(as.Date(begin_JHU), as.Date("2020-05-19"), by="days")
```

### COVID-19 Cases Scraper

``` r
## ARGENTINA
cases_arg <- slice(JHU_cases, which(JHU_cases[,2] == "Argentina")
                   :which(JHU_cases[,2] == "Argentina")) %>%
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
cases_arg <- data.frame(cases_arg, dates_JHU)
cases_arg$Province.State <- NULL
cases_arg$Country.Region <- NULL
cases_arg$Lat <- NULL
cases_arg$Long <- NULL
cases_arg$Date <- NULL
cases_arg$cumulative_cases <- NULL
names(cases_arg)[1] = "ARG"

## BOLIVIA
cases_bol <- slice(JHU_cases, which(JHU_cases[,2] == "Bolivia")
                   :which(JHU_cases[,2] == "Bolivia")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
cases_bol <- data.frame(cases_bol, dates_JHU)
cases_bol$Province.State <- NULL
cases_bol$Country.Region <- NULL
cases_bol$Lat <- NULL
cases_bol$Long <- NULL
cases_bol$Date <- NULL
cases_bol$cumulative_cases <- NULL
names(cases_bol)[1] = "BOL"

## BRAZIL
cases_bra <- slice(JHU_cases, which(JHU_cases[,2] == "Brazil")
                   :which(JHU_cases[,2] == "Brazil")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
cases_bra <- data.frame(cases_bra, dates_JHU)
cases_bra$Province.State <- NULL
cases_bra$Country.Region <- NULL
cases_bra$Lat <- NULL
cases_bra$Long <- NULL
cases_bra$Date <- NULL
cases_bra$cumulative_cases <- NULL
names(cases_bra)[1] = "BRA"

## CHILE
cases_chl <- slice(JHU_cases, which(JHU_cases[,2] == "Chile")
             :which(JHU_cases[,2] == "Chile")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
cases_chl <- data.frame(cases_chl, dates_JHU)
cases_chl$Province.State <- NULL
cases_chl$Country.Region <- NULL
cases_chl$Lat <- NULL
cases_chl$Long <- NULL
cases_chl$Date <- NULL
cases_chl$cumulative_cases <- NULL
names(cases_chl)[1] = "CHL"

## COLOMBIA
cases_col <- slice(JHU_cases, which(JHU_cases[,2] == "Colombia")
             :which(JHU_cases[,2] == "Colombia")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
cases_col <- data.frame(cases_col, dates_JHU)
cases_col$Province.State <- NULL
cases_col$Country.Region <- NULL
cases_col$Lat <- NULL
cases_col$Long <- NULL
cases_col$Date <- NULL
cases_col$cumulative_cases <- NULL
names(cases_col)[1] = "COL"

## PARAGUAY
cases_pry <- slice(JHU_cases, which(JHU_cases[,2] == "Paraguay")
                   :which(JHU_cases[,2] == "Paraguay")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
cases_pry <- data.frame(cases_pry, dates_JHU)
cases_pry$Province.State <- NULL
cases_pry$Country.Region <- NULL
cases_pry$Lat <- NULL
cases_pry$Long <- NULL
cases_pry$Date <- NULL
cases_pry$cumulative_cases <- NULL
names(cases_pry)[1] = "PRY"

## PERU
cases_per <- slice(JHU_cases, which(JHU_cases[,2] == "Peru")
                   :which(JHU_cases[,2] == "Peru")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
cases_per <- data.frame(cases_per, dates_JHU)
cases_per$Province.State <- NULL
cases_per$Country.Region <- NULL
cases_per$Lat <- NULL
cases_per$Long <- NULL
cases_per$Date <- NULL
cases_per$cumulative_cases <- NULL
names(cases_per)[1] = "PER"

## URUGUAY
cases_ury <- slice(JHU_cases, which(JHU_cases[,2] == "Uruguay")
                   :which(JHU_cases[,2] == "Uruguay")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
cases_ury <- data.frame(cases_ury, dates_JHU)
cases_ury$Province.State <- NULL
cases_ury$Country.Region <- NULL
cases_ury$Lat <- NULL
cases_ury$Long <- NULL
cases_ury$Date <- NULL
cases_ury$cumulative_cases <- NULL
names(cases_ury)[1] = "URY"

# Combine Datasets
cases_covid19 <- merge(cases_arg, cases_bol, by = "dates_JHU", all = TRUE)
cases_covid19 <- merge(cases_covid19, cases_bra, by = "dates_JHU", all = TRUE)
cases_covid19 <- merge(cases_covid19, cases_chl, by = "dates_JHU", all = TRUE)
cases_covid19 <- merge(cases_covid19, cases_col, by = "dates_JHU", all = TRUE)
cases_covid19 <- merge(cases_covid19, cases_pry, by = "dates_JHU", all = TRUE)
cases_covid19 <- merge(cases_covid19, cases_per, by = "dates_JHU", all = TRUE)
cases_covid19 <- merge(cases_covid19, cases_ury, by = "dates_JHU", all = TRUE)

## Slice Data (26 Feb - 15 May)
confirmed_covid19 <- slice(cases_covid19, 36:(nrow(cases_covid19)-4))
```

### COVID-19 Deaths Scraper

``` r
## ARGENTINA
deaths_arg <- slice(JHU_deaths, which(JHU_deaths[,2] == "Argentina")
                    :which(JHU_deaths[,2] == "Argentina")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
deaths_arg <- data.frame(deaths_arg, dates_JHU)
deaths_arg$Province.State <- NULL
deaths_arg$Country.Region <- NULL
deaths_arg$Lat <- NULL
deaths_arg$Long <- NULL
deaths_arg$Date <- NULL
deaths_arg$cumulative_cases <- NULL
names(deaths_arg)[1] = "ARG"

## BOLIVIA
deaths_bol <- slice(JHU_deaths, which(JHU_deaths[,2] == "Bolivia")
                    :which(JHU_deaths[,2] == "Bolivia")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
deaths_bol <- data.frame(deaths_bol, dates_JHU)
deaths_bol$Province.State <- NULL
deaths_bol$Country.Region <- NULL
deaths_bol$Lat <- NULL
deaths_bol$Long <- NULL
deaths_bol$Date <- NULL
deaths_bol$cumulative_cases <- NULL
names(deaths_bol)[1] = "BOL"

## BRAZIL
deaths_bra <- slice(JHU_deaths, which(JHU_deaths[,2] == "Brazil")
                    :which(JHU_deaths[,2] == "Brazil")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
deaths_bra <- data.frame(deaths_bra, dates_JHU)
deaths_bra$Province.State <- NULL
deaths_bra$Country.Region <- NULL
deaths_bra$Lat <- NULL
deaths_bra$Long <- NULL
deaths_bra$Date <- NULL
deaths_bra$cumulative_cases <- NULL
names(deaths_bra)[1] = "BRA"

## CHILE
deaths_chl <- slice(JHU_deaths, which(JHU_deaths[,2] == "Chile")
                    :which(JHU_deaths[,2] == "Chile")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
deaths_chl <- data.frame(deaths_chl, dates_JHU)
deaths_chl$Province.State <- NULL
deaths_chl$Country.Region <- NULL
deaths_chl$Lat <- NULL
deaths_chl$Long <- NULL
deaths_chl$Date <- NULL
deaths_chl$cumulative_cases <- NULL
names(deaths_chl)[1] = "CHL"

## COLOMBIA
deaths_col <- slice(JHU_deaths, which(JHU_deaths[,2] == "Colombia")
                    :which(JHU_deaths[,2] == "Colombia")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
deaths_col <- data.frame(deaths_col, dates_JHU)
deaths_col$Province.State <- NULL
deaths_col$Country.Region <- NULL
deaths_col$Lat <- NULL
deaths_col$Long <- NULL
deaths_col$Date <- NULL
deaths_col$cumulative_cases <- NULL
names(deaths_col)[1] = "COL"

## PARAGUAY
deaths_pry <- slice(JHU_deaths, which(JHU_deaths[,2] == "Paraguay")
                    :which(JHU_deaths[,2] == "Paraguay")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
deaths_pry <- data.frame(deaths_pry, dates_JHU)
deaths_pry$Province.State <- NULL
deaths_pry$Country.Region <- NULL
deaths_pry$Lat <- NULL
deaths_pry$Long <- NULL
deaths_pry$Date <- NULL
deaths_pry$cumulative_cases <- NULL
names(deaths_pry)[1] = "PRY"

## PERU
deaths_per <- slice(JHU_deaths, which(JHU_deaths[,2] == "Peru")
                    :which(JHU_deaths[,2] == "Peru")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
deaths_per <- data.frame(deaths_per, dates_JHU)
deaths_per$Province.State <- NULL
deaths_per$Country.Region <- NULL
deaths_per$Lat <- NULL
deaths_per$Long <- NULL
deaths_per$Date <- NULL
deaths_per$cumulative_cases <- NULL
names(deaths_per)[1] = "PER"

## URUGUAY
deaths_ury <- slice(JHU_deaths, which(JHU_deaths[,2] == "Uruguay")
                    :which(JHU_deaths[,2] == "Uruguay")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
deaths_ury <- data.frame(deaths_ury, dates_JHU)
deaths_ury$Province.State <- NULL
deaths_ury$Country.Region <- NULL
deaths_ury$Lat <- NULL
deaths_ury$Long <- NULL
deaths_ury$Date <- NULL
deaths_ury$cumulative_cases <- NULL
names(deaths_ury)[1] = "URY"

# Combine Datasets
deaths_covid19 <- merge(deaths_arg, deaths_bol, by = "dates_JHU", all = TRUE)
deaths_covid19 <- merge(deaths_covid19, deaths_bra, by = "dates_JHU", all = TRUE)
deaths_covid19 <- merge(deaths_covid19, deaths_chl, by = "dates_JHU", all = TRUE)
deaths_covid19 <- merge(deaths_covid19, deaths_col, by = "dates_JHU", all = TRUE)
deaths_covid19 <- merge(deaths_covid19, deaths_pry, by = "dates_JHU", all = TRUE)
deaths_covid19 <- merge(deaths_covid19, deaths_per, by = "dates_JHU", all = TRUE)
deaths_covid19 <- merge(deaths_covid19, deaths_ury, by = "dates_JHU", all = TRUE)

## Slice Data  (26 Feb - 15 May)
deaths_covid19 <- slice(deaths_covid19, 36:(nrow(deaths_covid19)-4))
```

### COVID-19 Recovered Scraper

``` r
## ARGENTINA
recovered_arg <- slice(JHU_recovered, which(JHU_recovered[,2] == "Argentina")
                       :which(JHU_recovered[,2] == "Argentina")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
recovered_arg <- data.frame(recovered_arg, dates_JHU)
recovered_arg$Province.State <- NULL
recovered_arg$Country.Region <- NULL
recovered_arg$Lat <- NULL
recovered_arg$Long <- NULL
recovered_arg$Date <- NULL
recovered_arg$cumulative_cases <- NULL
names(recovered_arg)[1] = "ARG"

## BOLIVIA
recovered_bol <- slice(JHU_recovered, which(JHU_recovered[,2] == "Bolivia")
                       :which(JHU_recovered[,2] == "Bolivia")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
recovered_bol <- data.frame(recovered_bol, dates_JHU)
recovered_bol$Province.State <- NULL
recovered_bol$Country.Region <- NULL
recovered_bol$Lat <- NULL
recovered_bol$Long <- NULL
recovered_bol$Date <- NULL
recovered_bol$cumulative_cases <- NULL
names(recovered_bol)[1] = "BOL"

## BRAZIL
recovered_bra <- slice(JHU_recovered, which(JHU_recovered[,2] == "Brazil")
                       :which(JHU_recovered[,2] == "Brazil")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
recovered_bra <- data.frame(recovered_bra, dates_JHU)
recovered_bra$Province.State <- NULL
recovered_bra$Country.Region <- NULL
recovered_bra$Lat <- NULL
recovered_bra$Long <- NULL
recovered_bra$Date <- NULL
recovered_bra$cumulative_cases <- NULL
names(recovered_bra)[1] = "BRA"

## CHILE
recovered_chl <- slice(JHU_recovered, which(JHU_recovered[,2] == "Chile")
                       :which(JHU_recovered[,2] == "Chile")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases)))
recovered_chl <- data.frame(recovered_chl, dates_JHU)
recovered_chl$Province.State <- NULL
recovered_chl$Country.Region <- NULL
recovered_chl$Lat <- NULL
recovered_chl$Long <- NULL
recovered_chl$Date <- NULL
recovered_chl$cumulative_cases <- NULL
names(recovered_chl)[1] = "CHL"

## COLOMBIA
recovered_col <- slice(JHU_recovered, which(JHU_recovered[,2] == "Colombia")
                       :which(JHU_recovered[,2] == "Colombia")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
recovered_col <- data.frame(recovered_col, dates_JHU)
recovered_col$Province.State <- NULL
recovered_col$Country.Region <- NULL
recovered_col$Lat <- NULL
recovered_col$Long <- NULL
recovered_col$Date <- NULL
recovered_col$cumulative_cases <- NULL
names(recovered_col)[1] = "COL"

## PARAGUAY
recovered_pry <- slice(JHU_recovered, which(JHU_recovered[,2] == "Paraguay")
                       :which(JHU_recovered[,2] == "Paraguay")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
recovered_pry <- data.frame(recovered_pry, dates_JHU)
recovered_pry$Province.State <- NULL
recovered_pry$Country.Region <- NULL
recovered_pry$Lat <- NULL
recovered_pry$Long <- NULL
recovered_pry$Date <- NULL
recovered_pry$cumulative_cases <- NULL
names(recovered_pry)[1] = "PRY"

## PERU
recovered_per <- slice(JHU_recovered, which(JHU_recovered[,2] == "Peru")
                       :which(JHU_recovered[,2] == "Peru")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
recovered_per <- data.frame(recovered_per, dates_JHU)
recovered_per$Province.State <- NULL
recovered_per$Country.Region <- NULL
recovered_per$Lat <- NULL
recovered_per$Long <- NULL
recovered_per$Date <- NULL
recovered_per$cumulative_cases <- NULL
names(recovered_per)[1] = "PER"

## URUGUAY
recovered_ury <- slice(JHU_recovered, which(JHU_recovered[,2] == "Uruguay")
                       :which(JHU_recovered[,2] == "Uruguay")) %>% 
  pivot_longer(-c(Province.State, Country.Region, Lat, Long), 
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases))) 
recovered_ury <- data.frame(recovered_ury, dates_JHU)
recovered_ury$Province.State <- NULL
recovered_ury$Country.Region <- NULL
recovered_ury$Lat <- NULL
recovered_ury$Long <- NULL
recovered_ury$Date <- NULL
recovered_ury$cumulative_cases <- NULL
names(recovered_ury)[1] = "URY"

# Combine Datasets
recovered_covid19 <- merge(recovered_arg, recovered_bol, by = "dates_JHU", all = TRUE)
recovered_covid19 <- merge(recovered_covid19, recovered_bra, by = "dates_JHU", all = TRUE)
recovered_covid19 <- merge(recovered_covid19, recovered_chl, by = "dates_JHU", all = TRUE)
recovered_covid19 <- merge(recovered_covid19, recovered_col, by = "dates_JHU", all = TRUE)
recovered_covid19 <- merge(recovered_covid19, recovered_pry, by = "dates_JHU", all = TRUE)
recovered_covid19 <- merge(recovered_covid19, recovered_per, by = "dates_JHU", all = TRUE)
recovered_covid19 <- merge(recovered_covid19, recovered_ury, by = "dates_JHU", all = TRUE)

## Slice Data (26 Feb - 15 May)
recovered_covid19 <- slice(recovered_covid19, 36:(nrow(recovered_covid19)-4))
```
