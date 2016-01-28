## Written by IrisKro

### input: txt from add_interval_missing_data
### tasks: subset --> wanted area and save subset as txt
## output: txt data file with data from wanted area

## input file
setwd("~/scripts")  # set working directory

# import data, change all missing data no NA
birddata <- read.table(file="intervaldata.txt",sep="\t",header=TRUE) # Import data, tab-delimited with a header


#wanted_area <- readline("Enter location number from list below: \n
### NOTE: this is only possible in interactive mode (R studio), not on command line
#number-name                       
#1-diever1
#2-diever2
#3-diever3
#4-diever4
#5-oudewillem
#6-appelscha
#7-lheebroek
#8-dwingeloo
#9-ruinen
#10-dwingelderzand
#11-anserdennen
#12-maria
#
#                        ")


## If not in interactive mode: set area of interest here:
wanted_area <- 8

## subset with use of the wanted area
area_birddata <- subset(birddata, study_area == as.integer(wanted_area))

## save this subset as txt 
write.table(area_birddata, "/home/iriskro/scripts/area_birddata.txt", sep="\t", quote = FALSE)














