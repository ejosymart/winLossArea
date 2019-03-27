library(raster)
library(SDMTools)
source("code/joinRaster_functions.R")

#Junta raster y suma valores
JR <- joinRaster(files = c("data/Binario_Presente.asc",
                           "data/Binario_2050.asc", 
                           "data/Binario_2100.asc"), newValue = 14)
JR


#Grafico
cols <- rev(terrain.colors(JR@data@max+1))
plot(JR, xlab = "Hola", ylab = "Chau", col = cols)
# legend("topleft", c("Present", "2050", "2010","Absence"), 
#        fill = terrain.colors(JR@data@max+1), bty = "n") 
