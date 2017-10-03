# CONVERT SHP TO GEOJSON

library("sf")

setwd("/var/www/html/d3leaflet")

version <- c(2006,2010,2013)
level <- c(0,1,2,3)

getwd()

for(i in version){
  for(j in level){
  x <- paste("database/shp/nuts",i,"/nuts",j,"-geo-",i,".shp",sep="")
  shp <- st_read(x, quiet = T)
  output <- paste("database/geojson/nuts",i,"-level",j,".geojson",sep="")
  st_write(shp, output, driver ="geojson",factorsAsCharacter = TRUE, delete_dsn=T)
  }
}


