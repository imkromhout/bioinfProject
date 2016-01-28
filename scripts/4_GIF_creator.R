## written by IrisKro

setwd("~/scripts")  # set working directory

## load package
library(animation)

categoryList <- c(1,2,3) # 1=budburst, 2=first_egg, 3=interval

for (category in categoryList){
    if (category == 1){
      ImportFiles <- "budburst_map_*.png"
      OutputFile <- "budburst.gif"
    } else if (category == 2){
      ImportFiles <- "egg_map_*.png"
      OutputFile <- "egg.gif"
    } else if (category == 3){
      ImportFiles <- "interval_map_*.png"
      OutputFile <- "interval.gif"
    }
    im.convert(files = ImportFiles, output = OutputFile, convert = c("convert", "gm convert"), 
               cmd.fun = if (.Platform$OS.type == "windows") shell else system, extra.opts = "", 
               clean = FALSE)
}



#################### SKETCH AREA ############################
#im.convert(files = 'budburst_map_*.png', output = "budburst.gif", convert = c("convert", "gm convert"), 
#           cmd.fun = if (.Platform$OS.type == "windows") shell else system, extra.opts = "", 
#           clean = FALSE)

#im.convert(files = 'egg_map_*.png', output = "first_egg.gif", convert = c("convert", "gm convert"), 
#           cmd.fun = if (.Platform$OS.type == "windows") shell else system, extra.opts = "", 
#           clean = FALSE)

#im.convert(files = 'interval_map_*.png', output = "interval.gif", convert = c("convert", "gm convert"), 
#           cmd.fun = if (.Platform$OS.type == "windows") shell else system, extra.opts = "", 
#           clean = FALSE)
