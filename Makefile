# bee count data pipe
# author: Simon Guo
# date: 2021-12-02

all: results/analysis_results.rds src/figures/bee_df_hist.png src/figures/Bumblebee_survey_area.png  src/figures/bee_df_jitter.png src/figures/bee_df_violin.png src/eda_bee.html docs/report_bee.md docs/report_bee.html docs/report_bee.pdf

# download data
data/raw/Bumble_Bee_Public_Data.csv: src/download_data.py
	python src/download_data.py --url=https://files.ontario.ca/moe_mapping/downloads/4Other/PHAP/Bumble_Bee_Public_Data.csv --out_file=data/raw/Bumble_Bee_Public_Data.csv

# pre-process data (e.g., scale and clean up the data)
data/processed/processed_Bumble_Bee_Public_Data.csv: src/preprocess.R data/raw/Bumble_Bee_Public_Data.csv
	Rscript src/preprocess.R --input=data/raw/Bumble_Bee_Public_Data.csv --out_dir=data/processed/

# exploratory data analysis (EDA) - visualize bee count distributions across different fields
src/figures/bee_df_jitter.png src/figures/bee_df_violin.png src/figures/bee_df_hist.png: src/plot_eda_figures.R data/processed/processed_Bumble_Bee_Public_Data.csv
	Rscript src/plot_eda_figures.R --csv_file=data/processed/processed_Bumble_Bee_Public_Data.csv --out_dir=src/figures

# run eda report and create html file
src/eda_bee.html: src/eda_bee.md
	Rscript -e "rmarkdown::render('src/eda_bee.md')"

# apply data analysis on the processed bee count data
data/processed/agri_table.csv data/processed/nat_table.csv: src/glm_analysis.R data/processed/processed_Bumble_Bee_Public_Data.csv
	Rscript src/glm_analysis.R --file_path=data/processed/processed_Bumble_Bee_Public_Data.csv --output_folder=data/processed

# test the results
results/analysis_results.rds: src/results_bee.R data/processed/agri_table.csv data/processed/nat_table.csv
	Rscript src/results_bee.R --test_agri=data/processed/agri_table.csv --test_nat=data/processed/nat_table.csv --out_dir=results

# render final report
docs/report_bee.md docs/report_bee.html docs/report_bee.pdf: docs/report_bee.Rmd docs/references.bib results/analysis_results.rds
	Rscript -e "rmarkdown::render('docs/report_bee.Rmd', output_format = 'all')"

clean: 
	rm -rf data
	rm -rf results
	rm -rf src/eda_bee.html
	rm -rf docs/report_bee.md docs/report_bee.html docs/report_bee.pdf
	rm -f src/figures/bee_df_hist.png src/figures/bee_df_jitter.png src/figures/bee_df_violin.png
			