


# Upload the packages -----------------------------------------------------

pacman::p_load(readxl, lubridate, tidyverse, ggplot2, hrbrthemes, ggfittext, patchwork, scales, ggtext, ggpubr,ggbump,wesanderson,
               grid, gridtext, biscale, cowplot,sysfonts,ggimage,extrafont,systemfonts, showtext, ggbeeswarm,countrycode,geofacet)




# Graph -------------------------------------------------------------------



first_graph_personal_income<-ggplot("data source", aes(Year, Personal_income, group=State)) +
  geom_area(alpha = 0.5,fill="#c6dabf",colour="#c6dabf") +
  geom_line(aes(x=Year, y = Personal_income), size = .5, color = '#c6dabf') +
  #coord_flip() +
  facet_geo( ~ State, grid = "us_state_grid1") +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 100000),breaks=c(0,50000)) +
  labs(
    title = "Per capita personal income by State", 
    subtitle = "Q1 2010 - Q3 2020 - Quaterly analysis",
    x = "",
    y = "",
    caption= "Source: U.S. BUREAU OF LABOR STATISTICS\nVisualization: JuanmaMN (Twitter @Juanma_MN)"
  ) +
  guides(fill = NULL) +
  theme(
    plot.title = element_text(#margin = margin(b = 2), 
      color = "#22222b",face = "bold",size = 14,
      hjust = 0,
      family = font_labels),
    plot.subtitle = element_text(margin = margin(t=10,b = 25), 
                                 color = "#22222b", size = 10, family = font_labels,
                                 hjust = 0),
    plot.caption =  element_text(#margin = margin(t = 5), 
      color = "#22222b", size = 7,family = font_labels,
      hjust = 0.95),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    legend.position = "none",
    axis.text.x    = element_text(size = 6, color = "#22222b",family = font_labels),
    axis.text.y    = element_text(size = 6, color = "#22222b",family = font_labels), 
    panel.background = element_blank(), 
    panel.grid.major = element_blank(),
    panel.grid.major.y = element_blank(),
    panel.grid.minor = element_blank(), 
    plot.background = element_rect(fill = "#f7f7f7", color = NA),    # color removes the border
    plot.margin = unit(c(2, 2, 2, 2), "cm"),
    axis.ticks = element_blank(),
    strip.background = element_blank(),
    strip.text.x = element_blank()  # remove each graph title
  )  + geom_text(aes(x = as.Date("2010-10-01",  "%Y-%m-%d"), y = 20000, label = State), hjust = 0, 
                 nudge_x = 0.01,face = "bold", family = font_labels,size = 3, colour = "#828282")





