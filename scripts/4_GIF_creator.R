## written by IrisKro

setwd("~/scripts")  # set working directory

## load package
library(animation)

# create a list of 3 elements that represent the three categories
categoryList <- c(1,2,3) # 1=budburst, 2=first_egg, 3=interval

# loop over categories
for (category in categoryList){
    # if the category is 1 (budburst)..
    if (category == 1){
    # ..the files that should be imported are:
      ImportFiles <- "budburst_map_*.png"
    # ..the file that should be created and outputted is:
      OutputFile <- "budburst.gif"
    } else if (category == 2){      # if the category is not 1: if it is 2..
    # ..the files that should be imported are:
      ImportFiles <- "egg_map_*.png"
    # ..the file that should be created and outputted is:
      OutputFile <- "egg.gif"
    } else if (category == 3){      # if the category is not 1 and it is not 2: if it is 3..
    # ..the files that should be imported are:
      ImportFiles <- "interval_map_*.png"
    # ..the file that should be created and outputted is:
      OutputFile <- "interval.gif"
    }
    ## convert (for every category, because still in for loop) all Importfiles to one Outputfile
    im.convert(files = ImportFiles, output = OutputFile, convert = c("convert", "gm convert"), 
               cmd.fun = if (.Platform$OS.type == "windows") shell else system, extra.opts = "", 
               clean = FALSE)
}



