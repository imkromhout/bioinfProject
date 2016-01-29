## Written by IrisKro

## input: area_birddata.txt
## tasks: create map for every year within one area
## output: 5 .png files per category

## input file
setwd("~/scripts")  # set working directory

# import data
birddata <- read.table(file="area_birddata.txt",sep="\t",header=TRUE)
attach(birddata)

## load packages
library(ggplot2)
library(ggmap)

######## CREATE MAPS
### determine the spatial limits of the area
extraDegrees <- 0.025
xmin <- (min(longitude)-extraDegrees)
xmax <- (max(longitude)+extraDegrees)
ymin <- (min(latitude)-extraDegrees)
ymax <- (max(latitude)+extraDegrees)

## calculate center of the study area
# In order to do this, the median is used (the value in the middle of the distribution)
xcoordinates = longitude
xcenter = median(xcoordinates) 
ycoordinates = latitude
ycenter = median(ycoordinates)

## get map from googlemaps
focalArea <- get_googlemap(center = c(xcenter,ycenter), zoom = 16, maptype="satellite") # get it
AreaMap <- ggmap(focalArea, extent = "device", legend = "topleft")  # plot it

## determine limits for budburst
minBudburst <- min(budburst)
maxBudburst <- max(budburst)
## set limits, so scales of this category are similar in each of its plots
## determine the colors for data points
## store in limitsBudburst (you need this when you create the plot later on)
limitsBudburst <- scale_colour_gradient(low="yellow", high="red", 
                                        limits = c(minBudburst, maxBudburst))

## determine limits for first_egg
minEgg <- min(first_egg)
maxEgg <- max(first_egg)
## set limits, so scales of this category are similar in each of its plots
## determine the colors for data points
## store in limitsEgg (you need this when you create the plot later on)
limitsEgg <- scale_colour_gradient(low="blue", high="grey", limits = c(minEgg, maxEgg))

## determine limits for interval
minInterval <- min(interval)
maxInterval <- max(interval)
## set limits, so scales of this category are similar in each of its plots
## determine the colors for data points
## store in limitsInterval (you need this when you create the plot later on)
limitsInterval <- scale_colour_gradient2(low="blue", mid="green",high="red",
                                        limits = c(minInterval, maxInterval))



## for loop that creates subset and makes 3 maps (budburst, first_egg, interval) for each year
## for every year, do:
for (theyear in 2007:2011){ 
  ## create subset of that year with corresponding name
    subsetName <- paste(theyear, "Data", sep="")
    subsetName <- subset(birddata, year == theyear)
  
  ####### budburst 
  ## add data points to the existing map (AreaMap) and store this new map (Areamap+data) in budburstmap
    budburstmap <- AreaMap +   
    geom_point(aes(x = subsetName$longitude, y = subsetName$latitude,  
                  colour = subsetName$budburst), data = subsetName)  + 
                  limitsBudburst +  labs(color= "Budburst (april date)", title = theyear) +  
                  theme(legend.title = element_text(size=7, family = "Calibri"), 
                  plot.title = element_text(family = "Calibri"), legend.position = "bottom")
      
  ### first_egg 
  ## add data points to the existing map (AreaMap) and store this new map (Areamap+data) in eggmap
    eggmap <- AreaMap +   
    geom_point(aes(x = subsetName$longitude, y = subsetName$latitude,
                  colour = subsetName$first_egg), data = subsetName)  + 
                  limitsEgg + labs(color= "First egg (april date)", title = theyear) +
                  theme(legend.title = element_text(size=7, family = "Calibri"), 
                  plot.title = element_text(family = "Calibri"), legend.position = "bottom")
    
    
    ### interval 
    ## add data points to the existing map (AreaMap) and store this new map (Areamap+data) in intervalmap
    intervalmap <- AreaMap +   
      geom_point(aes(x = subsetName$longitude, y = subsetName$latitude,
                    colour = subsetName$interval), data = subsetName)  + 
                    limitsInterval + labs(color= "Interval (days)", title = theyear) +
                    theme(legend.title = element_text(size=7, family = "Calibri"), 
                    plot.title = element_text(family = "Calibri"), legend.position = "bottom")
    

    ##### now save the 3 images in the right way (category_map_year.png)
    ## create the names that images should get when saving
    ImageNameBudburst <- paste("budburst_map_", theyear, ".png", sep="") # budburst_map_year.png
    ImageNameEgg <- paste("egg_map_", theyear,".png", sep="") # egg_map_year.png
    ImageNameInterval <- paste("interval_map_", theyear,".png", sep="") # interval_map_year.png
    ## Save them    
    ggsave(budburstmap, file = ImageNameBudburst, width = 5, height = 5, type = "cairo-png")
    ggsave(eggmap, file = ImageNameEgg, width = 5, height = 5, type = "cairo-png")
    ggsave(intervalmap, file = ImageNameInterval, width = 5, height = 5, type = "cairo-png")

}



