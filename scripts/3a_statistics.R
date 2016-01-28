## Written by IrisKro

## input: txt from subset_script
## tasks: statistics
## output: file with statistical data

## input file
setwd("~/scripts")  # set working directory

# import data
birddata <- read.table(file="area_birddata.txt",sep="\t",header=TRUE)
attach(birddata)


################################# STATISTICAL TESTS
######### Over all years
## first_egg~budburst?
modelAllYears <- lm(first_egg~budburst, data = birddata)
resultsAllYears <- capture.output(summary(modelAllYears))
cat("resultsAllYears", resultsAllYears, file="resultAllYears.txt", sep="\n", append=TRUE)

######### within years (note: make for (theyear in 2007:2011) loop)
## first_egg~budburst?
data2007 <- subset(birddata, year == 2007)
data2008 <- subset(birddata, year == 2008)
data2009 <- subset(birddata, year == 2009)
data2010 <- subset(birddata, year == 2010)
data2011 <- subset(birddata, year == 2011)

model2007 <- lm(first_egg~budburst, data = data2007)
model2008 <- lm(first_egg~budburst, data = data2008)
model2009 <- lm(first_egg~budburst, data = data2009)
model2010 <- lm(first_egg~budburst, data = data2010)
model2011 <- lm(first_egg~budburst, data = data2011)

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

######### between years (ANOVA)
## budburst
modelBudburst <- lm(budburst~year, data = birddata)
capture.output(summary(modelBudburst),file="resultsModelBudburst.doc")

## first_egg
modelEgg <- lm(first_egg~year, data = birddata)
capture.output(summary(modelEgg),file="resultsModelEgg.doc")

## interval
modelInterval <- lm(interval~year, data = birddata)
capture.output(summary(modelInterval),file="resultsModelInterval.doc")








