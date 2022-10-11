library(ggplot2)
library(reshape2)
ge_bp <- read.csv(file.choose(),header = T)
ge_b <- melt(ge_bp,id.vars='cycles',variable.name='composition',value.name='count')
ge_b$composition<-factor(ge_b$composition,levels = c('ydcI','ydfV','galU_p','galU'))
bp<-ggplot(ge_b,aes(cycles,count,fill=composition,color=composition))+
  geom_area(aes(fill=composition),position = 'identity',alpha=0.4)+
  labs(x = 'Cycles', y = 'Relative abundance')+
  scale_color_manual(values=c('#FDBF6F','#FF7F00','#B2DF8A','#A6CEE3'))+
  scale_fill_manual(values=c('#FDBF6F','#FF7F00','#B2DF8A','#A6CEE3'))+
  scale_x_continuous(breaks = seq(0,10,1),expand = c(0,0))+
  scale_y_continuous(labels = scales::percent,breaks = seq(0,1,0.25),expand = c(0,0))+
  theme_minimal(base_size = 18)+
  theme(legend.position = 'none',
        panel.grid = element_blank())
bp
