## Written by IrisKro

### delete lines with missing data
### add column with interval between budburst and first egg
### save as txt

setwd("~/scripts")  # set working directory

# import data, change all missing data no NA
birddata <- read.table(file="birddata.txt", na.strings=c("","NA"),sep="\t",header=TRUE) # Import data, tab-delimited with a header

# drop lines with NA
birddata <- na.omit(birddata)

# add column interval that gives the interval between budburst and the first egg
birddata$interval <- birddata$first_egg - birddata$budburst

# save dataframe to text file
write.table(birddata, "/home/iriskro/scripts/intervaldata.txt", sep="\t", quote = FALSE)

