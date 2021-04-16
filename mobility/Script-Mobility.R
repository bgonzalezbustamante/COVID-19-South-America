## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Script ID ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Mobility and COVID-19 in South America
## R version 4.0.2 (2020-06-22) -- "Taking Off Again"
## Date: March-April 2021

## Bastián González-Bustamante (University of Oxford, UK)
## E-mail: bastian.gonzalezbustamante@politics.ox.ac.uk
## https://bgonzalezbustamante.com/

## COVID-19 Pandemic in South America Project
## OSF-Project DOI: 10.17605/OSF.IO/6FM7X
## http://bgonzalezbustamante.github.io/COVID-19-South-America/

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Packages and Functions ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Clean Environment
rm(list = ls())

## Packages
library(tidyverse)
library(ggplot2)

## Functions
source("R/functions.R", encoding = "UTF-8")

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Google Data ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Google Data
mobility <- read.csv("../data/Google/Global_Mobility_Report.csv", encoding = "UTF-8")

## Subsample Argentina
ARG <- filter(mobility, country_region == "Argentina" & date < "2020-05-16" & date > "2020-02-14"
              & sub_region_1 != "")

## Subsample Chile
CHL <- filter(mobility, country_region == "Chile" & date < "2020-05-16" & date > "2020-02-14"
              & sub_region_1 != "")

## Subsample Colombia
COL <- filter(mobility, country_region == "Colombia" & date < "2020-05-16" & date > "2020-02-14"
              & sub_region_1 != "")

## Subsample Peru
PER <- filter(mobility, country_region == "Peru" & date < "2020-05-16" & date > "2020-02-14"
              & sub_region_1 != "")

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Poverty Data ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Poverty in Argentina
for(i in 1:nrow(ARG)) {
  ARG$poverty[i] <- f.poverty.ARG(ARG$sub_region_1[i])
}

## Poverty in Chile
for(i in 1:nrow(CHL)) {
  CHL$poverty[i] <- f.poverty.CHL(CHL$sub_region_1[i])
}

### Poverty in Colombia
for(i in 1:nrow(COL)) {
  COL$poverty[i] <- f.poverty.COL(COL$sub_region_1[i])
}

### Poverty in Peru
for(i in 1:nrow(PER)) {
  PER$poverty[i] <- f.poverty.PER(PER$sub_region_1[i])
}

## Recode Argentina
unique(ARG$sub_region_1[which(is.na(ARG$poverty))])
ARG.vor <- ARG %>% drop_na(poverty)
## quantile(unique(ARG.vor$poverty))
ARG.vor$Poverty <- ifelse(ARG.vor$poverty > mean_poverty_ARG, "High % of poor", "Low % of poor")
ARG.vor$binary_poverty <- ifelse(ARG.vor$poverty > mean_poverty_ARG, 1, 0)
## table(ARG.vor$Poverty)
## table(ARG.vor$binary_poverty)

## Recode Chile
unique(CHL$sub_region_1[which(is.na(CHL$poverty))])
quantile(c(unique(CHL$poverty), 4.6))
CHL$Poverty <- ifelse(CHL$poverty > mean_poverty_CHL, "High % of poor", "Low % of poor")
CHL$binary_poverty <- ifelse(CHL$poverty > mean_poverty_CHL, 1, 0)
## table(CHL$Poverty)
## table(CHL$binary_poverty)

## Recode Colombia
unique(COL$sub_region_1[which(is.na(COL$poverty))])
COL.vor <- COL %>% drop_na(poverty)
quantile(c(unique(COL.vor$poverty), 28.7))
COL.vor$Poverty <- ifelse(COL.vor$poverty > mean_poverty_COL, "High % of poor", "Low % of poor")
COL.vor$binary_poverty <- ifelse(COL.vor$poverty > mean_poverty_COL, 1, 0)
## table(COL.vor$Poverty)
## table(COL.vor$binary_poverty)

## Recode PER
unique(PER$sub_region_1[which(is.na(PER$poverty))])
quantile(unique(PER$poverty))
PER$Poverty <- ifelse(PER$poverty > mean_poverty_PER, "High % of poor", "Low % of poor")
PER$binary_poverty <- ifelse(PER$poverty > mean_poverty_PER, 1, 0)
## table(PER$Poverty)
## table(PER$binary_poverty)

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Oxford Government Responses Tracker ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Omitted source for peer-review.

## OxCGRT - Covid-Policy-Tracker
stringencyindex <- read.csv("https://osf.io/kga4d/download", sep = ",")
c1_schoolclosing <- read.csv("https://osf.io/82hjz/download", sep = ",")
c1_flag <- read.csv("https://osf.io/qcmsb/download", sep = ",")
c2_workplaceclosing <- read.csv("https://osf.io/5fs42/download", sep = ",")
c2_flag <- read.csv("https://osf.io/yn83e/download", sep = ",")
c6_stayathomerequirements <- read.csv("https://osf.io/xpm74/download", sep = ",")
c6_flag <- read.csv("https://osf.io/62r7k/download", sep = ",")

## Period Coverage
dd_OXF <- as.numeric((as.Date("2020-05-15")) - as.Date("2020-01-01"))
begin_OXF <- ((as.Date("2020-05-15"))-dd_OXF) ## 01 January
dates_OXF <- seq(as.Date(begin_OXF), as.Date("2020-05-15"), by="days")

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Argentina Responses ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Omitted source for peer-review.

## stringencyindex
arg.stringencyindex <- slice(stringencyindex, which(stringencyindex[,1] == "Argentina"):
                               which(stringencyindex[,1] == "Argentina")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "stringency_index")
arg.stringencyindex <- slice(arg.stringencyindex, 1:136) ## 15 May
arg.stringencyindex <- data.frame(arg.stringencyindex, dates_OXF)
arg.stringencyindex$X <- NULL
arg.stringencyindex$X.1 <- NULL
arg.stringencyindex$Date <- NULL

## c1_schoolclosing
arg.c1_schoolclosing <- slice(c1_schoolclosing, which(c1_schoolclosing[,1] == "Argentina"):
                                which(c1_schoolclosing[,1] == "Argentina")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c1_schoolclosing")
arg.c1_schoolclosing <- slice(arg.c1_schoolclosing, 1:136) ## 15 May
arg.c1_schoolclosing <- data.frame(arg.c1_schoolclosing, dates_OXF)
arg.c1_schoolclosing$X <- NULL
arg.c1_schoolclosing$X.1 <- NULL
arg.c1_schoolclosing$Date <- NULL

## c1_flag
arg.c1_flag <- slice(c1_flag, which(c1_flag[,1] == "Argentina"):which(c1_flag[,1] == "Argentina")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c1_flag")
arg.c1_flag <- slice(arg.c1_flag, 1:136) ## 15 May
arg.c1_flag <- data.frame(arg.c1_flag, dates_OXF)
arg.c1_flag$X <- NULL
arg.c1_flag$X.1 <- NULL
arg.c1_flag$Date <- NULL

## c2_workplaceclosing
arg.c2_workplaceclosing <- slice(c2_workplaceclosing, which(c2_workplaceclosing[,1] == "Argentina"):
                                   which(c2_workplaceclosing[,1] == "Argentina")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c2_workplaceclosing")
arg.c2_workplaceclosing <- slice(arg.c2_workplaceclosing, 1:136) ## 15 May
arg.c2_workplaceclosing <- data.frame(arg.c2_workplaceclosing, dates_OXF)
arg.c2_workplaceclosing$X <- NULL
arg.c2_workplaceclosing$X.1 <- NULL
arg.c2_workplaceclosing$Date <- NULL

## c2_flag
arg.c2_flag <- slice(c2_flag, which(c2_flag[,1] == "Argentina"):which(c2_flag[,1] == "Argentina")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c2_flag")
arg.c2_flag <- slice(arg.c2_flag, 1:136) ## 15 May
arg.c2_flag <- data.frame(arg.c2_flag, dates_OXF)
arg.c2_flag$X <- NULL
arg.c2_flag$X.1 <- NULL
arg.c2_flag$Date <- NULL

## c6_stayathomerequirements
arg.c6_stayathomerequirements <- slice(c6_stayathomerequirements, which(c6_stayathomerequirements[,1] == "Argentina"):
                                         which(c6_stayathomerequirements[,1] == "Argentina")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c6_stayathomerequirements")
arg.c6_stayathomerequirements <- slice(arg.c6_stayathomerequirements, 1:136) ## 15 May
arg.c6_stayathomerequirements <- data.frame(arg.c6_stayathomerequirements, dates_OXF)
arg.c6_stayathomerequirements$X <- NULL
arg.c6_stayathomerequirements$X.1 <- NULL
arg.c6_stayathomerequirements$Date <- NULL

## c6_flag
arg.c6_flag <- slice(c6_flag, which(c6_flag[,1] == "Argentina"):which(c6_flag[,1] == "Argentina")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c6_flag")
arg.c6_flag <- slice(arg.c6_flag, 1:136) ## 15 May
arg.c6_flag <- data.frame(arg.c6_flag, dates_OXF)
arg.c6_flag$X <- NULL
arg.c6_flag$X.1 <- NULL
arg.c6_flag$Date <- NULL

## Dataframe Responses Argentina
arg_resp <- data.frame(arg.stringencyindex, arg.c1_schoolclosing$c1_schoolclosing, arg.c1_flag$c1_flag,
                       arg.c2_workplaceclosing$c2_workplaceclosing, arg.c2_flag$c2_flag,
                       arg.c6_stayathomerequirements$c6_stayathomerequirements,
                       arg.c6_flag$c6_flag)
names(arg_resp)[1] = "stringencyindex"
names(arg_resp)[2] = "dates"
names(arg_resp)[3] = "c1_schoolclosing"
names(arg_resp)[4] = "c1_flag"
names(arg_resp)[5] = "c2_workplaceclosing"
names(arg_resp)[6] = "c2_flag"
names(arg_resp)[7] = "c6_stayathomerequirements"
names(arg_resp)[8] = "c6_flag"

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Mobility Changes ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Cross National Data Frame
cross.national <- bind_rows(ARG.vor, CHL, COL.vor, PER)
names(cross.national)[2] = "Country"

## Plot Workplaces
ggplot(cross.national, aes(x = as.Date(date), y = workplaces_percent_change_from_baseline,
                           col = Country)) + geom_smooth(aes(linetype = Country, fill = Country)) +
  theme_minimal(base_size = 12) + theme(legend.position = "bottom") +
  theme(panel.grid.minor = element_blank()) +
  theme(axis.text.x = element_text(angle = 35, hjust = 1, color = "black",  size = 9)) +
  labs(x = "Date", y = "Workplaces", title = NULL, subtitle = NULL) +
  theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")) +
  scale_x_date(date_breaks = "2 weeks", date_minor_breaks = "2 weeks", date_labels = "%Y-%m-%d") +
  scale_y_continuous(limits = c(-100, 20), breaks = c(-100, -80, -60, -40, -20, 0, 20)) +
  scale_colour_manual(values=c("#1f78b4", "#e31a1c", "#ff7f00", "#33a02c")) +
  scale_fill_manual(values=c("#1f78b4", "#e31a1c", "#ff7f00", "#33a02c"))

## Plot Transit Stations
ggplot(cross.national, aes(x = as.Date(date), y = transit_stations_percent_change_from_baseline,
                           col = Country)) + geom_smooth(aes(linetype = Country, fill = Country)) +
  theme_minimal(base_size = 12) + theme(legend.position = "bottom") +
  theme(panel.grid.minor = element_blank()) +
  theme(axis.text.x = element_text(angle = 35, hjust = 1, color = "black",  size = 9)) +
  labs(x = "Date", y = "Transit Stations", title = NULL, subtitle = NULL) +
  theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")) +
  scale_x_date(date_breaks = "2 weeks", date_minor_breaks = "2 weeks",
               date_labels = "%Y-%m-%d") +
  scale_y_continuous(limits = c(-100, 20), breaks = c(-100, -80, -60, -40, -20, 0, 20)) +
  scale_colour_manual(values=c("#1f78b4", "#e31a1c", "#ff7f00", "#33a02c")) +
  scale_fill_manual(values=c("#1f78b4", "#e31a1c", "#ff7f00", "#33a02c"))

## Plot Groceries
ggplot(cross.national, aes(x = as.Date(date), y = grocery_and_pharmacy_percent_change_from_baseline,
                           col = Country)) + geom_smooth(aes(linetype = Country, fill = Country)) +
  theme_minimal(base_size = 12) + theme(legend.position = "bottom") +
  theme(panel.grid.minor = element_blank()) +
  theme(axis.text.x = element_text(angle = 35, hjust = 1, color = "black",  size = 9)) +
  labs(x = "Date", y = "Groceries", title = NULL, subtitle = NULL) +
  theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")) +
  scale_x_date(date_breaks = "2 weeks", date_minor_breaks = "2 weeks",
               date_labels = "%Y-%m-%d") +
  scale_y_continuous(limits = c(-100, 20), breaks = c(-100, -80, -60, -40, -20, 0, 20)) +
  scale_colour_manual(values=c("#1f78b4", "#e31a1c", "#ff7f00", "#33a02c")) +
  scale_fill_manual(values=c("#1f78b4", "#e31a1c", "#ff7f00", "#33a02c"))

## Plot Recreation
ggplot(cross.national, aes(x = as.Date(date), y = retail_and_recreation_percent_change_from_baseline,
                           col = Country)) + geom_smooth(aes(linetype = Country, fill = Country)) +
  theme_minimal(base_size = 12) + theme(legend.position = "bottom") +
  theme(panel.grid.minor = element_blank()) +
  theme(axis.text.x = element_text(angle = 35, hjust = 1, color = "black",  size = 9)) +
  labs(x = "Date", y = "Groceries", title = NULL, subtitle = NULL) +
  theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")) +
  scale_x_date(date_breaks = "2 weeks", date_minor_breaks = "2 weeks",
               date_labels = "%Y-%m-%d") +
  scale_y_continuous(limits = c(-100, 20), breaks = c(-100, -80, -60, -40, -20, 0, 20)) +
  scale_colour_manual(values=c("#1f78b4", "#e31a1c", "#ff7f00", "#33a02c")) +
  scale_fill_manual(values=c("#1f78b4", "#e31a1c", "#ff7f00", "#33a02c"))

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### National Trends ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Checking Responses Argentina
as.Date(arg_resp$dates[which(arg_resp$c1_schoolclosing == 3 & arg_resp$c1_flag == 1, arr.ind = TRUE)])[1]
as.Date(arg_resp$dates[which(arg_resp$c2_workplaceclosing == 3 & arg_resp$c1_flag == 1, arr.ind = TRUE)])[1]
as.Date(arg_resp$dates[which(arg_resp$c6_stayathomerequirements == 3 & arg_resp$c1_flag == 1, arr.ind = TRUE)])[1]

## Checking Responses Chile

## Checking Responses Colombia

## Checking Responses Peru

## Plot Argentina
ggplot(ARG.vor, aes(x = as.Date(date), y = workplaces_percent_change_from_baseline,
                    col = Poverty)) + geom_smooth(aes(linetype = Poverty, fill = Poverty)) +
  theme_minimal(base_size = 12) + theme(legend.position = "bottom") +
  theme(panel.grid.minor = element_blank()) +
  theme(axis.text.x = element_text(angle = 35, hjust = 1, color = "black",  size = 9)) +
  labs(x = "Date", y = "Workplaces", title = NULL, subtitle = NULL) +
  theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")) +
  scale_x_date(date_breaks = "2 weeks", date_minor_breaks = "2 weeks",
               date_labels = "%Y-%m-%d") +
  scale_y_continuous(limits = c(-100, 20), breaks = c(-100, -80, -60, -40, -20, 0, 20)) +
  scale_colour_manual(values=c("#1f78b4","gray30")) +
  scale_fill_manual(values=c("#1f78b4","gray30")) +
  scale_linetype_manual(values=c(2,3)) +
  geom_vline(xintercept = as.Date(arg_resp$dates[which(arg_resp$c1_schoolclosing == 3
                                                       & arg_resp$c1_flag == 1, arr.ind = TRUE)[1]]), col = "tomato2", lty = 2) +
  geom_vline(xintercept = as.Date(arg_resp$dates[which(arg_resp$c6_stayathomerequirements == 3
                                                       & arg_resp$c1_flag == 1, arr.ind = TRUE)[1]]), col = "tomato2", lty = 2)

## Plot Chile
ggplot(CHL, aes(x = as.Date(date), y = workplaces_percent_change_from_baseline,
                    col = Poverty)) + geom_smooth(aes(linetype = Poverty, fill = Poverty)) +
  theme_minimal(base_size = 12) + theme(legend.position = "bottom") +
  theme(panel.grid.minor = element_blank()) +
  theme(axis.text.x = element_text(angle = 35, hjust = 1, color = "black",  size = 9)) +
  labs(x = "Date", y = "Workplaces", title = NULL, subtitle = NULL) +
  theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")) +
  scale_x_date(date_breaks = "2 weeks", date_minor_breaks = "2 weeks",
               date_labels = "%Y-%m-%d") +
  scale_y_continuous(limits = c(-100, 20), breaks = c(-100, -80, -60, -40, -20, 0, 20)) +
  scale_colour_manual(values=c("#e31a1c","gray30")) +
  scale_fill_manual(values=c("#e31a1c","gray30")) +
  scale_linetype_manual(values=c(2,3))

## Plot Colombia
ggplot(COL.vor, aes(x = as.Date(date), y = workplaces_percent_change_from_baseline,
                col = Poverty)) + geom_smooth(aes(linetype = Poverty, fill = Poverty)) +
  theme_minimal(base_size = 12) + theme(legend.position = "bottom") +
  theme(panel.grid.minor = element_blank()) +
  theme(axis.text.x = element_text(angle = 35, hjust = 1, color = "black",  size = 9)) +
  labs(x = "Date", y = "Workplaces", title = NULL, subtitle = NULL) +
  theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")) +
  scale_x_date(date_breaks = "2 weeks", date_minor_breaks = "2 weeks",
               date_labels = "%Y-%m-%d") +
  scale_y_continuous(limits = c(-100, 20), breaks = c(-100, -80, -60, -40, -20, 0, 20)) +
  scale_colour_manual(values=c("#ff7f00","gray30")) +
  scale_fill_manual(values=c("#ff7f00","gray30")) +
  scale_linetype_manual(values=c(2,3))

## Plot Peru
ggplot(COL.vor, aes(x = as.Date(date), y = workplaces_percent_change_from_baseline,
                    col = Poverty)) + geom_smooth(aes(linetype = Poverty, fill = Poverty)) +
  theme_minimal(base_size = 12) + theme(legend.position = "bottom") +
  theme(panel.grid.minor = element_blank()) +
  theme(axis.text.x = element_text(angle = 35, hjust = 1, color = "black",  size = 9)) +
  labs(x = "Date", y = "Workplaces", title = NULL, subtitle = NULL) +
  theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")) +
  scale_x_date(date_breaks = "2 weeks", date_minor_breaks = "2 weeks",
               date_labels = "%Y-%m-%d") +
  scale_y_continuous(limits = c(-100, 20), breaks = c(-100, -80, -60, -40, -20, 0, 20)) +
  scale_colour_manual(values=c("#33a02c","gray30")) +
  scale_fill_manual(values=c("#33a02c","gray30")) +
  scale_linetype_manual(values=c(2,3))
