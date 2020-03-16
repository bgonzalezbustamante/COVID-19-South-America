## Estimated R and Explored Serial Interval Distribution in Brazil

[![R](https://raw.githubusercontent.com/bgonzalezbustamante/COVID-19-South-America/master/docs/images/20200315/20200315_R_BRA.png)](https://raw.githubusercontent.com/bgonzalezbustamante/COVID-19-South-America/master/docs/images/20200315/20200315_R_BRA.png)
<small>Source: Compiled using data from González-Bustamante (2020). DOI: [10.17605/OSF.IO/3QRMZ](http://doi.org/10.17605/OSF.IO/3QRMZ)</small> <br />
<small>Note: The estimations have been calculated with a parametric serial interval based on a Gamma distribution with mean μ = 7.5 and standard deviation σ = 3.4 following to [Li *et al.* (2020)](https://www.nejm.org/doi/full/10.1056/NEJMoa2001316). The epicurve shows new infections over the period. On the other hand, estimated R illustrates the number of infections that a single case generates: when the value is lower than one, the outbreak is under control ([see figure in detail](https://raw.githubusercontent.com/bgonzalezbustamante/COVID-19-South-America/master/docs/images/20200315/20200315_Re_BRA.png)). R is specifically the effective reproduction number (R<sub>e</sub>), which is calculated on a daily incidence basis. Therefore, it allows us to measure the public health systems response (see [Cori *et al*., 2013](https://dx.doi.org/10.1093%2Faje%2Fkwt133); see also [Thomson *et al.*, 2019](https://doi.org/10.1016/j.epidem.2019.100356)). Finally, the explored serial interval (SI) distribution shows the time interval between the symptoms in each case and the onset of them in secondary cases because of transmission. It is relevant to note that these estimations are too early in this epidemic to obtain a reliable posterior coefficient of variation of the R indicator.</small>

## Epidemic Trajectory and Future Incidence Simulation

[![Growth](https://raw.githubusercontent.com/bgonzalezbustamante/COVID-19-South-America/master/docs/images/20200315/Projections/20200315_growth_BRA.png)](https://raw.githubusercontent.com/bgonzalezbustamante/COVID-19-South-America/master/docs/images/20200315/Projections/20200315_growth_BRA.png)
<small>Source: Compiled using data from González-Bustamante (2020). DOI: [10.17605/OSF.IO/3QRMZ](http://doi.org/10.17605/OSF.IO/3QRMZ)</small> <br />
<small>Note: The average number of secondary cases is calculated using a maximum-likelihood estimate of R based on the model of [Cori *et al.* (2013)](https://doi.org/10.1093/aje/kwt133) and the previous serial interval values. After that, 1,000 futures epicurves are simulated from the five days before the current peak, which is not necessarily the real growth-phase peak, to the next two weeks to compare observed and predicted values.</small>

[![Projection](https://raw.githubusercontent.com/bgonzalezbustamante/COVID-19-South-America/master/docs/images/20200315/Projections/20200315_proj_BRA.png)](https://raw.githubusercontent.com/bgonzalezbustamante/COVID-19-South-America/master/docs/images/20200315/Projections/20200315_proj_BRA.png)
<small>Source: Compiled using data from González-Bustamante (2020). DOI: [10.17605/OSF.IO/3QRMZ](http://doi.org/10.17605/OSF.IO/3QRMZ)</small> <br />
<small>Note: The predicted cumulative incidence is estimated from the current peak to the following 30-days with 1,000 simulated curves based on the previous maximum-likelihood estimation and serial interval values. When the epidemic reaches a real peak, a log-linear model should be estimated to measure the decay-phase adequately.</small>

### Were You Looking for Previous Figures?

See the Visualisation COVID-19 component of the **OSF-Project** (DOI: [10.17605/OSF.IO/Y6C7Z](http://doi.org/10.17605/OSF.IO/Y6C7Z))

### How to Download and Cite This Dataset?

González-Bustamante, B. (2020). *COVID-19 Pandemic in South America Datasets*. DOI: [10.17605/OSF.IO/3QRMZ](http://doi.org/10.17605/OSF.IO/3QRMZ)
