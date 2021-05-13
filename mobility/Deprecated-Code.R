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

#### Deprecated Code ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Multidimensional CHL
for(i in 1:nrow(CHL)) {
  CHL$multi[i] <- f.multi.CHL(CHL$sub_region_1[i])
}

## Recode Argentina
## quantile(unique(ARG.vor$poverty))
ARG.vor$quantiles <- ifelse(ARG.vor$poverty < as.numeric(quantile(unique(ARG.vor$poverty))[2]), "Low % of poor",
                            ifelse(ARG.vor$poverty > as.numeric(quantile(unique(ARG.vor$poverty))[4]), "High of % poor",
                                   "Average"))

## Recode Chile
## quantile(c(unique(CHL$poverty), 4.6))
CHL$quantiles <- ifelse(CHL$poverty < as.numeric(quantile(c(unique(CHL$poverty), 4.6))[2]), "Low % of poor",
                        ifelse(CHL$poverty > as.numeric(quantile(c(unique(CHL$poverty), 4.6))[4]), "High of % poor",
                               "Average"))

## Multidimensional Poverty CHL
unique(CHL$sub_region_1[which(is.na(CHL$multi))])
CHL$dummy_multi <- ifelse(CHL$multi > mean_multi_CHL, "High % of poor", "Low of % poor")
CHL$binary_multi <- ifelse(CHL$multi > mean_multi_CHL, 1, 0)

## Recode Colombia
## quantile(c(unique(COL.vor$poverty), 28.7))
COL.vor$quantiles <- ifelse(COL.vor$poverty < as.numeric(quantile(c(unique(COL.vor$poverty), 28.7))[2]), "Low % of poor",
                            ifelse(COL.vor$poverty > as.numeric(quantile(c(unique(COL.vor$poverty), 28.7))[4]), "High of % poor",
                                   "Average"))

## Recode Peru
## quantile(unique(PER$poverty))
PER$quantiles <- ifelse(PER$poverty < as.numeric(quantile(unique(PER$poverty))[2]), "Low % of poor",
                        ifelse(PER$poverty > as.numeric(quantile(unique(PER$poverty))[4]), "High of % poor",
                               "Average"))

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Deprecated Plots ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

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
