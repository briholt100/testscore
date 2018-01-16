library(dplyr)
library(tidyr)
height<-rnorm(17,67,15)

person1<-data.frame(rbind(c(65,65.1,65.4,65.09)))
colnames(person1)<-c('string','tape measure','yardstick','caliper')
person1

p<-seq(1,17)
samples<-sample(height,1e4,prob=p,replace = T)
plot(density(samples))

TapeMeasure<-data.frame(cbind(1e4,rnorm(1e4,65.1,.25)))
caliper<-rnorm(1e4,65.1,.05)
df<-data.frame(TapeMeasure,caliper)
df<-df[,2:3]
colnames(df)<-c('tape','caliper')

tidy_df<-df %>% gather(key = measure,value = height)


p<-ggplot(tidy_df,aes(x=height))
p+geom_density()+geom_vline(xintercept=65.1,col='blue')+facet_grid(measure~.)

