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
xcoordinates = longitude
xcenter = median(xcoordinates)
ycoordinates = latitude
ycenter = median(ycoordinates)

## get map from googlemaps
focalArea <- get_googlemap(center = c(xcenter,ycenter), zoom = 16, maptype="satellite")
AreaMap <- ggmap(focalArea, extent = "device", legend = "topleft")

## set limits for each category, so scales are similar between years
minBudburst <- min(budburst)
maxBudburst <- max(budburst)
limitsBudburst <- scale_colour_gradient(low="yellow", high="red", 
                                        limits = c(minBudburst, maxBudburst))

minEgg <- min(first_egg)
maxEgg <- max(first_egg)
limitsEgg <- scale_colour_gradient(low="blue", high="grey", limits = c(minEgg, maxEgg))


minInterval <- min(interval)
maxInterval <- max(interval)
limitsInterval <- scale_colour_gradient2(low="blue", mid="green",high="red",
                                        limits = c(minInterval, maxInterval))



## for loop that creates subset and makes 3 maps (bb, egg, interval) for each year
for (theyear in 2007:2011){
  # create subset of that year with corresponding name
    subsetName <- paste(theyear, "Data", sep="")
    subsetName <- subset(birddata, year == theyear)
  
  ### budburst (budburst_map_year.png)
    budburstmap <- AreaMap +   
    geom_point(aes(x = subsetName$longitude, y = subsetName$latitude,  
                  colour = subsetName$budburst), data = subsetName)  + 
                  limitsBudburst +  labs(color= "Budburst (april date)", title = theyear) +  
                  theme(legend.title = element_text(size=7, family = "Calibri"), 
                  plot.title = element_text(family = "Calibri"), legend.position = "bottom")
      
  ### first_egg (egg_map_year.png)
    eggmap <- AreaMap +   
    geom_point(aes(x = subsetName$longitude, y = subsetName$latitude,
                  colour = subsetName$first_egg), data = subsetName)  + 
                  limitsEgg + labs(color= "First egg (april date)", title = theyear) +
                  theme(legend.title = element_text(size=7, family = "Calibri"), 
                  plot.title = element_text(family = "Calibri"), legend.position = "bottom")
    
    
    ### interval (interval_map_year.png)
    intervalmap <- AreaMap +   
      geom_point(aes(x = subsetName$longitude, y = subsetName$latitude,
                    colour = subsetName$interval), data = subsetName)  + 
                    limitsInterval + labs(color= "Interval (days)", title = theyear) +
                    theme(legend.title = element_text(size=7, family = "Calibri"), 
                    plot.title = element_text(family = "Calibri"), legend.position = "bottom")
    

        ##### now save the 3 images in the right way (category_map_year.png)
    ## create the names that images should get
    ImageNameBudburst <- paste("budburst_map_", theyear, ".png", sep="")
    ImageNameEgg <- paste("egg_map_", theyear,".png", sep="")
    ImageNameInterval <- paste("interval_map_", theyear,".png", sep="")
    ## Save them.
    ggsave(budburstmap, file = ImageNameBudburst, width = 5, height = 5, type = "cairo-png")
    ggsave(eggmap, file = ImageNameEgg, width = 5, height = 5, type = "cairo-png")
    ggsave(intervalmap, file = ImageNameInterval, width = 5, height = 5, type = "cairo-png")

}



