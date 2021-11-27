# author: Katia Aristova
# date: 2021-11-26

"The script analyzes the dataset using the Poisson regression model

Usage: analysis.R --file_path=<file_path>

Options:
--file_path=<file_path>   Path to the .csv data file
" -> doc

library(tidyverse)
library(testthat)
library(tidyverse)
library(broom)
library(knitr)
library(docopt)

opt <- docopt(doc)

main <- function(file_path) {
  
  # read in data
  data <- read_csv(file_path, show_col_types = FALSE)
  
  data <- data |>
    mutate(site_type = as.factor(site_type))
  
  # calculate test statistic for site types
  pois_lr_agri <- glm(no_of_bees ~ site_type,
                      family = poisson,
                      data = data)
  
  pois_lr_natural <- glm(no_of_bees ~ relevel(site_type, ref = "Natural"),
                         family = poisson,
                         data = data)
  agri_table <- tidy(pois_lr_agri)
  nat_table <- tidy(pois_lr_natural)
  
  write.csv(agri_table, "agri_table.csv", row.names = FALSE)
  write.csv(nat_table, "nat_table.csv", row.names = FALSE)
  
}



# test_that("sterror should return 0 if vector values are all the same", {
#   expect_equal(sterror(c(1, 1, 1)), 0)
# })

main(opt$file_path)