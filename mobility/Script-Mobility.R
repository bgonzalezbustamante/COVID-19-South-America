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
ARG <- filter(mobility, country_region == "Argentina" & date < "2020-05-15" & date > "2020-02-15"
              & sub_region_1 != "")

## Subsample Chile
CHL <- filter(mobility, country_region == "Chile" & date < "2020-05-15" & date > "2020-02-15"
              & sub_region_1 != "")

## Subsample Colombia
COL <- filter(mobility, country_region == "Colombia" & date < "2020-05-15" & date > "2020-02-15"
              & sub_region_1 != "")

## Subsample Peru
PER <- filter(mobility, country_region == "Peru" & date < "2020-05-15" & date > "2020-02-15"
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
quantile(unique(ARG.vor$poverty))
ARG.vor$Poverty <- ifelse(ARG.vor$poverty > mean_poverty_ARG, "High % of poor", "Low of % poor")
ARG.vor$binary_poverty <- ifelse(ARG.vor$Poverty > mean_poverty_ARG, 1, 0)

ARG.vor$quantiles <- ifelse(ARG.vor$poverty < as.numeric(quantile(unique(ARG.vor$poverty))[2]), "Low % of poor",
                            ifelse(ARG.vor$poverty > as.numeric(quantile(unique(ARG.vor$poverty))[4]), "High of % poor",
                                   "Average"))

## Recode CHL
unique(CHL$sub_region_1[which(is.na(CHL$poverty))])
quantile(c(unique(CHL$poverty), 4.6))
CHL$dummy_poverty <- ifelse(CHL$poverty > mean_poverty_CHL, "High % of poor", "Low of % poor")
CHL$binary_poverty <- ifelse(CHL$poverty > mean_poverty_CHL, 1, 0)
## CHL$quantiles <- ifelse(CHL$poverty < as.numeric(quantile(c(unique(CHL$poverty), 4.6))[2]), "Low % of poor",
                        ## ifelse(CHL$poverty > as.numeric(quantile(c(unique(CHL$poverty), 4.6))[4]), "High of % poor",
                               ## "Average"))

## Multidimensional Poverty CHL
## unique(CHL$sub_region_1[which(is.na(CHL$multi))])
## CHL$dummy_multi <- ifelse(CHL$multi > mean_multi_CHL, "High % of poor", "Low of % poor")
## CHL$binary_multi <- ifelse(CHL$multi > mean_multi_CHL, 1, 0)

## Recode COL
unique(COL$sub_region_1[which(is.na(COL$poverty))])
COL.vor <- COL %>% drop_na(poverty)
quantile(c(unique(COL.vor$poverty), 28.7))
COL.vor$dummy_poverty <- ifelse(COL.vor$poverty > mean_poverty_COL, "High % of poor", "Low of % poor")
COL.vor$binary_poverty <- ifelse(COL.vor$poverty > mean_poverty_COL, 1, 0)
## COL.vor$quantiles <- ifelse(COL.vor$poverty < as.numeric(quantile(c(unique(COL.vor$poverty), 28.7))[2]), "Low % of poor",
                            ## ifelse(COL.vor$poverty > as.numeric(quantile(c(unique(COL.vor$poverty), 28.7))[4]), "High of % poor",
                                   ## "Average"))

## Recode PER
unique(PER$sub_region_1[which(is.na(PER$poverty))])
quantile(unique(PER$poverty))
PER$dummy_poverty <- ifelse(PER$poverty > mean_poverty_PER, "High % of poor", "Low of % poor")
PER$binary_poverty <- ifelse(PER$poverty > mean_poverty_PER, 1, 0)
PER$quantiles <- ifelse(PER$poverty < as.numeric(quantile(unique(PER$poverty))[2]), "Low % of poor",
                        ifelse(PER$poverty > as.numeric(quantile(unique(PER$poverty))[4]), "High of % poor",
                               "Average"))

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

## Plot Argentina
ggplot(ARG.vor, aes(x = as.Date(date), y = workplaces_percent_change_from_baseline,
                 col = dummy_poverty)) + geom_smooth(aes(linetype = dummy_poverty, fill = dummy_poverty)) +
  theme_minimal(base_size = 12) + theme(legend.position = "bottom") +
  theme(panel.grid.minor = element_blank()) +
  theme(axis.text.x = element_text(angle = 35, hjust = 1, color = "black",  size = 9)) +
  labs(x = "Date", y = "Workplaces Mobility", title = NULL, subtitle = NULL) +
  theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")) +
  scale_x_date(date_breaks = "2 weeks", date_minor_breaks = "2 weeks",
               date_labels = "%Y-%m-%d") +
  scale_y_continuous(limits = c(-100, 20), breaks = c(-100, -80, -60, -40, -20, 0, 20)) +
  scale_colour_manual(values=c("#1f78b4","gray30")) +
  scale_fill_manual(values=c("#1f78b4","gray30")) +
  scale_linetype_manual(values=c(2,3))

## Plot Chile
ggplot(CHL, aes(x = as.Date(date), y = workplaces_percent_change_from_baseline,
                    col = dummy_poverty)) + geom_smooth(aes(linetype = dummy_poverty, fill = dummy_poverty)) +
  theme_minimal(base_size = 12) + theme(legend.position = "bottom") +
  theme(panel.grid.minor = element_blank()) +
  theme(axis.text.x = element_text(angle = 35, hjust = 1, color = "black",  size = 9)) +
  labs(x = "Date", y = "Workplaces Mobility", title = NULL, subtitle = NULL) +
  theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")) +
  scale_x_date(date_breaks = "2 weeks", date_minor_breaks = "2 weeks",
               date_labels = "%Y-%m-%d") +
  scale_y_continuous(limits = c(-100, 20), breaks = c(-100, -80, -60, -40, -20, 0, 20)) +
  scale_colour_manual(values=c("#e31a1c","gray30")) +
  scale_fill_manual(values=c("#e31a1c","gray30")) +
  scale_linetype_manual(values=c(2,3))

## Plot Colombia
ggplot(COL.vor, aes(x = as.Date(date), y = workplaces_percent_change_from_baseline,
                col = dummy_poverty)) + geom_smooth(aes(linetype = dummy_poverty, fill = dummy_poverty)) +
  theme_minimal(base_size = 12) + theme(legend.position = "bottom") +
  theme(panel.grid.minor = element_blank()) +
  theme(axis.text.x = element_text(angle = 35, hjust = 1, color = "black",  size = 9)) +
  labs(x = "Date", y = "Workplaces Mobility", title = NULL, subtitle = NULL) +
  theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")) +
  scale_x_date(date_breaks = "2 weeks", date_minor_breaks = "2 weeks",
               date_labels = "%Y-%m-%d") +
  scale_y_continuous(limits = c(-100, 20), breaks = c(-100, -80, -60, -40, -20, 0, 20)) +
  scale_colour_manual(values=c("#ff7f00","gray30")) +
  scale_fill_manual(values=c("#ff7f00","gray30")) +
  scale_linetype_manual(values=c(2,3))

## Plot Peru
ggplot(COL.vor, aes(x = as.Date(date), y = workplaces_percent_change_from_baseline,
                    col = dummy_poverty)) + geom_smooth(aes(linetype = dummy_poverty, fill = dummy_poverty)) +
  theme_minimal(base_size = 12) + theme(legend.position = "bottom") +
  theme(panel.grid.minor = element_blank()) +
  theme(axis.text.x = element_text(angle = 35, hjust = 1, color = "black",  size = 9)) +
  labs(x = "Date", y = "Workplaces Mobility", title = NULL, subtitle = NULL) +
  theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")) +
  scale_x_date(date_breaks = "2 weeks", date_minor_breaks = "2 weeks",
               date_labels = "%Y-%m-%d") +
  scale_y_continuous(limits = c(-100, 20), breaks = c(-100, -80, -60, -40, -20, 0, 20)) +
  scale_colour_manual(values=c("#33a02c","gray30")) +
  scale_fill_manual(values=c("#33a02c","gray30")) +
  scale_linetype_manual(values=c(2,3))
