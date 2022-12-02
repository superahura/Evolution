library(umap)
library(ggplot2)
library(RColorBrewer)
library(paletteer)
set.seed(916)
umapall<-read.csv(file.choose(),header = TRUE,check.names = FALSE,row.names = 1)
umap.data <- umapall[,c(4:470)]
umap_r <- umap::umap(umap.data,method='naive',
                     n_neighbors = 50, min_dist = 0.8,
                     target_weight = 0.5)
umap.label<-factor(umapall[,2])#branches
umap.label<-umapall[,3]#CD
umap.label<-factor(umapall[,1])#Cycles
umap_df<-data.frame(umap_r$layout,umap.label)
head(umap_df)
umap_p <- ggplot(umap_df,aes(X1,X2,fill=umap.label))+
  geom_point(size=2,shape=21)+
  scale_fill_manual(name='Cycles',values=c(brewer.pal(11,'Paired'),brewer.pal(11,'Set3')))+
 # scale_fill_paletteer_c(name='Cycles','viridis::inferno')+#for CD
  labs(x='UMAP1',y='UMAP2')+
  theme_bw(base_size = 18)+
  theme()
umap_p
  
library(plotly)
p<-plot_ly(umap_df,
           x=~X1,
           y=~X2,
           text=~row.names(umap_df),
           color=~umap.label)
p
htmlwidgets::saveWidget(as_widget(p), "graphU.html")
