## Technical Note

> This online tracker was deprecated in mid-May 2020 to focus on a paper which evaluates early projections and governmental responses to COVID-19 epidemic in South America. This paper was published in *World Development* journal (DOI: [10.1016/j.worlddev.2020.105180](https://doi.org/10.1016/j.worlddev.2020.105180)). See its [demonstration for R](Early-Responses.md).

It is possible to observe in certain instances some significant changes between projections in short time lapses. This is because of the models that have been used. In these estimations, three models have been fitted. 

- First, in earlier stages, the average number of secondary cases have been calculated using a maximum likelihood-estimations of R based in a parametric serial interval with a Gamma distribution. For example, [Paraguay](Paraguay.md), [Uruguay](Uruguay.md), and [Venezuela](Venezuela.md).

- In intermediate phases, the first component of a log-incidence model is used to obtain the R daily growth rate. Although this generally increases the projections significantly; it is a more reliable method for intermediate-advanced stages. For instance, [Argentina](Argentina.md), [Bolivia](Bolivia.md), [Brazil](Brazil.md), [Chile](Chile.md), [Colombia](Colombia.md), [Ecuador](Ecuador.md), and [Peru](Peru.md).

- Finally, when the epidemic reaches a peak, the R daily decay rate is obtained from the second component of the log-incidence regression over the period, which shows a significant decrease in the projections and denotes the decay in the epidemic. For example, [Spain](Spain.md), the [United Kingdom](United-Kingdom.md), and [Italy](Italy.md).

### Were You Looking for Previous Figures?

See the Visualisation COVID-19 component of the **OSF-Project** (DOI: [10.17605/OSF.IO/Y6C7Z](http://doi.org/10.17605/OSF.IO/Y6C7Z))
