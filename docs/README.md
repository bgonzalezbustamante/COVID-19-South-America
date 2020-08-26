# Coronavirus Pandemic in South America

[![Version](https://img.shields.io/badge/version-v2.12.19-blue.svg)](https://github.com/bgonzalezbustamante/COVID-19-South-America/blob/master/changelog.txt) [![Update](https://img.shields.io/badge/latest%20data%20update-2020--05--16-orange.svg)](https://github.com/CSSEGISandData/COVID-19/tree/master/csse_covid_19_data/csse_covid_19_time_series) [![GitHub issues](https://img.shields.io/github/issues/bgonzalezbustamante/COVID-19-South-America.svg)](https://github.com/bgonzalezbustamante/COVID-19-South-America/issues/) [![GitHub issues-closed](https://img.shields.io/github/issues-closed/bgonzalezbustamante/COVID-19-South-America.svg)](https://github.com/bgonzalezbustamante/COVID-19-South-America/issues?q=is%3Aissue+is%3Aclosed) [![DOI](https://img.shields.io/badge/DOI-10.17605%2FOSF.IO%2F6FM7X-blue)](http://doi.org/10.17605/OSF.IO/6FM7X) [![License](https://img.shields.io/badge/license-CC--BY--4.0-black)](https://github.com/bgonzalezbustamante/COVID-19-South-America/blob/master/LICENSE.txt) [![R](https://img.shields.io/badge/made%20with-R%20v3.6.1-1f425f.svg)](https://cran.r-project.org/) [![Jekyll](https://img.shields.io/badge/made%20with-Jekyll-1f425f.svg)](https://jekyllrb.com/)

> This project was deprecated in mid-May 2020 waiting for the peer-review outcome of a paper focused on early projections and governmental responses to COVID-19 epidemic in South America.

This is a measurement of COVID-19 coronavirus outbreak -a pandemic- in South America, specifically, the epidemic curve based on the incidence in the region [(see epicurve stratified by country)](Incidence-South-America.md). Furthermore, estimated R, explored serial interval (SI) distribution, and future incidence simulations are fitted by case.<sup id="a1">[1](#f1)</sup> The countries reviewed are as follows: 

- [Argentina](Argentina.md) (ARG), 
- [Bolivia](Bolivia.md) (BOL),
- [Brazil](Brazil.md) (BRA),
- [Chile](Chile.md) (CHL),
- [Colombia](Colombia.md) (COL),
- [Ecuador](Ecuador.md) (ECU),
- [Paraguay](Paraguay.md) (PRY),
- [Peru](Peru.md) (PER),
- [Uruguay](Uruguay.md) (URY), and 
- [Venezuela](Venezuela.md) (VEN).

Moreover, [Spain](Spain.md) (ESP), the [United Kingdom](United-Kingdom.md) (GBR), and [Italy](Italy.md) (ITA) are computed for comparative purposes [(see epicurve stratified by country)](Incidence-Europe.md).<sup id="a2">[2](#f2)</sup>

The charts and estimations are updated after the close of the day in Greenwich Mean Time based on the **Johns Hopkins University CSSE COVID-19 Dataset** [(see repository)](https://github.com/CSSEGISandData/COVID-19/tree/master/csse_covid_19_data/csse_covid_19_time_series). 

The materials can be downloaded from the **OSF-Project** (DOI: [10.17605/OSF.IO/6FM7X](http://doi.org/10.17605/OSF.IO/6FM7X)). This site will be updated on a regular basis, see the [changelog](https://github.com/bgonzalezbustamante/COVID-19-South-America/blob/master/changelog.txt).

## About Me

I am a PRS in the DPhil in Politics programme in the [Department of Politics and International Relations](https://www.politics.ox.ac.uk/) and [St Hilda's College](https://www.sthildas.ox.ac.uk/) at the [University of Oxford](http://www.ox.ac.uk/), United Kingdom. Furthermore, I am an Instructor in the Department of Public Administration and Policy at the Faculty of Economics and Management at the Universidad de Santiago, where I have been working since 2014. 

Further details on my [website at the University of Oxford](http://users.ox.ac.uk/~shil5311/).

## Notes

1.  <small id="f1"> R is specifically the effective reproduction number (R<sub>e</sub>), which is calculated on a daily incidence basis. Therefore, it allows us to measure the public health systems response (see [Cori *et al*., 2013](https://dx.doi.org/10.1093%2Faje%2Fkwt133); see also [Thomson *et al.*, 2019](https://doi.org/10.1016/j.epidem.2019.100356)). On the other hand, SI is the time interval between the symptoms in each case and the onset of them in secondary cases because of transmission. Finally, the projections are 1,000 future incidence simulations by case using maximum-likelihood estimations or log-incidence models, depending on the stage of the growth phase. For further details, see the [technical note](technical-note.md). </small> [↩](#a1)
2. <small id="f2"> At the beginning of the project, I was scraping data from the health services and ministries of each country. Since 17 March 2020 [(see the changelog)](https://github.com/bgonzalezbustamante/COVID-19-South-America/blob/master/changelog.txt), to standardise the measurement and improve -and automatise- the data collection process, I have connected these analyses to the [Johns Hopkins University CSSE COVID-19 Dataset](https://github.com/CSSEGISandData/COVID-19/tree/master/csse_covid_19_data/csse_covid_19_time_series). </small> [↩](#a2)
