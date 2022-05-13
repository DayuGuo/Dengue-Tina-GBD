library(readr)
library(ggplot2)
library(tidyverse)

data <- read_csv("Non-tropical-data/165.csv")
### ggplot
p1=ggplot(data=data,aes(Time,rate))+
  geom_point(color = '#8ac6d1')+
  geom_line(color = '#8ac6d1')+
  geom_ribbon(aes(ymin = ratelow, ymax = rateup), alpha = 0.2)+
  geom_point(data=data %>% filter(Time>2019),aes(Time,rate,color="red"))+
  geom_line(data=data %>% filter(Time>2019),aes(Time,rate,color="red"))+
  geom_vline(xintercept=2019, linetype="dashed", color = "grey")+
  scale_x_continuous(breaks = seq(1990, 2035, by = 5))+
  xlab("Time") +
  ylab("ASR per 100,000 people")+
  theme_classic()+
  theme(strip.background = element_blank(),
        strip.text = element_text(size = 12),
        legend.position="none"
  )

p1

ggsave("165-rate.pdf", units="in", width=8, height=4, dpi=600)
