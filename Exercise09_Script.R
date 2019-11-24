#Exercise09
#Question 1
library(ggplot2)
#load in mouse tumor data (% change in tumor volume over time)
tumor_volume <- read.table("Tumor_volume.txt", sep='\t', header = TRUE, stringsAsFactors = FALSE)
tumor_plot <- ggplot(data=tumor_volume, mapping=aes(x=DPI, y=Volume))
tumor_plot+geom_point()+theme_classic()+
  stat_smooth(method="lm", color="black")+xlab("Days Post Injection")+ylab("Tumor Volume (mm^3")

#Question 2
#load in data.txt
data09 <- read.table("data.txt", sep=',', header = TRUE, stringsAsFactors = FALSE)
#barplot showing average population size for 4 different regions
avg_pop <- ggplot(data=data09, aes(x=region, y=observations))
avg_pop+xlab("Region")+ylab("Avg Population")+stat_summary(geom="bar",fun.y="mean")+
  theme_classic() 
#scatter plot of observations
#This type of plot tells a different story because you can see the variance in population size
#distribution for different regions. This is masked when you only look at average population size.
#East and west have a large distribution of pop size.
#North is discretely around one pop size for the entire region.
#Southern region seems to consist of two discrete pop sizes ( one small and one large).
avg_pop+geom_jitter(aes(color=region))+xlab("Region")+ylab("Population Size")+theme_classic()

