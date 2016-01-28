# bioinfProject
Project for the course Practical Bioinformatics for Biologists
Goal: Create geological maps with data points, do statistical analyses
Study area: National Park Dwingelderveld
########################
NOTE: the data is confidential and therefore not provided here. 
folder Results shows the created GIFs

Folder scripts contains all scripts needed
mapDwingelderveld is the main script that will call the following scripts:
1_add_interval_missing_data.R 
--> adds column of data, removes all lines with missing data

2_subset_script.R 
--> makes subset of study area of interest. Area of interest can be set by user input in 
interactive mode or can be set within the script as variable wanted_area

3a_statistics.R
--> statistical analyses of the data

3b_maps_creator.R
--> creates map from Googlemaps using coordinates in data, adds data points for each year and each category, resulting in 15 maps (categories: budburst, first egg, interval; years: 2007-2011)

4_GIF_creator.R
--> makes a GIF of the pictures of each category over the years

##########################
IrisKro (28/jan/2016)
Info: imkromhout@gmail.com
