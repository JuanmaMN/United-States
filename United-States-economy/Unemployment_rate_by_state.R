
# Upload the packages -----------------------------------------------------

pacman::p_load(readxl, lubridate, tidyverse, ggplot2, hrbrthemes, ggfittext, patchwork, scales, ggtext, ggpubr,ggbump,wesanderson,
               grid, gridtext, biscale, cowplot,sysfonts,ggimage,extrafont,systemfonts, showtext, ggbeeswarm,countrycode,geofacet)




# Graph -------------------------------------------------------------------


ggplot("data source", aes(Year, Unemployment_rate, group=State)) +
  geom_area(alpha = 0.2,fill="#e13d3d",colour="#e13d3d") +
  geom_line(aes(x=Year, y = Unemployment_rate), size = .5, color = '#e13d3d') +
  facet_geo( ~ State, grid = "us_state_grid1") +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 15),breaks=c(0,5,10)) +
  scale_x_continuous(breaks=c(2016,2017,2018,2019,2020))+
  labs(
    title = "Unemployment Rates by State",
    subtitle = "Annual Averages - 2016-2020",
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
  )  + geom_text(aes(x = 2018, y = 10, label = State), hjust = 0.5, 
                 nudge_x = 0.01, face = "bold",family = font_labels,size = 3, colour = "#828282")





