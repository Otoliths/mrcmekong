#------------------------Custom get_occ function-------------
if (!requireNamespace("jsonlite", quietly = TRUE))
  install.packages("jsonlite",dependencies = T)
station <- jsonlite::fromJSON("https://api.mrcmekong.org/api/v1/nrtm/station")
result <- lapply(station$stationId, function(stationid){
  fromJSON(paste0("https://api.mrcmekong.org/api/v1/nrtm/measurement/",stationid))
})

if (!file.exists("data")){
  dir.create("data")
}
path <- paste0("data/",as.POSIXlt(Sys.time(), "Asia/Shanghai"),".rds")
saveRDS(result,path)
