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
## rm(list = ls())

## Packages
library(tidyverse)
library(ggplot2)

## Functions
source("R/functions.R", encoding = "UTF-8")

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Google Data ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

mobility <- read.csv("../data/Google/Global_Mobility_Report.csv", encoding = "UTF-8")

CHL <- filter(mobility, country_region == "Chile" & date < "2020-05-15"
              & date > "2020-02-15" & sub_region_1 != "")

ARG <- filter(mobility, country_region == "Argentina" & date < "2020-05-15"
              & date > "2020-02-15" & sub_region_1 != "")

COL <- filter(mobility, country_region == "Colombia" & date < "2020-05-15"
              & date > "2020-02-15" & sub_region_1 != "")

PER <- filter(mobility, country_region == "Peru" & date < "2020-05-15"
              & date > "2020-02-15" & sub_region_1 != "")

