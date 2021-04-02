# Upload the packages -----------------------------------------------------

pacman::p_load(readxl,readr, lubridate, tidyverse, ggplot2, hrbrthemes, ggfittext, patchwork, scales, ggtext, ggpubr,ggbump,wesanderson,
               grid, gridtext, biscale, cowplot,sysfonts,ggimage,extrafont,systemfonts, showtext, ggbeeswarm)


# Fonts -------------------------------------------------------------------

extrafont::loadfonts(device = "win", quiet = TRUE)

font_add_google("Lora")

font_labels <- "Lora"

showtext_auto()




# Graph -------------------------------------------------------------------

# I only include graph code

ggUSAboth<-ggplot("data_source", aes(TIME, value, color = Index)) + geom_line(size=1.2) +
  scale_color_manual(values=c("#e3d18f","#c6dabf")) +
  scale_y_continuous(breaks = c(96, 98, 100, 102),
                     limits = c(95, 104)) +
  labs(x = "",y = "",
       title = "Business and Consumer confidence index - US",
       subtitle = "Monthly analysis of Business and Consumer confidence index in the US since January 1989 during each presidential term ",
       caption = "Source: OECD Data  data.oecd.org\nVisualization: JuanmaMN (Twitter @Juanma_MN)")+
  theme_ipsum(grid="Y") + 
  annotate("segment", x = George_H_W_Bush, xend = George_H_W_Bush, y = 95.5, yend = 103.2,family = font_labels,
           linetype = "longdash",   color = "#e13d3d") +
  annotate("segment", x = BClinton, xend = BClinton, y = 95.5, yend = 103.2,family = font_labels,
           linetype = "longdash",   color = "#1a6aff") +
  annotate("segment", x = BushDate2, xend = BushDate2, y = 95.5, yend = 103.2,family = font_labels,
           linetype = "longdash",   color = "#e13d3d") +
  annotate("segment", x = ObamaDate2, xend = ObamaDate2, y = 95.5, yend = 103.2,family = font_labels,
           linetype = "longdash",   color = "#1a6aff") +
  annotate("segment", x =TrumpDate2, xend = TrumpDate2, y = 95.5, yend = 103.2,family = font_labels,
           linetype = "longdash",   color = "#e13d3d") +
  annotate("segment", x =BidenDate2, xend = BidenDate2, y = 95.5, yend = 103.2,family = font_labels,
           linetype = "longdash",   color = "#1a6aff") +
  annotate("text", x = George_H_W_Bush,y =103.5,fontface =2,
           hjust = 0.5, color = "#e13d3d",family = font_labels,
           size = 3.5, label = paste0("George H. W. Bush \nJanuary 1989")) +
  annotate("text", x = BClinton, y=103.5,fontface =2,
           hjust = 0.5, color = "#1a6aff",family = font_labels,
           size = 3.5, label = paste0("Bill Clinton - January 1993")) +
  annotate("text", x = BushDate2, y =103.5,fontface =2,
           hjust = 0.5, color = "#e13d3d",family = font_labels,
           size = 3.5, label = paste0("George W. Bush - January 2001"))  +
  annotate("text", x = ObamaDate2, y =103.5,fontface =2,
           hjust = 0.5, color = "#1a6aff",family = font_labels,
           size = 3.5, label = paste0("Obama - January 2009")) +
  annotate("text", x = TrumpDate2, y =103.5,fontface =2,
           hjust = 0.5, color = "#e13d3d",family = font_labels,
           size = 3.5, label = paste0("Trump - January 2017")) +
  annotate("text", x = BidenDate2, y =103.5,fontface =2,
           hjust = 0.5, color = "#1a6aff",family = font_labels,
           size = 3.5, label = paste0("Biden - January 2021")) +
  theme(legend.position = "bottom",
        plot.title = element_text(margin = margin(b = 8), 
                                  color = "#22222b",face = "bold",size = 16,
                                  hjust = 0.5,
                                  family = font_labels),
        plot.subtitle = element_text(margin = margin(t=10,b = 25), 
                                     color = "#22222b", size = 9, family = font_labels,
                                     hjust = 0.5),
        plot.caption =  element_text(margin = margin(t = 20), 
                                     color = "#22222b", size = 10, family = font_labels,
                                     hjust = 0.95),
        axis.title.x = element_text(margin = margin(t = 5),color = "#22222b",family = font_labels),
        axis.title.y = element_text(margin = margin(r = 15),color = "#22222b",family = font_labels),
        axis.text.x    = element_text(color = "#22222b",family = font_labels),
        axis.text.y    = element_text(color = "#22222b",family = font_labels),

        plot.background = element_rect(fill = "#f7f7f7", color = NA),   # color removes the border
        legend.text=element_text(size=8, color = "#525252",family = font_labels),
        legend.key.size = unit(0.8, "cm"),
        legend.title = element_blank(),
        plot.margin = unit(c(1, 1, 1, 1), "cm"),
        axis.ticks = element_blank())

ggUSAboth
