## Written by IrisKro
## 28/jan/2016

###### input: txt from subset_script
###### tasks: statistics and create plots
###### output: files with statistical data, plots (.jpeg)

## input file
setwd("~/scripts")  # set working directory

# import data
birddata <- read.table(file="area_birddata.txt",sep="\t",header=TRUE)
attach(birddata)


################################# STATISTICAL TESTS

## Correlation between first egg and bud burst? (first_egg~budburst)

######### Over all years
# create model
modelAllYears <- lm(first_egg~budburst, data = birddata)
# create variable that will store the statistical data
resultsAllYears <- capture.output(summary(modelAllYears))
# write to file
cat("resultsAllYears", resultsAllYears, file="resultAllYears.txt", sep="\n", append=TRUE)

# create plot to visualize data
jpeg('budburst_egg_plot.jpg') # create the file
## make the plot --> it will write automatically to the file 
plot(budburst, first_egg, xlab = "Bud burst (april date)", ylab = "First egg (april date)")
abline(modelAllYears, lwd=2)
dev.off()  # say that you don't want to write to this file anymore (close it)


######### within years (note: could make a for(theyear in 2007:2011) loop)
# create subset for each year
data2007 <- subset(birddata, year == 2007)
data2008 <- subset(birddata, year == 2008)
data2009 <- subset(birddata, year == 2009)
data2010 <- subset(birddata, year == 2010)
data2011 <- subset(birddata, year == 2011)

# create model for each year
model2007 <- lm(first_egg~budburst, data = data2007)
model2008 <- lm(first_egg~budburst, data = data2008)
model2009 <- lm(first_egg~budburst, data = data2009)
model2010 <- lm(first_egg~budburst, data = data2010)
model2011 <- lm(first_egg~budburst, data = data2011)

# store results in variables and output to files
resultsModel2007 <- capture.output(summary(model2007))
cat("resultsModel2007", resultsModel2007, file="resultModel2007.txt", sep="\n", append=TRUE)
resultsModel2008 <- capture.output(summary(model2008))
cat("resultsModel2008", resultsModel2008, file="resultModel2008.txt", sep="\n", append=TRUE)
resultsModel2009 <- capture.output(summary(model2009))
cat("resultsModel2009", resultsModel2009, file="resultModel2009.txt", sep="\n", append=TRUE)
resultsModel2010 <- capture.output(summary(model2010))
cat("resultsModel2010", resultsModel2010, file="resultModel2010.txt", sep="\n", append=TRUE)
resultsModel2011 <- capture.output(summary(model2011))
cat("resultsModel2011", resultsModel2011, file="resultModel2011.txt", sep="\n", append=TRUE)


######### Is there a difference in variable value between years? (Variable ~ year)
## budburst #######
# create model, capture output and write to file
modelBudburst <- lm(budburst~year, data = birddata)
capture.output(summary(modelBudburst),file="resultsModelBudburst.doc")

# create boxplot to visualize data
jpeg('boxplot_budburst.jpg') # create the file
## make the plot --> it will write automatically to the file 
boxplot(budburst ~ year, data = birddata, col = "darkgreen", main="Bud burst", xlab = "Year", ylab="April date") 
dev.off() # say that you don't want to write to this file anymore (close it)


## first_egg #######
# create model, capture output and write to file
modelEgg <- lm(first_egg~year, data = birddata)
capture.output(summary(modelEgg),file="resultsModelEgg.doc")

# create boxplot to visualize data
jpeg('boxplot_egg.jpg') # create the file
## make the plot --> it will write automatically to the file 
boxplot(first_egg ~ year, data = birddata, col = "blue", main="First egg", xlab = "Year", ylab="April date")
dev.off() # say that you don't want to write to this file anymore (close it)


## interval #######
# create model, capture output and write to file
modelInterval <- lm(interval~year, data = birddata)
capture.output(summary(modelInterval),file="resultsModelInterval.doc")

# create boxplot to visualize data
jpeg('boxplot_interval.jpg') # create the file
## make the plot --> it will write automatically to the file 
boxplot(interval ~ year, data = birddata, col = "red", main="Interval", xlab = "Year", ylab="Interval: bud burst - first egg (Days)")
dev.off() # say that you don't want to write to this file anymore (close it)





