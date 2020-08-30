Oxford Government Responses Tracker Scraper
================
Bastián González-Bustamante

  - [Precoding](#precoding)
  - [Argentina Responses](#argentina-responses)
  - [Bolivia Responses](#bolivia-responses)
  - [Brazil Responses](#brazil-responses)
  - [Chile Responses](#chile-responses)
  - [Colombia Responses](#colombia-responses)
  - [Paraguay Responses](#paraguay-responses)
  - [Peru Responses](#peru-responses)
  - [Uruguay Responses](#uruguay-responses)

### Precoding

``` r
## OxCGRT - Covid-Policy-Tracker
OXF_fork1 <- "https://raw.githubusercontent.com/bgonzalezbustamante/"
OXF_fork2 <- "covid-policy-tracker/master/data/timeseries/"
stringencyindex <- read.csv(paste(OXF_fork1, OXF_fork2,
                                  "stringency_index.csv", sep = ""), sep = ",")
c1_schoolclosing <- read.csv(paste(OXF_fork1, OXF_fork2, "c1_schoolclosing.csv", 
                                   sep = ""), sep = ",")
c1_flag <- read.csv(paste(OXF_fork1, OXF_fork2, "c1_flag.csv", sep = ""), sep = ",")
c2_workplaceclosing <- read.csv(paste(OXF_fork1, OXF_fork2, "c2_workplaceclosing.csv", 
                                      sep = ""), sep = ",")
c2_flag <- read.csv(paste(OXF_fork1, OXF_fork2, "c2_flag.csv", sep = ""), sep = ",")
c3_cancelpublicevents <- read.csv(paste(OXF_fork1, OXF_fork2, "c3_cancelpublicevents.csv", 
                                        sep = ""), sep = ",")
c3_flag <- read.csv(paste(OXF_fork1, OXF_fork2, "c3_flag.csv", sep = ""), sep = ",")
c4_restrictionsongatherings <- read.csv(paste(OXF_fork1, OXF_fork2,
                                              "c4_restrictionsongatherings.csv", 
                                              sep = ""), sep = ",")
c4_flag <- read.csv(paste(OXF_fork1, OXF_fork2, "c4_flag.csv", sep = ""), sep = ",")
c5_closepublictransport <- read.csv(paste(OXF_fork1, OXF_fork2, 
                                          "c5_closepublictransport.csv", sep = ""), 
                                    sep = ",")
c5_flag <- read.csv(paste(OXF_fork1, OXF_fork2, "c5_flag.csv", sep = ""), sep = ",")
c6_stayathomerequirements <- read.csv(paste(OXF_fork1, OXF_fork2,
                                            "c6_stayathomerequirements.csv", sep = ""), 
                                      sep = ",")
c6_flag <- read.csv(paste(OXF_fork1, OXF_fork2, "c6_flag.csv", sep = ""), sep = ",")
c7_domestictravel <- read.csv(paste(OXF_fork1, OXF_fork2, "c7_domestictravel.csv", 
                                    sep = ""), sep = ",")
c7_flag <- read.csv(paste(OXF_fork1, OXF_fork2, "c7_flag.csv", sep = ""), sep = ",")
c8_internationaltravel <- read.csv(paste(OXF_fork1, OXF_fork2,
                                         "c8_internationaltravel.csv", sep = ""), 
                                   sep = ",")
h2_testingpolicy <- read.csv(paste(OXF_fork1, OXF_fork2, "h2_testingpolicy.csv", 
                                   sep = ""), sep = ",")
h3_contacttracing <- read.csv(paste(OXF_fork1, OXF_fork2, "h3_contacttracing.csv", 
                                    sep = ""), sep = ",")

## Period Coverage
dd_OXF <- as.numeric((as.Date("2020-05-15")) - as.Date("2020-01-01"))
begin_OXF <- ((as.Date("2020-05-15"))-dd_OXF) ## 01 January
dates_OXF <- seq(as.Date(begin_OXF), as.Date("2020-05-15"), by="days")
```

### Argentina Responses

``` r
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
arg.c1_schoolclosing <- slice(c1_schoolclosing, which(c1_schoolclosing[,1] 
                                                      == "Argentina"):
                               which(c1_schoolclosing[,1] == "Argentina")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c1_schoolclosing")
arg.c1_schoolclosing <- slice(arg.c1_schoolclosing, 1:136) ## 15 May
arg.c1_schoolclosing <- data.frame(arg.c1_schoolclosing, dates_OXF)
arg.c1_schoolclosing$X <- NULL
arg.c1_schoolclosing$X.1 <- NULL
arg.c1_schoolclosing$Date <- NULL

## c1_flag
arg.c1_flag <- slice(c1_flag, which(c1_flag[,1] == "Argentina"):
                            which(c1_flag[,1] == "Argentina")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c1_flag")
arg.c1_flag <- slice(arg.c1_flag, 1:136) ## 15 May
arg.c1_flag <- data.frame(arg.c1_flag, dates_OXF)
arg.c1_flag$X <- NULL
arg.c1_flag$X.1 <- NULL
arg.c1_flag$Date <- NULL

## c2_workplaceclosing
arg.c2_workplaceclosing <- slice(c2_workplaceclosing, which(c2_workplaceclosing[,1] 
                                                            == "Argentina"):
                            which(c2_workplaceclosing[,1] == "Argentina")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c2_workplaceclosing")
arg.c2_workplaceclosing <- slice(arg.c2_workplaceclosing, 1:136) ## 15 May
arg.c2_workplaceclosing <- data.frame(arg.c2_workplaceclosing, dates_OXF)
arg.c2_workplaceclosing$X <- NULL
arg.c2_workplaceclosing$X.1 <- NULL
arg.c2_workplaceclosing$Date <- NULL

## c2_flag
arg.c2_flag <- slice(c2_flag, which(c2_flag[,1] == "Argentina"):
                            which(c2_flag[,1] == "Argentina")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c2_flag")
arg.c2_flag <- slice(arg.c2_flag, 1:136) ## 15 May
arg.c2_flag <- data.frame(arg.c2_flag, dates_OXF)
arg.c2_flag$X <- NULL
arg.c2_flag$X.1 <- NULL
arg.c2_flag$Date <- NULL

## c3_cancelpublicevents
arg.c3_cancelpublicevents <- slice(c3_cancelpublicevents, which(c3_cancelpublicevents[,1]
                                                                == "Argentina"):
                                   which(c3_cancelpublicevents[,1] == "Argentina")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c3_cancelpublicevents")
arg.c3_cancelpublicevents <- slice(arg.c3_cancelpublicevents, 1:136) ## 15 May
arg.c3_cancelpublicevents <- data.frame(arg.c3_cancelpublicevents, dates_OXF)
arg.c3_cancelpublicevents$X <- NULL
arg.c3_cancelpublicevents$X.1 <- NULL
arg.c3_cancelpublicevents$Date <- NULL

## c3_flag
arg.c3_flag <- slice(c3_flag, which(c3_flag[,1] == "Argentina"):
                            which(c3_flag[,1] == "Argentina")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c3_flag")
arg.c3_flag <- slice(arg.c3_flag, 1:136) ## 15 May
arg.c3_flag <- data.frame(arg.c3_flag, dates_OXF)
arg.c3_flag$X <- NULL
arg.c3_flag$X.1 <- NULL
arg.c3_flag$Date <- NULL

## c4_restrictionsongatherings
arg.c4_restrictionsongatherings <- slice(c4_restrictionsongatherings, 
                                         which(c4_restrictionsongatherings[,1]
                                               == "Argentina"):
                                     which(c4_restrictionsongatherings[,1]
                                           == "Argentina")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c4_restrictionsongatherings")
arg.c4_restrictionsongatherings <- slice(arg.c4_restrictionsongatherings, 1:136) ## 15 May
arg.c4_restrictionsongatherings <- data.frame(arg.c4_restrictionsongatherings, dates_OXF)
arg.c4_restrictionsongatherings$X <- NULL
arg.c4_restrictionsongatherings$X.1 <- NULL
arg.c4_restrictionsongatherings$Date <- NULL

## c4_flag
arg.c4_flag <- slice(c4_flag, which(c4_flag[,1] == "Argentina"):
                       which(c4_flag[,1] == "Argentina")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c4_flag")
arg.c4_flag <- slice(arg.c4_flag, 1:136) ## 15 May
arg.c4_flag <- data.frame(arg.c4_flag, dates_OXF)
arg.c4_flag$X <- NULL
arg.c4_flag$X.1 <- NULL
arg.c4_flag$Date <- NULL

## c5_closepublictransport 
arg.c5_closepublictransport <- slice(c5_closepublictransport, 
                                     which(c5_closepublictransport[,1] == "Argentina"):
                                     which(c5_closepublictransport[,1] 
                                           == "Argentina")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c5_closepublictransport")
arg.c5_closepublictransport <- slice(arg.c5_closepublictransport, 1:136) ## 15 May
arg.c5_closepublictransport <- data.frame(arg.c5_closepublictransport, dates_OXF)
arg.c5_closepublictransport$X <- NULL
arg.c5_closepublictransport$X.1 <- NULL
arg.c5_closepublictransport$Date <- NULL

## c5_flag 
arg.c5_flag <- slice(c5_flag, which(c5_flag[,1] == "Argentina"):
                            which(c5_flag[,1] == "Argentina")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c5_flag")
arg.c5_flag <- slice(arg.c5_flag, 1:136) ## 15 May
arg.c5_flag <- data.frame(arg.c5_flag, dates_OXF)
arg.c5_flag$X <- NULL
arg.c5_flag$X.1 <- NULL
arg.c5_flag$Date <- NULL

## c6_stayathomerequirements
arg.c6_stayathomerequirements <- slice(c6_stayathomerequirements,
                                       which(c6_stayathomerequirements[,1]
                                             == "Argentina"):
                                       which(c6_stayathomerequirements[,1]
                                             == "Argentina")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c6_stayathomerequirements")
arg.c6_stayathomerequirements <- slice(arg.c6_stayathomerequirements, 1:136) ## 15 May
arg.c6_stayathomerequirements <- data.frame(arg.c6_stayathomerequirements, dates_OXF)
arg.c6_stayathomerequirements$X <- NULL
arg.c6_stayathomerequirements$X.1 <- NULL
arg.c6_stayathomerequirements$Date <- NULL

## c6_flag
arg.c6_flag <- slice(c6_flag, which(c6_flag[,1] == "Argentina"):
                       which(c6_flag[,1] == "Argentina")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c6_flag")
arg.c6_flag <- slice(arg.c6_flag, 1:136) ## 15 May
arg.c6_flag <- data.frame(arg.c6_flag, dates_OXF)
arg.c6_flag$X <- NULL
arg.c6_flag$X.1 <- NULL
arg.c6_flag$Date <- NULL

## c7_domestictravel
arg.c7_domestictravel <- slice(c7_domestictravel, which(c7_domestictravel[,1]
                                                        == "Argentina"):
                                       which(c7_domestictravel[,1] == "Argentina")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c7_domestictravel")
arg.c7_domestictravel <- slice(arg.c7_domestictravel, 1:136) ## 15 May
arg.c7_domestictravel <- data.frame(arg.c7_domestictravel, dates_OXF)
arg.c7_domestictravel$X <- NULL
arg.c7_domestictravel$X.1 <- NULL
arg.c7_domestictravel$Date <- NULL

## c7_flag 
arg.c7_flag <- slice(c7_flag, which(c7_flag[,1] == "Argentina"):
                            which(c7_flag[,1] == "Argentina")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c7_flag")
arg.c7_flag <- slice(arg.c7_flag, 1:136) ## 15 May
arg.c7_flag <- data.frame(arg.c7_flag, dates_OXF)
arg.c7_flag$X <- NULL
arg.c7_flag$X.1 <- NULL
arg.c7_flag$Date <- NULL

## c8_internationaltravel
arg.c8_internationaltravel <- slice(c8_internationaltravel,
                                    which(c8_internationaltravel[,1] == "Argentina"):
                                 which(c8_internationaltravel[,1] == "Argentina")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c8_internationaltravel")
arg.c8_internationaltravel <- slice(arg.c8_internationaltravel, 1:136) ## 15 May
arg.c8_internationaltravel <- data.frame(arg.c8_internationaltravel, dates_OXF)
arg.c8_internationaltravel$X <- NULL
arg.c8_internationaltravel$X.1 <- NULL
arg.c8_internationaltravel$Date <- NULL

## h2_testingpolicy
arg.h2_testingpolicy <- slice(h2_testingpolicy, which(h2_testingpolicy[,1]
                                                      == "Argentina"):
                                 which(h2_testingpolicy[,1] == "Argentina")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "h2_testingpolicy")
arg.h2_testingpolicy <- slice(arg.h2_testingpolicy, 1:136) ## 15 May
arg.h2_testingpolicy <- data.frame(arg.h2_testingpolicy, dates_OXF)
arg.h2_testingpolicy$X <- NULL
arg.h2_testingpolicy$X.1 <- NULL
arg.h2_testingpolicy$Date <- NULL

## h3_contacttracing
arg.h3_contacttracing <- slice(h3_contacttracing, which(h3_contacttracing[,1]
                                                        == "Argentina"):
                                    which(h3_contacttracing[,1] == "Argentina")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "h3_contacttracing")
arg.h3_contacttracing <- slice(arg.h3_contacttracing, 1:136) ## 15 May
arg.h3_contacttracing <- data.frame(arg.h3_contacttracing, dates_OXF)
arg.h3_contacttracing$X <- NULL
arg.h3_contacttracing$X.1 <- NULL
arg.h3_contacttracing$Date <- NULL

## Dataframe 
arg_resp <- data.frame(arg.stringencyindex, arg.c1_schoolclosing$c1_schoolclosing, 
                       arg.c1_flag$c1_flag, arg.c2_workplaceclosing$c2_workplaceclosing, 
                       arg.c2_flag$c2_flag, 
                       arg.c3_cancelpublicevents$c3_cancelpublicevents, 
                       arg.c3_flag$c3_flag, 
                       arg.c4_restrictionsongatherings$c4_restrictionsongatherings,
                       arg.c4_flag$c4_flag, 
                       arg.c5_closepublictransport$c5_closepublictransport, 
                       arg.c5_flag$c5_flag, 
                       arg.c6_stayathomerequirements$c6_stayathomerequirements,
                       arg.c6_flag$c6_flag, arg.c7_domestictravel$c7_domestictravel, 
                       arg.c7_flag$c7_flag, 
                       arg.c8_internationaltravel$c8_internationaltravel, 
                       arg.h2_testingpolicy$h2_testingpolicy, 
                       arg.h3_contacttracing$h3_contacttracing)
names(arg_resp)[1] = "stringencyindex"
names(arg_resp)[2] = "dates"
names(arg_resp)[3] = "c1_schoolclosing"
names(arg_resp)[4] = "c1_flag"
names(arg_resp)[5] = "c2_workplaceclosing"
names(arg_resp)[6] = "c2_flag"
names(arg_resp)[7] = "c3_cancelpublicevents"
names(arg_resp)[8] = "c3_flag"
names(arg_resp)[9] = "c4_restrictionsongatherings"
names(arg_resp)[10] = "c4_flag"
names(arg_resp)[11] = "c5_closepublictransport"
names(arg_resp)[12] = "c5_flag"
names(arg_resp)[13] = "c6_stayathomerequirements"
names(arg_resp)[14] = "c6_flag"
names(arg_resp)[15] = "c7_domestictravel"
names(arg_resp)[16] = "c7_flag"
names(arg_resp)[17] = "c8_internationaltravel"
names(arg_resp)[18] = "h2_testingpolicy"
names(arg_resp)[19] = "h3_contacttracing"
```

### Bolivia Responses

``` r
## stringencyindex
bol.stringencyindex <- slice(stringencyindex, which(stringencyindex[,1] == "Bolivia"):
                               which(stringencyindex[,1] == "Bolivia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "stringency_index")
bol.stringencyindex <- slice(bol.stringencyindex, 1:136) ## 15 May
bol.stringencyindex <- data.frame(bol.stringencyindex, dates_OXF)
bol.stringencyindex$X <- NULL
bol.stringencyindex$X.1 <- NULL
bol.stringencyindex$Date <- NULL

## c1_schoolclosing
bol.c1_schoolclosing <- slice(c1_schoolclosing, which(c1_schoolclosing[,1] == "Bolivia"):
                                which(c1_schoolclosing[,1] == "Bolivia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c1_schoolclosing")
bol.c1_schoolclosing <- slice(bol.c1_schoolclosing, 1:136) ## 15 May
bol.c1_schoolclosing <- data.frame(bol.c1_schoolclosing, dates_OXF)
bol.c1_schoolclosing$X <- NULL
bol.c1_schoolclosing$X.1 <- NULL
bol.c1_schoolclosing$Date <- NULL

## c1_flag
bol.c1_flag <- slice(c1_flag, which(c1_flag[,1] == "Bolivia"):
                       which(c1_flag[,1] == "Bolivia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c1_flag")
bol.c1_flag <- slice(bol.c1_flag, 1:136) ## 15 May
bol.c1_flag <- data.frame(bol.c1_flag, dates_OXF)
bol.c1_flag$X <- NULL
bol.c1_flag$X.1 <- NULL
bol.c1_flag$Date <- NULL

## c2_workplaceclosing
bol.c2_workplaceclosing <- slice(c2_workplaceclosing, which(c2_workplaceclosing[,1]
                                                            == "Bolivia"):
                                   which(c2_workplaceclosing[,1] == "Bolivia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c2_workplaceclosing")
bol.c2_workplaceclosing <- slice(bol.c2_workplaceclosing, 1:136) ## 15 May
bol.c2_workplaceclosing <- data.frame(bol.c2_workplaceclosing, dates_OXF)
bol.c2_workplaceclosing$X <- NULL
bol.c2_workplaceclosing$X.1 <- NULL
bol.c2_workplaceclosing$Date <- NULL

## c2_flag
bol.c2_flag <- slice(c2_flag, which(c2_flag[,1] == "Bolivia"):
                       which(c2_flag[,1] == "Bolivia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c2_flag")
bol.c2_flag <- slice(bol.c2_flag, 1:136) ## 15 May
bol.c2_flag <- data.frame(bol.c2_flag, dates_OXF)
bol.c2_flag$X <- NULL
bol.c2_flag$X.1 <- NULL
bol.c2_flag$Date <- NULL

## c3_cancelpublicevents
bol.c3_cancelpublicevents <- slice(c3_cancelpublicevents, which(c3_cancelpublicevents[,1]
                                                                == "Bolivia"):
                                     which(c3_cancelpublicevents[,1] == "Bolivia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c3_cancelpublicevents")
bol.c3_cancelpublicevents <- slice(bol.c3_cancelpublicevents, 1:136) ## 15 May
bol.c3_cancelpublicevents <- data.frame(bol.c3_cancelpublicevents, dates_OXF)
bol.c3_cancelpublicevents$X <- NULL
bol.c3_cancelpublicevents$X.1 <- NULL
bol.c3_cancelpublicevents$Date <- NULL

## c3_flag
bol.c3_flag <- slice(c3_flag, which(c3_flag[,1] == "Bolivia"):
                       which(c3_flag[,1] == "Bolivia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c3_flag")
bol.c3_flag <- slice(bol.c3_flag, 1:136) ## 15 May
bol.c3_flag <- data.frame(bol.c3_flag, dates_OXF)
bol.c3_flag$X <- NULL
bol.c3_flag$X.1 <- NULL
bol.c3_flag$Date <- NULL

## c4_restrictionsongatherings
bol.c4_restrictionsongatherings <- slice(c4_restrictionsongatherings,
                                         which(c4_restrictionsongatherings[,1]
                                               == "Bolivia"):
                                           which(c4_restrictionsongatherings[,1]
                                                 == "Bolivia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c4_restrictionsongatherings")
bol.c4_restrictionsongatherings <- slice(bol.c4_restrictionsongatherings, 1:136) ## 15 May
bol.c4_restrictionsongatherings <- data.frame(bol.c4_restrictionsongatherings, dates_OXF)
bol.c4_restrictionsongatherings$X <- NULL
bol.c4_restrictionsongatherings$X.1 <- NULL
bol.c4_restrictionsongatherings$Date <- NULL

## c4_flag
bol.c4_flag <- slice(c4_flag, which(c4_flag[,1] == "Bolivia"):
                       which(c4_flag[,1] == "Bolivia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c4_flag")
bol.c4_flag <- slice(bol.c4_flag, 1:136) ## 15 May
bol.c4_flag <- data.frame(bol.c4_flag, dates_OXF)
bol.c4_flag$X <- NULL
bol.c4_flag$X.1 <- NULL
bol.c4_flag$Date <- NULL

## c5_closepublictransport 
bol.c5_closepublictransport <- slice(c5_closepublictransport,
                                     which(c5_closepublictransport[,1] == "Bolivia"):
                                       which(c5_closepublictransport[,1]
                                             == "Bolivia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c5_closepublictransport")
bol.c5_closepublictransport <- slice(bol.c5_closepublictransport, 1:136) ## 15 May
bol.c5_closepublictransport <- data.frame(bol.c5_closepublictransport, dates_OXF)
bol.c5_closepublictransport$X <- NULL
bol.c5_closepublictransport$X.1 <- NULL
bol.c5_closepublictransport$Date <- NULL

## c5_flag 
bol.c5_flag <- slice(c5_flag, which(c5_flag[,1] == "Bolivia"):
                       which(c5_flag[,1] == "Bolivia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c5_flag")
bol.c5_flag <- slice(bol.c5_flag, 1:136) ## 15 May
bol.c5_flag <- data.frame(bol.c5_flag, dates_OXF)
bol.c5_flag$X <- NULL
bol.c5_flag$X.1 <- NULL
bol.c5_flag$Date <- NULL

## c6_stayathomerequirements
bol.c6_stayathomerequirements <- slice(c6_stayathomerequirements,
                                       which(c6_stayathomerequirements[,1] == "Bolivia"):
                                         which(c6_stayathomerequirements[,1]
                                               == "Bolivia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c6_stayathomerequirements")
bol.c6_stayathomerequirements <- slice(bol.c6_stayathomerequirements, 1:136) ## 15 May
bol.c6_stayathomerequirements <- data.frame(bol.c6_stayathomerequirements, dates_OXF)
bol.c6_stayathomerequirements$X <- NULL
bol.c6_stayathomerequirements$X.1 <- NULL
bol.c6_stayathomerequirements$Date <- NULL

## c6_flag
bol.c6_flag <- slice(c6_flag, which(c6_flag[,1] == "Bolivia"):
                       which(c6_flag[,1] == "Bolivia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c6_flag")
bol.c6_flag <- slice(bol.c6_flag, 1:136) ## 15 May
bol.c6_flag <- data.frame(bol.c6_flag, dates_OXF)
bol.c6_flag$X <- NULL
bol.c6_flag$X.1 <- NULL
bol.c6_flag$Date <- NULL

## c7_domestictravel
bol.c7_domestictravel <- slice(c7_domestictravel, which(c7_domestictravel[,1]
                                                        == "Bolivia"):
                                 which(c7_domestictravel[,1] == "Bolivia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c7_domestictravel")
bol.c7_domestictravel <- slice(bol.c7_domestictravel, 1:136) ## 15 May
bol.c7_domestictravel <- data.frame(bol.c7_domestictravel, dates_OXF)
bol.c7_domestictravel$X <- NULL
bol.c7_domestictravel$X.1 <- NULL
bol.c7_domestictravel$Date <- NULL

## c7_flag 
bol.c7_flag <- slice(c7_flag, which(c7_flag[,1] == "Bolivia"):
                       which(c7_flag[,1] == "Bolivia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c7_flag")
bol.c7_flag <- slice(bol.c7_flag, 1:136) ## 15 May
bol.c7_flag <- data.frame(bol.c7_flag, dates_OXF)
bol.c7_flag$X <- NULL
bol.c7_flag$X.1 <- NULL
bol.c7_flag$Date <- NULL

## c8_internationaltravel
bol.c8_internationaltravel <- slice(c8_internationaltravel,
                                    which(c8_internationaltravel[,1] == "Bolivia"):
                                      which(c8_internationaltravel[,1] == "Bolivia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c8_internationaltravel")
bol.c8_internationaltravel <- slice(bol.c8_internationaltravel, 1:136) ## 15 May
bol.c8_internationaltravel <- data.frame(bol.c8_internationaltravel, dates_OXF)
bol.c8_internationaltravel$X <- NULL
bol.c8_internationaltravel$X.1 <- NULL
bol.c8_internationaltravel$Date <- NULL

## h2_testingpolicy
bol.h2_testingpolicy <- slice(h2_testingpolicy, which(h2_testingpolicy[,1] == "Bolivia"):
                                which(h2_testingpolicy[,1] == "Bolivia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "h2_testingpolicy")
bol.h2_testingpolicy <- slice(bol.h2_testingpolicy, 1:136) ## 15 May
bol.h2_testingpolicy <- data.frame(bol.h2_testingpolicy, dates_OXF)
bol.h2_testingpolicy$X <- NULL
bol.h2_testingpolicy$X.1 <- NULL
bol.h2_testingpolicy$Date <- NULL

## h3_contacttracing
bol.h3_contacttracing <- slice(h3_contacttracing, which(h3_contacttracing[,1]
                                                        == "Bolivia"):
                                 which(h3_contacttracing[,1] == "Bolivia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "h3_contacttracing")
bol.h3_contacttracing <- slice(bol.h3_contacttracing, 1:136) ## 15 May
bol.h3_contacttracing <- data.frame(bol.h3_contacttracing, dates_OXF)
bol.h3_contacttracing$X <- NULL
bol.h3_contacttracing$X.1 <- NULL
bol.h3_contacttracing$Date <- NULL

## Dataframe 
bol_resp <- data.frame(bol.stringencyindex, bol.c1_schoolclosing$c1_schoolclosing, 
                       bol.c1_flag$c1_flag, bol.c2_workplaceclosing$c2_workplaceclosing, 
                       bol.c2_flag$c2_flag, 
                       bol.c3_cancelpublicevents$c3_cancelpublicevents, 
                       bol.c3_flag$c3_flag, 
                       bol.c4_restrictionsongatherings$c4_restrictionsongatherings,
                       bol.c4_flag$c4_flag, 
                       bol.c5_closepublictransport$c5_closepublictransport, 
                       bol.c5_flag$c5_flag, 
                       bol.c6_stayathomerequirements$c6_stayathomerequirements,
                       bol.c6_flag$c6_flag, bol.c7_domestictravel$c7_domestictravel, 
                       bol.c7_flag$c7_flag, 
                       bol.c8_internationaltravel$c8_internationaltravel, 
                       bol.h2_testingpolicy$h2_testingpolicy, 
                       bol.h3_contacttracing$h3_contacttracing)
names(bol_resp)[1] = "stringencyindex"
names(bol_resp)[2] = "dates"
names(bol_resp)[3] = "c1_schoolclosing"
names(bol_resp)[4] = "c1_flag"
names(bol_resp)[5] = "c2_workplaceclosing"
names(bol_resp)[6] = "c2_flag"
names(bol_resp)[7] = "c3_cancelpublicevents"
names(bol_resp)[8] = "c3_flag"
names(bol_resp)[9] = "c4_restrictionsongatherings"
names(bol_resp)[10] = "c4_flag"
names(bol_resp)[11] = "c5_closepublictransport"
names(bol_resp)[12] = "c5_flag"
names(bol_resp)[13] = "c6_stayathomerequirements"
names(bol_resp)[14] = "c6_flag"
names(bol_resp)[15] = "c7_domestictravel"
names(bol_resp)[16] = "c7_flag"
names(bol_resp)[17] = "c8_internationaltravel"
names(bol_resp)[18] = "h2_testingpolicy"
names(bol_resp)[19] = "h3_contacttracing"
```

### Brazil Responses

``` r
## stringencyindex
bra.stringencyindex <- slice(stringencyindex, which(stringencyindex[,1] == "Brazil"):
                               which(stringencyindex[,1] == "Brazil")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "stringency_index")
bra.stringencyindex <- slice(bra.stringencyindex, 1:136) ## 15 May
bra.stringencyindex <- data.frame(bra.stringencyindex, dates_OXF)
bra.stringencyindex$X <- NULL
bra.stringencyindex$X.1 <- NULL
bra.stringencyindex$Date <- NULL

## c1_schoolclosing
bra.c1_schoolclosing <- slice(c1_schoolclosing, which(c1_schoolclosing[,1] == "Brazil"):
                                which(c1_schoolclosing[,1] == "Brazil")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c1_schoolclosing")
bra.c1_schoolclosing <- slice(bra.c1_schoolclosing, 1:136) ## 15 May
bra.c1_schoolclosing <- data.frame(bra.c1_schoolclosing, dates_OXF)
bra.c1_schoolclosing$X <- NULL
bra.c1_schoolclosing$X.1 <- NULL
bra.c1_schoolclosing$Date <- NULL

## c1_flag
bra.c1_flag <- slice(c1_flag, which(c1_flag[,1] == "Brazil"):
                       which(c1_flag[,1] == "Brazil")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c1_flag")
bra.c1_flag <- slice(bra.c1_flag, 1:136) ## 15 May
bra.c1_flag <- data.frame(bra.c1_flag, dates_OXF)
bra.c1_flag$X <- NULL
bra.c1_flag$X.1 <- NULL
bra.c1_flag$Date <- NULL

## c2_workplaceclosing
bra.c2_workplaceclosing <- slice(c2_workplaceclosing, which(c2_workplaceclosing[,1]
                                                            == "Brazil"):
                                   which(c2_workplaceclosing[,1] == "Brazil")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c2_workplaceclosing")
bra.c2_workplaceclosing <- slice(bra.c2_workplaceclosing, 1:136) ## 15 May
bra.c2_workplaceclosing <- data.frame(bra.c2_workplaceclosing, dates_OXF)
bra.c2_workplaceclosing$X <- NULL
bra.c2_workplaceclosing$X.1 <- NULL
bra.c2_workplaceclosing$Date <- NULL

## c2_flag
bra.c2_flag <- slice(c2_flag, which(c2_flag[,1] == "Brazil"):
                       which(c2_flag[,1] == "Brazil")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c2_flag")
bra.c2_flag <- slice(bra.c2_flag, 1:136) ## 15 May
bra.c2_flag <- data.frame(bra.c2_flag, dates_OXF)
bra.c2_flag$X <- NULL
bra.c2_flag$X.1 <- NULL
bra.c2_flag$Date <- NULL

## c3_cancelpublicevents
bra.c3_cancelpublicevents <- slice(c3_cancelpublicevents, which(c3_cancelpublicevents[,1]
                                                                == "Brazil"):
                                     which(c3_cancelpublicevents[,1] == "Brazil")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c3_cancelpublicevents")
bra.c3_cancelpublicevents <- slice(bra.c3_cancelpublicevents, 1:136) ## 15 May
bra.c3_cancelpublicevents <- data.frame(bra.c3_cancelpublicevents, dates_OXF)
bra.c3_cancelpublicevents$X <- NULL
bra.c3_cancelpublicevents$X.1 <- NULL
bra.c3_cancelpublicevents$Date <- NULL

## c3_flag
bra.c3_flag <- slice(c3_flag, which(c3_flag[,1] == "Brazil"):
                       which(c3_flag[,1] == "Brazil")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c3_flag")
bra.c3_flag <- slice(bra.c3_flag, 1:136) ## 15 May
bra.c3_flag <- data.frame(bra.c3_flag, dates_OXF)
bra.c3_flag$X <- NULL
bra.c3_flag$X.1 <- NULL
bra.c3_flag$Date <- NULL

## c4_restrictionsongatherings
bra.c4_restrictionsongatherings <- slice(c4_restrictionsongatherings,
                                         which(c4_restrictionsongatherings[,1]
                                               == "Brazil"):
                                           which(c4_restrictionsongatherings[,1] 
                                                 == "Brazil")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c4_restrictionsongatherings")
bra.c4_restrictionsongatherings <- slice(bra.c4_restrictionsongatherings, 1:136) ## 15 May
bra.c4_restrictionsongatherings <- data.frame(bra.c4_restrictionsongatherings, dates_OXF)
bra.c4_restrictionsongatherings$X <- NULL
bra.c4_restrictionsongatherings$X.1 <- NULL
bra.c4_restrictionsongatherings$Date <- NULL

## c4_flag
bra.c4_flag <- slice(c4_flag, which(c4_flag[,1] == "Brazil"):
                       which(c4_flag[,1] == "Brazil")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c4_flag")
bra.c4_flag <- slice(bra.c4_flag, 1:136) ## 15 May
bra.c4_flag <- data.frame(bra.c4_flag, dates_OXF)
bra.c4_flag$X <- NULL
bra.c4_flag$X.1 <- NULL
bra.c4_flag$Date <- NULL

## c5_closepublictransport 
bra.c5_closepublictransport <- slice(c5_closepublictransport,
                                     which(c5_closepublictransport[,1] == "Brazil"):
                                       which(c5_closepublictransport[,1] == "Brazil")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c5_closepublictransport")
bra.c5_closepublictransport <- slice(bra.c5_closepublictransport, 1:136) ## 15 May
bra.c5_closepublictransport <- data.frame(bra.c5_closepublictransport, dates_OXF)
bra.c5_closepublictransport$X <- NULL
bra.c5_closepublictransport$X.1 <- NULL
bra.c5_closepublictransport$Date <- NULL

## c5_flag 
bra.c5_flag <- slice(c5_flag, which(c5_flag[,1] == "Brazil"):
                       which(c5_flag[,1] == "Brazil")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c5_flag")
bra.c5_flag <- slice(bra.c5_flag, 1:136) ## 15 May
bra.c5_flag <- data.frame(bra.c5_flag, dates_OXF)
bra.c5_flag$X <- NULL
bra.c5_flag$X.1 <- NULL
bra.c5_flag$Date <- NULL

## c6_stayathomerequirements
bra.c6_stayathomerequirements <- slice(c6_stayathomerequirements,
                                       which(c6_stayathomerequirements[,1] == "Brazil"):
                                         which(c6_stayathomerequirements[,1]
                                               == "Brazil")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c6_stayathomerequirements")
bra.c6_stayathomerequirements <- slice(bra.c6_stayathomerequirements, 1:136) ## 15 May
bra.c6_stayathomerequirements <- data.frame(bra.c6_stayathomerequirements, dates_OXF)
bra.c6_stayathomerequirements$X <- NULL
bra.c6_stayathomerequirements$X.1 <- NULL
bra.c6_stayathomerequirements$Date <- NULL

## c6_flag
bra.c6_flag <- slice(c6_flag, which(c6_flag[,1] == "Brazil"):
                       which(c6_flag[,1] == "Brazil")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c6_flag")
bra.c6_flag <- slice(bra.c6_flag, 1:136) ## 15 May
bra.c6_flag <- data.frame(bra.c6_flag, dates_OXF)
bra.c6_flag$X <- NULL
bra.c6_flag$X.1 <- NULL
bra.c6_flag$Date <- NULL

## c7_domestictravel
bra.c7_domestictravel <- slice(c7_domestictravel, which(c7_domestictravel[,1]
                                                        == "Brazil"):
                                 which(c7_domestictravel[,1] == "Brazil")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c7_domestictravel")
bra.c7_domestictravel <- slice(bra.c7_domestictravel, 1:136) ## 15 May
bra.c7_domestictravel <- data.frame(bra.c7_domestictravel, dates_OXF)
bra.c7_domestictravel$X <- NULL
bra.c7_domestictravel$X.1 <- NULL
bra.c7_domestictravel$Date <- NULL

## c7_flag 
bra.c7_flag <- slice(c7_flag, which(c7_flag[,1] == "Brazil"):
                       which(c7_flag[,1] == "Brazil")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c7_flag")
bra.c7_flag <- slice(bra.c7_flag, 1:136) ## 15 May
bra.c7_flag <- data.frame(bra.c7_flag, dates_OXF)
bra.c7_flag$X <- NULL
bra.c7_flag$X.1 <- NULL
bra.c7_flag$Date <- NULL

## c8_internationaltravel
bra.c8_internationaltravel <- slice(c8_internationaltravel,
                                    which(c8_internationaltravel[,1] == "Brazil"):
                                      which(c8_internationaltravel[,1] == "Brazil")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c8_internationaltravel")
bra.c8_internationaltravel <- slice(bra.c8_internationaltravel, 1:136) ## 15 May
bra.c8_internationaltravel <- data.frame(bra.c8_internationaltravel, dates_OXF)
bra.c8_internationaltravel$X <- NULL
bra.c8_internationaltravel$X.1 <- NULL
bra.c8_internationaltravel$Date <- NULL

## h2_testingpolicy
bra.h2_testingpolicy <- slice(h2_testingpolicy, which(h2_testingpolicy[,1] == "Brazil"):
                                which(h2_testingpolicy[,1] == "Brazil")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "h2_testingpolicy")
bra.h2_testingpolicy <- slice(bra.h2_testingpolicy, 1:136) ## 15 May
bra.h2_testingpolicy <- data.frame(bra.h2_testingpolicy, dates_OXF)
bra.h2_testingpolicy$X <- NULL
bra.h2_testingpolicy$X.1 <- NULL
bra.h2_testingpolicy$Date <- NULL

## h3_contacttracing
bra.h3_contacttracing <- slice(h3_contacttracing, which(h3_contacttracing[,1]
                                                        == "Brazil"):
                                 which(h3_contacttracing[,1] == "Brazil")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "h3_contacttracing")
bra.h3_contacttracing <- slice(bra.h3_contacttracing, 1:136) ## 15 May
bra.h3_contacttracing <- data.frame(bra.h3_contacttracing, dates_OXF)
bra.h3_contacttracing$X <- NULL
bra.h3_contacttracing$X.1 <- NULL
bra.h3_contacttracing$Date <- NULL

## Dataframe 
bra_resp <- data.frame(bra.stringencyindex, bra.c1_schoolclosing$c1_schoolclosing, 
                       bra.c1_flag$c1_flag, bra.c2_workplaceclosing$c2_workplaceclosing, 
                       bra.c2_flag$c2_flag, 
                       bra.c3_cancelpublicevents$c3_cancelpublicevents, 
                       bra.c3_flag$c3_flag, 
                       bra.c4_restrictionsongatherings$c4_restrictionsongatherings,
                       bra.c4_flag$c4_flag, 
                       bra.c5_closepublictransport$c5_closepublictransport, 
                       bra.c5_flag$c5_flag, 
                       bra.c6_stayathomerequirements$c6_stayathomerequirements,
                       bra.c6_flag$c6_flag, bra.c7_domestictravel$c7_domestictravel, 
                       bra.c7_flag$c7_flag, 
                       bra.c8_internationaltravel$c8_internationaltravel, 
                       bra.h2_testingpolicy$h2_testingpolicy, 
                       bra.h3_contacttracing$h3_contacttracing)
names(bra_resp)[1] = "stringencyindex"
names(bra_resp)[2] = "dates"
names(bra_resp)[3] = "c1_schoolclosing"
names(bra_resp)[4] = "c1_flag"
names(bra_resp)[5] = "c2_workplaceclosing"
names(bra_resp)[6] = "c2_flag"
names(bra_resp)[7] = "c3_cancelpublicevents"
names(bra_resp)[8] = "c3_flag"
names(bra_resp)[9] = "c4_restrictionsongatherings"
names(bra_resp)[10] = "c4_flag"
names(bra_resp)[11] = "c5_closepublictransport"
names(bra_resp)[12] = "c5_flag"
names(bra_resp)[13] = "c6_stayathomerequirements"
names(bra_resp)[14] = "c6_flag"
names(bra_resp)[15] = "c7_domestictravel"
names(bra_resp)[16] = "c7_flag"
names(bra_resp)[17] = "c8_internationaltravel"
names(bra_resp)[18] = "h2_testingpolicy"
names(bra_resp)[19] = "h3_contacttracing"
```

### Chile Responses

``` r
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
chl.c1_flag <- slice(c1_flag, which(c1_flag[,1] == "Chile"):
                       which(c1_flag[,1] == "Chile")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c1_flag")
chl.c1_flag <- slice(chl.c1_flag, 1:136) ## 15 May
chl.c1_flag <- data.frame(chl.c1_flag, dates_OXF)
chl.c1_flag$X <- NULL
chl.c1_flag$X.1 <- NULL
chl.c1_flag$Date <- NULL

## c2_workplaceclosing
chl.c2_workplaceclosing <- slice(c2_workplaceclosing, which(c2_workplaceclosing[,1]
                                                            == "Chile"):
                                   which(c2_workplaceclosing[,1] == "Chile")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c2_workplaceclosing")
chl.c2_workplaceclosing <- slice(chl.c2_workplaceclosing, 1:136) ## 15 May
chl.c2_workplaceclosing <- data.frame(chl.c2_workplaceclosing, dates_OXF)
chl.c2_workplaceclosing$X <- NULL
chl.c2_workplaceclosing$X.1 <- NULL
chl.c2_workplaceclosing$Date <- NULL

## c2_flag
chl.c2_flag <- slice(c2_flag, which(c2_flag[,1] == "Chile"):
                       which(c2_flag[,1] == "Chile")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c2_flag")
chl.c2_flag <- slice(chl.c2_flag, 1:136) ## 15 May
chl.c2_flag <- data.frame(chl.c2_flag, dates_OXF)
chl.c2_flag$X <- NULL
chl.c2_flag$X.1 <- NULL
chl.c2_flag$Date <- NULL

## c3_cancelpublicevents
chl.c3_cancelpublicevents <- slice(c3_cancelpublicevents, which(c3_cancelpublicevents[,1]
                                                                == "Chile"):
                                     which(c3_cancelpublicevents[,1] == "Chile")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c3_cancelpublicevents")
chl.c3_cancelpublicevents <- slice(chl.c3_cancelpublicevents, 1:136) ## 15 May
chl.c3_cancelpublicevents <- data.frame(chl.c3_cancelpublicevents, dates_OXF)
chl.c3_cancelpublicevents$X <- NULL
chl.c3_cancelpublicevents$X.1 <- NULL
chl.c3_cancelpublicevents$Date <- NULL

## c3_flag
chl.c3_flag <- slice(c3_flag, which(c3_flag[,1] == "Chile"):
                       which(c3_flag[,1] == "Chile")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c3_flag")
chl.c3_flag <- slice(chl.c3_flag, 1:136) ## 15 May
chl.c3_flag <- data.frame(chl.c3_flag, dates_OXF)
chl.c3_flag$X <- NULL
chl.c3_flag$X.1 <- NULL
chl.c3_flag$Date <- NULL

## c4_restrictionsongatherings
chl.c4_restrictionsongatherings <- slice(c4_restrictionsongatherings,
                                         which(c4_restrictionsongatherings[,1]
                                               == "Chile"):
                                           which(c4_restrictionsongatherings[,1]
                                                 == "Chile")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c4_restrictionsongatherings")
chl.c4_restrictionsongatherings <- slice(chl.c4_restrictionsongatherings, 1:136) ## 15 May
chl.c4_restrictionsongatherings <- data.frame(chl.c4_restrictionsongatherings, dates_OXF)
chl.c4_restrictionsongatherings$X <- NULL
chl.c4_restrictionsongatherings$X.1 <- NULL
chl.c4_restrictionsongatherings$Date <- NULL

## c4_flag
chl.c4_flag <- slice(c4_flag, which(c4_flag[,1] == "Chile"):
                       which(c4_flag[,1] == "Chile")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c4_flag")
chl.c4_flag <- slice(chl.c4_flag, 1:136) ## 15 May
chl.c4_flag <- data.frame(chl.c4_flag, dates_OXF)
chl.c4_flag$X <- NULL
chl.c4_flag$X.1 <- NULL
chl.c4_flag$Date <- NULL

## c5_closepublictransport 
chl.c5_closepublictransport <- slice(c5_closepublictransport,
                                     which(c5_closepublictransport[,1] == "Chile"):
                                       which(c5_closepublictransport[,1] == "Chile")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c5_closepublictransport")
chl.c5_closepublictransport <- slice(chl.c5_closepublictransport, 1:136) ## 15 May
chl.c5_closepublictransport <- data.frame(chl.c5_closepublictransport, dates_OXF)
chl.c5_closepublictransport$X <- NULL
chl.c5_closepublictransport$X.1 <- NULL
chl.c5_closepublictransport$Date <- NULL

## c5_flag 
chl.c5_flag <- slice(c5_flag, which(c5_flag[,1] == "Chile"):
                       which(c5_flag[,1] == "Chile")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c5_flag")
chl.c5_flag <- slice(chl.c5_flag, 1:136) ## 15 May
chl.c5_flag <- data.frame(chl.c5_flag, dates_OXF)
chl.c5_flag$X <- NULL
chl.c5_flag$X.1 <- NULL
chl.c5_flag$Date <- NULL

## c6_stayathomerequirements
chl.c6_stayathomerequirements <- slice(c6_stayathomerequirements,
                                       which(c6_stayathomerequirements[,1] == "Chile"):
                                         which(c6_stayathomerequirements[,1]
                                               == "Chile")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c6_stayathomerequirements")
chl.c6_stayathomerequirements <- slice(chl.c6_stayathomerequirements, 1:136) ## 15 May
chl.c6_stayathomerequirements <- data.frame(chl.c6_stayathomerequirements, dates_OXF)
chl.c6_stayathomerequirements$X <- NULL
chl.c6_stayathomerequirements$X.1 <- NULL
chl.c6_stayathomerequirements$Date <- NULL

## c6_flag
chl.c6_flag <- slice(c6_flag, which(c6_flag[,1] == "Chile"):
                       which(c6_flag[,1] == "Chile")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c6_flag")
chl.c6_flag <- slice(chl.c6_flag, 1:136) ## 15 May
chl.c6_flag <- data.frame(chl.c6_flag, dates_OXF)
chl.c6_flag$X <- NULL
chl.c6_flag$X.1 <- NULL
chl.c6_flag$Date <- NULL

## c7_domestictravel
chl.c7_domestictravel <- slice(c7_domestictravel, which(c7_domestictravel[,1] == "Chile"):
                                 which(c7_domestictravel[,1] == "Chile")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c7_domestictravel")
chl.c7_domestictravel <- slice(chl.c7_domestictravel, 1:136) ## 15 May
chl.c7_domestictravel <- data.frame(chl.c7_domestictravel, dates_OXF)
chl.c7_domestictravel$X <- NULL
chl.c7_domestictravel$X.1 <- NULL
chl.c7_domestictravel$Date <- NULL

## c7_flag 
chl.c7_flag <- slice(c7_flag, which(c7_flag[,1] == "Chile"):
                       which(c7_flag[,1] == "Chile")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c7_flag")
chl.c7_flag <- slice(chl.c7_flag, 1:136) ## 15 May
chl.c7_flag <- data.frame(chl.c7_flag, dates_OXF)
chl.c7_flag$X <- NULL
chl.c7_flag$X.1 <- NULL
chl.c7_flag$Date <- NULL

## c8_internationaltravel
chl.c8_internationaltravel <- slice(c8_internationaltravel,
                                    which(c8_internationaltravel[,1] == "Chile"):
                                      which(c8_internationaltravel[,1] == "Chile")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c8_internationaltravel")
chl.c8_internationaltravel <- slice(chl.c8_internationaltravel, 1:136) ## 15 May
chl.c8_internationaltravel <- data.frame(chl.c8_internationaltravel, dates_OXF)
chl.c8_internationaltravel$X <- NULL
chl.c8_internationaltravel$X.1 <- NULL
chl.c8_internationaltravel$Date <- NULL

## h2_testingpolicy
chl.h2_testingpolicy <- slice(h2_testingpolicy, which(h2_testingpolicy[,1] == "Chile"):
                                which(h2_testingpolicy[,1] == "Chile")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "h2_testingpolicy")
chl.h2_testingpolicy <- slice(chl.h2_testingpolicy, 1:136) ## 15 May
chl.h2_testingpolicy <- data.frame(chl.h2_testingpolicy, dates_OXF)
chl.h2_testingpolicy$X <- NULL
chl.h2_testingpolicy$X.1 <- NULL
chl.h2_testingpolicy$Date <- NULL

## h3_contacttracing
chl.h3_contacttracing <- slice(h3_contacttracing, which(h3_contacttracing[,1] == "Chile"):
                                 which(h3_contacttracing[,1] == "Chile")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "h3_contacttracing")
chl.h3_contacttracing <- slice(chl.h3_contacttracing, 1:136) ## 15 May
chl.h3_contacttracing <- data.frame(chl.h3_contacttracing, dates_OXF)
chl.h3_contacttracing$X <- NULL
chl.h3_contacttracing$X.1 <- NULL
chl.h3_contacttracing$Date <- NULL

## Dataframe 
chl_resp <- data.frame(chl.stringencyindex, chl.c1_schoolclosing$c1_schoolclosing, 
                       chl.c1_flag$c1_flag, chl.c2_workplaceclosing$c2_workplaceclosing, 
                       chl.c2_flag$c2_flag, 
                       chl.c3_cancelpublicevents$c3_cancelpublicevents, 
                       chl.c3_flag$c3_flag, 
                       chl.c4_restrictionsongatherings$c4_restrictionsongatherings,
                       chl.c4_flag$c4_flag, 
                       chl.c5_closepublictransport$c5_closepublictransport, 
                       chl.c5_flag$c5_flag, 
                       chl.c6_stayathomerequirements$c6_stayathomerequirements,
                       chl.c6_flag$c6_flag, chl.c7_domestictravel$c7_domestictravel, 
                       chl.c7_flag$c7_flag, 
                       chl.c8_internationaltravel$c8_internationaltravel, 
                       chl.h2_testingpolicy$h2_testingpolicy, 
                       chl.h3_contacttracing$h3_contacttracing)
names(chl_resp)[1] = "stringencyindex"
names(chl_resp)[2] = "dates"
names(chl_resp)[3] = "c1_schoolclosing"
names(chl_resp)[4] = "c1_flag"
names(chl_resp)[5] = "c2_workplaceclosing"
names(chl_resp)[6] = "c2_flag"
names(chl_resp)[7] = "c3_cancelpublicevents"
names(chl_resp)[8] = "c3_flag"
names(chl_resp)[9] = "c4_restrictionsongatherings"
names(chl_resp)[10] = "c4_flag"
names(chl_resp)[11] = "c5_closepublictransport"
names(chl_resp)[12] = "c5_flag"
names(chl_resp)[13] = "c6_stayathomerequirements"
names(chl_resp)[14] = "c6_flag"
names(chl_resp)[15] = "c7_domestictravel"
names(chl_resp)[16] = "c7_flag"
names(chl_resp)[17] = "c8_internationaltravel"
names(chl_resp)[18] = "h2_testingpolicy"
names(chl_resp)[19] = "h3_contacttracing"
```

### Colombia Responses

``` r
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
col.c1_flag <- slice(c1_flag, which(c1_flag[,1] == "Colombia"):
                       which(c1_flag[,1] == "Colombia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c1_flag")
col.c1_flag <- slice(col.c1_flag, 1:136) ## 15 May
col.c1_flag <- data.frame(col.c1_flag, dates_OXF)
col.c1_flag$X <- NULL
col.c1_flag$X.1 <- NULL
col.c1_flag$Date <- NULL

## c2_workplaceclosing
col.c2_workplaceclosing <- slice(c2_workplaceclosing, which(c2_workplaceclosing[,1]
                                                            == "Colombia"):
                                   which(c2_workplaceclosing[,1] == "Colombia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c2_workplaceclosing")
col.c2_workplaceclosing <- slice(col.c2_workplaceclosing, 1:136) ## 15 May
col.c2_workplaceclosing <- data.frame(col.c2_workplaceclosing, dates_OXF)
col.c2_workplaceclosing$X <- NULL
col.c2_workplaceclosing$X.1 <- NULL
col.c2_workplaceclosing$Date <- NULL

## c2_flag
col.c2_flag <- slice(c2_flag, which(c2_flag[,1] == "Colombia"):
                       which(c2_flag[,1] == "Colombia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c2_flag")
col.c2_flag <- slice(col.c2_flag, 1:136) ## 15 May
col.c2_flag <- data.frame(col.c2_flag, dates_OXF)
col.c2_flag$X <- NULL
col.c2_flag$X.1 <- NULL
col.c2_flag$Date <- NULL

## c3_cancelpublicevents
col.c3_cancelpublicevents <- slice(c3_cancelpublicevents, which(c3_cancelpublicevents[,1]
                                                                == "Colombia"):
                                     which(c3_cancelpublicevents[,1] == "Colombia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c3_cancelpublicevents")
col.c3_cancelpublicevents <- slice(col.c3_cancelpublicevents, 1:136) ## 15 May
col.c3_cancelpublicevents <- data.frame(col.c3_cancelpublicevents, dates_OXF)
col.c3_cancelpublicevents$X <- NULL
col.c3_cancelpublicevents$X.1 <- NULL
col.c3_cancelpublicevents$Date <- NULL

## c3_flag
col.c3_flag <- slice(c3_flag, which(c3_flag[,1] == "Colombia"):
                       which(c3_flag[,1] == "Colombia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c3_flag")
col.c3_flag <- slice(col.c3_flag, 1:136) ## 15 May
col.c3_flag <- data.frame(col.c3_flag, dates_OXF)
col.c3_flag$X <- NULL
col.c3_flag$X.1 <- NULL
col.c3_flag$Date <- NULL

## c4_restrictionsongatherings
col.c4_restrictionsongatherings <- slice(c4_restrictionsongatherings,
                                         which(c4_restrictionsongatherings[,1]
                                               == "Colombia"):
                                           which(c4_restrictionsongatherings[,1]
                                                 == "Colombia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c4_restrictionsongatherings")
col.c4_restrictionsongatherings <- slice(col.c4_restrictionsongatherings, 1:136) ## 15 May
col.c4_restrictionsongatherings <- data.frame(col.c4_restrictionsongatherings, dates_OXF)
col.c4_restrictionsongatherings$X <- NULL
col.c4_restrictionsongatherings$X.1 <- NULL
col.c4_restrictionsongatherings$Date <- NULL

## c4_flag
col.c4_flag <- slice(c4_flag, which(c4_flag[,1] == "Colombia"):
                       which(c4_flag[,1] == "Colombia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c4_flag")
col.c4_flag <- slice(col.c4_flag, 1:136) ## 15 May
col.c4_flag <- data.frame(col.c4_flag, dates_OXF)
col.c4_flag$X <- NULL
col.c4_flag$X.1 <- NULL
col.c4_flag$Date <- NULL

## c5_closepublictransport 
col.c5_closepublictransport <- slice(c5_closepublictransport, 
                                     which(c5_closepublictransport[,1] 
                                           == "Colombia"):
                                       which(c5_closepublictransport[,1] 
                                             == "Colombia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c5_closepublictransport")
col.c5_closepublictransport <- slice(col.c5_closepublictransport, 1:136) ## 15 May
col.c5_closepublictransport <- data.frame(col.c5_closepublictransport, dates_OXF)
col.c5_closepublictransport$X <- NULL
col.c5_closepublictransport$X.1 <- NULL
col.c5_closepublictransport$Date <- NULL

## c5_flag 
col.c5_flag <- slice(c5_flag, which(c5_flag[,1] == "Colombia"):
                       which(c5_flag[,1] == "Colombia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c5_flag")
col.c5_flag <- slice(col.c5_flag, 1:136) ## 15 May
col.c5_flag <- data.frame(col.c5_flag, dates_OXF)
col.c5_flag$X <- NULL
col.c5_flag$X.1 <- NULL
col.c5_flag$Date <- NULL

## c6_stayathomerequirements
col.c6_stayathomerequirements <- slice(c6_stayathomerequirements,
                                       which(c6_stayathomerequirements[,1] == "Colombia"):
                                         which(c6_stayathomerequirements[,1] 
                                               == "Colombia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c6_stayathomerequirements")
col.c6_stayathomerequirements <- slice(col.c6_stayathomerequirements, 1:136) ## 15 May
col.c6_stayathomerequirements <- data.frame(col.c6_stayathomerequirements, dates_OXF)
col.c6_stayathomerequirements$X <- NULL
col.c6_stayathomerequirements$X.1 <- NULL
col.c6_stayathomerequirements$Date <- NULL

## c6_flag
col.c6_flag <- slice(c6_flag, which(c6_flag[,1] == "Colombia"):
                       which(c6_flag[,1] == "Colombia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c6_flag")
col.c6_flag <- slice(col.c6_flag, 1:136) ## 15 May
col.c6_flag <- data.frame(col.c6_flag, dates_OXF)
col.c6_flag$X <- NULL
col.c6_flag$X.1 <- NULL
col.c6_flag$Date <- NULL

## c7_domestictravel
col.c7_domestictravel <- slice(c7_domestictravel, which(c7_domestictravel[,1]
                                                        == "Colombia"):
                                 which(c7_domestictravel[,1] == "Colombia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c7_domestictravel")
col.c7_domestictravel <- slice(col.c7_domestictravel, 1:136) ## 15 May
col.c7_domestictravel <- data.frame(col.c7_domestictravel, dates_OXF)
col.c7_domestictravel$X <- NULL
col.c7_domestictravel$X.1 <- NULL
col.c7_domestictravel$Date <- NULL

## c7_flag 
col.c7_flag <- slice(c7_flag, which(c7_flag[,1] == "Colombia"):
                       which(c7_flag[,1] == "Colombia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c7_flag")
col.c7_flag <- slice(col.c7_flag, 1:136) ## 15 May
col.c7_flag <- data.frame(col.c7_flag, dates_OXF)
col.c7_flag$X <- NULL
col.c7_flag$X.1 <- NULL
col.c7_flag$Date <- NULL

## c8_internationaltravel
col.c8_internationaltravel <- slice(c8_internationaltravel, 
                                    which(c8_internationaltravel[,1] == "Colombia"):
                                      which(c8_internationaltravel[,1] == "Colombia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c8_internationaltravel")
col.c8_internationaltravel <- slice(col.c8_internationaltravel, 1:136) ## 15 May
col.c8_internationaltravel <- data.frame(col.c8_internationaltravel, dates_OXF)
col.c8_internationaltravel$X <- NULL
col.c8_internationaltravel$X.1 <- NULL
col.c8_internationaltravel$Date <- NULL

## h2_testingpolicy
col.h2_testingpolicy <- slice(h2_testingpolicy, which(h2_testingpolicy[,1] == "Colombia"):
                                which(h2_testingpolicy[,1] == "Colombia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "h2_testingpolicy")
col.h2_testingpolicy <- slice(col.h2_testingpolicy, 1:136) ## 15 May
col.h2_testingpolicy <- data.frame(col.h2_testingpolicy, dates_OXF)
col.h2_testingpolicy$X <- NULL
col.h2_testingpolicy$X.1 <- NULL
col.h2_testingpolicy$Date <- NULL

## h3_contacttracing
col.h3_contacttracing <- slice(h3_contacttracing, which(h3_contacttracing[,1] 
                                                        == "Colombia"):
                                 which(h3_contacttracing[,1] == "Colombia")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "h3_contacttracing")
col.h3_contacttracing <- slice(col.h3_contacttracing, 1:136) ## 15 May
col.h3_contacttracing <- data.frame(col.h3_contacttracing, dates_OXF)
col.h3_contacttracing$X <- NULL
col.h3_contacttracing$X.1 <- NULL
col.h3_contacttracing$Date <- NULL

## Dataframe 
col_resp <- data.frame(col.stringencyindex, col.c1_schoolclosing$c1_schoolclosing, 
                       col.c1_flag$c1_flag, col.c2_workplaceclosing$c2_workplaceclosing, 
                       col.c2_flag$c2_flag, 
                       col.c3_cancelpublicevents$c3_cancelpublicevents, 
                       col.c3_flag$c3_flag, 
                       col.c4_restrictionsongatherings$c4_restrictionsongatherings,
                       col.c4_flag$c4_flag, 
                       col.c5_closepublictransport$c5_closepublictransport, 
                       col.c5_flag$c5_flag, 
                       col.c6_stayathomerequirements$c6_stayathomerequirements,
                       col.c6_flag$c6_flag, col.c7_domestictravel$c7_domestictravel, 
                       col.c7_flag$c7_flag,
                       col.c8_internationaltravel$c8_internationaltravel, 
                       col.h2_testingpolicy$h2_testingpolicy, 
                       col.h3_contacttracing$h3_contacttracing)
names(col_resp)[1] = "stringencyindex"
names(col_resp)[2] = "dates"
names(col_resp)[3] = "c1_schoolclosing"
names(col_resp)[4] = "c1_flag"
names(col_resp)[5] = "c2_workplaceclosing"
names(col_resp)[6] = "c2_flag"
names(col_resp)[7] = "c3_cancelpublicevents"
names(col_resp)[8] = "c3_flag"
names(col_resp)[9] = "c4_restrictionsongatherings"
names(col_resp)[10] = "c4_flag"
names(col_resp)[11] = "c5_closepublictransport"
names(col_resp)[12] = "c5_flag"
names(col_resp)[13] = "c6_stayathomerequirements"
names(col_resp)[14] = "c6_flag"
names(col_resp)[15] = "c7_domestictravel"
names(col_resp)[16] = "c7_flag"
names(col_resp)[17] = "c8_internationaltravel"
names(col_resp)[18] = "h2_testingpolicy"
names(col_resp)[19] = "h3_contacttracing"
```

### Paraguay Responses

``` r
## stringencyindex
pry.stringencyindex <- slice(stringencyindex, which(stringencyindex[,1] == "Paraguay"):
                               which(stringencyindex[,1] == "Paraguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "stringency_index")
pry.stringencyindex <- slice(pry.stringencyindex, 1:136) ## 15 May
pry.stringencyindex <- data.frame(pry.stringencyindex, dates_OXF)
pry.stringencyindex$X <- NULL
pry.stringencyindex$X.1 <- NULL
pry.stringencyindex$Date <- NULL

## c1_schoolclosing
pry.c1_schoolclosing <- slice(c1_schoolclosing, which(c1_schoolclosing[,1] == "Paraguay"):
                                which(c1_schoolclosing[,1] == "Paraguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c1_schoolclosing")
pry.c1_schoolclosing <- slice(pry.c1_schoolclosing, 1:136) ## 15 May
pry.c1_schoolclosing <- data.frame(pry.c1_schoolclosing, dates_OXF)
pry.c1_schoolclosing$X <- NULL
pry.c1_schoolclosing$X.1 <- NULL
pry.c1_schoolclosing$Date <- NULL

## c1_flag
pry.c1_flag <- slice(c1_flag, which(c1_flag[,1] == "Paraguay"):
                       which(c1_flag[,1] == "Paraguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c1_flag")
pry.c1_flag <- slice(pry.c1_flag, 1:136) ## 15 May
pry.c1_flag <- data.frame(pry.c1_flag, dates_OXF)
pry.c1_flag$X <- NULL
pry.c1_flag$X.1 <- NULL
pry.c1_flag$Date <- NULL

## c2_workplaceclosing
pry.c2_workplaceclosing <- slice(c2_workplaceclosing, which(c2_workplaceclosing[,1]
                                                            == "Paraguay"):
                                   which(c2_workplaceclosing[,1] == "Paraguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c2_workplaceclosing")
pry.c2_workplaceclosing <- slice(pry.c2_workplaceclosing, 1:136) ## 15 May
pry.c2_workplaceclosing <- data.frame(pry.c2_workplaceclosing, dates_OXF)
pry.c2_workplaceclosing$X <- NULL
pry.c2_workplaceclosing$X.1 <- NULL
pry.c2_workplaceclosing$Date <- NULL

## c2_flag
pry.c2_flag <- slice(c2_flag, which(c2_flag[,1] == "Paraguay"):
                       which(c2_flag[,1] == "Paraguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c2_flag")
pry.c2_flag <- slice(pry.c2_flag, 1:136) ## 15 May
pry.c2_flag <- data.frame(pry.c2_flag, dates_OXF)
pry.c2_flag$X <- NULL
pry.c2_flag$X.1 <- NULL
pry.c2_flag$Date <- NULL

## c3_cancelpublicevents
pry.c3_cancelpublicevents <- slice(c3_cancelpublicevents, which(c3_cancelpublicevents[,1]
                                                                == "Paraguay"):
                                     which(c3_cancelpublicevents[,1] == "Paraguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c3_cancelpublicevents")
pry.c3_cancelpublicevents <- slice(pry.c3_cancelpublicevents, 1:136) ## 15 May
pry.c3_cancelpublicevents <- data.frame(pry.c3_cancelpublicevents, dates_OXF)
pry.c3_cancelpublicevents$X <- NULL
pry.c3_cancelpublicevents$X.1 <- NULL
pry.c3_cancelpublicevents$Date <- NULL

## c3_flag
pry.c3_flag <- slice(c3_flag, which(c3_flag[,1] == "Paraguay"):
                       which(c3_flag[,1] == "Paraguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c3_flag")
pry.c3_flag <- slice(pry.c3_flag, 1:136) ## 15 May
pry.c3_flag <- data.frame(pry.c3_flag, dates_OXF)
pry.c3_flag$X <- NULL
pry.c3_flag$X.1 <- NULL
pry.c3_flag$Date <- NULL

## c4_restrictionsongatherings
pry.c4_restrictionsongatherings <- slice(c4_restrictionsongatherings,
                                         which(c4_restrictionsongatherings[,1] 
                                               == "Paraguay"):
                                           which(c4_restrictionsongatherings[,1] 
                                                 == "Paraguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c4_restrictionsongatherings")
pry.c4_restrictionsongatherings <- slice(pry.c4_restrictionsongatherings, 1:136) ## 15 May
pry.c4_restrictionsongatherings <- data.frame(pry.c4_restrictionsongatherings, dates_OXF)
pry.c4_restrictionsongatherings$X <- NULL
pry.c4_restrictionsongatherings$X.1 <- NULL
pry.c4_restrictionsongatherings$Date <- NULL

## c4_flag
pry.c4_flag <- slice(c4_flag, which(c4_flag[,1] == "Paraguay"):
                       which(c4_flag[,1] == "Paraguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c4_flag")
pry.c4_flag <- slice(pry.c4_flag, 1:136) ## 15 May
pry.c4_flag <- data.frame(pry.c4_flag, dates_OXF)
pry.c4_flag$X <- NULL
pry.c4_flag$X.1 <- NULL
pry.c4_flag$Date <- NULL

## c5_closepublictransport 
pry.c5_closepublictransport <- slice(c5_closepublictransport, 
                                     which(c5_closepublictransport[,1] 
                                           == "Paraguay"):
                                       which(c5_closepublictransport[,1] 
                                             == "Paraguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c5_closepublictransport")
pry.c5_closepublictransport <- slice(pry.c5_closepublictransport, 1:136) ## 15 May
pry.c5_closepublictransport <- data.frame(pry.c5_closepublictransport, dates_OXF)
pry.c5_closepublictransport$X <- NULL
pry.c5_closepublictransport$X.1 <- NULL
pry.c5_closepublictransport$Date <- NULL

## c5_flag 
pry.c5_flag <- slice(c5_flag, which(c5_flag[,1] == "Paraguay"):
                       which(c5_flag[,1] == "Paraguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c5_flag")
pry.c5_flag <- slice(pry.c5_flag, 1:136) ## 15 May
pry.c5_flag <- data.frame(pry.c5_flag, dates_OXF)
pry.c5_flag$X <- NULL
pry.c5_flag$X.1 <- NULL
pry.c5_flag$Date <- NULL

## c6_stayathomerequirements
pry.c6_stayathomerequirements <- slice(c6_stayathomerequirements, 
                                       which(c6_stayathomerequirements[,1] == "Paraguay"):
                                         which(c6_stayathomerequirements[,1]
                                               == "Paraguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c6_stayathomerequirements")
pry.c6_stayathomerequirements <- slice(pry.c6_stayathomerequirements, 1:136) ## 15 May
pry.c6_stayathomerequirements <- data.frame(pry.c6_stayathomerequirements, dates_OXF)
pry.c6_stayathomerequirements$X <- NULL
pry.c6_stayathomerequirements$X.1 <- NULL
pry.c6_stayathomerequirements$Date <- NULL

## c6_flag
pry.c6_flag <- slice(c6_flag, which(c6_flag[,1] == "Paraguay"):
                       which(c6_flag[,1] == "Paraguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c6_flag")
pry.c6_flag <- slice(pry.c6_flag, 1:136) ## 15 May
pry.c6_flag <- data.frame(pry.c6_flag, dates_OXF)
pry.c6_flag$X <- NULL
pry.c6_flag$X.1 <- NULL
pry.c6_flag$Date <- NULL

## c7_domestictravel
pry.c7_domestictravel <- slice(c7_domestictravel, which(c7_domestictravel[,1] 
                                                        == "Paraguay"):
                                 which(c7_domestictravel[,1] == "Paraguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c7_domestictravel")
pry.c7_domestictravel <- slice(pry.c7_domestictravel, 1:136) ## 15 May
pry.c7_domestictravel <- data.frame(pry.c7_domestictravel, dates_OXF)
pry.c7_domestictravel$X <- NULL
pry.c7_domestictravel$X.1 <- NULL
pry.c7_domestictravel$Date <- NULL

## c7_flag 
pry.c7_flag <- slice(c7_flag, which(c7_flag[,1] == "Paraguay"):
                       which(c7_flag[,1] == "Paraguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c7_flag")
pry.c7_flag <- slice(pry.c7_flag, 1:136) ## 15 May
pry.c7_flag <- data.frame(pry.c7_flag, dates_OXF)
pry.c7_flag$X <- NULL
pry.c7_flag$X.1 <- NULL
pry.c7_flag$Date <- NULL

## c8_internationaltravel
pry.c8_internationaltravel <- slice(c8_internationaltravel, 
                                    which(c8_internationaltravel[,1] == "Paraguay"):
                                      which(c8_internationaltravel[,1] == "Paraguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c8_internationaltravel")
pry.c8_internationaltravel <- slice(pry.c8_internationaltravel, 1:136) ## 15 May
pry.c8_internationaltravel <- data.frame(pry.c8_internationaltravel, dates_OXF)
pry.c8_internationaltravel$X <- NULL
pry.c8_internationaltravel$X.1 <- NULL
pry.c8_internationaltravel$Date <- NULL

## h2_testingpolicy
pry.h2_testingpolicy <- slice(h2_testingpolicy, which(h2_testingpolicy[,1] == "Paraguay"):
                                which(h2_testingpolicy[,1] == "Paraguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "h2_testingpolicy")
pry.h2_testingpolicy <- slice(pry.h2_testingpolicy, 1:136) ## 15 May
pry.h2_testingpolicy <- data.frame(pry.h2_testingpolicy, dates_OXF)
pry.h2_testingpolicy$X <- NULL
pry.h2_testingpolicy$X.1 <- NULL
pry.h2_testingpolicy$Date <- NULL

## h3_contacttracing
pry.h3_contacttracing <- slice(h3_contacttracing, which(h3_contacttracing[,1] 
                                                        == "Paraguay"):
                                 which(h3_contacttracing[,1] == "Paraguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "h3_contacttracing")
pry.h3_contacttracing <- slice(pry.h3_contacttracing, 1:136) ## 15 May
pry.h3_contacttracing <- data.frame(pry.h3_contacttracing, dates_OXF)
pry.h3_contacttracing$X <- NULL
pry.h3_contacttracing$X.1 <- NULL
pry.h3_contacttracing$Date <- NULL

## Dataframe 
pry_resp <- data.frame(pry.stringencyindex, pry.c1_schoolclosing$c1_schoolclosing, 
                       pry.c1_flag$c1_flag, pry.c2_workplaceclosing$c2_workplaceclosing, 
                       pry.c2_flag$c2_flag, 
                       pry.c3_cancelpublicevents$c3_cancelpublicevents, 
                       pry.c3_flag$c3_flag, 
                       pry.c4_restrictionsongatherings$c4_restrictionsongatherings,
                       pry.c4_flag$c4_flag, 
                       pry.c5_closepublictransport$c5_closepublictransport, 
                       pry.c5_flag$c5_flag, 
                       pry.c6_stayathomerequirements$c6_stayathomerequirements,
                       pry.c6_flag$c6_flag, pry.c7_domestictravel$c7_domestictravel, 
                       pry.c7_flag$c7_flag, 
                       pry.c8_internationaltravel$c8_internationaltravel, 
                       pry.h2_testingpolicy$h2_testingpolicy, 
                       pry.h3_contacttracing$h3_contacttracing)
names(pry_resp)[1] = "stringencyindex"
names(pry_resp)[2] = "dates"
names(pry_resp)[3] = "c1_schoolclosing"
names(pry_resp)[4] = "c1_flag"
names(pry_resp)[5] = "c2_workplaceclosing"
names(pry_resp)[6] = "c2_flag"
names(pry_resp)[7] = "c3_cancelpublicevents"
names(pry_resp)[8] = "c3_flag"
names(pry_resp)[9] = "c4_restrictionsongatherings"
names(pry_resp)[10] = "c4_flag"
names(pry_resp)[11] = "c5_closepublictransport"
names(pry_resp)[12] = "c5_flag"
names(pry_resp)[13] = "c6_stayathomerequirements"
names(pry_resp)[14] = "c6_flag"
names(pry_resp)[15] = "c7_domestictravel"
names(pry_resp)[16] = "c7_flag"
names(pry_resp)[17] = "c8_internationaltravel"
names(pry_resp)[18] = "h2_testingpolicy"
names(pry_resp)[19] = "h3_contacttracing"
```

### Peru Responses

``` r
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
per.c1_flag <- slice(c1_flag, which(c1_flag[,1] == "Peru"):
                       which(c1_flag[,1] == "Peru")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c1_flag")
per.c1_flag <- slice(per.c1_flag, 1:136) ## 15 May
per.c1_flag <- data.frame(per.c1_flag, dates_OXF)
per.c1_flag$X <- NULL
per.c1_flag$X.1 <- NULL
per.c1_flag$Date <- NULL

## c2_workplaceclosing
per.c2_workplaceclosing <- slice(c2_workplaceclosing, which(c2_workplaceclosing[,1]
                                                            == "Peru"):
                                   which(c2_workplaceclosing[,1] == "Peru")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c2_workplaceclosing")
per.c2_workplaceclosing <- slice(per.c2_workplaceclosing, 1:136) ## 15 May
per.c2_workplaceclosing <- data.frame(per.c2_workplaceclosing, dates_OXF)
per.c2_workplaceclosing$X <- NULL
per.c2_workplaceclosing$X.1 <- NULL
per.c2_workplaceclosing$Date <- NULL

## c2_flag
per.c2_flag <- slice(c2_flag, which(c2_flag[,1] == "Peru"):
                       which(c2_flag[,1] == "Peru")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c2_flag")
per.c2_flag <- slice(per.c2_flag, 1:136) ## 15 May
per.c2_flag <- data.frame(per.c2_flag, dates_OXF)
per.c2_flag$X <- NULL
per.c2_flag$X.1 <- NULL
per.c2_flag$Date <- NULL

## c3_cancelpublicevents
per.c3_cancelpublicevents <- slice(c3_cancelpublicevents, which(c3_cancelpublicevents[,1]
                                                                == "Peru"):
                                     which(c3_cancelpublicevents[,1] == "Peru")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c3_cancelpublicevents")
per.c3_cancelpublicevents <- slice(per.c3_cancelpublicevents, 1:136) ## 15 May
per.c3_cancelpublicevents <- data.frame(per.c3_cancelpublicevents, dates_OXF)
per.c3_cancelpublicevents$X <- NULL
per.c3_cancelpublicevents$X.1 <- NULL
per.c3_cancelpublicevents$Date <- NULL

## c3_flag
per.c3_flag <- slice(c3_flag, which(c3_flag[,1] == "Peru"):
                       which(c3_flag[,1] == "Peru")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c3_flag")
per.c3_flag <- slice(per.c3_flag, 1:136) ## 15 May
per.c3_flag <- data.frame(per.c3_flag, dates_OXF)
per.c3_flag$X <- NULL
per.c3_flag$X.1 <- NULL
per.c3_flag$Date <- NULL

## c4_restrictionsongatherings
per.c4_restrictionsongatherings <- slice(c4_restrictionsongatherings,
                                         which(c4_restrictionsongatherings[,1]
                                               == "Peru"):
                                           which(c4_restrictionsongatherings[,1]
                                                 == "Peru")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c4_restrictionsongatherings")
per.c4_restrictionsongatherings <- slice(per.c4_restrictionsongatherings, 1:136) ## 15 May
per.c4_restrictionsongatherings <- data.frame(per.c4_restrictionsongatherings, dates_OXF)
per.c4_restrictionsongatherings$X <- NULL
per.c4_restrictionsongatherings$X.1 <- NULL
per.c4_restrictionsongatherings$Date <- NULL

## c4_flag
per.c4_flag <- slice(c4_flag, which(c4_flag[,1] == "Peru"):
                       which(c4_flag[,1] == "Peru")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c4_flag")
per.c4_flag <- slice(per.c4_flag, 1:136) ## 15 May
per.c4_flag <- data.frame(per.c4_flag, dates_OXF)
per.c4_flag$X <- NULL
per.c4_flag$X.1 <- NULL
per.c4_flag$Date <- NULL

## c5_closepublictransport 
per.c5_closepublictransport <- slice(c5_closepublictransport,
                                     which(c5_closepublictransport[,1] == "Peru"):
                                       which(c5_closepublictransport[,1] == "Peru")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c5_closepublictransport")
per.c5_closepublictransport <- slice(per.c5_closepublictransport, 1:136) ## 15 May
per.c5_closepublictransport <- data.frame(per.c5_closepublictransport, dates_OXF)
per.c5_closepublictransport$X <- NULL
per.c5_closepublictransport$X.1 <- NULL
per.c5_closepublictransport$Date <- NULL

## c5_flag 
per.c5_flag <- slice(c5_flag, which(c5_flag[,1] == "Peru"):
                       which(c5_flag[,1] == "Peru")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c5_flag")
per.c5_flag <- slice(per.c5_flag, 1:136) ## 15 May
per.c5_flag <- data.frame(per.c5_flag, dates_OXF)
per.c5_flag$X <- NULL
per.c5_flag$X.1 <- NULL
per.c5_flag$Date <- NULL

## c6_stayathomerequirements
per.c6_stayathomerequirements <- slice(c6_stayathomerequirements,
                                       which(c6_stayathomerequirements[,1] == "Peru"):
                                         which(c6_stayathomerequirements[,1]
                                               == "Peru")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c6_stayathomerequirements")
per.c6_stayathomerequirements <- slice(per.c6_stayathomerequirements, 1:136) ## 15 May
per.c6_stayathomerequirements <- data.frame(per.c6_stayathomerequirements, dates_OXF)
per.c6_stayathomerequirements$X <- NULL
per.c6_stayathomerequirements$X.1 <- NULL
per.c6_stayathomerequirements$Date <- NULL

## c6_flag
per.c6_flag <- slice(c6_flag, which(c6_flag[,1] == "Peru"):
                       which(c6_flag[,1] == "Peru")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c6_flag")
per.c6_flag <- slice(per.c6_flag, 1:136) ## 15 May
per.c6_flag <- data.frame(per.c6_flag, dates_OXF)
per.c6_flag$X <- NULL
per.c6_flag$X.1 <- NULL
per.c6_flag$Date <- NULL

## c7_domestictravel
per.c7_domestictravel <- slice(c7_domestictravel, which(c7_domestictravel[,1] == "Peru"):
                                 which(c7_domestictravel[,1] == "Peru")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c7_domestictravel")
per.c7_domestictravel <- slice(per.c7_domestictravel, 1:136) ## 15 May
per.c7_domestictravel <- data.frame(per.c7_domestictravel, dates_OXF)
per.c7_domestictravel$X <- NULL
per.c7_domestictravel$X.1 <- NULL
per.c7_domestictravel$Date <- NULL

## c7_flag 
per.c7_flag <- slice(c7_flag, which(c7_flag[,1] == "Peru"):
                       which(c7_flag[,1] == "Peru")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c7_flag")
per.c7_flag <- slice(per.c7_flag, 1:136) ## 15 May
per.c7_flag <- data.frame(per.c7_flag, dates_OXF)
per.c7_flag$X <- NULL
per.c7_flag$X.1 <- NULL
per.c7_flag$Date <- NULL

## c8_internationaltravel
per.c8_internationaltravel <- slice(c8_internationaltravel, 
                                    which(c8_internationaltravel[,1] == "Peru"):
                                      which(c8_internationaltravel[,1] == "Peru")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c8_internationaltravel")
per.c8_internationaltravel <- slice(per.c8_internationaltravel, 1:136) ## 15 May
per.c8_internationaltravel <- data.frame(per.c8_internationaltravel, dates_OXF)
per.c8_internationaltravel$X <- NULL
per.c8_internationaltravel$X.1 <- NULL
per.c8_internationaltravel$Date <- NULL

## h2_testingpolicy
per.h2_testingpolicy <- slice(h2_testingpolicy, which(h2_testingpolicy[,1] == "Peru"):
                                which(h2_testingpolicy[,1] == "Peru")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "h2_testingpolicy")
per.h2_testingpolicy <- slice(per.h2_testingpolicy, 1:136) ## 15 May
per.h2_testingpolicy <- data.frame(per.h2_testingpolicy, dates_OXF)
per.h2_testingpolicy$X <- NULL
per.h2_testingpolicy$X.1 <- NULL
per.h2_testingpolicy$Date <- NULL

## h3_contacttracing
per.h3_contacttracing <- slice(h3_contacttracing, which(h3_contacttracing[,1] == "Peru"):
                                 which(h3_contacttracing[,1] == "Peru")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "h3_contacttracing")
per.h3_contacttracing <- slice(per.h3_contacttracing, 1:136) ## 15 May
per.h3_contacttracing <- data.frame(per.h3_contacttracing, dates_OXF)
per.h3_contacttracing$X <- NULL
per.h3_contacttracing$X.1 <- NULL
per.h3_contacttracing$Date <- NULL

## Dataframe 
per_resp <- data.frame(per.stringencyindex, per.c1_schoolclosing$c1_schoolclosing, 
                       per.c1_flag$c1_flag, per.c2_workplaceclosing$c2_workplaceclosing, 
                       per.c2_flag$c2_flag,
                       per.c3_cancelpublicevents$c3_cancelpublicevents, 
                       per.c3_flag$c3_flag, 
                       per.c4_restrictionsongatherings$c4_restrictionsongatherings,
                       per.c4_flag$c4_flag, 
                       per.c5_closepublictransport$c5_closepublictransport, 
                       per.c5_flag$c5_flag, 
                       per.c6_stayathomerequirements$c6_stayathomerequirements,
                       per.c6_flag$c6_flag, per.c7_domestictravel$c7_domestictravel, 
                       per.c7_flag$c7_flag, 
                       per.c8_internationaltravel$c8_internationaltravel, 
                       per.h2_testingpolicy$h2_testingpolicy, 
                       per.h3_contacttracing$h3_contacttracing)
names(per_resp)[1] = "stringencyindex"
names(per_resp)[2] = "dates"
names(per_resp)[3] = "c1_schoolclosing"
names(per_resp)[4] = "c1_flag"
names(per_resp)[5] = "c2_workplaceclosing"
names(per_resp)[6] = "c2_flag"
names(per_resp)[7] = "c3_cancelpublicevents"
names(per_resp)[8] = "c3_flag"
names(per_resp)[9] = "c4_restrictionsongatherings"
names(per_resp)[10] = "c4_flag"
names(per_resp)[11] = "c5_closepublictransport"
names(per_resp)[12] = "c5_flag"
names(per_resp)[13] = "c6_stayathomerequirements"
names(per_resp)[14] = "c6_flag"
names(per_resp)[15] = "c7_domestictravel"
names(per_resp)[16] = "c7_flag"
names(per_resp)[17] = "c8_internationaltravel"
names(per_resp)[18] = "h2_testingpolicy"
names(per_resp)[19] = "h3_contacttracing"
```

### Uruguay Responses

``` r
## stringencyindex
ury.stringencyindex <- slice(stringencyindex, which(stringencyindex[,1] == "Uruguay"):
                               which(stringencyindex[,1] == "Uruguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "stringency_index")
ury.stringencyindex <- slice(ury.stringencyindex, 1:136) ## 15 May
ury.stringencyindex <- data.frame(ury.stringencyindex, dates_OXF)
ury.stringencyindex$X <- NULL
ury.stringencyindex$X.1 <- NULL
ury.stringencyindex$Date <- NULL

## c1_schoolclosing
ury.c1_schoolclosing <- slice(c1_schoolclosing, which(c1_schoolclosing[,1] == "Uruguay"):
                                which(c1_schoolclosing[,1] == "Uruguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c1_schoolclosing")
ury.c1_schoolclosing <- slice(ury.c1_schoolclosing, 1:136) ## 15 May
ury.c1_schoolclosing <- data.frame(ury.c1_schoolclosing, dates_OXF)
ury.c1_schoolclosing$X <- NULL
ury.c1_schoolclosing$X.1 <- NULL
ury.c1_schoolclosing$Date <- NULL

## c1_flag
ury.c1_flag <- slice(c1_flag, which(c1_flag[,1] == "Uruguay"):
                       which(c1_flag[,1] == "Uruguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c1_flag")
ury.c1_flag <- slice(ury.c1_flag, 1:136) ## 15 May
ury.c1_flag <- data.frame(ury.c1_flag, dates_OXF)
ury.c1_flag$X <- NULL
ury.c1_flag$X.1 <- NULL
ury.c1_flag$Date <- NULL

## c2_workplaceclosing
ury.c2_workplaceclosing <- slice(c2_workplaceclosing, which(c2_workplaceclosing[,1] 
                                                            == "Uruguay"):
                                   which(c2_workplaceclosing[,1] == "Uruguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c2_workplaceclosing")
ury.c2_workplaceclosing <- slice(ury.c2_workplaceclosing, 1:136) ## 15 May
ury.c2_workplaceclosing <- data.frame(ury.c2_workplaceclosing, dates_OXF)
ury.c2_workplaceclosing$X <- NULL
ury.c2_workplaceclosing$X.1 <- NULL
ury.c2_workplaceclosing$Date <- NULL

## c2_flag
ury.c2_flag <- slice(c2_flag, which(c2_flag[,1] == "Uruguay"):
                       which(c2_flag[,1] == "Uruguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c2_flag")
ury.c2_flag <- slice(ury.c2_flag, 1:136) ## 15 May
ury.c2_flag <- data.frame(ury.c2_flag, dates_OXF)
ury.c2_flag$X <- NULL
ury.c2_flag$X.1 <- NULL
ury.c2_flag$Date <- NULL

## c3_cancelpublicevents
ury.c3_cancelpublicevents <- slice(c3_cancelpublicevents, which(c3_cancelpublicevents[,1] 
                                                                == "Uruguay"):
                                     which(c3_cancelpublicevents[,1] == "Uruguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c3_cancelpublicevents")
ury.c3_cancelpublicevents <- slice(ury.c3_cancelpublicevents, 1:136) ## 15 May
ury.c3_cancelpublicevents <- data.frame(ury.c3_cancelpublicevents, dates_OXF)
ury.c3_cancelpublicevents$X <- NULL
ury.c3_cancelpublicevents$X.1 <- NULL
ury.c3_cancelpublicevents$Date <- NULL

## c3_flag
ury.c3_flag <- slice(c3_flag, which(c3_flag[,1] == "Uruguay"):
                       which(c3_flag[,1] == "Uruguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c3_flag")
ury.c3_flag <- slice(ury.c3_flag, 1:136) ## 15 May
ury.c3_flag <- data.frame(ury.c3_flag, dates_OXF)
ury.c3_flag$X <- NULL
ury.c3_flag$X.1 <- NULL
ury.c3_flag$Date <- NULL

## c4_restrictionsongatherings
ury.c4_restrictionsongatherings <- slice(c4_restrictionsongatherings, 
                                         which(c4_restrictionsongatherings[,1] 
                                               == "Uruguay"):
                                           which(c4_restrictionsongatherings[,1] 
                                                 == "Uruguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c4_restrictionsongatherings")
ury.c4_restrictionsongatherings <- slice(ury.c4_restrictionsongatherings, 1:136) ## 15 May
ury.c4_restrictionsongatherings <- data.frame(ury.c4_restrictionsongatherings, dates_OXF)
ury.c4_restrictionsongatherings$X <- NULL
ury.c4_restrictionsongatherings$X.1 <- NULL
ury.c4_restrictionsongatherings$Date <- NULL

## c4_flag
ury.c4_flag <- slice(c4_flag, which(c4_flag[,1] == "Uruguay"):
                       which(c4_flag[,1] == "Uruguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c4_flag")
ury.c4_flag <- slice(ury.c4_flag, 1:136) ## 15 May
ury.c4_flag <- data.frame(ury.c4_flag, dates_OXF)
ury.c4_flag$X <- NULL
ury.c4_flag$X.1 <- NULL
ury.c4_flag$Date <- NULL

## c5_closepublictransport 
ury.c5_closepublictransport <- slice(c5_closepublictransport, 
                                     which(c5_closepublictransport[,1] == "Uruguay"):
                                       which(c5_closepublictransport[,1] 
                                             == "Uruguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c5_closepublictransport")
ury.c5_closepublictransport <- slice(ury.c5_closepublictransport, 1:136) ## 15 May
ury.c5_closepublictransport <- data.frame(ury.c5_closepublictransport, dates_OXF)
ury.c5_closepublictransport$X <- NULL
ury.c5_closepublictransport$X.1 <- NULL
ury.c5_closepublictransport$Date <- NULL

## c5_flag 
ury.c5_flag <- slice(c5_flag, which(c5_flag[,1] == "Uruguay"):
                       which(c5_flag[,1] == "Uruguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c5_flag")
ury.c5_flag <- slice(ury.c5_flag, 1:136) ## 15 May
ury.c5_flag <- data.frame(ury.c5_flag, dates_OXF)
ury.c5_flag$X <- NULL
ury.c5_flag$X.1 <- NULL
ury.c5_flag$Date <- NULL

## c6_stayathomerequirements
ury.c6_stayathomerequirements <- slice(c6_stayathomerequirements, 
                                       which(c6_stayathomerequirements[,1] == "Uruguay"):
                                         which(c6_stayathomerequirements[,1] 
                                               == "Uruguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c6_stayathomerequirements")
ury.c6_stayathomerequirements <- slice(ury.c6_stayathomerequirements, 1:136) ## 15 May
ury.c6_stayathomerequirements <- data.frame(ury.c6_stayathomerequirements, dates_OXF)
ury.c6_stayathomerequirements$X <- NULL
ury.c6_stayathomerequirements$X.1 <- NULL
ury.c6_stayathomerequirements$Date <- NULL

## c6_flag
ury.c6_flag <- slice(c6_flag, which(c6_flag[,1] == "Uruguay"):
                       which(c6_flag[,1] == "Uruguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c6_flag")
ury.c6_flag <- slice(ury.c6_flag, 1:136) ## 15 May
ury.c6_flag <- data.frame(ury.c6_flag, dates_OXF)
ury.c6_flag$X <- NULL
ury.c6_flag$X.1 <- NULL
ury.c6_flag$Date <- NULL

## c7_domestictravel
ury.c7_domestictravel <- slice(c7_domestictravel, which(c7_domestictravel[,1] 
                                                        == "Uruguay"):
                                 which(c7_domestictravel[,1] == "Uruguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c7_domestictravel")
ury.c7_domestictravel <- slice(ury.c7_domestictravel, 1:136) ## 15 May
ury.c7_domestictravel <- data.frame(ury.c7_domestictravel, dates_OXF)
ury.c7_domestictravel$X <- NULL
ury.c7_domestictravel$X.1 <- NULL
ury.c7_domestictravel$Date <- NULL

## c7_flag 
ury.c7_flag <- slice(c7_flag, which(c7_flag[,1] == "Uruguay"):
                       which(c7_flag[,1] == "Uruguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c7_flag")
ury.c7_flag <- slice(ury.c7_flag, 1:136) ## 15 May
ury.c7_flag <- data.frame(ury.c7_flag, dates_OXF)
ury.c7_flag$X <- NULL
ury.c7_flag$X.1 <- NULL
ury.c7_flag$Date <- NULL

## c8_internationaltravel
ury.c8_internationaltravel <- slice(c8_internationaltravel, 
                                    which(c8_internationaltravel[,1] == "Uruguay"):
                                      which(c8_internationaltravel[,1] == "Uruguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "c8_internationaltravel")
ury.c8_internationaltravel <- slice(ury.c8_internationaltravel, 1:136) ## 15 May
ury.c8_internationaltravel <- data.frame(ury.c8_internationaltravel, dates_OXF)
ury.c8_internationaltravel$X <- NULL
ury.c8_internationaltravel$X.1 <- NULL
ury.c8_internationaltravel$Date <- NULL

## h2_testingpolicy
ury.h2_testingpolicy <- slice(h2_testingpolicy, which(h2_testingpolicy[,1] == "Uruguay"):
                                which(h2_testingpolicy[,1] == "Uruguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "h2_testingpolicy")
ury.h2_testingpolicy <- slice(ury.h2_testingpolicy, 1:136) ## 15 May
ury.h2_testingpolicy <- data.frame(ury.h2_testingpolicy, dates_OXF)
ury.h2_testingpolicy$X <- NULL
ury.h2_testingpolicy$X.1 <- NULL
ury.h2_testingpolicy$Date <- NULL

## h3_contacttracing
ury.h3_contacttracing <- slice(h3_contacttracing, which(h3_contacttracing[,1] 
                                                        == "Uruguay"):
                                 which(h3_contacttracing[,1] == "Uruguay")) %>% 
  pivot_longer(-c(X, X.1), names_to = "Date", values_to = "h3_contacttracing")
ury.h3_contacttracing <- slice(ury.h3_contacttracing, 1:136) ## 15 May
ury.h3_contacttracing <- data.frame(ury.h3_contacttracing, dates_OXF)
ury.h3_contacttracing$X <- NULL
ury.h3_contacttracing$X.1 <- NULL
ury.h3_contacttracing$Date <- NULL

## Dataframe 
ury_resp <- data.frame(ury.stringencyindex, ury.c1_schoolclosing$c1_schoolclosing, 
                       ury.c1_flag$c1_flag, ury.c2_workplaceclosing$c2_workplaceclosing, 
                       ury.c2_flag$c2_flag, 
                       ury.c3_cancelpublicevents$c3_cancelpublicevents, 
                       ury.c3_flag$c3_flag, 
                       ury.c4_restrictionsongatherings$c4_restrictionsongatherings,
                       ury.c4_flag$c4_flag, 
                       ury.c5_closepublictransport$c5_closepublictransport, 
                       ury.c5_flag$c5_flag, 
                       ury.c6_stayathomerequirements$c6_stayathomerequirements,
                       ury.c6_flag$c6_flag, ury.c7_domestictravel$c7_domestictravel, 
                       ury.c7_flag$c7_flag, 
                       ury.c8_internationaltravel$c8_internationaltravel, 
                       ury.h2_testingpolicy$h2_testingpolicy, 
                       ury.h3_contacttracing$h3_contacttracing)
names(ury_resp)[1] = "stringencyindex"
names(ury_resp)[2] = "dates"
names(ury_resp)[3] = "c1_schoolclosing"
names(ury_resp)[4] = "c1_flag"
names(ury_resp)[5] = "c2_workplaceclosing"
names(ury_resp)[6] = "c2_flag"
names(ury_resp)[7] = "c3_cancelpublicevents"
names(ury_resp)[8] = "c3_flag"
names(ury_resp)[9] = "c4_restrictionsongatherings"
names(ury_resp)[10] = "c4_flag"
names(ury_resp)[11] = "c5_closepublictransport"
names(ury_resp)[12] = "c5_flag"
names(ury_resp)[13] = "c6_stayathomerequirements"
names(ury_resp)[14] = "c6_flag"
names(ury_resp)[15] = "c7_domestictravel"
names(ury_resp)[16] = "c7_flag"
names(ury_resp)[17] = "c8_internationaltravel"
names(ury_resp)[18] = "h2_testingpolicy"
names(ury_resp)[19] = "h3_contacttracing"
```