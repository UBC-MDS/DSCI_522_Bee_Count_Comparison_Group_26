README
================

# Bee Counts Comparison across Types of Bee Sites

-   Authors and contributors: Katia Aristova, Simon Guo, John Lee,
    Adrianne Leung

## Introduction

In this project, we are trying to answer the question: the bumble bee
counts of one type of bee site is the same as that of the other types of
bee sites in Southwestern Ontario . There are three different types of
bee sites, namely Agricultural, Natural and Semi-Natural and their
nature is different that would have an impact on the number of bumble
bees. Answering this question is important because we would like to find
out if the function of sites would impact the bee counts occurring in
agricultural and more natural areas to provide more information on site
planning in favour of pollination in agriculture and ecosystems.

The dataset used in this project is from the Bumble Bee Diversity and
Abundance Survey of the Ministry of the Environment, Conservation and
Parks of Ontario, which can be found
[here](https://data.ontario.ca/dataset/bumble-bee-diversity-and-abundance-survey "Bumble Bee Diversity and Abundance Survey")
and specifically [this
file](https://files.ontario.ca/moe_mapping/downloads/4Other/PHAP/Bumble_Bee_Public_Data.csv "Bumble Bee Public Data").
Each row of the data set represents the number of bee counts of each
species at the sampled bee site at the specified sample date. We are
interested in the total bee count in total disregard of time and year,
so data wrangling is applied to summarise the data set by grouping the
sample date by year, bee site type and county. Each row of the
simplified dataset represents the number of bee counts at each site type
in the county by year.

Before the analysis, we will perform exploratory data analysis to assess
the type of distribution and density of bee counts at each type of site,
as well as to assess whether the median and mean of bee counts are
similar between the types of site. The distribution of bee counts of
types of site will be explored with histogram plot and the density will
be assessed with violin plots combined with indication of median and
mean values of bee counts on the same plot.

From the exploratory data analysis, the median is a suitable estimator
given the data is right skewed. To answer the inferential question
posted above, we plan to do a hypothesis test for independence of a
difference in medians of bee counts by site type using permutation. This
test assumes that all observations are independent. This assumption is
probably satisfied as all data are from observations taken at each site
on the day separately.

Result of the analysis will be reported as a table of the hypothesis
test statistics and p-value in the final report. Thus far we have
performed some exploratory data analysis, and the report for that can be
found here <u>++link to EDA report in the repo++</u>.

## Usage

To replicate the analysis, clone this GitHub repository, install the
dependencies listed below, and run the following commands at the command
line/terminal from the root directory of this project:

<u>++ To be updated with the script++</u>

## Dependencies

<u>++ To be updated with required libraries of Python and R++</u>

## License

The materials used in this project are licensed under the Open
Government Licence â Ontario. If re-using/re-mixing please provide
attribution and link to this webpage.

## References

++I do not have any reference used currently. Feel free to add if you
found anything inspired your data analysis / method of analysis.++
