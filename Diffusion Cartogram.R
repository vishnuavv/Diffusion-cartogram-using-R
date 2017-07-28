library(maptools)
library(cartogram)
library(rgeos)
library(mapproj)
library(rgdal)
library(sp)

#Generic Country & States Maps
loc <- file.path(tempdir(), "stats_dat")
unzip(system.file("extdata", "states_21basic.zip", package = "fiftystater"), exdir = loc)
fifty_states_sp <- readOGR(dsn = loc, layer = "states", verbose = FALSE) 
spdf <- spTransform(fifty_states_sp,CRS("+init=epsg:2163"))

#Importing food services dataframe
ds = read.table("FoodSrvcByState.txt", header = T, sep = "\t")
ds$FoodServices.97 <- NULL
ds$FoodServices.2002 <- NULL

#Converting state names to lowercase for merge function
ds$region <- sapply(ds$State,tolower)

#Converting Title state names to uppercase for merge function

ds$STATE_NAME <- toTitleCase(ds$region)

#Removing original upper case states column
ds$State <- NULL

#Merging with Generic state names 
dx <- merge(spdf, ds, by="STATE_NAME")

#Create cartogram
dz <- cartogram::cartogram(dx, weight = "FoodServices.2007", itermax=15)

#Plot Cartogram
  tm_shape(dz) + tm_fill("FoodServices.2007", style="jenks")
	      	+ tm_borders() + tm_layout(frame=F)
