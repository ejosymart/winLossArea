joinRaster <- function(files, newValue = 14, ...){
  
  if(length(files) < 2) stop("You must provide at least two '.asc' files")
  nfiles <- length(files)
  if(length(grep(pattern = ".asc", x = files)) != nfiles) stop("you must provide '.asc' files only")
  
  rasters <- list()
  for(i in seq_len(nfiles)){
    out <-  raster.from.asc(read.asc(file = files[i]))
    rasters[[i]] <- out
  }
  
  newPresent <- rasters[[1]]
  newPresent[newPresent==1] <- newValue
  
  rasterFuture <- rasters[-1]
  future <- do.call("sum", rasterFuture)
  
  output <- newPresent + future
  return(output)
}


areaEstimationPresence <- function(data, to = "km2", ...){
  dat  <-  raster.from.asc(read.asc(file = data))
  
  out <- switch(to, 
                km2 = length(dat[dat == 1]) * res(dat)[1]^2 * 111,
                miles2 = length(dat[dat == 1]) * res(dat)[1]^2 * 69)
  
  print(paste("Area - presence:", round(out, 1), to))
}