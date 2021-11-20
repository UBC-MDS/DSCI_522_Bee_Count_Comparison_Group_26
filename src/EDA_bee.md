Exploratory data analysis of the Bumble Bee data set
================

# Summary of the data set

The data set used in this project is the bumble bee data set prepared by the Ministry of the Environment, Conservation and Parks. This project was started to characterize the number of species of bumble bees and the relative abundances of these species. The bumble bees were collected from 46 locations in southwestern Ontario to compare the diversity of bees occuring in agricultural and more natural areas.

![Bumblebee_survey_area](Bumblebee_survey_area.png)

Figure 1. Bumble bee survey areas.

The original data includes vast information about the survey sites and kinds of bumble bees. Some of the data includes:
- sampling locations, including GPS coordinates and the county name
- the number of bumble bee individuals sampled at each site, listed for each species and for each caste of a species (queen, worker, male)
- other site details, such as the date of the site visit

# Preprocessing of the original data set

Since the original data set contains vast amount of data, it needed to be preprocessed to make it more effective for analysis. The preprocessing of the data was carried out with the following approaches:
- omit the GPS coordinates
- sum the number of bumble bee regardless of the species
- categorize the locations as agricultural and natural areas

The table below shows the number of bumble bees for each type of the areas in the preprocessed data set.

| Agricultural Area | Natural Area |
| ----------------: | -----------: |
|          44       |           44 |

# Exploratory analysis on the training data set

The following histogram shows the distributions of the bumble bee collected on different types of area. The distributions are right-skewed, indicating that the median should be used for comparing the numbers. 

![bee_df_hist](bee_df_hist.png)

Figure 2. Distribution of training set predictors for the benign (B) and
malignant (M) tumour cases.

# References

<div id="refs" class="references">

<div id="ref-Streetetal">

"Bumble Bee Diversity and Abundance Survey" by The Ministry of the Environment, Conservation and Parks. <https://data.ontario.ca/dataset/bumble-bee-diversity-and-abundance-survey>.

</div>

</div>