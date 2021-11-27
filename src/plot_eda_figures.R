# author: John Lee
# date: 2021-11-26

"Creates eda plots for the pre-processed bee count data from Open Data Ontario
(https://data.ontario.ca/dataset/bumble-bee-diversity-and-abundance-survey)

Saves the plots as a png file.

Usage: src/plot_eda_figures.r --csv_file=<csv_file> --out_dir=<out_dir>

Options:
--csv_file=<csv_file>  Path (including filename) to preprocessed bee_count csv file
--out_dir=<out_dir>    Path to directory where the plots should be saved
" -> doc

library(tidyverse)
library(ggplot2)
library(broom)
library(knitr)
library(docopt)

opt <- docopt(doc)

main <- function(csv_file, out_dir) {

  # read in the preprocessed csv file
  bee_df <- read.csv(csv_file)

  # draw histogram  
  bee_df_hist <- ggplot(bee_df) +
    aes(x = no_of_bees,
        fill = site_type) +
    geom_histogram(bins = 40, color = 'white') +
    facet_wrap(~site_type, ncol = 1) +
    labs(x = "Number of bees per site",
         y = "Count",
         fill = "Site types",
         title = "Distiributions of the Bees Collected on Different Sites",
         subtitle = "Scales were limited to 60 for representation purposes"
    ) +
    xlim(0, 60) +
    ylim(0, 60) +
    theme_bw() +
    theme(text =  element_text(size = 13))
  
  # draw violin plot
  bee_df_violin <- ggplot(bee_df) +
    aes(y = site_type,
        x = no_of_bees,
        fill = site_type) +
    geom_violin() +
    geom_point(stat = "summary", fun = median, size = 3) +
    geom_point(stat = "summary", fun = mean, size = 3,
               shape = 15, color = "white") +
    scale_x_continuous(trans='log10') +
    labs(x = "log(Number of bees per site)",
         y = "Site types",
         fill = "Site types",
         title = "Distiributions of the Bees Collected on Different Sites",
         subtitle = "Black dot is median value, white square dot is mean"
    ) +
    guides(fill = "none") +
    theme_bw() +
    theme(text =  element_text(size = 15))
  
  # draw jitter plot
  bee_df_jitter <- ggplot(bee_df) +
    aes(y = site_type,
        x = no_of_bees,
        color = site_type) +
    geom_jitter() +
    labs(x = "Number of bees per site",
         y = "",
         color = "Site types",
         title = "Distiributions of the Bees Collected on Different Sites",
         subtitle = "Scales were limited to 60 for representation purposes"
    ) +
    scale_x_continuous(limits = c(0, 60)) +
    guides(fill = "none") +
    theme_bw() +
    theme(text =  element_text(size = 15))
  
  # save histogram as "bee_df_hist.png" in the designated output folder
  ggsave(paste0(out_dir, "/bee_df_hist.png"), 
         bee_df_hist,
         width = 8, 
         height = 8)

  # save histogram as "bee_df_violin.png" in the designated output folder
  ggsave(paste0(out_dir, "/bee_df_violin.png"), 
         bee_df_violin,
         width = 10, 
         height = 4)

  # save histogram as "bee_df_jitter.png" in the designated output folder
  ggsave(paste0(out_dir, "/bee_df_jitter.png"), 
         bee_df_jitter,
         width = 10, 
         height = 4)

}

main(opt[["--csv_file"]], opt[["--out_dir"]])
