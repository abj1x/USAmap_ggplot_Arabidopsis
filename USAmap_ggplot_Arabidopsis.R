## after https://eriqande.github.io/rep-res-web/lectures/making-maps-with-R.html

library(ggplot2)
library(ggmap)
library(mapdata)

usa <- map_data("usa")
p<-ggplot() +
  geom_polygon(data=usa,aes(x=long,y=lat,group=group)) +
  coord_fixed(1.3)
ecotypes_all<-read.csv('LHY_SNP_WRLD_dataset.csv', header=TRUE)
USAdata_all<-ecotypes_all[which(ecotypes_all$country=="USA"),]

p1<-p+theme_dark() +
  geom_point(data=USAdata_all,aes(x=long,y=lat,color=factor(genotype_comp)),size=2.0) +
  labs(x="longitude", y="latitude",col="haplotype") +
  scale_color_manual(values=c("dodgerblue1","firebrick1","lightgoldenrod2")) +
  theme(legend.background = element_rect(fill="gray 90"),legend.title=element_blank()) +
  theme(legend.justification = c(0,0),legend.position = c(0,0)) +
  theme(legend.background = element_rect(colour="black",size=0.25))
p2<- p1 + annotate(geom="text",x=-93.5,y=37.2,label="Col-0",color="white")

ggsave('USAmap_LHY_haplotype.png')
