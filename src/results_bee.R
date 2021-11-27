# author: Adrianne Leung
# date: 2021-11-26

"This script creates a table of analysis result summary.
Usage: src/results_bee.R --test_agri=<test_agri> --test_nat=<test_nat> --out_dir=<out_dir>

Options:
--test_agri=<test_agri>  Path (including filename) to test data with baseline Agricultural site type (which needs to be saved as a csv file)
--test_nat=<test_nat>    Path (including filename) to test data with baseline Natural site type (which needs to be saved as a csv file)
--out_dir=<out_dir>      Path to directory where the analysis result summary table should be saved
" -> doc

library(tidyverse)
library(broom)
library(knitr)
library(docopt)
opt <- docopt(doc)

main <- function(test_agri, test_nat, out_dir){
  # Read the test result data
  agri_table <- read.csv(test_agri) 
  nat_table <- read.csv(test_nat)
  
  # Create baseline and response variables pairs
  pairs <- c("Agricultural vs natural",
             "Agricultural vs semi-natural remnant",
             "Natural vs agricultural",
             "Natural vs semi-natural remnant")
  
  # Summarize the test results
  analysis_table <- rbind(agri_table, nat_table) |>
    filter(term != "(Intercept)") |>
    mutate(p_rounded = round(`p.value`, 3),
           coeff = round(exp(estimate), 3),
           pairs = case_when(
             term == 'site_typeNatural' ~ "Agricultural(ref) vs natural",
             term == 'site_typeSemi-natural remnant' ~ "Agricultural(ref) vs semi-natural remnant",
             term == 'relevel(site_type, ref = "Natural")Agricultural' ~ "Natural(ref) vs agricultural",
             term == 'relevel(site_type, ref = "Natural")Semi-natural remnant' ~ "Natural(ref) vs semi-natural remnant")) |>
    relocate(pairs, .before = estimate) |>
    filter(pairs != "Natural(ref) vs agricultural") |>
    select(-term)

  # Output analysis results table
  saveRDS(analysis_table, file = paste0(out_dir, "/analysis_results.rds"))
}


main(opt[["--test_agri"]], opt[["--test_nat"]], opt[["--out_dir"]])
