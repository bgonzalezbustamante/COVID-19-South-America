## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Script ID ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Mobility and COVID-19 in South America
## R version 4.0.2 (2020-06-22) -- "Taking Off Again"
## Date: March-May 2021

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
library(estimatr)
library(fmsb)
library(stargazer)

## Functions
source("R/functions.R", encoding = "UTF-8")

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Google Data ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Google Data
mobility <- read.csv("../data/Google/Global_Mobility_Report.csv", encoding = "UTF-8")

## Subsample Argentina
ARG <- filter(mobility, country_region == "Argentina" & date < "2020-05-01" & date > "2020-02-29"
              & sub_region_1 != "")

## Placebo Argentina
placebo_ARG <- filter(mobility, country_region == "Argentina" & date < "2020-03-10" & date > "2020-02-14"
                      & sub_region_1 != "")

## Subsample Chile
## CHL <- filter(mobility, country_region == "Chile" & date < "2020-05-16" & date > "2020-02-14"
CHL <- filter(mobility, country_region == "Chile" & date < "2020-05-01" & date > "2020-02-29"
              & sub_region_1 != "")

## Placebo Chile
placebo_CHL <- filter(mobility, country_region == "Chile" & date < "2020-03-10" & date > "2020-02-14"
                      & sub_region_1 != "")

## Subsample Colombia
## COL <- filter(mobility, country_region == "Colombia" & date < "2020-05-16" & date > "2020-02-14"
COL <- filter(mobility, country_region == "Colombia" & date < "2020-05-01" & date > "2020-02-29"
              & sub_region_1 != "")

## Placebo Colombia
placebo_COL <- filter(mobility, country_region == "Colombia" & date < "2020-03-10" & date > "2020-02-14"
                      & sub_region_1 != "")

## Subsample Peru
## PER <- filter(mobility, country_region == "Peru" & date < "2020-05-16" & date > "2020-02-14"
PER <- filter(mobility, country_region == "Peru" & date < "2020-05-01" & date > "2020-02-29"
              & sub_region_1 != "")

## Placebo Peru
placebo_PER <- filter(mobility, country_region == "Peru" & date < "2020-03-10" & date > "2020-02-14"
                      & sub_region_1 != "")

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Poverty Data ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Poverty in Argentina
for(i in 1:nrow(ARG)) {
  ARG$poverty[i] <- f.poverty.ARG(ARG$sub_region_1[i])
}
for(i in 1:nrow(placebo_ARG)) {
  placebo_ARG$poverty[i] <- f.poverty.ARG(placebo_ARG$sub_region_1[i])
}

## Poverty in Chile
for(i in 1:nrow(CHL)) {
  CHL$poverty[i] <- f.poverty.CHL(CHL$sub_region_1[i])
}
for(i in 1:nrow(placebo_CHL)) {
  placebo_CHL$poverty[i] <- f.poverty.CHL(placebo_CHL$sub_region_1[i])
}

### Poverty in Colombia
for(i in 1:nrow(COL)) {
  COL$poverty[i] <- f.poverty.COL(COL$sub_region_1[i])
}
for(i in 1:nrow(placebo_COL)) {
  placebo_COL$poverty[i] <- f.poverty.COL(placebo_COL$sub_region_1[i])
}

### Poverty in Peru
for(i in 1:nrow(PER)) {
  PER$poverty[i] <- f.poverty.PER(PER$sub_region_1[i])
}
for(i in 1:nrow(placebo_PER)) {
  placebo_PER$poverty[i] <- f.poverty.PER(placebo_PER$sub_region_1[i])
}

## Recode Argentina
unique(ARG$sub_region_1[which(is.na(ARG$poverty))])
ARG.vor <- ARG %>% drop_na(poverty)
ARG.vor$Poverty <- ifelse(ARG.vor$poverty > mean_poverty_ARG, "High % of poor", "Low % of poor")
ARG.vor$binary_poverty <- ifelse(ARG.vor$poverty > mean_poverty_ARG, 1, 0)
## table(ARG.vor$Poverty)
## table(ARG.vor$binary_poverty)
placebo_ARG <- placebo_ARG %>% drop_na(poverty)
placebo_ARG$binary_poverty <- ifelse(placebo_ARG$poverty > mean_poverty_ARG, 1, 0)

## Recode Chile
unique(CHL$sub_region_1[which(is.na(CHL$poverty))])
CHL$Poverty <- ifelse(CHL$poverty > mean_poverty_CHL, "High % of poor", "Low % of poor")
CHL$binary_poverty <- ifelse(CHL$poverty > mean_poverty_CHL, 1, 0)
## table(CHL$Poverty)
## table(CHL$binary_poverty)
placebo_CHL$binary_poverty <- ifelse(placebo_CHL$poverty > mean_poverty_CHL, 1, 0)

## Recode Colombia
unique(COL$sub_region_1[which(is.na(COL$poverty))])
COL.vor <- COL %>% drop_na(poverty)
COL.vor$Poverty <- ifelse(COL.vor$poverty > mean_poverty_COL, "High % of poor", "Low % of poor")
COL.vor$binary_poverty <- ifelse(COL.vor$poverty > mean_poverty_COL, 1, 0)
## table(COL.vor$Poverty)
## table(COL.vor$binary_poverty)
placebo_COL <- placebo_COL %>% drop_na(poverty)
placebo_COL$binary_poverty <- ifelse(placebo_COL$poverty > mean_poverty_COL, 1, 0)

## Recode PER
unique(PER$sub_region_1[which(is.na(PER$poverty))])
PER$Poverty <- ifelse(PER$poverty > mean_poverty_PER, "High % of poor", "Low % of poor")
PER$binary_poverty <- ifelse(PER$poverty > mean_poverty_PER, 1, 0)
## table(PER$Poverty)
## table(PER$binary_poverty)
placebo_PER$binary_poverty <- ifelse(placebo_PER$poverty > mean_poverty_PER, 1, 0)

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Mobility Changes ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Cross National Data Frame
cross.national <- bind_rows(ARG.vor, CHL, COL.vor, PER)
names(cross.national)[2] = "Country"

## Plot Workplaces
## pdf("plots-300dpi/figure_1a.pdf", width = 6.826666666666667, height = 5.12)
## png("plots-300dpi/figure_1a.png", width = (1024*2), height = (768*2), units = 'px', res = 300)
ggplot(cross.national, aes(x = as.Date(date), y = workplaces_percent_change_from_baseline,
                           col = Country)) + geom_smooth(aes(linetype = Country, fill = Country)) +
  theme_minimal(base_size = 12) + theme(legend.position = "bottom") +
  theme(panel.grid.minor = element_blank()) +
  theme(axis.text.x = element_text(angle = 35, hjust = 1, color = "black",  size = 9)) +
  labs(x = "Date", y = "Workplaces", title = NULL, subtitle = NULL) +
  theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")) +
  scale_x_date(date_breaks = "1 week", date_minor_breaks = "1 week", date_labels = "%Y-%m-%d") +
  scale_y_continuous(limits = c(-100, 20), breaks = c(-100, -80, -60, -40, -20, 0, 20)) +
  scale_colour_manual(values=c("#1f78b4", "#e31a1c", "#ff7f00", "#33a02c")) +
  scale_fill_manual(values=c("#1f78b4", "#e31a1c", "#ff7f00", "#33a02c"))
## dev.off()

## Plot Workplaces
## pdf("plots-300dpi/appendices/appendix_1a.pdf", width = 6.826666666666667, height = 5.12)
## png("plots-300dpi/appendices/appendix_1a.png", width = (1024*2), height = (768*2), units = 'px', res = 300)
ggplot(subset(cross.national, sub_region_1 != "Buenos Aires" & sub_region_1 != "Santiago Metropolitan Region"
              & sub_region_1 != "Bogota" & sub_region_1 != "Metropolitan Municipality of Lima"),
       aes(x = as.Date(date), y = workplaces_percent_change_from_baseline, col = Country)) +
  geom_smooth(aes(linetype = Country, fill = Country)) +
  theme_minimal(base_size = 12) + theme(legend.position = "bottom") +
  theme(panel.grid.minor = element_blank()) +
  theme(axis.text.x = element_text(angle = 35, hjust = 1, color = "black",  size = 9)) +
  labs(x = "Date", y = "Workplaces", title = NULL, subtitle = NULL) +
  theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")) +
  scale_x_date(date_breaks = "1 week", date_minor_breaks = "1 week", date_labels = "%Y-%m-%d") +
  scale_y_continuous(limits = c(-100, 20), breaks = c(-100, -80, -60, -40, -20, 0, 20)) +
  scale_colour_manual(values=c("#1f78b4", "#e31a1c", "#ff7f00", "#33a02c")) +
  scale_fill_manual(values=c("#1f78b4", "#e31a1c", "#ff7f00", "#33a02c"))
## dev.off()

## Plot Transit Stations
## pdf("plots-300dpi/figure_1b.pdf", width = 6.826666666666667, height = 5.12)
## png("plots-300dpi/figure_1b.png", width = (1024*2), height = (768*2), units = 'px', res = 300)
ggplot(cross.national, aes(x = as.Date(date), y = transit_stations_percent_change_from_baseline,
                           col = Country)) + geom_smooth(aes(linetype = Country, fill = Country)) +
  theme_minimal(base_size = 12) + theme(legend.position = "bottom") +
  theme(panel.grid.minor = element_blank()) +
  theme(axis.text.x = element_text(angle = 35, hjust = 1, color = "black",  size = 9)) +
  labs(x = "Date", y = "Transit Stations", title = NULL, subtitle = NULL) +
  theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")) +
  scale_x_date(date_breaks = "1 week", date_minor_breaks = "1 week", date_labels = "%Y-%m-%d") +
  scale_y_continuous(limits = c(-100, 20), breaks = c(-100, -80, -60, -40, -20, 0, 20)) +
  scale_colour_manual(values=c("#1f78b4", "#e31a1c", "#ff7f00", "#33a02c")) +
  scale_fill_manual(values=c("#1f78b4", "#e31a1c", "#ff7f00", "#33a02c"))
## dev.off()

## Plot Transit Stations
## pdf("plots-300dpi/appendices/appendix_1b.pdf", width = 6.826666666666667, height = 5.12)
## png("plots-300dpi/appendices/appendix_1b.png", width = (1024*2), height = (768*2), units = 'px', res = 300)
ggplot(subset(cross.national, sub_region_1 != "Buenos Aires" & sub_region_1 != "Santiago Metropolitan Region"
              & sub_region_1 != "Bogota" & sub_region_1 != "Metropolitan Municipality of Lima"),
       aes(x = as.Date(date), y = transit_stations_percent_change_from_baseline, col = Country)) +
  geom_smooth(aes(linetype = Country, fill = Country)) +
  theme_minimal(base_size = 12) + theme(legend.position = "bottom") +
  theme(panel.grid.minor = element_blank()) +
  theme(axis.text.x = element_text(angle = 35, hjust = 1, color = "black",  size = 9)) +
  labs(x = "Date", y = "Transit Stations", title = NULL, subtitle = NULL) +
  theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")) +
  scale_x_date(date_breaks = "1 week", date_minor_breaks = "1 week", date_labels = "%Y-%m-%d") +
  scale_y_continuous(limits = c(-100, 20), breaks = c(-100, -80, -60, -40, -20, 0, 20)) +
  scale_colour_manual(values=c("#1f78b4", "#e31a1c", "#ff7f00", "#33a02c")) +
  scale_fill_manual(values=c("#1f78b4", "#e31a1c", "#ff7f00", "#33a02c"))
## dev.off()

## Plot Groceries
## pdf("plots-300dpi/figure_1c.pdf", width = 6.826666666666667, height = 5.12)
## png("plots-300dpi/figure_1c.png", width = (1024*2), height = (768*2), units = 'px', res = 300)
ggplot(cross.national, aes(x = as.Date(date), y = grocery_and_pharmacy_percent_change_from_baseline,
                           col = Country)) + geom_smooth(aes(linetype = Country, fill = Country)) +
  theme_minimal(base_size = 12) + theme(legend.position = "bottom") +
  theme(panel.grid.minor = element_blank()) +
  theme(axis.text.x = element_text(angle = 35, hjust = 1, color = "black",  size = 9)) +
  labs(x = "Date", y = "Groceries", title = NULL, subtitle = NULL) +
  theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")) +
  scale_x_date(date_breaks = "1 week", date_minor_breaks = "1 week", date_labels = "%Y-%m-%d") +
  scale_y_continuous(limits = c(-100, 20), breaks = c(-100, -80, -60, -40, -20, 0, 20)) +
  scale_colour_manual(values=c("#1f78b4", "#e31a1c", "#ff7f00", "#33a02c")) +
  scale_fill_manual(values=c("#1f78b4", "#e31a1c", "#ff7f00", "#33a02c"))
## dev.off()

## Plot Groceries
## pdf("plots-300dpi/appendices/appendix_1c.pdf", width = 6.826666666666667, height = 5.12)
## png("plots-300dpi/appendices/appendix_1c.png", width = (1024*2), height = (768*2), units = 'px', res = 300)
ggplot(subset(cross.national, sub_region_1 != "Buenos Aires" & sub_region_1 != "Santiago Metropolitan Region"
              & sub_region_1 != "Bogota" & sub_region_1 != "Metropolitan Municipality of Lima"),
       aes(x = as.Date(date), y = grocery_and_pharmacy_percent_change_from_baseline, col = Country)) +
  geom_smooth(aes(linetype = Country, fill = Country)) +
  theme_minimal(base_size = 12) + theme(legend.position = "bottom") +
  theme(panel.grid.minor = element_blank()) +
  theme(axis.text.x = element_text(angle = 35, hjust = 1, color = "black",  size = 9)) +
  labs(x = "Date", y = "Groceries", title = NULL, subtitle = NULL) +
  theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")) +
  scale_x_date(date_breaks = "1 week", date_minor_breaks = "1 week", date_labels = "%Y-%m-%d") +
  scale_y_continuous(limits = c(-100, 20), breaks = c(-100, -80, -60, -40, -20, 0, 20)) +
  scale_colour_manual(values=c("#1f78b4", "#e31a1c", "#ff7f00", "#33a02c")) +
  scale_fill_manual(values=c("#1f78b4", "#e31a1c", "#ff7f00", "#33a02c"))
## dev.off()

## Plot Recreation
## pdf("plots-300dpi/figure_1d.pdf", width = 6.826666666666667, height = 5.12)
## png("plots-300dpi/figure_1d.png", width = (1024*2), height = (768*2), units = 'px', res = 300)
ggplot(cross.national, aes(x = as.Date(date), y = retail_and_recreation_percent_change_from_baseline,
                           col = Country)) + geom_smooth(aes(linetype = Country, fill = Country)) +
  theme_minimal(base_size = 12) + theme(legend.position = "bottom") +
  theme(panel.grid.minor = element_blank()) +
  theme(axis.text.x = element_text(angle = 35, hjust = 1, color = "black",  size = 9)) +
  labs(x = "Date", y = "Retail and Recreation", title = NULL, subtitle = NULL) +
  theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")) +
  scale_x_date(date_breaks = "1 week", date_minor_breaks = "1 week", date_labels = "%Y-%m-%d") +
  scale_y_continuous(limits = c(-100, 20), breaks = c(-100, -80, -60, -40, -20, 0, 20)) +
  scale_colour_manual(values=c("#1f78b4", "#e31a1c", "#ff7f00", "#33a02c")) +
  scale_fill_manual(values=c("#1f78b4", "#e31a1c", "#ff7f00", "#33a02c"))
## dev.off()

## Plot Recreation
## pdf("plots-300dpi/appendices/appendix_1d.pdf", width = 6.826666666666667, height = 5.12)
## png("plots-300dpi/appendices/appendix_1d.png", width = (1024*2), height = (768*2), units = 'px', res = 300)
ggplot(subset(cross.national, sub_region_1 != "Buenos Aires" & sub_region_1 != "Santiago Metropolitan Region"
              & sub_region_1 != "Bogota" & sub_region_1 != "Metropolitan Municipality of Lima"),
       aes(x = as.Date(date), y = retail_and_recreation_percent_change_from_baseline, col = Country)) +
  geom_smooth(aes(linetype = Country, fill = Country)) +
  theme_minimal(base_size = 12) + theme(legend.position = "bottom") +
  theme(panel.grid.minor = element_blank()) +
  theme(axis.text.x = element_text(angle = 35, hjust = 1, color = "black",  size = 9)) +
  labs(x = "Date", y = "Retail and Recreation", title = NULL, subtitle = NULL) +
  theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")) +
  scale_x_date(date_breaks = "1 week", date_minor_breaks = "1 week", date_labels = "%Y-%m-%d") +
  scale_y_continuous(limits = c(-100, 20), breaks = c(-100, -80, -60, -40, -20, 0, 20)) +
  scale_colour_manual(values=c("#1f78b4", "#e31a1c", "#ff7f00", "#33a02c")) +
  scale_fill_manual(values=c("#1f78b4", "#e31a1c", "#ff7f00", "#33a02c"))
## dev.off()

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Oxford Government Responses Tracker ####
## Code based on **source omitted because of peer-reviewing**

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

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

## Economic measures
e1_incomesupport <- read.csv("https://osf.io/f94d6/download", sep = ",")
e1_flag <- read.csv("https://osf.io/3eyt5/download", sep = ",")
e2_debtrelief <- read.csv("https://osf.io/d82gu/download", sep = ",")

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Argentina Responses ####
## Code based on **source omitted because of peer-reviewing**

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

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

## e1_incomesupport
arg.e1_incomesupport <- slice(e1_incomesupport, which(e1_incomesupport[,1] == "Argentina"):
                                         which(e1_incomesupport[,1] == "Argentina")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "e1_incomesupport")
arg.e1_incomesupport <- slice(arg.e1_incomesupport, 1:136) ## 15 May
arg.e1_incomesupport <- data.frame(arg.e1_incomesupport, dates_OXF)
arg.e1_incomesupport$X <- NULL
arg.e1_incomesupport$X.1 <- NULL
arg.e1_incomesupport$Date <- NULL

## e1_flag
arg.e1_flag <- slice(e1_flag, which(e1_flag[,1] == "Argentina"):which(e1_flag[,1] == "Argentina")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "e1_flag")
arg.e1_flag <- slice(arg.e1_flag, 1:136) ## 15 May
arg.e1_flag <- data.frame(arg.e1_flag, dates_OXF)
arg.e1_flag$X <- NULL
arg.e1_flag$X.1 <- NULL
arg.e1_flag$Date <- NULL

## e2_debtrelief
arg.e2_debtrelief <- slice(e2_debtrelief, which(e2_debtrelief[,1] == "Argentina"):
                                which(e2_debtrelief[,1] == "Argentina")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "e2_debtrelief")
arg.e2_debtrelief <- slice(arg.e2_debtrelief, 1:136) ## 15 May
arg.e2_debtrelief <- data.frame(arg.e2_debtrelief, dates_OXF)
arg.e2_debtrelief$X <- NULL
arg.e2_debtrelief$X.1 <- NULL
arg.e2_debtrelief$Date <- NULL

## Dataframe Responses Argentina
arg_resp <- data.frame(arg.stringencyindex, arg.c1_schoolclosing$c1_schoolclosing, arg.c1_flag$c1_flag,
                       arg.c2_workplaceclosing$c2_workplaceclosing, arg.c2_flag$c2_flag,
                       arg.c6_stayathomerequirements$c6_stayathomerequirements,
                       arg.c6_flag$c6_flag, arg.e1_incomesupport$e1_incomesupport,
                       arg.e1_flag$e1_flag, arg.e2_debtrelief$e2_debtrelief)
names(arg_resp)[1] = "stringencyindex"
names(arg_resp)[2] = "dates"
names(arg_resp)[3] = "c1_schoolclosing"
names(arg_resp)[4] = "c1_flag"
names(arg_resp)[5] = "c2_workplaceclosing"
names(arg_resp)[6] = "c2_flag"
names(arg_resp)[7] = "c6_stayathomerequirements"
names(arg_resp)[8] = "c6_flag"
names(arg_resp)[9] = "e1_incomesupport"
names(arg_resp)[10] = "e1_flag"
names(arg_resp)[11] = "e2_debtrelief"

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Chile Responses ####
## Code based on **source omitted because of peer-reviewing**

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## stringencyindex
chl.stringencyindex <- slice(stringencyindex, which(stringencyindex[,1] == "Chile"):
                               which(stringencyindex[,1] == "Chile")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "stringency_index")
chl.stringencyindex <- slice(chl.stringencyindex, 1:136) ## 15 May
chl.stringencyindex <- data.frame(chl.stringencyindex, dates_OXF)
chl.stringencyindex$X <- NULL
chl.stringencyindex$X.1 <- NULL
chl.stringencyindex$Date <- NULL

## c1_schoolclosing
chl.c1_schoolclosing <- slice(c1_schoolclosing, which(c1_schoolclosing[,1] == "Chile"):
                                which(c1_schoolclosing[,1] == "Chile")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c1_schoolclosing")
chl.c1_schoolclosing <- slice(chl.c1_schoolclosing, 1:136) ## 15 May
chl.c1_schoolclosing <- data.frame(chl.c1_schoolclosing, dates_OXF)
chl.c1_schoolclosing$X <- NULL
chl.c1_schoolclosing$X.1 <- NULL
chl.c1_schoolclosing$Date <- NULL

## c1_flag
chl.c1_flag <- slice(c1_flag, which(c1_flag[,1] == "Chile"):which(c1_flag[,1] == "Chile")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c1_flag")
chl.c1_flag <- slice(chl.c1_flag, 1:136) ## 15 May
chl.c1_flag <- data.frame(chl.c1_flag, dates_OXF)
chl.c1_flag$X <- NULL
chl.c1_flag$X.1 <- NULL
chl.c1_flag$Date <- NULL

## c2_workplaceclosing
chl.c2_workplaceclosing <- slice(c2_workplaceclosing, which(c2_workplaceclosing[,1] == "Chile"):
                                   which(c2_workplaceclosing[,1] == "Chile")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c2_workplaceclosing")
chl.c2_workplaceclosing <- slice(chl.c2_workplaceclosing, 1:136) ## 15 May
chl.c2_workplaceclosing <- data.frame(chl.c2_workplaceclosing, dates_OXF)
chl.c2_workplaceclosing$X <- NULL
chl.c2_workplaceclosing$X.1 <- NULL
chl.c2_workplaceclosing$Date <- NULL

## c2_flag
chl.c2_flag <- slice(c2_flag, which(c2_flag[,1] == "Chile"):which(c2_flag[,1] == "Chile")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c2_flag")
chl.c2_flag <- slice(chl.c2_flag, 1:136) ## 15 May
chl.c2_flag <- data.frame(chl.c2_flag, dates_OXF)
chl.c2_flag$X <- NULL
chl.c2_flag$X.1 <- NULL
chl.c2_flag$Date <- NULL

## c6_stayathomerequirements
chl.c6_stayathomerequirements <- slice(c6_stayathomerequirements, which(c6_stayathomerequirements[,1] == "Chile"):
                                         which(c6_stayathomerequirements[,1] == "Chile")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c6_stayathomerequirements")
chl.c6_stayathomerequirements <- slice(chl.c6_stayathomerequirements, 1:136) ## 15 May
chl.c6_stayathomerequirements <- data.frame(chl.c6_stayathomerequirements, dates_OXF)
chl.c6_stayathomerequirements$X <- NULL
chl.c6_stayathomerequirements$X.1 <- NULL
chl.c6_stayathomerequirements$Date <- NULL

## c6_flag
chl.c6_flag <- slice(c6_flag, which(c6_flag[,1] == "Chile"):which(c6_flag[,1] == "Chile")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c6_flag")
chl.c6_flag <- slice(chl.c6_flag, 1:136) ## 15 May
chl.c6_flag <- data.frame(chl.c6_flag, dates_OXF)
chl.c6_flag$X <- NULL
chl.c6_flag$X.1 <- NULL
chl.c6_flag$Date <- NULL

## e1_incomesupport
chl.e1_incomesupport <- slice(e1_incomesupport, which(e1_incomesupport[,1] == "Chile"):
                                which(e1_incomesupport[,1] == "Chile")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "e1_incomesupport")
chl.e1_incomesupport <- slice(chl.e1_incomesupport, 1:136) ## 15 May
chl.e1_incomesupport <- data.frame(chl.e1_incomesupport, dates_OXF)
chl.e1_incomesupport$X <- NULL
chl.e1_incomesupport$X.1 <- NULL
chl.e1_incomesupport$Date <- NULL

## e1_flag
chl.e1_flag <- slice(e1_flag, which(e1_flag[,1] == "Chile"):which(e1_flag[,1] == "Chile")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "e1_flag")
chl.e1_flag <- slice(chl.e1_flag, 1:136) ## 15 May
chl.e1_flag <- data.frame(chl.e1_flag, dates_OXF)
chl.e1_flag$X <- NULL
chl.e1_flag$X.1 <- NULL
chl.e1_flag$Date <- NULL

## e2_debtrelief
chl.e2_debtrelief <- slice(e2_debtrelief, which(e2_debtrelief[,1] == "Chile"):
                             which(e2_debtrelief[,1] == "Chile")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "e2_debtrelief")
chl.e2_debtrelief <- slice(chl.e2_debtrelief, 1:136) ## 15 May
chl.e2_debtrelief <- data.frame(chl.e2_debtrelief, dates_OXF)
chl.e2_debtrelief$X <- NULL
chl.e2_debtrelief$X.1 <- NULL
chl.e2_debtrelief$Date <- NULL

## Dataframe Responses Chile
chl_resp <- data.frame(chl.stringencyindex, chl.c1_schoolclosing$c1_schoolclosing, chl.c1_flag$c1_flag,
                       chl.c2_workplaceclosing$c2_workplaceclosing, chl.c2_flag$c2_flag,
                       chl.c6_stayathomerequirements$c6_stayathomerequirements,
                       chl.c6_flag$c6_flag, chl.e1_incomesupport$e1_incomesupport,
                       chl.e1_flag$e1_flag, chl.e2_debtrelief$e2_debtrelief)
names(chl_resp)[1] = "stringencyindex"
names(chl_resp)[2] = "dates"
names(chl_resp)[3] = "c1_schoolclosing"
names(chl_resp)[4] = "c1_flag"
names(chl_resp)[5] = "c2_workplaceclosing"
names(chl_resp)[6] = "c2_flag"
names(chl_resp)[7] = "c6_stayathomerequirements"
names(chl_resp)[8] = "c6_flag"
names(chl_resp)[9] = "e1_incomesupport"
names(chl_resp)[10] = "e1_flag"
names(chl_resp)[11] = "e2_debtrelief"

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Colombia Responses ####
## Code based on **source omitted because of peer-reviewing**

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## stringencyindex
col.stringencyindex <- slice(stringencyindex, which(stringencyindex[,1] == "Colombia"):
                               which(stringencyindex[,1] == "Colombia")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "stringency_index")
col.stringencyindex <- slice(col.stringencyindex, 1:136) ## 15 May
col.stringencyindex <- data.frame(col.stringencyindex, dates_OXF)
col.stringencyindex$X <- NULL
col.stringencyindex$X.1 <- NULL
col.stringencyindex$Date <- NULL

## c1_schoolclosing
col.c1_schoolclosing <- slice(c1_schoolclosing, which(c1_schoolclosing[,1] == "Colombia"):
                                which(c1_schoolclosing[,1] == "Colombia")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c1_schoolclosing")
col.c1_schoolclosing <- slice(col.c1_schoolclosing, 1:136) ## 15 May
col.c1_schoolclosing <- data.frame(col.c1_schoolclosing, dates_OXF)
col.c1_schoolclosing$X <- NULL
col.c1_schoolclosing$X.1 <- NULL
col.c1_schoolclosing$Date <- NULL

## c1_flag
col.c1_flag <- slice(c1_flag, which(c1_flag[,1] == "Colombia"):which(c1_flag[,1] == "Colombia")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c1_flag")
col.c1_flag <- slice(col.c1_flag, 1:136) ## 15 May
col.c1_flag <- data.frame(col.c1_flag, dates_OXF)
col.c1_flag$X <- NULL
col.c1_flag$X.1 <- NULL
col.c1_flag$Date <- NULL

## c2_workplaceclosing
col.c2_workplaceclosing <- slice(c2_workplaceclosing, which(c2_workplaceclosing[,1] == "Colombia"):
                                   which(c2_workplaceclosing[,1] == "Colombia")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c2_workplaceclosing")
col.c2_workplaceclosing <- slice(col.c2_workplaceclosing, 1:136) ## 15 May
col.c2_workplaceclosing <- data.frame(col.c2_workplaceclosing, dates_OXF)
col.c2_workplaceclosing$X <- NULL
col.c2_workplaceclosing$X.1 <- NULL
col.c2_workplaceclosing$Date <- NULL

## c2_flag
col.c2_flag <- slice(c2_flag, which(c2_flag[,1] == "Colombia"):which(c2_flag[,1] == "Colombia")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c2_flag")
col.c2_flag <- slice(col.c2_flag, 1:136) ## 15 May
col.c2_flag <- data.frame(col.c2_flag, dates_OXF)
col.c2_flag$X <- NULL
col.c2_flag$X.1 <- NULL
col.c2_flag$Date <- NULL

## c6_stayathomerequirements
col.c6_stayathomerequirements <- slice(c6_stayathomerequirements, which(c6_stayathomerequirements[,1] == "Colombia"):
                                         which(c6_stayathomerequirements[,1] == "Colombia")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c6_stayathomerequirements")
col.c6_stayathomerequirements <- slice(col.c6_stayathomerequirements, 1:136) ## 15 May
col.c6_stayathomerequirements <- data.frame(col.c6_stayathomerequirements, dates_OXF)
col.c6_stayathomerequirements$X <- NULL
col.c6_stayathomerequirements$X.1 <- NULL
col.c6_stayathomerequirements$Date <- NULL

## c6_flag
col.c6_flag <- slice(c6_flag, which(c6_flag[,1] == "Colombia"):which(c6_flag[,1] == "Colombia")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c6_flag")
col.c6_flag <- slice(col.c6_flag, 1:136) ## 15 May
col.c6_flag <- data.frame(col.c6_flag, dates_OXF)
col.c6_flag$X <- NULL
col.c6_flag$X.1 <- NULL
col.c6_flag$Date <- NULL

## e1_incomesupport
col.e1_incomesupport <- slice(e1_incomesupport, which(e1_incomesupport[,1] == "Colombia"):
                                which(e1_incomesupport[,1] == "Colombia")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "e1_incomesupport")
col.e1_incomesupport <- slice(col.e1_incomesupport, 1:136) ## 15 May
col.e1_incomesupport <- data.frame(col.e1_incomesupport, dates_OXF)
col.e1_incomesupport$X <- NULL
col.e1_incomesupport$X.1 <- NULL
col.e1_incomesupport$Date <- NULL

## e1_flag
col.e1_flag <- slice(e1_flag, which(e1_flag[,1] == "Colombia"):which(e1_flag[,1] == "Colombia")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "e1_flag")
col.e1_flag <- slice(col.e1_flag, 1:136) ## 15 May
col.e1_flag <- data.frame(col.e1_flag, dates_OXF)
col.e1_flag$X <- NULL
col.e1_flag$X.1 <- NULL
col.e1_flag$Date <- NULL

## e2_debtrelief
col.e2_debtrelief <- slice(e2_debtrelief, which(e2_debtrelief[,1] == "Colombia"):
                             which(e2_debtrelief[,1] == "Colombia")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "e2_debtrelief")
col.e2_debtrelief <- slice(col.e2_debtrelief, 1:136) ## 15 May
col.e2_debtrelief <- data.frame(col.e2_debtrelief, dates_OXF)
col.e2_debtrelief$X <- NULL
col.e2_debtrelief$X.1 <- NULL
col.e2_debtrelief$Date <- NULL

## Dataframe Responses Chile
col_resp <- data.frame(col.stringencyindex, col.c1_schoolclosing$c1_schoolclosing, col.c1_flag$c1_flag,
                       col.c2_workplaceclosing$c2_workplaceclosing, col.c2_flag$c2_flag,
                       col.c6_stayathomerequirements$c6_stayathomerequirements,
                       col.c6_flag$c6_flag, col.e1_incomesupport$e1_incomesupport,
                       col.e1_flag$e1_flag, col.e2_debtrelief$e2_debtrelief)
names(col_resp)[1] = "stringencyindex"
names(col_resp)[2] = "dates"
names(col_resp)[3] = "c1_schoolclosing"
names(col_resp)[4] = "c1_flag"
names(col_resp)[5] = "c2_workplaceclosing"
names(col_resp)[6] = "c2_flag"
names(col_resp)[7] = "c6_stayathomerequirements"
names(col_resp)[8] = "c6_flag"
names(col_resp)[9] = "e1_incomesupport"
names(col_resp)[10] = "e1_flag"
names(col_resp)[11] = "e2_debtrelief"

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Peru Responses ####
## Code based on **source omitted because of peer-reviewing**

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## stringencyindex
per.stringencyindex <- slice(stringencyindex, which(stringencyindex[,1] == "Peru"):
                               which(stringencyindex[,1] == "Peru")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "stringency_index")
per.stringencyindex <- slice(per.stringencyindex, 1:136) ## 15 May
per.stringencyindex <- data.frame(per.stringencyindex, dates_OXF)
per.stringencyindex$X <- NULL
per.stringencyindex$X.1 <- NULL
per.stringencyindex$Date <- NULL

## c1_schoolclosing
per.c1_schoolclosing <- slice(c1_schoolclosing, which(c1_schoolclosing[,1] == "Peru"):
                                which(c1_schoolclosing[,1] == "Peru")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c1_schoolclosing")
per.c1_schoolclosing <- slice(per.c1_schoolclosing, 1:136) ## 15 May
per.c1_schoolclosing <- data.frame(per.c1_schoolclosing, dates_OXF)
per.c1_schoolclosing$X <- NULL
per.c1_schoolclosing$X.1 <- NULL
per.c1_schoolclosing$Date <- NULL

## c1_flag
per.c1_flag <- slice(c1_flag, which(c1_flag[,1] == "Peru"):which(c1_flag[,1] == "Peru")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c1_flag")
per.c1_flag <- slice(per.c1_flag, 1:136) ## 15 May
per.c1_flag <- data.frame(per.c1_flag, dates_OXF)
per.c1_flag$X <- NULL
per.c1_flag$X.1 <- NULL
per.c1_flag$Date <- NULL

## c2_workplaceclosing
per.c2_workplaceclosing <- slice(c2_workplaceclosing, which(c2_workplaceclosing[,1] == "Peru"):
                                   which(c2_workplaceclosing[,1] == "Peru")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c2_workplaceclosing")
per.c2_workplaceclosing <- slice(per.c2_workplaceclosing, 1:136) ## 15 May
per.c2_workplaceclosing <- data.frame(per.c2_workplaceclosing, dates_OXF)
per.c2_workplaceclosing$X <- NULL
per.c2_workplaceclosing$X.1 <- NULL
per.c2_workplaceclosing$Date <- NULL

## c2_flag
per.c2_flag <- slice(c2_flag, which(c2_flag[,1] == "Peru"):which(c2_flag[,1] == "Peru")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c2_flag")
per.c2_flag <- slice(per.c2_flag, 1:136) ## 15 May
per.c2_flag <- data.frame(per.c2_flag, dates_OXF)
per.c2_flag$X <- NULL
per.c2_flag$X.1 <- NULL
per.c2_flag$Date <- NULL

## c6_stayathomerequirements
per.c6_stayathomerequirements <- slice(c6_stayathomerequirements, which(c6_stayathomerequirements[,1] == "Peru"):
                                         which(c6_stayathomerequirements[,1] == "Peru")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c6_stayathomerequirements")
per.c6_stayathomerequirements <- slice(per.c6_stayathomerequirements, 1:136) ## 15 May
per.c6_stayathomerequirements <- data.frame(per.c6_stayathomerequirements, dates_OXF)
per.c6_stayathomerequirements$X <- NULL
per.c6_stayathomerequirements$X.1 <- NULL
per.c6_stayathomerequirements$Date <- NULL

## c6_flag
per.c6_flag <- slice(c6_flag, which(c6_flag[,1] == "Peru"):which(c6_flag[,1] == "Peru")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c6_flag")
per.c6_flag <- slice(per.c6_flag, 1:136) ## 15 May
per.c6_flag <- data.frame(per.c6_flag, dates_OXF)
per.c6_flag$X <- NULL
per.c6_flag$X.1 <- NULL
per.c6_flag$Date <- NULL

## e1_incomesupport
per.e1_incomesupport <- slice(e1_incomesupport, which(e1_incomesupport[,1] == "Peru"):
                                which(e1_incomesupport[,1] == "Peru")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "e1_incomesupport")
per.e1_incomesupport <- slice(per.e1_incomesupport, 1:136) ## 15 May
per.e1_incomesupport <- data.frame(per.e1_incomesupport, dates_OXF)
per.e1_incomesupport$X <- NULL
per.e1_incomesupport$X.1 <- NULL
per.e1_incomesupport$Date <- NULL

## e1_flag
per.e1_flag <- slice(e1_flag, which(e1_flag[,1] == "Peru"):which(e1_flag[,1] == "Peru")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "e1_flag")
per.e1_flag <- slice(per.e1_flag, 1:136) ## 15 May
per.e1_flag <- data.frame(per.e1_flag, dates_OXF)
per.e1_flag$X <- NULL
per.e1_flag$X.1 <- NULL
per.e1_flag$Date <- NULL

## e2_debtrelief
per.e2_debtrelief <- slice(e2_debtrelief, which(e2_debtrelief[,1] == "Peru"):
                             which(e2_debtrelief[,1] == "Peru")) %>%
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "e2_debtrelief")
per.e2_debtrelief <- slice(per.e2_debtrelief, 1:136) ## 15 May
per.e2_debtrelief <- data.frame(per.e2_debtrelief, dates_OXF)
per.e2_debtrelief$X <- NULL
per.e2_debtrelief$X.1 <- NULL
per.e2_debtrelief$Date <- NULL

## Dataframe Responses Chile
per_resp <- data.frame(per.stringencyindex, per.c1_schoolclosing$c1_schoolclosing, per.c1_flag$c1_flag,
                       per.c2_workplaceclosing$c2_workplaceclosing, per.c2_flag$c2_flag,
                       per.c6_stayathomerequirements$c6_stayathomerequirements,
                       per.c6_flag$c6_flag, per.e1_incomesupport$e1_incomesupport,
                       per.e1_flag$e1_flag, per.e2_debtrelief$e2_debtrelief)
names(per_resp)[1] = "stringencyindex"
names(per_resp)[2] = "dates"
names(per_resp)[3] = "c1_schoolclosing"
names(per_resp)[4] = "c1_flag"
names(per_resp)[5] = "c2_workplaceclosing"
names(per_resp)[6] = "c2_flag"
names(per_resp)[7] = "c6_stayathomerequirements"
names(per_resp)[8] = "c6_flag"
names(per_resp)[9] = "e1_incomesupport"
names(per_resp)[10] = "e1_flag"
names(per_resp)[11] = "e2_debtrelief"

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### National Trends ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Checking Responses Argentina
first_ARG <- as.Date(arg_resp$dates[which(arg_resp$c1_schoolclosing == 3 & arg_resp$c1_flag == 1, arr.ind = TRUE)])[1]
as.Date(arg_resp$dates[which(arg_resp$c2_workplaceclosing == 3 & arg_resp$c2_flag == 1, arr.ind = TRUE)])[1]
lock_ARG <- as.Date(arg_resp$dates[which(arg_resp$c6_stayathomerequirements == 3 & arg_resp$c6_flag == 1, arr.ind = TRUE)])[1]

## Checking Responses Chile
first_CHL <- as.Date(chl_resp$dates[which(chl_resp$c1_schoolclosing == 3 & chl_resp$c1_flag == 1, arr.ind = TRUE)])[1]
as.Date(chl_resp$dates[which(chl_resp$c2_workplaceclosing == 3 & chl_resp$c2_flag == 1, arr.ind = TRUE)])[1]
as.Date(chl_resp$dates[which(chl_resp$c6_stayathomerequirements == 3 & chl_resp$c6_flag == 1, arr.ind = TRUE)])[1]

## Checking Responses Colombia
first_COL <- as.Date(col_resp$dates[which(col_resp$c1_schoolclosing == 3 & col_resp$c1_flag == 1, arr.ind = TRUE)])[1]
as.Date(col_resp$dates[which(col_resp$c2_workplaceclosing == 3 & col_resp$c2_flag == 1, arr.ind = TRUE)])[1]
as.Date(col_resp$dates[which(col_resp$c6_stayathomerequirements == 3 & col_resp$c6_flag == 1, arr.ind = TRUE)])[1]

## Checking Responses Peru
first_PER <- as.Date(per_resp$dates[which(per_resp$c1_schoolclosing == 3 & per_resp$c1_flag == 1, arr.ind = TRUE)])[1]
as.Date(per_resp$dates[which(per_resp$c2_workplaceclosing == 3 & per_resp$c2_flag == 1, arr.ind = TRUE)])[1]
lock_PER <- as.Date(per_resp$dates[which(per_resp$c6_stayathomerequirements == 3 & per_resp$c6_flag == 1, arr.ind = TRUE)])[1]

## Plot Argentina
## pdf("plots-300dpi/figure_2a.pdf", width = 6.826666666666667, height = 5.12)
## png("plots-300dpi/figure_2a.png", width = (1024*2), height = (768*2), units = 'px', res = 300)
ggplot(ARG.vor, aes(x = as.Date(date), y = workplaces_percent_change_from_baseline,
                    col = Poverty)) + geom_smooth(aes(linetype = Poverty, fill = Poverty)) +
  theme_minimal(base_size = 12) + theme(legend.position = "bottom") +
  theme(panel.grid.minor = element_blank()) +
  theme(axis.text.x = element_text(angle = 35, hjust = 1, color = "black",  size = 9)) +
  labs(x = "Date", y = "Workplaces", title = NULL, subtitle = NULL) +
  theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")) +
  scale_x_date(date_breaks = "1 week", date_minor_breaks = "1 week", date_labels = "%Y-%m-%d") +
  scale_y_continuous(limits = c(-100, 20), breaks = c(-100, -80, -60, -40, -20, 0, 20)) +
  scale_colour_manual(values=c("#1f78b4","gray30")) +
  scale_fill_manual(values=c("#1f78b4","gray30")) +
  scale_linetype_manual(values=c(2,3)) +
  geom_vline(xintercept = as.Date(arg_resp$dates[which(arg_resp$c1_schoolclosing == 3
                                                       & arg_resp$c1_flag == 1, arr.ind = TRUE)[1]]), col = "tomato2", lty = 2) +
  geom_vline(xintercept = as.Date(arg_resp$dates[which(arg_resp$c6_stayathomerequirements == 3
                                                       & arg_resp$c6_flag == 1, arr.ind = TRUE)[1]]), col = "tomato2", lty = 2)

## dev.off()

## Plot Argentina
## pdf("plots-300dpi/appendices/appendix_2a.pdf", width = 6.826666666666667, height = 5.12)
## png("plots-300dpi/appendices/appendix_2a.png", width = (1024*2), height = (768*2), units = 'px', res = 300)
ggplot(subset(ARG.vor, sub_region_1 != "Buenos Aires"),
       aes(x = as.Date(date), y = workplaces_percent_change_from_baseline, col = Poverty)) +
  geom_smooth(aes(linetype = Poverty, fill = Poverty)) +
  theme_minimal(base_size = 12) + theme(legend.position = "bottom") +
  theme(panel.grid.minor = element_blank()) +
  theme(axis.text.x = element_text(angle = 35, hjust = 1, color = "black",  size = 9)) +
  labs(x = "Date", y = "Workplaces", title = NULL, subtitle = NULL) +
  theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")) +
  scale_x_date(date_breaks = "1 week", date_minor_breaks = "1 week", date_labels = "%Y-%m-%d") +
  scale_y_continuous(limits = c(-100, 20), breaks = c(-100, -80, -60, -40, -20, 0, 20)) +
  scale_colour_manual(values=c("#1f78b4","gray30")) +
  scale_fill_manual(values=c("#1f78b4","gray30")) +
  scale_linetype_manual(values=c(2,3)) +
  geom_vline(xintercept = as.Date(arg_resp$dates[which(arg_resp$c1_schoolclosing == 3
                                                       & arg_resp$c1_flag == 1, arr.ind = TRUE)[1]]), col = "tomato2", lty = 2) +
  geom_vline(xintercept = as.Date(arg_resp$dates[which(arg_resp$c6_stayathomerequirements == 3
                                                       & arg_resp$c6_flag == 1, arr.ind = TRUE)[1]]), col = "tomato2", lty = 2)
## dev.off()

## Plot Chile
## pdf("plots-300dpi/figure_2b.pdf", width = 6.826666666666667, height = 5.12)
## png("plots-300dpi/figure_2b.png", width = (1024*2), height = (768*2), units = 'px', res = 300)
ggplot(CHL, aes(x = as.Date(date), y = workplaces_percent_change_from_baseline,
                    col = Poverty)) + geom_smooth(aes(linetype = Poverty, fill = Poverty)) +
  theme_minimal(base_size = 12) + theme(legend.position = "bottom") +
  theme(panel.grid.minor = element_blank()) +
  theme(axis.text.x = element_text(angle = 35, hjust = 1, color = "black",  size = 9)) +
  labs(x = "Date", y = "Workplaces", title = NULL, subtitle = NULL) +
  theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")) +
  scale_x_date(date_breaks = "1 week", date_minor_breaks = "1 week", date_labels = "%Y-%m-%d") +
  scale_y_continuous(limits = c(-100, 20), breaks = c(-100, -80, -60, -40, -20, 0, 20)) +
  scale_colour_manual(values=c("#e31a1c","gray30")) +
  scale_fill_manual(values=c("#e31a1c","gray30")) +
  scale_linetype_manual(values=c(2,3)) +
  geom_vline(xintercept = as.Date(arg_resp$dates[which(chl_resp$c1_schoolclosing == 3
                                                       & chl_resp$c1_flag == 1, arr.ind = TRUE)[1]]), col = "tomato2", lty = 2) +
  geom_vline(xintercept = as.Date(arg_resp$dates[which(chl_resp$c2_workplaceclosing == 3
                                                       & chl_resp$c2_flag == 1, arr.ind = TRUE)[1]]), col = "tomato2", lty = 2)
## dev.off()

## Plot Chile
## pdf("plots-300dpi/appendices/appendix_2b.pdf", width = 6.826666666666667, height = 5.12)
## png("plots-300dpi/appendices/appendix_2b.png", width = (1024*2), height = (768*2), units = 'px', res = 300)
ggplot(subset(CHL, sub_region_1 != "Santiago Metropolitan Region"),
       aes(x = as.Date(date), y = workplaces_percent_change_from_baseline, col = Poverty)) +
  geom_smooth(aes(linetype = Poverty, fill = Poverty)) +
  theme_minimal(base_size = 12) + theme(legend.position = "bottom") +
  theme(panel.grid.minor = element_blank()) +
  theme(axis.text.x = element_text(angle = 35, hjust = 1, color = "black",  size = 9)) +
  labs(x = "Date", y = "Workplaces", title = NULL, subtitle = NULL) +
  theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")) +
  scale_x_date(date_breaks = "1 week", date_minor_breaks = "1 week", date_labels = "%Y-%m-%d") +
  scale_y_continuous(limits = c(-100, 20), breaks = c(-100, -80, -60, -40, -20, 0, 20)) +
  scale_colour_manual(values=c("#e31a1c","gray30")) +
  scale_fill_manual(values=c("#e31a1c","gray30")) +
  scale_linetype_manual(values=c(2,3)) +
  geom_vline(xintercept = as.Date(arg_resp$dates[which(chl_resp$c1_schoolclosing == 3
                                                       & chl_resp$c1_flag == 1, arr.ind = TRUE)[1]]), col = "tomato2", lty = 2) +
  geom_vline(xintercept = as.Date(arg_resp$dates[which(chl_resp$c2_workplaceclosing == 3
                                                       & chl_resp$c2_flag == 1, arr.ind = TRUE)[1]]), col = "tomato2", lty = 2)
## dev.off()

## Plot Colombia
## pdf("plots-300dpi/figure_2c.pdf", width = 6.826666666666667, height = 5.12)
## png("plots-300dpi/figure_2c.png", width = (1024*2), height = (768*2), units = 'px', res = 300)
ggplot(COL.vor, aes(x = as.Date(date), y = workplaces_percent_change_from_baseline,
                col = Poverty)) + geom_smooth(aes(linetype = Poverty, fill = Poverty)) +
  theme_minimal(base_size = 12) + theme(legend.position = "bottom") +
  theme(panel.grid.minor = element_blank()) +
  theme(axis.text.x = element_text(angle = 35, hjust = 1, color = "black",  size = 9)) +
  labs(x = "Date", y = "Workplaces", title = NULL, subtitle = NULL) +
  theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")) +
  scale_x_date(date_breaks = "1 week", date_minor_breaks = "1 week", date_labels = "%Y-%m-%d") +
  scale_y_continuous(limits = c(-100, 20), breaks = c(-100, -80, -60, -40, -20, 0, 20)) +
  scale_colour_manual(values=c("#ff7f00","gray30")) +
  scale_fill_manual(values=c("#ff7f00","gray30")) +
  scale_linetype_manual(values=c(2,3)) +
  geom_vline(xintercept = as.Date(arg_resp$dates[which(col_resp$c1_schoolclosing == 3
                                                       & col_resp$c1_flag == 1, arr.ind = TRUE)[1]]), col = "tomato2", lty = 2) +
  geom_vline(xintercept = as.Date(arg_resp$dates[which(col_resp$c2_workplaceclosing == 3
                                                       & col_resp$c2_flag == 1, arr.ind = TRUE)[1]]), col = "tomato2", lty = 2)
## dev.off()

## Plot Colombia
## pdf("plots-300dpi/appendices/appendix_2c.pdf", width = 6.826666666666667, height = 5.12)
## png("plots-300dpi/appendices/appendix_2c.png", width = (1024*2), height = (768*2), units = 'px', res = 300)
ggplot(subset(COL.vor, sub_region_1 != "Bogota"),
       aes(x = as.Date(date), y = workplaces_percent_change_from_baseline, col = Poverty)) +
  geom_smooth(aes(linetype = Poverty, fill = Poverty)) +
  theme_minimal(base_size = 12) + theme(legend.position = "bottom") +
  theme(panel.grid.minor = element_blank()) +
  theme(axis.text.x = element_text(angle = 35, hjust = 1, color = "black",  size = 9)) +
  labs(x = "Date", y = "Workplaces", title = NULL, subtitle = NULL) +
  theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")) +
  scale_x_date(date_breaks = "1 week", date_minor_breaks = "1 week", date_labels = "%Y-%m-%d") +
  scale_y_continuous(limits = c(-100, 20), breaks = c(-100, -80, -60, -40, -20, 0, 20)) +
  scale_colour_manual(values=c("#ff7f00","gray30")) +
  scale_fill_manual(values=c("#ff7f00","gray30")) +
  scale_linetype_manual(values=c(2,3)) +
  geom_vline(xintercept = as.Date(arg_resp$dates[which(col_resp$c1_schoolclosing == 3
                                                       & col_resp$c1_flag == 1, arr.ind = TRUE)[1]]), col = "tomato2", lty = 2) +
  geom_vline(xintercept = as.Date(arg_resp$dates[which(col_resp$c2_workplaceclosing == 3
                                                       & col_resp$c2_flag == 1, arr.ind = TRUE)[1]]), col = "tomato2", lty = 2)
## dev.off()

## Plot Peru
## pdf("plots-300dpi/figure_2d.pdf", width = 6.826666666666667, height = 5.12)
## png("plots-300dpi/figure_2d.png", width = (1024*2), height = (768*2), units = 'px', res = 300)
ggplot(PER, aes(x = as.Date(date), y = workplaces_percent_change_from_baseline,
                    col = Poverty)) + geom_smooth(aes(linetype = Poverty, fill = Poverty)) +
  theme_minimal(base_size = 12) + theme(legend.position = "bottom") +
  theme(panel.grid.minor = element_blank()) +
  theme(axis.text.x = element_text(angle = 35, hjust = 1, color = "black",  size = 9)) +
  labs(x = "Date", y = "Workplaces", title = NULL, subtitle = NULL) +
  theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")) +
  scale_x_date(date_breaks = "1 weeks", date_minor_breaks = "1 week", date_labels = "%Y-%m-%d") +
  scale_y_continuous(limits = c(-100, 20), breaks = c(-100, -80, -60, -40, -20, 0, 20)) +
  scale_colour_manual(values=c("#33a02c","gray30")) +
  scale_fill_manual(values=c("#33a02c","gray30")) +
  scale_linetype_manual(values=c(2,3)) +
  geom_vline(xintercept = as.Date(arg_resp$dates[which(per_resp$c1_schoolclosing == 3
                                                       & per_resp$c1_flag == 1, arr.ind = TRUE)[1]]), col = "tomato2", lty = 2) +
  geom_vline(xintercept = as.Date(arg_resp$dates[which(per_resp$c2_workplaceclosing == 3
                                                       & per_resp$c2_flag == 1, arr.ind = TRUE)[1]]), col = "tomato2", lty = 2) +
  geom_vline(xintercept = as.Date(arg_resp$dates[which(per_resp$c6_stayathomerequirements == 3
                                                       & per_resp$c6_flag == 1, arr.ind = TRUE)[1]]), col = "tomato2", lty = 2)
## dev.off()

## Plot Peru
## pdf("plots-300dpi/appendices/appendix_2d.pdf", width = 6.826666666666667, height = 5.12)
## png("plots-300dpi/appendices/appendix_2d.png", width = (1024*2), height = (768*2), units = 'px', res = 300)
ggplot(subset(PER, sub_region_1 != "Metropolitan Municipality of Lima"),
       aes(x = as.Date(date), y = workplaces_percent_change_from_baseline, col = Poverty)) +
  geom_smooth(aes(linetype = Poverty, fill = Poverty)) +
  theme_minimal(base_size = 12) + theme(legend.position = "bottom") +
  theme(panel.grid.minor = element_blank()) +
  theme(axis.text.x = element_text(angle = 35, hjust = 1, color = "black",  size = 9)) +
  labs(x = "Date", y = "Workplaces", title = NULL, subtitle = NULL) +
  theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")) +
  scale_x_date(date_breaks = "1 weeks", date_minor_breaks = "1 week", date_labels = "%Y-%m-%d") +
  scale_y_continuous(limits = c(-100, 20), breaks = c(-100, -80, -60, -40, -20, 0, 20)) +
  scale_colour_manual(values=c("#33a02c","gray30")) +
  scale_fill_manual(values=c("#33a02c","gray30")) +
  scale_linetype_manual(values=c(2,3)) +
  geom_vline(xintercept = as.Date(arg_resp$dates[which(per_resp$c1_schoolclosing == 3
                                                       & per_resp$c1_flag == 1, arr.ind = TRUE)[1]]), col = "tomato2", lty = 2) +
  geom_vline(xintercept = as.Date(arg_resp$dates[which(per_resp$c2_workplaceclosing == 3
                                                       & per_resp$c2_flag == 1, arr.ind = TRUE)[1]]), col = "tomato2", lty = 2) +
  geom_vline(xintercept = as.Date(arg_resp$dates[which(per_resp$c6_stayathomerequirements == 3
                                                       & per_resp$c6_flag == 1, arr.ind = TRUE)[1]]), col = "tomato2", lty = 2)
## dev.off()

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### JHU-CSSE COVID-19 Dataset ####
## Code based on **source omitted because of peer-reviewing**

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## JHU-CSSE COVID-19 Confirmed Dataset
JHU_cases <- read.csv("https://osf.io/cpfra/download", sep = ",")

## JHU-CSSE COVID-19 Deaths Dataset
JHU_deaths <- read.csv("https://osf.io/h6yex/download", sep = ",")

## Period Coverage
dd_JHU <- as.numeric((as.Date("2020-05-19")) - as.Date("2020-01-22"))
begin_JHU <- ((as.Date("2020-05-19"))-dd_JHU) ## 22 January
dates_JHU <- seq(as.Date(begin_JHU), as.Date("2020-05-19"), by="days")

## Argentina
cases_arg <- slice(JHU_cases, which(JHU_cases[,2] == "Argentina")
                   :which(JHU_cases[,2] == "Argentina")) %>%
  pivot_longer(-c(Province.State, Country.Region, Lat, Long),
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases)))
cases_arg <- data.frame(cases_arg, dates_JHU)
cases_arg$Province.State <- NULL
## cases_arg$Country.Region <- NULL
cases_arg$Lat <- NULL
cases_arg$Long <- NULL
cases_arg$Date <- NULL
cases_arg$lagged_date <- dates_JHU+1
cases_arg$incident_cases <- NULL
cases_arg$dates_JHU <- NULL

## Chile
cases_chl <- slice(JHU_cases, which(JHU_cases[,2] == "Chile")
                   :which(JHU_cases[,2] == "Chile")) %>%
  pivot_longer(-c(Province.State, Country.Region, Lat, Long),
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases)))
cases_chl <- data.frame(cases_chl, dates_JHU)
cases_chl$Province.State <- NULL
## cases_chl$Country.Region <- NULL
cases_chl$Lat <- NULL
cases_chl$Long <- NULL
cases_chl$Date <- NULL
cases_chl$lagged_date <- dates_JHU+1
cases_chl$incident_cases <- NULL
cases_chl$dates_JHU <- NULL

## Colombia
cases_col <- slice(JHU_cases, which(JHU_cases[,2] == "Colombia")
                   :which(JHU_cases[,2] == "Colombia")) %>%
  pivot_longer(-c(Province.State, Country.Region, Lat, Long),
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases)))
cases_col <- data.frame(cases_col, dates_JHU)
cases_col$Province.State <- NULL
## cases_col$Country.Region <- NULL
cases_col$Lat <- NULL
cases_col$Long <- NULL
cases_col$Date <- NULL
cases_col$lagged_date <- dates_JHU+1
cases_col$incident_cases <- NULL
cases_col$dates_JHU <- NULL

## Peru
cases_per <- slice(JHU_cases, which(JHU_cases[,2] == "Peru")
                   :which(JHU_cases[,2] == "Peru")) %>%
  pivot_longer(-c(Province.State, Country.Region, Lat, Long),
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases)))
cases_per <- data.frame(cases_per, dates_JHU)
cases_per$Province.State <- NULL
## cases_per$Country.Region <- NULL
cases_per$Lat <- NULL
cases_per$Long <- NULL
cases_per$Date <- NULL
cases_per$lagged_date <- dates_JHU+1
cases_per$incident_cases <- NULL
cases_per$dates_JHU <- NULL

## Argentina
deaths_arg <- slice(JHU_deaths, which(JHU_deaths[,2] == "Argentina")
                    :which(JHU_deaths[,2] == "Argentina")) %>%
  pivot_longer(-c(Province.State, Country.Region, Lat, Long),
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases)))
deaths_arg <- data.frame(deaths_arg, dates_JHU)
deaths_arg$Province.State <- NULL
## deaths_arg$Country.Region <- NULL
deaths_arg$Lat <- NULL
deaths_arg$Long <- NULL
deaths_arg$Date <- NULL
deaths_arg$lagged_date <- dates_JHU+1
deaths_arg$incident_cases <- NULL
deaths_arg$dates_JHU <- NULL

## Chile
deaths_chl <- slice(JHU_deaths, which(JHU_deaths[,2] == "Chile")
                    :which(JHU_deaths[,2] == "Chile")) %>%
  pivot_longer(-c(Province.State, Country.Region, Lat, Long),
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases)))
deaths_chl <- data.frame(deaths_chl, dates_JHU)
deaths_chl$Province.State <- NULL
## deaths_chl$Country.Region <- NULL
deaths_chl$Lat <- NULL
deaths_chl$Long <- NULL
deaths_chl$Date <- NULL
deaths_chl$lagged_date <- dates_JHU+1
deaths_chl$incident_cases <- NULL
deaths_chl$dates_JHU <- NULL

## Colombia
deaths_col <- slice(JHU_deaths, which(JHU_deaths[,2] == "Colombia")
                    :which(JHU_deaths[,2] == "Colombia")) %>%
  pivot_longer(-c(Province.State, Country.Region, Lat, Long),
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases)))
deaths_col <- data.frame(deaths_col, dates_JHU)
deaths_col$Province.State <- NULL
## deaths_col$Country.Region <- NULL
deaths_col$Lat <- NULL
deaths_col$Long <- NULL
deaths_col$Date <- NULL
deaths_col$lagged_date <- dates_JHU+1
deaths_col$incident_cases <- NULL
deaths_col$dates_JHU <- NULL

## Peru
deaths_per <- slice(JHU_deaths, which(JHU_deaths[,2] == "Peru")
                    :which(JHU_deaths[,2] == "Peru")) %>%
  pivot_longer(-c(Province.State, Country.Region, Lat, Long),
               names_to = "Date", values_to = "cumulative_cases") %>%
  mutate(incident_cases = c(0, diff(cumulative_cases)))
deaths_per <- data.frame(deaths_per, dates_JHU)
deaths_per$Province.State <- NULL
## deaths_per$Country.Region <- NULL
deaths_per$Lat <- NULL
deaths_per$Long <- NULL
deaths_per$Date <- NULL
deaths_per$lagged_date <- dates_JHU+1
deaths_per$incident_cases <- NULL
deaths_per$dates_JHU <- NULL

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Diff-in-Diff NPIs ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Economic Measures
ecc_ARG <- as.Date(arg_resp$dates[which(arg_resp$e1_incomesupport == 1 & arg_resp$e1_flag == 1, arr.ind = TRUE)])[1]
ecc_CHL <- as.Date(chl_resp$dates[which(chl_resp$e1_incomesupport == 1 & chl_resp$e1_flag == 1, arr.ind = TRUE)])[1]
ecc_COL <- as.Date(col_resp$dates[which(col_resp$e1_incomesupport == 1 & col_resp$e1_flag == 1, arr.ind = TRUE)])[1]
ecc_PER <- as.Date(per_resp$dates[which(per_resp$e1_incomesupport == 1 & per_resp$e1_flag == 1, arr.ind = TRUE)])[1]
debt_ARG <- as.Date(arg_resp$dates[which(arg_resp$e2_debtrelief == 2, arr.ind = TRUE)])[1]
## as.Date(chl_resp$dates[which(chl_resp$e2_debtrelief == 2, arr.ind = TRUE)])[1]
debt_COL <-as.Date(col_resp$dates[which(col_resp$e2_debtrelief == 2, arr.ind = TRUE)])[1]
debt_PER <- as.Date(per_resp$dates[which(per_resp$e2_debtrelief == 2, arr.ind = TRUE)])[1]

## Cross National Data Frame
cross.national <- bind_rows(ARG.vor, CHL, COL.vor, PER) ## Comment
names(cross.national)[2] = "Country" ## Comment
cross.national_cases <- bind_rows(cases_arg, cases_chl, cases_col, cases_per)
cross.national_deaths <- bind_rows(deaths_arg, deaths_chl, deaths_col, deaths_per)
names(cross.national_deaths)[2] = "cumulative_deaths"
cross.national$date <- as.Date(cross.national$date)
cross.national <- left_join(cross.national, cross.national_cases,
                            by = c("Country" = "Country.Region", "date" = "lagged_date"))
cross.national <- left_join(cross.national, cross.national_deaths,
                            by = c("Country" = "Country.Region", "date" = "lagged_date"))
cross.national$income <- ifelse((cross.national$date > ecc_ARG) & cross.national$Country == "Argentina", 1,
                                ifelse((cross.national$date > ecc_CHL) & cross.national$Country == "Chile", 1,
                                       ifelse((cross.national$date > ecc_COL) & cross.national$Country == "Colombia", 1,
                                              ifelse((cross.national$date > ecc_PER) & cross.national$Country == "Peru", 1, 0))))
cross.national$debt <- ifelse((cross.national$date > debt_ARG) & cross.national$Country == "Argentina", 1,
                              ifelse((cross.national$date > debt_COL) & cross.national$Country == "Colombia", 1,
                                     ifelse((cross.national$date > debt_PER) & cross.national$Country == "Peru", 1, 0)))
cs.baseline <- cross.national
cs.lockdown <- cross.national

## Codification Post Period
cs.baseline$post <- ifelse(cs.baseline$date > as.Date("2020-03-11"), 1, 0)
cs.lockdown$post <- ifelse((cs.lockdown$date > lock_ARG) & cs.lockdown$Country == "Argentina", 1,
                           ifelse((cs.lockdown$date > lock_PER) & cs.lockdown$Country == "Peru", 1, 0))
cross.national$post <- ifelse((cross.national$date > first_ARG) & cross.national$Country == "Argentina", 1,
                               ifelse((cross.national$date > first_CHL) & cross.national$Country == "Chile", 1,
                                      ifelse((cross.national$date > first_COL) & cross.national$Country == "Colombia", 1,
                                             ifelse((cross.national$date > first_PER) & cross.national$Country == "Peru", 1, 0))))


## Diff-in-Diff WHO Announcement
diff_1 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + I(Country), data = cs.baseline, cluster = date)
fit_1 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + I(Country), data = cs.baseline)
vif_1 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + I(Country), data = cs.baseline))

## Diff-in-Diff Lockdown
diff_2 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + I(Country),
                    data = subset(cross.national, Country == "Argentina" | Country == "Peru"), cluster = date)
fit_2 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + I(Country),
            data = subset(cross.national, Country == "Argentina" | Country == "Peru"))
vif_2 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + I(Country),
                data = subset(cross.national, Country == "Argentina" | Country == "Peru")))

## Diff-in-Diff First Interventions
diff_3 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + I(Country), data = cross.national, cluster = date)
fit_3 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + I(Country), data = cross.national)
vif_3 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + I(Country), data = cross.national))

## Diff-in-Diff Controlling for Cumulative Cases
diff_4 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + I(Country),
                    data = cross.national, cluster = date)
fit_4 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + I(Country), data = cross.national)
vif_4 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + I(Country), data = cross.national))

## Diff-in-Diff Controlling for Cumulative Deaths
diff_5 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
                    + I(Country), data = cross.national, cluster = date)
fit_5 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
            + I(Country), data = cross.national)
vif_5 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases  + cumulative_deaths
                + I(Country), data = cross.national))

## Diff-in-Diff Argentina
diff_6 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths,
                    data = subset(cross.national, Country == "Argentina"), cluster = date)
fit_6 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths,
            data = subset(cross.national, Country == "Argentina"))
vif_6 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths,
             data = subset(cross.national, Country == "Argentina")))

## Diff-in-Diff Chile
diff_7 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths,
                    data = subset(cross.national, Country == "Chile"), cluster = date)
fit_7 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths,
            data = subset(cross.national, Country == "Chile"))
vif_7 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths,
                data = subset(cross.national, Country == "Chile")))

## Diff-in-Diff Colombia
diff_8 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths,
                    data = subset(cross.national, Country == "Colombia"), cluster = date)
fit_8 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths,
            data = subset(cross.national, Country == "Colombia"))
vif_8 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths,
                data = subset(cross.national, Country == "Colombia")))

## Diff-in-Diff Peru
diff_9 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths,
                    data = subset(cross.national, Country == "Peru"), cluster = date)
fit_9 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths,
            data = subset(cross.national, Country == "Peru"))
vif_9 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths,
                data = subset(cross.national, Country == "Peru")))

## Models Table
stargazer(fit_1, fit_2, fit_3, fit_4, fit_5, fit_6, fit_7, fit_8, fit_9,
          se = starprep(diff_1, diff_2, diff_3, diff_4, diff_5, diff_6, diff_7, diff_8, diff_9),
          type = "html", header = FALSE, style = "ajps", out = "tables/table_0.html",
          title = "Effect of Poverty on Workplaces Mobility", dep.var.labels = "Mobility Change from Baseline",
          notes.align = "c", model.numbers = TRUE, omit.stat = c("f", "ser"),
          omit = c("Country", "cumulative_cases", "cumulative_deaths"),
          add.lines = list(c("Post-t", "WHO", "Lockdown", "NPIs", "NPIs", "NPIs", "NPIs", "NPIs", "NPIs", "NPIs"),
                           c("Lagged cases", "No", "No", "No", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes"),
                           c("Lagged deaths", "No", "No", "No", "No", "Yes", "Yes", "Yes", "Yes", "Yes"),
                           c("Day FE", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes"),
                           c("Country FE", "Yes", "Yes", "Yes", "Yes", "Yes", "No", "No", "No", "No"),
                           c("VIF", format(round(vif_1, digits = 3), nsmall = 3), format(round(vif_2, digits = 3), nsmall = 3),
                             format(round(vif_3, digits = 3), nsmall = 3), format(round(vif_4, digits = 3), nsmall = 3),
                             format(round(vif_5, digits = 3), nsmall = 3), format(round(vif_6, digits = 3), nsmall = 3),
                             format(round(vif_7, digits = 3), nsmall = 3), format(round(vif_8, digits = 3), nsmall = 3),
                             format(round(vif_9, digits = 3), nsmall = 3))),
          covariate.labels = c("Poverty", "Post", "Poverty x Post"),
          column.labels = c("All", "ARG-PER", "All", "All", "All", "ARG", "CHL", "COL", "PER"))

## Models Table
stargazer(fit_1, fit_3, fit_4, fit_5, fit_6, fit_7, fit_8, fit_9,
          se = starprep(diff_1, diff_3, diff_4, diff_5, diff_6, diff_7, diff_8, diff_9),
          type = "html", header = FALSE, style = "ajps", out = "tables/table_1.html",
          title = "Effect of Poverty on Workplaces Mobility", dep.var.labels = "Mobility Change from Baseline",
          notes.align = "c", model.numbers = TRUE, omit.stat = c("f", "ser"),
          omit = c("Country", "cumulative_cases", "cumulative_deaths"),
          add.lines = list(c("Post-t", "WHO", "NPIs", "NPIs", "NPIs", "NPIs", "NPIs", "NPIs", "NPIs"),
                           c("Lagged cases", "No", "No", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes"),
                           c("Lagged deaths", "No", "No", "No", "Yes", "Yes", "Yes", "Yes", "Yes"),
                           c("Day FE", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes"),
                           c("Region FE", "No", "No", "No", "No", "No", "No", "No", "No"),
                           c("Country FE", "Yes", "Yes", "Yes", "Yes", "No", "No", "No", "No"),
                           c("VIF", format(round(vif_1, digits = 3), nsmall = 3),
                                    format(round(vif_3, digits = 3), nsmall = 3), format(round(vif_4, digits = 3), nsmall = 3),
                                    format(round(vif_5, digits = 3), nsmall = 3), format(round(vif_6, digits = 3), nsmall = 3),
                                    format(round(vif_7, digits = 3), nsmall = 3), format(round(vif_8, digits = 3), nsmall = 3),
                                    format(round(vif_9, digits = 3), nsmall = 3)),
                           c("Exclusion", "No", "No", "No", "No", "No", "No", "No", "No")),
          covariate.labels = c("Poverty", "Post", "Poverty x Post"),
          column.labels = c("All", "All", "All", "All", "Argentina", "Chile", "Colombia", "Peru"))

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### RC FE by Region ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Diff-in-Diff WHO Announcement
diff_10 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + I(sub_region_1),
                     data = cs.baseline, cluster = date)
fit_10 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + I(sub_region_1), data = cs.baseline)
vif_10 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + I(sub_region_1), data = cs.baseline))

## Diff-in-Diff First Interventions
diff_11 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + I(sub_region_1),
                     data = cross.national, cluster = date)
fit_11 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + I(sub_region_1), data = cross.national)
vif_11 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + I(sub_region_1), data = cross.national))

## Diff-in-Diff Controlling for Cumulative Cases
diff_12 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + I(Country) + I(sub_region_1),
                     data = cross.national, cluster = date)
fit_12 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + I(Country) + I(sub_region_1),
             data = cross.national)
vif_12 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + I(Country) + I(sub_region_1),
                 data = cross.national))

## Diff-in-Diff Controlling for Cumulative Deaths
diff_13 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
                     + I(Country) + I(sub_region_1), data = cross.national, cluster = date)
fit_13 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
             + I(Country) + I(sub_region_1), data = cross.national)
vif_13 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases  + cumulative_deaths
                 + I(Country) + I(sub_region_1), data = cross.national))

## Diff-in-Diff Argentina
diff_14 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
                     + I(sub_region_1), data = subset(cross.national, Country == "Argentina"), cluster = date)
fit_14 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths + I(sub_region_1),
             data = subset(cross.national, Country == "Argentina"))
vif_14 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
                 + I(sub_region_1), data = subset(cross.national, Country == "Argentina")))

## Diff-in-Diff Chile
diff_15 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
                     + I(sub_region_1), data = subset(cross.national, Country == "Chile"), cluster = date)
fit_15 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths + I(sub_region_1),
             data = subset(cross.national, Country == "Chile"))
vif_15 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
                 + I(sub_region_1), data = subset(cross.national, Country == "Chile")))

## Diff-in-Diff Colombia
diff_16 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
                     + I(sub_region_1), data = subset(cross.national, Country == "Colombia"), cluster = date)
fit_16 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths + I(sub_region_1),
             data = subset(cross.national, Country == "Colombia"))
vif_16 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
                 + I(sub_region_1), data = subset(cross.national, Country == "Colombia")))

## Diff-in-Diff Peru
diff_17 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
                     + I(sub_region_1), data = subset(cross.national, Country == "Peru"), cluster = date)
fit_17 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths + I(sub_region_1),
             data = subset(cross.national, Country == "Peru"))
vif_17 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
                 + I(sub_region_1), data = subset(cross.national, Country == "Peru")))

## Models Table
stargazer(fit_10, fit_11, fit_12, fit_13, fit_14, fit_15, fit_16, fit_17,
          se = starprep(diff_10, diff_11, diff_12, diff_13, diff_14, diff_15, diff_16, diff_17),
          type = "html", header = FALSE, style = "ajps", out = "tables/table_2.html",
          title = "Effect of Poverty on Workplaces Mobility", dep.var.labels = "Mobility Change from Baseline",
          notes.align = "c", model.numbers = TRUE, omit.stat = c("f", "ser"),
          omit = c("Country", "sub_region_1", "cumulative_cases", "cumulative_deaths"),
          add.lines = list(c("Post-t", "WHO", "NPIs", "NPIs", "NPIs", "NPIs", "NPIs", "NPIs", "NPIs"),
                           c("Lagged cases", "No", "No", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes"),
                           c("Lagged deaths", "No", "No", "No", "Yes", "Yes", "Yes", "Yes", "Yes"),
                           c("Day FE", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes"),
                           c("Region FE", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes"),
                           c("Country FE", "No", "No", "Yes", "Yes", "No", "No", "No", "No"),
                           c("VIF", format(round(vif_10, digits = 3), nsmall = 3),
                             format(round(vif_11, digits = 3), nsmall = 3), format(round(vif_12, digits = 3), nsmall = 3),
                             format(round(vif_13, digits = 3), nsmall = 3), format(round(vif_14, digits = 3), nsmall = 3),
                             format(round(vif_15, digits = 3), nsmall = 3), format(round(vif_16, digits = 3), nsmall = 3),
                             format(round(vif_17, digits = 3), nsmall = 3)),
                           c("Exclusion", "No", "No", "No", "No", "No", "No", "No", "No")),
          covariate.labels = c("Poverty", "Post", "Poverty x Post"),
          column.labels = c("All", "All", "All", "All", "Argentina", "Chile", "Colombia", "Peru"))

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### RC FE by Region (excluding capitals) ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Diff-in-Diff WHO Announcement
diff_18 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + I(sub_region_1),
                     data = subset(cs.baseline, sub_region_1 != "Buenos Aires" & sub_region_1 != "Santiago Metropolitan Region"
                                   & sub_region_1 != "Bogota" & sub_region_1 != "Metropolitan Municipality of Lima"), cluster = date)
fit_18 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + I(sub_region_1),
             data = subset(cs.baseline), sub_region_1 != "Buenos Aires" & sub_region_1 != "Santiago Metropolitan Region"
             & sub_region_1 != "Bogota" & sub_region_1 != "Metropolitan Municipality of Lima")
vif_18 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + I(sub_region_1),
                 data = subset(cs.baseline, sub_region_1 != "Buenos Aires" & sub_region_1 != "Santiago Metropolitan Region"
                         & sub_region_1 != "Bogota" & sub_region_1 != "Metropolitan Municipality of Lima")))

## Diff-in-Diff First Interventions
diff_19 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + I(sub_region_1),
                     data = subset(cross.national, sub_region_1 != "Buenos Aires" & sub_region_1 != "Santiago Metropolitan Region"
                                   & sub_region_1 != "Bogota" & sub_region_1 != "Metropolitan Municipality of Lima"), cluster = date)
fit_19 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + I(sub_region_1),
             data = subset(cross.national, sub_region_1 != "Buenos Aires" & sub_region_1 != "Santiago Metropolitan Region"
                           & sub_region_1 != "Bogota" & sub_region_1 != "Metropolitan Municipality of Lima"))
vif_19 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + I(sub_region_1),
                 data = subset(cross.national, sub_region_1 != "Buenos Aires" & sub_region_1 != "Santiago Metropolitan Region"
                               & sub_region_1 != "Bogota" & sub_region_1 != "Metropolitan Municipality of Lima")))

## Diff-in-Diff Controlling for Cumulative Cases
diff_20 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + I(Country) + I(sub_region_1),
                     data = subset(cross.national, sub_region_1 != "Buenos Aires" & sub_region_1 != "Santiago Metropolitan Region"
                                   & sub_region_1 != "Bogota" & sub_region_1 != "Metropolitan Municipality of Lima"), cluster = date)
fit_20 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + I(Country) + I(sub_region_1),
             data = subset(cross.national, sub_region_1 != "Buenos Aires" & sub_region_1 != "Santiago Metropolitan Region"
                           & sub_region_1 != "Bogota" & sub_region_1 != "Metropolitan Municipality of Lima"))
vif_20 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + I(Country) + I(sub_region_1),
                 data = subset(cross.national, sub_region_1 != "Buenos Aires" & sub_region_1 != "Santiago Metropolitan Region"
                               & sub_region_1 != "Bogota" & sub_region_1 != "Metropolitan Municipality of Lima")))

## Diff-in-Diff Controlling for Cumulative Deaths
diff_21 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
                     + I(Country) + I(sub_region_1),
                     data = subset(cross.national, sub_region_1 != "Buenos Aires" & sub_region_1 != "Santiago Metropolitan Region"
                                   & sub_region_1 != "Bogota" & sub_region_1 != "Metropolitan Municipality of Lima"), cluster = date)
fit_21 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
             + I(Country) + I(sub_region_1),
             data = subset(cross.national, sub_region_1 != "Buenos Aires" & sub_region_1 != "Santiago Metropolitan Region"
                           & sub_region_1 != "Bogota" & sub_region_1 != "Metropolitan Municipality of Lima"))
vif_21 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases  + cumulative_deaths
                 + I(Country) + I(sub_region_1),
                 data = subset(cross.national, sub_region_1 != "Buenos Aires" & sub_region_1 != "Santiago Metropolitan Region"
                         & sub_region_1 != "Bogota" & sub_region_1 != "Metropolitan Municipality of Lima")))

## Diff-in-Diff Argentina
diff_22 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
                     + I(sub_region_1), data = subset(cross.national, Country == "Argentina" & sub_region_1 != "Buenos Aires"),
                     cluster = date)
fit_22 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths + I(sub_region_1),
             data = subset(cross.national, Country == "Argentina" & sub_region_1 != "Buenos Aires"))
vif_22 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
                 + I(sub_region_1), data = subset(cross.national, Country == "Argentina" & sub_region_1 != "Buenos Aires")))

## Diff-in-Diff Chile
diff_23 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
                     + I(sub_region_1), data = subset(cross.national, Country == "Chile" & sub_region_1 != "Santiago Metropolitan Region"),
                     cluster = date)
fit_23 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths + I(sub_region_1),
             data = subset(cross.national, Country == "Chile" & sub_region_1 != "Santiago Metropolitan Region"))
vif_23 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
                 + I(sub_region_1), data = subset(cross.national, Country == "Chile" & sub_region_1 != "Santiago Metropolitan Region")))

## Diff-in-Diff Colombia
diff_24 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
                     + I(sub_region_1), data = subset(cross.national, Country == "Colombia" & sub_region_1 != "Bogota"),
                     cluster = date)
fit_24 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths+ I(sub_region_1),
             data = subset(cross.national, Country == "Colombia" & sub_region_1 != "Bogota"))
vif_24 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
                 + I(sub_region_1), data = subset(cross.national, Country == "Colombia" & sub_region_1 != "Bogota")))

## Diff-in-Diff Peru
diff_25 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
                     + I(sub_region_1), data = subset(cross.national, Country == "Peru" & sub_region_1 != "Metropolitan Municipality of Lima"),
                     cluster = date)
fit_25 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths + I(sub_region_1),
             data = subset(cross.national, Country == "Peru" & sub_region_1 != "Metropolitan Municipality of Lima"))
vif_25 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
                 + I(sub_region_1), data = subset(cross.national, Country == "Peru" & sub_region_1 != "Metropolitan Municipality of Lima")))

## Models Table
stargazer(fit_18, fit_19, fit_20, fit_21, fit_22, fit_23, fit_24, fit_25,
          se = starprep(diff_18, diff_19, diff_20, diff_21, diff_22, diff_23, diff_24, diff_25),
          type = "html", header = FALSE, style = "ajps", out = "tables/table_3.html",
          title = "Effect of Poverty on Workplaces Mobility", dep.var.labels = "Mobility Change from Baseline",
          notes.align = "c", model.numbers = TRUE, omit.stat = c("f", "ser"),
          omit = c("Country", "sub_region_1", "cumulative_cases", "cumulative_deaths"),
          add.lines = list(c("Post-t", "WHO", "NPIs", "NPIs", "NPIs", "NPIs", "NPIs", "NPIs", "NPIs"),
                           c("Lagged cases", "No", "No", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes"),
                           c("Lagged deaths", "No", "No", "No", "Yes", "Yes", "Yes", "Yes", "Yes"),
                           c("Day FE", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes"),
                           c("Region FE", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes"),
                           c("Country FE", "No", "No", "Yes", "Yes", "No", "No", "No", "No"),
                           c("VIF", format(round(vif_18, digits = 3), nsmall = 3),
                             format(round(vif_19, digits = 3), nsmall = 3), format(round(vif_20, digits = 3), nsmall = 3),
                             format(round(vif_21, digits = 3), nsmall = 3), format(round(vif_22, digits = 3), nsmall = 3),
                             format(round(vif_23, digits = 3), nsmall = 3), format(round(vif_24, digits = 3), nsmall = 3),
                             format(round(vif_25, digits = 3), nsmall = 3)),
                           c("Exclusion", "Capital", "Capital", "Capital", "Capital", "Capital", "Capital", "Capital", "Capital")),
          covariate.labels = c("Poverty", "Post", "Poverty x Post"),
          column.labels = c("All", "All", "All", "All", "Argentina", "Chile", "Colombia", "Peru"))

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### RC Controlling for Economic Measures ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Diff-in-Diff WHO Announcement
diff_26 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + income + debt + I(Country),
                     data = cs.baseline, cluster = date)
fit_26 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + income + debt + I(Country), data = cs.baseline)
vif_26 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + income + debt + I(Country), data = cs.baseline))

## Diff-in-Diff First Interventions
diff_27 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + income + debt + I(Country),
                     data = cross.national, cluster = date)
fit_27 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + income + debt + I(Country), data = cross.national)
vif_27 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + income + debt + I(Country), data = cross.national))

## Diff-in-Diff Controlling for Cumulative Cases
diff_28 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + income + debt + I(Country),
                    data = cross.national, cluster = date)
fit_28 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + income + debt + I(Country),
             data = cross.national)
vif_28 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + income + debt + I(Country),
                 data = cross.national))

## Diff-in-Diff Controlling for Cumulative Deaths
diff_29 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
                    + income + debt + I(Country), data = cross.national, cluster = date)
fit_29 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
            + income + debt + I(Country), data = cross.national)
vif_29 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases  + cumulative_deaths
                + income + debt + I(Country), data = cross.national))

## Diff-in-Diff Argentina
diff_30 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
                     + income + debt, data = subset(cross.national, Country == "Argentina"), cluster = date)
fit_30 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
             + income + debt, data = subset(cross.national, Country == "Argentina"))
vif_30 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
                 + income + debt, data = subset(cross.national, Country == "Argentina")))

## Diff-in-Diff Chile
diff_31 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
                     + income + debt, data = subset(cross.national, Country == "Chile"), cluster = date)
fit_31 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
             + income + debt, data = subset(cross.national, Country == "Chile"))
vif_31 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
                 + income + debt, data = subset(cross.national, Country == "Chile")))

## Diff-in-Diff Colombia
diff_32 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
                     + income + debt, data = subset(cross.national, Country == "Colombia"), cluster = date)
fit_32 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
             + income + debt, data = subset(cross.national, Country == "Colombia"))
vif_32 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
                 + income + debt, data = subset(cross.national, Country == "Colombia")))

## Diff-in-Diff Peru
diff_33 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
                     + income + debt, data = subset(cross.national, Country == "Peru"), cluster = date)
fit_33 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
             + income + debt, data = subset(cross.national, Country == "Peru"))
vif_33 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
                 + income + debt, data = subset(cross.national, Country == "Peru")))

## Models Table
stargazer(fit_26, fit_27, fit_28, fit_29, fit_30, fit_31, fit_32, fit_33,
          se = starprep(diff_26, diff_27, diff_28, diff_29, diff_30, diff_31, diff_32, diff_33),
          type = "html", header = FALSE, style = "ajps", out = "tables/table_4.html",
          title = "Effect of Poverty on Workplaces Mobility", dep.var.labels = "Mobility Change from Baseline",
          notes.align = "c", model.numbers = TRUE, omit.stat = c("f", "ser"),
          omit = c("Country", "cumulative_cases", "cumulative_deaths", "income", "debt"),
          add.lines = list(c("Post-t", "WHO", "NPIs", "NPIs", "NPIs", "NPIs", "NPIs", "NPIs", "NPIs"),
                           c("Lagged cases", "No", "No", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes"),
                           c("Lagged deaths", "No", "No", "No", "Yes", "Yes", "Yes", "Yes", "Yes"),
                           c("Income support", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes"),
                           c("Debt relief", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes"),
                           c("Day FE", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes"),
                           c("Region FE", "No", "No", "No", "No", "No", "No", "No", "No"),
                           c("Country FE", "Yes", "Yes", "Yes", "Yes", "No", "No", "No", "No"),
                           c("VIF", format(round(vif_26, digits = 3), nsmall = 3),
                             format(round(vif_27, digits = 3), nsmall = 3), format(round(vif_28, digits = 3), nsmall = 3),
                             format(round(vif_29, digits = 3), nsmall = 3), format(round(vif_30, digits = 3), nsmall = 3),
                             format(round(vif_31, digits = 3), nsmall = 3), format(round(vif_32, digits = 3), nsmall = 3),
                             format(round(vif_33, digits = 3), nsmall = 3)),
                           c("Exclusion", "No", "No", "No", "No", "No", "No", "No", "No")),
          covariate.labels = c("Poverty", "Post", "Poverty x Post"),
          column.labels = c("All", "All", "All", "All", "Argentina", "Chile", "Colombia", "Peru"))

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Placebo Test ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Placebo Data Frame
placebo.data <- bind_rows(placebo_ARG, placebo_CHL, placebo_COL, placebo_PER)
names(placebo.data)[2] = "Country"

## Codification Post Period
placebo.data$post <- ifelse(placebo.data$date > as.Date("2020-02-17"), 1, 0)
placebo.data$date <- as.Date(placebo.data$date)
placebo.data <- left_join(placebo.data, cross.national_cases,
                          by = c("Country" = "Country.Region", "date" = "lagged_date"))
placebo.data <- left_join(placebo.data, cross.national_deaths,
                          by = c("Country" = "Country.Region", "date" = "lagged_date"))

## Diff-in-Diff WHO Announcement
diff_34 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + I(Country), data = placebo.data, cluster = date)
fit_34 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + I(Country), data = placebo.data)
vif_34 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + I(Country), data = placebo.data))

## Diff-in-Diff First Interventions
diff_35 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + I(Country), data = placebo.data, cluster = date)
fit_35 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + I(Country), data = placebo.data)
vif_35 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + I(Country), data = placebo.data))

## Diff-in-Diff Controlling for Cumulative Cases
diff_36 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + I(Country),
                    data = placebo.data, cluster = date)
fit_36 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + I(Country), data = placebo.data)
vif_36 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + I(Country), data = placebo.data))

## Diff-in-Diff Controlling for Cumulative Deaths
diff_37 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
                    + I(Country), data = placebo.data, cluster = date)
fit_37 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths
            + I(Country), data = placebo.data)
vif_37 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases  + cumulative_deaths
                + I(Country), data = placebo.data))

## Diff-in-Diff Argentina
diff_38 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths,
                    data = subset(placebo.data, Country == "Argentina"), cluster = date)
fit_38 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths,
            data = subset(placebo.data, Country == "Argentina"))
vif_38 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths,
                data = subset(placebo.data, Country == "Argentina")))

## Diff-in-Diff Chile
diff_39 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths,
                     data = subset(placebo.data, Country == "Chile" & sub_region_1 != "Valparaíso"), cluster = date)
fit_39 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths,
             data = subset(placebo.data, Country == "Chile" & sub_region_1 != "Valparaíso"))
vif_39 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths,
                 data = subset(placebo.data, Country == "Chile" & sub_region_1 != "Valparaíso")))

## Diff-in-Diff Colombia
diff_40 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths,
                    data = subset(placebo.data, Country == "Colombia"), cluster = date)
fit_40 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths,
            data = subset(placebo.data, Country == "Colombia"))
vif_40 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths,
                data = subset(placebo.data, Country == "Colombia")))

## Diff-in-Diff Peru
diff_41 <- lm_robust(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths,
                    data = subset(placebo.data, Country == "Peru"), cluster = date)
fit_41 <- lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths,
            data = subset(placebo.data, Country == "Peru"))
vif_41 <- VIF(lm(workplaces_percent_change_from_baseline ~ binary_poverty*post + cumulative_cases + cumulative_deaths,
                data = subset(placebo.data, Country == "Peru")))

## Models Table
stargazer(fit_34, fit_35, fit_36, fit_37, fit_38, fit_39, fit_40, fit_41,
          se = starprep(diff_34, diff_35, diff_36, diff_37, diff_38, diff_39, diff_40, diff_41),
          type = "html", header = FALSE, style = "ajps", out = "tables/table_5.html",
          title = "Placebo on Workplaces Mobility", dep.var.labels = "Mobility Change from Baseline",
          notes.align = "c", model.numbers = TRUE, omit.stat = c("f", "ser"),
          omit = c("Country", "cumulative_cases", "cumulative_deaths"),
          add.lines = list(c("Post-t", "Placebo", "Placebo", "Placebo", "Placebo", "Placebo", "Placebo", "Placebo", "Placebo"),
                           c("Lagged cases", "No", "No", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes"),
                           c("Lagged deaths", "No", "No", "No", "Yes", "Yes", "Yes", "Yes", "Yes"),
                           c("Day FE", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes"),
                           c("Region FE", "No", "No", "No", "No", "No", "No", "No", "No"),
                           c("Country FE", "Yes", "Yes", "Yes", "Yes", "No", "No", "No", "No"),
                           c("VIF", format(round(vif_34, digits = 3), nsmall = 3),
                             format(round(vif_35, digits = 3), nsmall = 3), format(round(vif_36, digits = 3), nsmall = 3),
                             format(round(vif_37, digits = 3), nsmall = 3), format(round(vif_38, digits = 3), nsmall = 3),
                             format(round(vif_39, digits = 3), nsmall = 3), format(round(vif_40, digits = 3), nsmall = 3),
                             format(round(vif_41, digits = 3), nsmall = 3)),
                           c("Exclusion", "No", "No", "No", "No", "No", "Tourism", "No", "No")),
          covariate.labels = c("Poverty", "Post", "Poverty x Post"),
          column.labels = c("All", "All", "All", "All", "Argentina", "Chile", "Colombia", "Peru"))

