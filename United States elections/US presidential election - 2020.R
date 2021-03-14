
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

first_map<-plot_usmap("data_source", values = "party_simplified",labels = TRUE) + 
  scale_fill_manual(values = map_fills) +
  labs(fill = "party_simplified") +
  labs(x = "",y = "") +
  theme(
    legend.position = "none", # I've changed bottom for none to remove from arrange
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
           family = font_labels, label =  str_wrap("Biden - 306")) +
  annotate("text", x = 1240000, y = -2700000, hjust = 0, vjust = 1,fontface=3, size = 8, colour = "#ff4a43",
           family = font_labels, label =  str_wrap("Trump - 232"))



##### Code for the second graph 

# Graph -------------------------------------------------------------------

second_graph<- data%>%ggplot() +
  
  geom_text(aes(x = x, y = y, label = label,color = party_simplified), hjust = 0, fontface = "italic",  size = 4, 
            family = font_labels) +
  geom_point(aes(x = x-0.15, y = y, colour= party_simplified), hjust = -2, size = 3.5) + 
  scale_x_continuous(limits = c(-0.4,15)) +
  scale_colour_manual(values = c( "Democrat" = "#1a6aff",
                                  "Republican" = "#ff4a43")) +
  scale_fill_manual(values = c( "Democrat" = "#1a6aff",
                                "Republican" = "#ff4a43")) +
  labs(x = "",y = "",
       title = "",
       subtitle = "",
       caption = "") +
  theme(      legend.position = "bottom",
              legend.title=element_blank(),
              axis.text.x = element_blank(),
              axis.text.y = element_blank(),
              axis.title.x = element_blank(),
              axis.title.y = element_blank(), 
              axis.ticks.x=element_blank(),
              panel.background = element_blank(),
              panel.grid.major = element_blank(),
              panel.grid.major.y =  element_blank(),
              panel.grid.major.x = element_blank(),
              panel.grid.minor = element_blank(), 
              legend.margin=margin(b = 2, unit='cm'),
              legend.text=element_text(size=8,family = font_labels),
              legend.key.size = unit(0.3, "cm"),
              plot.background = element_rect(fill = "#fbfaf6", color = NA),    # color removes the border
              axis.ticks = element_blank()
  )



##### Arrange

ggarrange(first_map,second_graph, ncol=2, nrow=1, common.legend = F, legend="none") +
  theme_ipsum() +
  labs(x = "",y = "",
       title = "US Presidential election 2020",
       caption = "Source: https://electionlab.mit.edu/data\nVisualization: JuanmaMN (Twitter @Juanma_MN)") +
  theme(
    plot.title = element_text(margin = margin(b = 8), 
                              color = "#000000",face = "bold",size = 14,
                              hjust = 0.5,
                              family = font_labels),
    plot.subtitle = element_text(margin = margin(t=10, b = 25), 
                                 color = "#000000", size = 10, family = font_labels,
                                 hjust = 0.5),
    plot.caption =  element_text(margin = margin(t = 20, b = 10), 
                                 color = "#000000", size = 8, family = font_labels,
                                 hjust = 0.95),
    plot.background = element_rect(fill = "#fbfaf6", color = NA))  

