# author: Simon Guo
# date: 2021-11-27

# based on the work by Tiffany Timbers
# source: https://github.com/ttimbers/breast_cancer_predictor/blob/v2.0/src/pre_process_wisc.r

"Cleans and pre-processes the Bee counts data (from https://files.ontario.ca/moe_mapping/downloads/4Other/PHAP/Bumble_Bee_Public_Data.csv).
Writes the training and test data to separate feather files.

Usage: src/preprocess.R --input=<input> --out_dir=<out_dir>
  
Options:
--input=<input>       Path (including filename) to raw data (feather file)
--out_dir=<out_dir>   Path to directory where the processed data should be written
" -> doc

library(tidyverse)
library(docopt)
set.seed(2020)

opt <- docopt(doc)
main <- function(input, out_dir){
  # read data and convert class to factor
  raw_data <- read.csv(input, skip = 1)

  raw_data <- raw_data |>
    select(1:7, contains("total")) |>
    mutate(site_type = case_when(`Site.Type` == "Agri" ~ "Agricultural",
                                 `Site.Type` == "Agriculture" ~ "Agricultural",
                                 TRUE ~ `Site.Type`)) |>
    rename(
        county = `County`,
        site_id = `MOECC.Site.Number`,
        year = Year,
        sample_date = `Sample.date`) |>
    filter(site_type != "") |>
    pivot_longer(`bimaculatus.total`:`flavidus.total`,
                 values_to = "no_of_bees", names_to = "species") |>
    select(county, year, site_id, site_type, no_of_bees, sample_date)
  
  # write preprocessed data to the directory
  dir.create(out_dir)
  write_csv(raw_data, paste0(out_dir, "processed_Bumble_Bee_Public_Data.csv"))
}

main(opt[["--input"]], opt[["--out_dir"]])