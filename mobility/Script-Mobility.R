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

## Subsample Chile
## CHL <- filter(mobility, country_region == "Chile" & date < "2020-05-16" & date > "2020-02-14"
CHL <- filter(mobility, country_region == "Chile" & date < "2020-05-01" & date > "2020-02-29"
              & sub_region_1 != "")

## Subsample Colombia
## COL <- filter(mobility, country_region == "Colombia" & date < "2020-05-16" & date > "2020-02-14"
COL <- filter(mobility, country_region == "Colombia" & date < "2020-05-01" & date > "2020-02-29"
              & sub_region_1 != "")

## Subsample Peru
## PER <- filter(mobility, country_region == "Peru" & date < "2020-05-16" & date > "2020-02-14"
PER <- filter(mobility, country_region == "Peru" & date < "2020-05-01" & date > "2020-02-29"
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
ARG.vor$Poverty <- ifelse(ARG.vor$poverty > mean_poverty_ARG, "High % of poor", "Low % of poor")
ARG.vor$binary_poverty <- ifelse(ARG.vor$poverty > mean_poverty_ARG, 1, 0)
## table(ARG.vor$Poverty)
## table(ARG.vor$binary_poverty)

## Recode Chile
unique(CHL$sub_region_1[which(is.na(CHL$poverty))])
CHL$Poverty <- ifelse(CHL$poverty > mean_poverty_CHL, "High % of poor", "Low % of poor")
CHL$binary_poverty <- ifelse(CHL$poverty > mean_poverty_CHL, 1, 0)
## table(CHL$Poverty)
## table(CHL$binary_poverty)

## Recode Colombia
unique(COL$sub_region_1[which(is.na(COL$poverty))])
COL.vor <- COL %>% drop_na(poverty)
COL.vor$Poverty <- ifelse(COL.vor$poverty > mean_poverty_COL, "High % of poor", "Low % of poor")
COL.vor$binary_poverty <- ifelse(COL.vor$poverty > mean_poverty_COL, 1, 0)
## table(COL.vor$Poverty)
## table(COL.vor$binary_poverty)

## Recode PER
unique(PER$sub_region_1[which(is.na(PER$poverty))])
PER$Poverty <- ifelse(PER$poverty > mean_poverty_PER, "High % of poor", "Low % of poor")
PER$binary_poverty <- ifelse(PER$poverty > mean_poverty_PER, 1, 0)
## table(PER$Poverty)
## table(PER$binary_poverty)

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
  labs(x = "Date", y = "Groceries", title = NULL, subtitle = NULL) +
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
  labs(x = "Date", y = "Groceries", title = NULL, subtitle = NULL) +
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
as.Date(arg_resp$dates[which(arg_resp$c1_schoolclosing == 3 & arg_resp$c1_flag == 1, arr.ind = TRUE)])[1]
as.Date(arg_resp$dates[which(arg_resp$c2_workplaceclosing == 3 & arg_resp$c2_flag == 1, arr.ind = TRUE)])[1]
as.Date(arg_resp$dates[which(arg_resp$c6_stayathomerequirements == 3 & arg_resp$c6_flag == 1, arr.ind = TRUE)])[1]

## Checking Responses Chile
as.Date(chl_resp$dates[which(chl_resp$c1_schoolclosing == 3 & chl_resp$c1_flag == 1, arr.ind = TRUE)])[1]
as.Date(chl_resp$dates[which(chl_resp$c2_workplaceclosing == 3 & chl_resp$c2_flag == 1, arr.ind = TRUE)])[1]
as.Date(chl_resp$dates[which(chl_resp$c6_stayathomerequirements == 3 & chl_resp$c6_flag == 1, arr.ind = TRUE)])[1]

## Checking Responses Colombia
as.Date(col_resp$dates[which(col_resp$c1_schoolclosing == 3 & col_resp$c1_flag == 1, arr.ind = TRUE)])[1]
as.Date(col_resp$dates[which(col_resp$c2_workplaceclosing == 3 & col_resp$c2_flag == 1, arr.ind = TRUE)])[1]
as.Date(col_resp$dates[which(col_resp$c6_stayathomerequirements == 3 & col_resp$c6_flag == 1, arr.ind = TRUE)])[1]

## Checking Responses Peru
as.Date(per_resp$dates[which(per_resp$c1_schoolclosing == 3 & per_resp$c1_flag == 1, arr.ind = TRUE)])[1]
as.Date(per_resp$dates[which(per_resp$c2_workplaceclosing == 3 & per_resp$c2_flag == 1, arr.ind = TRUE)])[1]
as.Date(per_resp$dates[which(per_resp$c6_stayathomerequirements == 3 & per_resp$c6_flag == 1, arr.ind = TRUE)])[1]

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
