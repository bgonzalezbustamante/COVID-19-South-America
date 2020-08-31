Early Projections Precoding
================
[Bastián González-Bustamante](http://users.ox.ac.uk/~shil5311/)

``` r
## Data
south_am <- covid19

## Format Dates
south_am$dates <- as.Date(south_am$dates)

## Table to Vector
pre.i.arg <- rep(south_am$dates, south_am$ARG)
pre.i.bol <- rep(south_am$dates, south_am$BOL)
pre.i.bra <- rep(south_am$dates, south_am$BRA)
pre.i.chl <- rep(south_am$dates, south_am$CHL)
pre.i.col <- rep(south_am$dates, south_am$COL)
pre.i.per <- rep(south_am$dates, south_am$PER)
pre.i.pry <- rep(south_am$dates, south_am$PRY)
pre.i.ury <- rep(south_am$dates, south_am$URY)

## Incidence Objets
third_week <- as.Date("2020-03-20")
last_date <- as.Date("2020-05-15") 

## Past Incidence (3rd Week of March)
past.i.arg <- incidence(as.Date(pre.i.arg), last_date = third_week)
past.i.bol <- incidence(as.Date(pre.i.bol), last_date = third_week)
past.i.bra <- incidence(as.Date(pre.i.bra), last_date = third_week)
past.i.chl <- incidence(as.Date(pre.i.chl), last_date = third_week)
past.i.col <- incidence(as.Date(pre.i.col), last_date = third_week)
past.i.per <- incidence(as.Date(pre.i.per), last_date = third_week)
past.i.pry <- incidence(as.Date(pre.i.pry), last_date = third_week)
past.i.ury <- incidence(as.Date(pre.i.ury), last_date = third_week)

## Current Incidence (15 May)
i.arg <- incidence(as.Date(pre.i.arg), last_date = last_date)
i.bol <- incidence(as.Date(pre.i.bol), last_date = last_date)
i.bra <- incidence(as.Date(pre.i.bra), last_date = last_date)
i.chl <- incidence(as.Date(pre.i.chl), last_date = last_date)
i.col <- incidence(as.Date(pre.i.col), last_date = last_date)
i.per <- incidence(as.Date(pre.i.per), last_date = last_date)
i.pry <- incidence(as.Date(pre.i.pry), last_date = last_date)
i.ury <- incidence(as.Date(pre.i.ury), last_date = last_date)

## Simulations Values
mu <- 7.5
sigma <- 3.4
cv <- sigma / mu
pred_days <- 7
```
