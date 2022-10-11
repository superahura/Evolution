library(ggplot2)
library(reshape2)
library(ggsignif)
x<-read.csv(file.choose(),header = TRUE,check.names = FALSE)
y<-melt(x,variable = 'Cycle', na.rm = TRUE)
p<-ggplot(y,aes(Cycle,value/(1+value),color=Cycle))+
  labs(x="Cycle", y= "CD/(CD+CH)")+
  geom_boxplot(width = 0.5,color='black',outlier.shape = NA)+
  geom_jitter(aes(fill=Cycle),shape = 21, width = 0.15,color='black')+
  stat_summary(fun.y = mean, geom = 'point', fill = 'white', shape = 21, size = 2) +
  scale_color_brewer(palette = 'Paired')+
  scale_fill_brewer(palette = 'Paired')+
  scale_y_continuous(labels = scales::percent)+
  theme_bw(base_size = 18)+
  theme(axis.text = element_text(color = "black"),
        panel.grid.minor = element_blank(),
        legend.position = 'none')
p
#6*5