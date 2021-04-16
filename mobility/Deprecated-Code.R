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

#### Deprecated Code ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Multidimensional CHL
for(i in 1:nrow(CHL)) {
  CHL$multi[i] <- f.multi.CHL(CHL$sub_region_1[i])
}

## Recode Argentina
ARG.vor$quantiles <- ifelse(ARG.vor$poverty < as.numeric(quantile(unique(ARG.vor$poverty))[2]), "Low % of poor",
                            ifelse(ARG.vor$poverty > as.numeric(quantile(unique(ARG.vor$poverty))[4]), "High of % poor",
                                   "Average"))

## Recode Chile
CHL$quantiles <- ifelse(CHL$poverty < as.numeric(quantile(c(unique(CHL$poverty), 4.6))[2]), "Low % of poor",
                        ifelse(CHL$poverty > as.numeric(quantile(c(unique(CHL$poverty), 4.6))[4]), "High of % poor",
                               "Average"))

## Multidimensional Poverty CHL
unique(CHL$sub_region_1[which(is.na(CHL$multi))])
CHL$dummy_multi <- ifelse(CHL$multi > mean_multi_CHL, "High % of poor", "Low of % poor")
CHL$binary_multi <- ifelse(CHL$multi > mean_multi_CHL, 1, 0)

## Recode Colombia
COL.vor$quantiles <- ifelse(COL.vor$poverty < as.numeric(quantile(c(unique(COL.vor$poverty), 28.7))[2]), "Low % of poor",
                            ifelse(COL.vor$poverty > as.numeric(quantile(c(unique(COL.vor$poverty), 28.7))[4]), "High of % poor",
                                   "Average"))

## Recode Peru
PER$quantiles <- ifelse(PER$poverty < as.numeric(quantile(unique(PER$poverty))[2]), "Low % of poor",
                        ifelse(PER$poverty > as.numeric(quantile(unique(PER$poverty))[4]), "High of % poor",
                               "Average"))
