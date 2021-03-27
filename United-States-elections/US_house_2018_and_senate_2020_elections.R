
## Data source: https://electionlab.mit.edu/data

# For this analysis, I have used a wide range of packages. For the graph, I've used plot_usmap which populates the 51 US states.

Main packages used.

- readxl,readr: to upload the ddata.
- lubridate: work with dates, particularly year.
- tidyverse: data manipulation and wrangling
- ggplot2, ggtext
- systemfonts, sysfonts,showtext: to upload the font
- choroplethr,choroplethrMaps,choroplethrZip,mapproj,usmap: mapping
- scales: format of variables
- hrbrthemes: graph theme


#####  Font used is Lora

# Font --------------------------------------------------------------------

font_add_google("Lora")

font_labels <- "Lora"

showtext_auto()

##### Code for the first graph 

# Graph -------------------------------------------------------------------






# Graph -------------------------------------------------------------------

first_map_house<-plot_usmap(data = "data source", values = "party",labels = TRUE) + 
  scale_fill_manual(values = map_fills,labels = c("Democrat", "Republican","No Election")) +
  labs(fill = "party") +
  #theme_void() +
  labs(x = "",y = "",
       title = "US House election 2018",
       x = "",
       y = "") +
  theme(
    plot.title = element_text(margin = margin(b = 15, t=10), 
                              color = "#000000",face = "bold",size = 14,
                              hjust = 0.5,
                              family = font_labels),
    legend.position = "bottom",
    legend.title=element_blank(),
    axis.ticks = element_blank(),
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    axis.title.x=element_blank(),
    axis.ticks.x=element_blank(),
    legend.margin=margin(b = 2, unit='cm'),
    legend.text=element_text(size=8,family = font_labels),
    legend.key.size = unit(0.3, "cm"),
    legend.background =  element_rect(fill = "#fbfaf6", color = NA),
    plot.background = element_rect(fill = "#fbfaf6", color = NA)    # color removes the border
  ) +  guides(fill = guide_legend(
    label.position = "bottom",
    family = font_labels, 
    color = "#808080",
    keywidth = 3, keyheight = 0.5)) +
  annotate("text", x = -1000, y = -2700000, hjust = 0, vjust = 1,fontface=3, size = 8, colour = "#1a6aff",
           family = font_labels, label =  str_wrap("Democrat - 235")) +
  annotate("text", x = 1340000, y = -2700000, hjust = 0, vjust = 1,fontface=3, size = 8, colour = "#ff4a43",
           family = font_labels, label =  str_wrap("Republican - 199"))




second_map<-plot_usmap("data source", values = "party_simplified",labels = TRUE) + 
  scale_fill_manual(values = map_fills,labels = c("Democrat", "Republican", "No election")) +
  labs(fill = "party_simplified") +
  labs(x = "",y = "",
       title = "US Senate election 2020",
       caption = "Source:https://electionlab.mit.edu/data\nVisualization: JuanmaMN (Twitter @Juanma_MN)") + 
  theme(
    plot.title = element_text(margin = margin(b = 15, t=10), 
                              color = "#000000",face = "bold",size = 14,
                              hjust = 0.5,
                              family = font_labels),
    plot.caption =  element_text(margin = margin(t = 20), 
                                 color = "#000000", size = 10, family = font_labels),
    legend.position = "bottom",
    legend.title=element_blank(),
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(), 
    axis.ticks.x=element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.major.y =  element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(), 
    legend.margin=margin(b = 2, unit='cm'),
    legend.text=element_text(size=8,family = font_labels),
    legend.key.size = unit(0.3, "cm"),
    legend.background = element_rect(fill = "#fbfaf6", color = NA),
    plot.background = element_rect(fill = "#fbfaf6", color = NA),    # color removes the border
    axis.ticks = element_blank()
  ) +  guides(fill = guide_legend(
    label.position = "bottom",
    family = font_labels, 
    color = "#808080",
    keywidth = 3, keyheight = 0.5)) +
  annotate("text", x = -1000, y = -2700000, hjust = 0, vjust = 1,fontface=3, size = 8, colour = "#1a6aff",
           family = font_labels, label =  str_wrap("Democrat - 50")) +
  annotate("text", x = 1240000, y = -2700000, hjust = 0, vjust = 1,fontface=3, size = 8, colour = "#ff4a43",
           family = font_labels, label =  str_wrap("Republican - 50"))


ggarrange(first_map_house,second_map_senate, ncol=2, nrow=1, common.legend = F, legend="none") +
  theme_ipsum() +
  labs(x = "",y = "",
       # title = "US Presidential election 2020",
       # subtitle = "XXXXXXXXXXX",
       caption = "Source: https://electionlab.mit.edu/data\nVisualization: JuanmaMN (Twitter @Juanma_MN)") +
  theme(
    #plot.title = element_text(margin = margin(b = 8), 
    #                         color = "#000000",face = "bold",size = 14,
    #                        hjust = 0.5,
    #                       family = font_labels),
    #plot.subtitle = element_text(margin = margin(t=10, b = 25), 
    #                             color = "#000000", size = 10, family = font_labels,
    #                            hjust = 0.5),
    plot.caption =  element_text(margin = margin(t = 20, b = 10), 
                                 color = "#000000", size = 8, family = font_labels,
                                 hjust = 0.95),
    plot.background = element_rect(fill = "#fbfaf6", color = NA))  