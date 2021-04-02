
# Upload the packages -----------------------------------------------------

pacman::p_load(readxl, lubridate, tidyverse, ggplot2, hrbrthemes, ggfittext, patchwork, scales, ggtext, ggpubr,ggbump,wesanderson,
               grid, gridtext, biscale, cowplot,sysfonts,ggimage,extrafont,systemfonts, showtext, ggbeeswarm,countrycode,geofacet)



# Only graph code included

# Graph -------------------------------------------------------------------

p <- ggplot(data = "data_source",
            mapping = aes(x = long, y = lat,
                          fill = color, 
                          group = group,
                          label = State))+ 
  geom_polygon(color = "gray90", size = 0.05) + 
  coord_equal()+  
  scale_fill_manual(values = c( "Less than 2.5" = "#b8c375",
                                           "2.5 to 5" = "#c6dabf",
                                           "5 to 7.5"= "#feeaa5",
                                           #"30 to 40"= "#f9cca5",
                                           "7.5 to 10"= "#fec072",
                                           "> 10" = "#e33d53"))  + labs(fill = "Unemployment\nrate") +
  theme_map() +
  guides(fill = guide_legend(nrow = 1)) + 
  theme(legend.position = "bottom") +
  scale_x_continuous(breaks = NULL) + 
  scale_y_continuous(breaks = NULL) +
  labs(x = "",y = "",
       title = "Unemployment rate by County, 2019 Annual Averages",
       subtitle = "",
       caption = "Source: U.S. BUREAU OF LABOR STATISTICS\nVisualization: JuanmaMN (Twitter @Juanma_MN)") +
  theme(
    plot.title = element_text(margin = margin(b = 8), 
                              color = "#22222b",face = "bold",size = 12,
                              hjust = 0.5,
                              family = font_labels),
    plot.subtitle = element_text(margin = margin(t=10,b = 25), 
                                 color = "#22222b", size = 10, family = font_labels,
                                 hjust = 0.5),
    plot.caption =  element_text(margin = margin(t = 20), 
                                 color = "#22222b", size = 10, family = font_labels,
                                 hjust = 0.95),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    legend.title = element_blank(),
    axis.text.x    = element_blank(),
    axis.text.y    = element_blank(),
    panel.background = element_rect(fill = "#f7f7f7", color = NA),    # color removes the border,
    panel.grid.major = element_blank(),
    panel.grid.major.y = element_blank(),
    panel.grid.minor = element_blank(), 
    plot.background = element_rect(fill = "#f7f7f7", color = NA),    # color removes the border,
    panel.border = element_blank(),
    plot.margin = unit(c(1, 1, 1, 1), "cm"),
    legend.position = "bottom",
    legend.text=element_text(size=8, color = "#22222b"),
    legend.key.size = unit(0.2, "cm"),
    legend.key = element_blank(),
    legend.background=element_blank(),
    axis.ticks = element_blank(),
    legend.margin=margin(b = 0.1, unit='cm')
  ) +
  guides(fill = guide_legend(
    label.position = "bottom",
    nrow = 1,
    family = font_labels, 
    color = "#525252",
    keywidth = 3, keyheight = 0.5))