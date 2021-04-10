# Upload the packages -----------------------------------------------------

pacman::p_load(readxl, lubridate, tidyverse, ggplot2, hrbrthemes, ggfittext, patchwork, scales, ggtext, ggpubr,ggbump,wesanderson,
               grid, gridtext, biscale, cowplot,sysfonts,ggimage,extrafont,systemfonts, showtext, ggbeeswarm,countrycode,geofacet)


# Graph -------------------------------------------------------------------

ggplot("GDP_by_state", aes(YEAR, GDP, group=State)) +
  geom_area(alpha = 0.2,fill="#a9beca",colour="#a9beca") +
  geom_line(aes(x=YEAR, y = GDP), size = .9, color = '#a9beca') +
  facet_geo( ~ State, grid = "us_state_grid1") +
  scale_y_continuous(expand = c(0, 0), limits = c(-10, 23),breaks=c(-10,0,10)) +
  
  scale_x_continuous(expand = c(0, 0), limits = c(1998, 2023),breaks = (1998:2020), 
                     labels = c("1998"," "," "," "," "," "," ","2005"," "," ",
                                " "," ","2010"," "," "," "," ","2015"," "," ",
                                " "," ","2020"))+
  labs(
    title = "US GDP by state",
    subtitle = "Real Gross Domestic Product (GDP) (Percent change from preceding period)",
    x = "",
    y = "",
    caption= "Source: U.S. BUREAU OF LABOR STATISTICS\nVisualization: JuanmaMN (Twitter @Juanma_MN)"
  ) +
  guides(fill = NULL) +
  theme(
    plot.title = element_text(margin = margin(b = 2), 
                              color = "#22222b",face = "bold",size = 14,
                              hjust = 0,
                              family = font_labels),
    plot.subtitle = element_text(margin = margin(t=10,b = 25), 
                                 color = "#22222b", size = 10, family = font_labels,
                                 hjust = 0),
    plot.caption =  element_text(margin = margin(t = 5), 
                                 color = "#22222b", size = 7,family = font_labels,
                                 hjust = 0.95),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    legend.position = "none",
    axis.text.x    = element_text(size = 6, color = "#828282",family = font_labels),
    axis.text.y    = element_text(size = 6, color = "#828282",family = font_labels), 
    panel.background = element_blank(), 
    panel.grid.major = element_blank(),
    panel.grid.major.y = element_blank(),
    panel.grid.minor = element_blank(), 
    plot.background = element_rect(fill = "#f7f7f7", color = NA),    # color removes the border
    plot.margin = unit(c(2, 2, 2, 2), "cm"),
    axis.ticks = element_blank(),
    strip.background = element_blank(),
    strip.text.x = element_blank()  # remove each graph title
    #strip.text.x = element_text(size = 8, face = "bold", color = "#828282",family = font_labels)
  )  + geom_text(aes(x = 2005, y = 12, label = State,fontface=1), hjust = 0.5, 
                 nudge_x = 0.01, size = 3, color = "#828282",family = font_labels)+ 
  geom_segment(data=GDP_by_state, mapping=aes(x=1998,xend=2020,y=0,yend=0),linetype="dotted",colour = "#525252") 


