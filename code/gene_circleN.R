#
library(ggplot2)
library(reshape2)
allp<-read.csv(file.choose(),header=T)#
allpl<-melt(allp,id.vars=c('position','class','gene','description'),
            variable.name = 'cycle',value.name = 'value',na.rm = TRUE)
#
p<-ggplot(allpl,aes(position/1048576,cycle,size=value))+
  #geom_vline(xintercept =allpl$position/1048576,color='#D9D9D9',size=1.5)+
  geom_point(aes(fill=gene,shape=class,size=2))+
  coord_polar(theta = 'x')+
  scale_size_identity()+
  scale_shape_manual(values= c(21,22,24))+
  scale_x_continuous(breaks = seq(0,4.6,0.5),expand = c(0,0.3))+
  scale_fill_brewer(palette = 'Paired')+
  #annotate('text',x=allpl$position/1048576,y=15.5,label=allpl$gene)+
  theme_minimal(base_size = 16)+
  theme(panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(size=4),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_blank())
p
#7*6