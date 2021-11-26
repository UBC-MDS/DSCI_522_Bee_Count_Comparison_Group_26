Exploratory Data Analysis of the Bumble Bee Data Set
================

# Summary of the data set

The data set used in this project is the bumble bee data set prepared by the Ministry of the Environment, Conservation and Parks. This project was started to characterize the number of species of bumble bees and the relative abundances of these species. The bumble bees were collected from 67 locations in southwestern Ontario to compare the diversity of bees occuring in agricultural and more natural areas.

<img src="Bumblebee_survey_area.png" width="600">

**Figure 1**. Bumble bee survey areas.

The original data includes vast information about the survey sites and kinds of bumble bees. The data set consists of total of 64 columns and includes: 

- sampling locations, including GPS coordinates and the county name
- the number of bumble bee individuals sampled at each site, listed for each species and for each caste of a species (queen, worker, male)
- other site details, such as the date of the site visit


**Table 1**. Column information of the original bumble bee data set

| Region Info        | Time Info         |    Type of Bees (54 types in total)     |    Flowers           |   
| -----------------  | ----------------- | ------------------- | ---------------------|
| county             | sample date       | bimaculatus         | Flowers in bloom     | 
| MOECC Site Number  | year              | griseocollis        | Flowers bees         |
| latitude           |                   | impatiens           |                      |
| longitude          |                   | fervidus            |                      |
| site type          |                   | borealis, etc.      |                      |


# Preprocessing of the original data set

Since the original data set contains vast amount of data, it needed to be preprocessed to make it more effective for analysis. The preprocessing of the data was carried out with the following approaches:
- omit the GPS coordinates
- sum the number of bumble bee regardless of the species
- categorize the locations as agricultural, natural, and semi-natural  areas

The table below shows the number of each site where bumble bees were sampled.

**Table 2**. Number of sampling sites 

| Agricultural Area | Natural Area |  Natural Area |
| ----------------: | -----------: | ------------: |
|          1806     |          658 |           980 |

# Exploratory analysis on the training data set

The following histogram shows the distributions of the bumble bee collected from different types of site. The distributions are highly right-skewed. The x axis of the following histogram was limited to 60 to show the shape of the distribution.

<img src="bee_df_hist.png" width="500">

**Figure 2**. The distribution of bee counts at each site type

The following violin plot shows not only the distribution of the number of bees but also the mean and median. The mean is shown as white dots, while the median is shown as black dots. In order to include all the data points, log scale was applied to the x-axis of the plot.

<img src="bee_df_violin.png" width="600">

**Figure 3**. The distribution of bee counts with the mean and median

Figure 4 shows the jitter plot for the number of bees collected at each site. The hypothesis testing would be required to find out whether the number of bees collected at each site is different from one another.   

<img src="bee_df_jitter.png" width="600">

**Figure 4**. The distribution of the bees collected on different sites


# References


<div id="refs" class="references">

<div id="ref-Streetetal">

"Bumble Bee Diversity and Abundance Survey" by The Ministry of the Environment, Conservation and Parks. <https://data.ontario.ca/dataset/bumble-bee-diversity-and-abundance-survey>.

</div>

</div>