

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

ggUSAB<-ggplot("data_source", aes(TIME, Value)) + geom_line(size = 0.8, color="#808080")+
  scale_y_continuous(limits = c(94.5, 103), breaks = c(96, 98, 100, 102))  +
  geom_point(x= George_H_W_BushB, y = c(100.37610),size=4, shape=21, fill="#e13d3d") +
  geom_point(x= BClintonBb, y = c(100.42880),size=4, shape=21, fill="#1a6aff") +
  geom_point(x= BushDate2B, y = c(97.45190),size=4, shape=21, fill="#e13d3d")+
  geom_point(x= ObamaDate2B, y = c(95.56631),size=4, shape=21, fill="#1a6aff")+
  geom_point(x= TrumpDate2B, y = c(100.66380),size=4, shape=21, fill="#e13d3d") +
  geom_point(x= BidenDate2B, y = c(101.19830),size=4, shape=21, fill="#1a6aff") +
  annotate("text", x = George_H_W_BushB, y =101.03380,fontface =2,
           hjust = 0.5, color = "#e13d3d",family = font_labels,
           size = 3.5, label = paste0("George H. W. Bush \nJanuary 1989")) +
  annotate("text", x = BClintonBb, y =100.8,fontface =2,
           hjust = 0.5, color = "#1a6aff",family = font_labels,
           size = 3.5, label = paste0("Bill Clinton \nJanuary 1993")) +
  annotate("text", x = BushDate_for_textB, y =96.74252,fontface =2,
           hjust = 0.5, color = "#e13d3d",family = font_labels,
           size = 3.5, label = paste0("George W. Bush \nJanuary 2001"))  +
  annotate("text", x = ObamaDate2B, y =95.27163,fontface =2,
           hjust = 0.5, color = "#1a6aff",family = font_labels,
           size = 3.5, label = paste0("Obama - January 2009")) +
  annotate("text", x = TrumpDate_for_textB, y =101.2,fontface =2,
           hjust = 0.5, color = "#e13d3d",family = font_labels,
           size = 3.5, label = paste0("Trump \n January 2017")) +
  annotate("text", x = BidenDate2B, y =101.58870,fontface =2,
           hjust = 0.5, color = "#1a6aff",family = font_labels,
           size = 3.5, label = paste0("Biden - January 2021")) +
  labs(x = "",y = "",
       title = "Busines confidence index (BCI) - US",
       subtitle = "Monthly analysis of Business confidence index in the US since January 1989 during each presidential term",
       caption = "Source: OECD Data  data.oecd.org\nVisualization: JuanmaMN (Twitter @Juanma_MN)")+
  theme_ipsum(grid="Y") + 
  theme(legend.position = "none",
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
        axis.title.x = element_text(margin = margin(t = 10),color = "#22222b",family = font_labels),
        axis.title.y = element_text(margin = margin(r = 15),color = "#22222b",family = font_labels),
        axis.text.x    = element_text(color = "#22222b",family = font_labels),
        axis.text.y    = element_text(color = "#22222b",family = font_labels),
        plot.background = element_rect(fill = "#f7f7f7", color = NA),   # color removes the border
        plot.margin = unit(c(1, 1, 1, 1), "cm"),
        axis.ticks = element_blank())
ggUSAB